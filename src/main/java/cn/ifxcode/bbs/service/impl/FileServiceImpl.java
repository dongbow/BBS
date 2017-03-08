package cn.ifxcode.bbs.service.impl;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.qiniu.common.QiniuException;
import com.qiniu.http.Response;
import com.qiniu.storage.BucketManager;
import com.qiniu.storage.UploadManager;
import com.qiniu.util.Auth;

import cn.ifxcode.bbs.bean.CookieBean;
import cn.ifxcode.bbs.bean.Page;
import cn.ifxcode.bbs.dao.FileDao;
import cn.ifxcode.bbs.dao.GeneralDao;
import cn.ifxcode.bbs.dao.UserValueDao;
import cn.ifxcode.bbs.entity.BbsFile;
import cn.ifxcode.bbs.entity.BbsFileDown;
import cn.ifxcode.bbs.entity.GoldHistory;
import cn.ifxcode.bbs.entity.UserValue;
import cn.ifxcode.bbs.enumtype.EGHistory;
import cn.ifxcode.bbs.enumtype.FileEnum;
import cn.ifxcode.bbs.service.FileService;
import cn.ifxcode.bbs.service.UserService;
import cn.ifxcode.bbs.utils.GetRemoteIpUtil;
import cn.ifxcode.bbs.utils.UserValueUtils;

@Service
public class FileServiceImpl implements FileService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Resource
	private UserService userService;
	
	@Resource
	private GeneralDao generalDao;
	
	@Resource
	private UserValueDao userValueDao;
	
	@Resource
	private FileDao fileDao;
	
	@Value("${temp.file.dir}")
	private String tempFile;
	
	@Value("${qiniu.domain}")
	private String doMain;
	
	@Value("${qiniu.ak}")
	private String ak;
	
	@Value("${qiniu.sk}")
	private String sk;
	
	@Value("${qiniu.bucket}")
	private String bucket;
	
	@Value("${thumbnail.file.dir}")
	private String thumbnailFileDir;
	
	@Value("${thumbnail.url}")
	private String thumbnailUrl;
	
	@Value("${image.type}")
	private String imageType;
	
	@Value("${image.size}")
	private int imageSize;
	
	@Value("${image.iscompress}")
	private boolean imageIsCompress;
	
	@Value("${file.type}")
	private String fileType;
	
	@Value("${file.size}")
	private int fileSize;
	
	@Value("${qiniu.compress}")
	private String qiniuCompress;
	
	private UploadManager uploadManager;
	
	private String path = null;
	
	private BucketManager bucketManager;
	
	private Auth auth = null;
	
	@PostConstruct
	private void initQiniu() {
		auth = Auth.create(ak, sk);
		uploadManager = new UploadManager();
		bucketManager = new BucketManager(auth);
	}
	
	public void removeFile(String fileName) {
		try {
			bucketManager.delete(bucket, fileName);
		} catch (QiniuException e) {
			// ignore it
		}
	}
	
	public String uploadPicture(HttpServletRequest request) {
		return uploadPicture(request, null);
	}

	public String uploadPicture(HttpServletRequest request, String fileName) {
		String data = null;
		if(path == null) {
			File uploadDir = new File(request.getSession().getServletContext().getRealPath("/"), tempFile);
			path = uploadDir.getAbsolutePath();
			
			if(!uploadDir.exists()) {
				uploadDir.mkdirs();
			}
		}
		
		DiskFileItemFactory factory = new DiskFileItemFactory();
		factory.setRepository(new File(path));
		factory.setSizeThreshold(1024 * 1024);
		
		ServletFileUpload upload = new ServletFileUpload(factory);
		
		String qiniuFileName = null;
		
		try {
			List<FileItem> items = upload.parseRequest(request);
			for (FileItem item : items) {
				try {
					if(!validatePicture(item)) {
						return data;
					}
					if(StringUtils.isEmpty(fileName)) {
						synchronized (this) {
							qiniuFileName = createName(item);
						}
					} else {
						qiniuFileName = fileName;
					}
					if(imageIsCompress) {
						try {
							//TODO 没有合适的算法
						} catch(Exception e) {
							logger.error("pic compress fail", e);
						}
					}
					Response response = null;
					File file = new File(path + "/" + qiniuFileName);
					createFile(file, item);
					response = uploadManager.put(file, qiniuFileName, auth.uploadToken(bucket));
					file.delete();
					if(response.isOK()) {
	    				data = doMain + "/" +qiniuFileName;
	    				saveFile(new BbsFile(data, FileEnum.IMAGE, item, userService, request));
					} else {
						return data;
					}
				} catch (QiniuException e) {
					logger.error("pic upload error", e);
				}
			}
		} catch (Exception e) {
			logger.error("pic upload error", e);
			e.printStackTrace();
		}
		return data + qiniuCompress;
	}

	public String uploadHeadImg(String pic) {
		String qiniuFileName = UUID.randomUUID().toString().replace("-", "") + ".jpg";
		try {
			byte[] file = new Base64().decode(pic);
			Response response = uploadManager.put(file, qiniuFileName, auth.uploadToken(bucket));
			if (response.isOK()) {
				return doMain + "/" + qiniuFileName;
			}
		} catch (QiniuException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public JSONArray uploadFile(HttpServletRequest request) {
		return uploadFile(request, null);
	}

	public JSONArray uploadFile(HttpServletRequest request, String fileName) {
		if(path == null) {
			File uploadDir = new File(request.getSession().getServletContext().getRealPath("/"), tempFile);
			path = uploadDir.getAbsolutePath();
			
			if(!uploadDir.exists()) {
				uploadDir.mkdirs();
			}
		}
		
		DiskFileItemFactory factory = new DiskFileItemFactory();
		factory.setRepository(new File(path));
		factory.setSizeThreshold(1024 * 1024);
		
		ServletFileUpload upload = new ServletFileUpload(factory);
		
		String qiniuFileName = null;
		
		List<Map<String, Object>> maps = Lists.newArrayList();
		try {
			List<FileItem> items = upload.parseRequest(request);
			for (FileItem item : items) {
				Map<String, Object> map = Maps.newHashMap();
				try {
					if(!validateFile(item)) {
						return null;
					}
					if(StringUtils.isEmpty(fileName)) {
						synchronized (this) {
							qiniuFileName = createName(item);
						}
					} else {
						qiniuFileName = fileName;
					}
					Response response = null;
					File file = new File(path + "/" + qiniuFileName);
					createFile(file, item);
					response = uploadManager.put(file, qiniuFileName, auth.uploadToken(bucket));
					file.delete();
					if(response.isOK()) {
	    				BbsFile bbsFile = new BbsFile(doMain + "/" +qiniuFileName, FileEnum.FILE, item, userService, request);
	    				saveFile(bbsFile);
	    				map.put("uuid", bbsFile.getUuid());
	    				map.put("filename", item.getName());
					}
					maps.add(map);
				} catch (QiniuException e) {
					logger.error("file upload error", e);
				}
			}
		} catch (Exception e) {
			logger.error("file upload error", e);
			e.printStackTrace();
		}
		return JSONArray.parseArray(JSONObject.toJSONString(maps));
	}

	private boolean validatePicture(FileItem item) {
		if(!item.isFormField()) {
			String types[] = imageType.split("|");
			for (String type : types) {
				String fileType = item.getName().substring(item.getName().indexOf(".") + 1, 
						item.getName().length());
				if(fileType.equals(type)) {
					continue;
				}
				if(item.getSize() < imageSize * 1024 * 1024) {
					return true;
				}
			}
		}
		return false;
	}
	
	private boolean validateFile(FileItem item) {
		if(!item.isFormField()) {
			String types[] = fileType.split("|");
			for (String type : types) {
				String fileType = item.getName().substring(item.getName().indexOf(".") + 1, 
						item.getName().length());
				if(fileType.equals(type)) {
					continue;
				}
				if(item.getSize() < fileSize * 1024 * 1024) {
					return true;
				}
			}
		}
		return false;
	}
	
	private String createName(FileItem item) {
		String fileType = item.getName().substring(item.getName().indexOf(".") + 1, 
				item.getName().length());
		StringBuilder builder = new StringBuilder();
		builder.append(UUID.randomUUID().toString().replace("-", ""));
		builder.append(new Date().getTime());
		return builder.append(".").append(fileType).toString();
	}
	
	private void createFile(File file, FileItem item) {
		if(!file.exists()) {
			InputStream ins = null;
			 OutputStream ous = null;
            try{
            	ins = item.getInputStream();
                ous = new FileOutputStream(file);
                byte[] buffer = new byte[1024];
                int len = 0;
                while((len = ins.read(buffer)) > -1)
                    ous.write(buffer,0,len);
            } catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			} finally{
                try {
					ous.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
                try {
					ins.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
            }
		}
	}
	
	private int saveFile(BbsFile bbsFile) {
		return fileDao.insert(bbsFile);
	}

	@Override
	public Map<String, Object> getFileLinkByUuid(String file) {
		Map<String, Object> map = Maps.newHashMap();
		map.put("uuid", file);
		map.put("sign", FileEnum.FILE.getCode());
		return fileDao.getFileLinkByUuid(map);
	}

	@Override
	public boolean vaildOnce(String uuid, HttpServletRequest request) {
		long uid = userService.getUserIdFromCookie(request);
		Map<String, Object> map = Maps.newHashMap();
		map.put("uuid", uuid);
		map.put("uid", uid);
		int row = fileDao.vaildOnce(map);
		if(row == 0) {
			UserValue value = userService.getUserValue(uid);
			value = UserValueUtils.download(value);
			if(value == null) {
				return false;
			} else {
				CookieBean cookieBean = userService.getCookieBeanFromCookie(request);
				if(value.isGoldChange()) {
					GoldHistory goldHistory = new GoldHistory(value.getUserId(), cookieBean.getNick_name(), value.getThisGold(), EGHistory.DOWNLOAD.getFrom(), 
							EGHistory.DOWNLOAD.getDesc(), value.getTodayGoldTime());
					generalDao.insertGoldHistory(goldHistory);
				}
				userValueDao.updateUserValue(value);
				return true;
			}
		}
		return true;
	}

	@Override
	@Transactional
	public int AddDownCount(String uuid, HttpServletRequest request) {
		synchronized (uuid) {
			fileDao.insertHistory(uuid, userService.getUserIdFromCookie(request), userService.getNicknameFromCookie(request), new Date(), GetRemoteIpUtil.getRemoteIp(request));
			fileDao.AddDownCount(uuid);
		}
		return 0;
	}

	@Override
	public List<BbsFile> getUploadFile(Page page, FileEnum file) {
		return getUploadFile(page, file, null, null, 0, null);
	}

	@Override
	public List<BbsFile> getUploadFile(Page page, FileEnum file, String startTime, String endTime, long uid, String nickname) {
		Map<String, Object> map = Maps.newHashMap();
		map.put("page", page);
		map.put("sign", file.getCode());
		if(StringUtils.isNotBlank(startTime)) {
			map.put("starttime", startTime);
		}
		if(StringUtils.isNotBlank(endTime)) {
			map.put("endtime", endTime);
		}
		if(uid != 0) {
			map.put("uid", uid);
		}
		if(StringUtils.isNotBlank(nickname)) {
			map.put("name", nickname);
		}
		return fileDao.getUploadFile(map);
	}

	@Override
	public List<BbsFileDown> getFileDownloadDetailList(Page page, String id, long uid) {
		Map<String, Object> map = Maps.newHashMap();
		map.put("page", page);
		map.put("uuid", id);
		if(uid != 0) {
			map.put("uid", uid);
		}
		return fileDao.getFileDownloadDetailList(map);
	}
	
}

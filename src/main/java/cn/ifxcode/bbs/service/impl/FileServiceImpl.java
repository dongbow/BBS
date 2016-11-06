package cn.ifxcode.bbs.service.impl;

import java.io.File;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;
import com.qiniu.common.QiniuException;
import com.qiniu.http.Response;
import com.qiniu.storage.BucketManager;
import com.qiniu.storage.UploadManager;
import com.qiniu.util.Auth;

import cn.ifxcode.bbs.constant.BbsConstant;
import cn.ifxcode.bbs.service.FileService;

@Service
public class FileServiceImpl implements FileService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
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
	
	public JSONObject uploadPicture(HttpServletRequest request) {
		return this.uploadPicture(request, null);
	}

	public JSONObject uploadPicture(HttpServletRequest request, String fileName) {
		JSONObject data = new JSONObject(true);
		if(path.isEmpty()) {
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
					if(!this.validatePicture(item)) {
						data.put(BbsConstant.RC, BbsConstant.ERROR);
					}
					if(StringUtils.isEmpty(fileName)) {
						synchronized (this) {
							qiniuFileName = this.createName(item);
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
					response = uploadManager.put(file, qiniuFileName, auth.uploadToken(bucket));
					file.delete();
					if(response.isOK()) {
						data.put("rc",BbsConstant.OK);
	    				data.put("url",doMain + "/" +qiniuFileName);
					} else {
						data.put(BbsConstant.RC, BbsConstant.ERROR);
					}
				} catch (QiniuException e) {
					logger.error("pic upload error", e);
				}
			}
		} catch (Exception e) {
			logger.error("pic upload error", e);
			e.printStackTrace();
		}
		return data;
	}

	public JSONObject uploadFile(HttpServletRequest request) {
		return this.uploadFile(request, null);
	}

	public JSONObject uploadFile(HttpServletRequest request, String fileName) {
		JSONObject data = new JSONObject(true);
		if(path.isEmpty()) {
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
					if(!this.validateFile(item)) {
						data.put(BbsConstant.RC, BbsConstant.ERROR);
					}
					if(StringUtils.isEmpty(fileName)) {
						synchronized (this) {
							qiniuFileName = this.createName(item);
						}
					} else {
						qiniuFileName = fileName;
					}
					Response response = null;
					File file = new File(path + "/" + qiniuFileName);
					response = uploadManager.put(file, qiniuFileName, auth.uploadToken(bucket));
					file.delete();
					if(response.isOK()) {
						data.put("rc",BbsConstant.OK);
	    				data.put("url",doMain + "/" +qiniuFileName);
					} else {
						data.put(BbsConstant.RC, BbsConstant.ERROR);
					}
				} catch (QiniuException e) {
					logger.error("pic upload error", e);
				}
			}
		} catch (Exception e) {
			logger.error("file upload error", e);
			e.printStackTrace();
		}
		return data;
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
	
}

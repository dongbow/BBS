package cn.ifxcode.bbs.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.alibaba.fastjson.JSONArray;

import cn.ifxcode.bbs.bean.Page;
import cn.ifxcode.bbs.entity.BbsFile;
import cn.ifxcode.bbs.entity.BbsFileDown;
import cn.ifxcode.bbs.enumtype.FileEnum;

public interface FileService {

	public String uploadPicture(HttpServletRequest request);
	
	public String uploadPicture(HttpServletRequest request, String fileName);
	
	public String uploadHeadImg(String pic);
	
	public JSONArray uploadFile(HttpServletRequest request);
	
	public JSONArray uploadFile(HttpServletRequest request, String fileName);

	public Map<String, Object> getFileLinkByUuid(String file);

	public boolean vaildOnce(String uuid, HttpServletRequest request);

	public int AddDownCount(String uuid, HttpServletRequest request);

	public List<BbsFile> getUploadFile(Page page, FileEnum file);
	
	public List<BbsFile> getUploadFile(Page page, FileEnum file, String startTime, String endTime, long uid, String nickname);

	public List<BbsFileDown> getFileDownloadDetailList(Page page, String id, long uid);

}

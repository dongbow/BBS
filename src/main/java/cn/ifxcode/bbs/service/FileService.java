package cn.ifxcode.bbs.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import cn.ifxcode.bbs.bean.Page;
import cn.ifxcode.bbs.entity.BbsFile;
import cn.ifxcode.bbs.enumtype.FileEnum;

public interface FileService {

	public String uploadPicture(HttpServletRequest request);
	
	public String uploadPicture(HttpServletRequest request, String fileName);
	
	public String uploadFile(HttpServletRequest request);
	
	public String uploadFile(HttpServletRequest request, String fileName);

	public Map<String, Object> getFileLinkByUuid(String file);

	public boolean vaildOnce(String uuid, HttpServletRequest request);

	public int AddDownCount(String uuid, HttpServletRequest request);

	public List<BbsFile> getUploadFile(Page page, FileEnum file);
	
	public List<BbsFile> getUploadFile(Page page, FileEnum file, String startTime, String endTime, long uid, String nickname);
	
}

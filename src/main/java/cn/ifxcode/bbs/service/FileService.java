package cn.ifxcode.bbs.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface FileService {

	public String uploadPicture(HttpServletRequest request);
	
	public String uploadPicture(HttpServletRequest request, String fileName);
	
	public String uploadFile(HttpServletRequest request);
	
	public String uploadFile(HttpServletRequest request, String fileName);

	public Map<String, Object> getFileLinkByUuid(String file);

	public boolean vaildOnce(String uuid, HttpServletRequest request);

	public int AddDownCount(String uuid, HttpServletRequest request);
	
}

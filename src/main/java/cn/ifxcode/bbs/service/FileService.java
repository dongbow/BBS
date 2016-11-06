package cn.ifxcode.bbs.service;

import javax.servlet.http.HttpServletRequest;

import com.alibaba.fastjson.JSONObject;

public interface FileService {

	public JSONObject uploadPicture(HttpServletRequest request);
	
	public JSONObject uploadPicture(HttpServletRequest request, String fileName);
	
	public JSONObject uploadFile(HttpServletRequest request);
	
	public JSONObject uploadFile(HttpServletRequest request, String fileName);
	
}

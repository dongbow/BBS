package cn.ifxcode.bbs.service;

import javax.servlet.http.HttpServletRequest;

public interface GeneralService {

	public boolean checkIp(HttpServletRequest request);

	public boolean checkLogin(HttpServletRequest request);

	public boolean checkBbsIsClose();
	
}

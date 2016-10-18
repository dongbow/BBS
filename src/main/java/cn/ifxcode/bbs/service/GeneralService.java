package cn.ifxcode.bbs.service;

import javax.servlet.http.HttpServletRequest;

import cn.ifxcode.bbs.enumtype.EGHistory;

public interface GeneralService {

	public boolean checkIp(HttpServletRequest request);

	public boolean checkBbsIsClose();
	
	public int UserAward(EGHistory eg, long uid, HttpServletRequest request);
}

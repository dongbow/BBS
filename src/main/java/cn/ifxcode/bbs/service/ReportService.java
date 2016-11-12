package cn.ifxcode.bbs.service;

import javax.servlet.http.HttpServletRequest;

public interface ReportService {

	public int addReport(String uid, String tid, String rid, String floor,
			String rs, String other, String url, HttpServletRequest request);
	
}

package cn.ifxcode.bbs.service;

import java.util.List;

import cn.ifxcode.bbs.bean.Page;
import cn.ifxcode.bbs.entity.LoginLog;

public interface LoginLogService {

	public int insertLog(LoginLog loginLog);

	public List<LoginLog> getAllLoginlog(Page page, String satrtTime, String endTime,
			String loginName, int status);
	
}

package cn.ifxcode.bbs.dao;

import java.util.List;
import java.util.Map;

import cn.ifxcode.bbs.entity.LoginLog;

public interface LoginLogDao {

	public List<LoginLog> getAllLoginLog(Map<String, Object> map);
	
	public int insertLog(LoginLog loginLog);
	
}

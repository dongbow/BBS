package cn.ifxcode.bbs.dao;

import java.util.List;
import java.util.Map;

import cn.ifxcode.bbs.entity.SystemLog;

public interface SystemLogDao {

	public int insert(SystemLog systemLog);

	public List<SystemLog> getAllOperationLog(Map<String, Object> map);

}

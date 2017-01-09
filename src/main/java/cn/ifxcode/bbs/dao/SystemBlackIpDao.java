package cn.ifxcode.bbs.dao;

import java.util.List;
import java.util.Map;

import cn.ifxcode.bbs.entity.SystemBlackIp;

public interface SystemBlackIpDao {

	public List<String> findAllIpAddress();

	public List<SystemBlackIp> getList();

	public int delete(Map<String, Object> map);

	public int add(SystemBlackIp blackIp);

}

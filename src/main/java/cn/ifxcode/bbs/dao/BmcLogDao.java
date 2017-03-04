package cn.ifxcode.bbs.dao;

import java.util.List;
import java.util.Map;

import cn.ifxcode.bbs.entity.BmcLog;

public interface BmcLogDao {

	public int insert(BmcLog bmcLog);

	public List<BmcLog> getLogs(Map<String, Object> map);

}

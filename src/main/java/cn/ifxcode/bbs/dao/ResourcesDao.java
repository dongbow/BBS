package cn.ifxcode.bbs.dao;

import java.util.List;
import java.util.Map;

import cn.ifxcode.bbs.entity.Resources;

public interface ResourcesDao {

	public List<Resources> getResourcesByRoleId(Integer id);

	public List<Resources> getResByRoleIds(Map<String, Object[]> map);
	
}

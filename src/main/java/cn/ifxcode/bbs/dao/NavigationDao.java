package cn.ifxcode.bbs.dao;

import java.util.List;
import java.util.Map;

import cn.ifxcode.bbs.entity.Navigation;

public interface NavigationDao {

	public List<Navigation> getAllNavigations();

	public List<Navigation> getAllNavigationsToAdmin(Map<String, Object> map);

}

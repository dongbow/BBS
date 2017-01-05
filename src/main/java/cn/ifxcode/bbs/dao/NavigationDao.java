package cn.ifxcode.bbs.dao;

import java.util.List;
import java.util.Map;

import cn.ifxcode.bbs.entity.Navigation;

public interface NavigationDao {

	public List<Navigation> getAllNavigations();

	public List<Navigation> getAllNavigationsToAdmin(Map<String, Object> map);

	public int insert(Navigation navigation);

	public int update(Navigation navigation);

	public int delete(Map<String, Object> map);

	public Navigation get(int id);

}

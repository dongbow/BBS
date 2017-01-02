package cn.ifxcode.bbs.dao;

import java.util.List;
import java.util.Map;

import cn.ifxcode.bbs.entity.QuickNavigation;

public interface QuickNavigationDao {

	public List<QuickNavigation> getAllQuickNavigations();
	
	public List<QuickNavigation> getAllQuickNavigationsPage(Map<String, Object> map);

	public int insert(QuickNavigation navigation);
	
}

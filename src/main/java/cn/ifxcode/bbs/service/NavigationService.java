package cn.ifxcode.bbs.service;

import java.util.List;

import cn.ifxcode.bbs.bean.Page;
import cn.ifxcode.bbs.entity.Navigation;

public interface NavigationService {

	public List<Navigation> getAllNavigations();
	
	public List<Navigation> getAllNavigationsFromCache();

	public Navigation getNavigation(int navId);

	public List<Navigation> getBCMNavs(List<Integer> boardIds);

	public List<Navigation> getAllNavigation(Page page);
	
	public List<Navigation> getAllNavigation(Page page, String startTime, String endTime, String navName, int status);

	public int addNavigation(String name, String desc, int sort, int status);

	public int updateNavigation(int id, String name, String desc, int sort, int status);

	public int deleteNavigation(String ids);

	public Navigation getNavigationFromDB(int id);
	
}

package cn.ifxcode.bbs.service;

import java.util.List;

import cn.ifxcode.bbs.bean.Page;
import cn.ifxcode.bbs.entity.QuickNavigation;

public interface QuickNavigationService {

	public List<QuickNavigation> getAllQuickNavigations();
	
	public List<QuickNavigation> getAllQuickNavigations(Page page);

	public int addQuick(String name, String link, String color, int sort, int status);

	public QuickNavigation getQuickNavigation(int id);

	public int updateQuick(int id, String name, String link, String color, int sort, int status);

	public int deleteQuick(String ids);
	
}

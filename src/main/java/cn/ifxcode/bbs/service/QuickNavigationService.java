package cn.ifxcode.bbs.service;

import java.util.List;

import cn.ifxcode.bbs.bean.Page;
import cn.ifxcode.bbs.entity.QuickNavigation;

public interface QuickNavigationService {

	public List<QuickNavigation> getAllQuickNavigations();
	
	public List<QuickNavigation> getAllQuickNavigations(Page page);
	
}

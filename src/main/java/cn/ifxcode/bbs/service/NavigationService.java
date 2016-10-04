package cn.ifxcode.bbs.service;

import java.util.List;

import cn.ifxcode.bbs.entity.Navigation;

public interface NavigationService {

	public List<Navigation> getAllNavigations();

	public Navigation getNavigation(int navId);
	
}

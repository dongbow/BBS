package cn.ifxcode.bbs.service;

import java.util.List;

import cn.ifxcode.bbs.entity.Resources;

public interface ResourcesService {

	public List<Resources> getResourcesByIds(List<Integer> roleIds);
	
}

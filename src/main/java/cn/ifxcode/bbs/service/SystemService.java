package cn.ifxcode.bbs.service;

import java.util.List;

import cn.ifxcode.bbs.entity.SystemConfig;

public interface SystemService {

	public SystemConfig get();
	
	public int update(SystemConfig config);

	public List<SystemConfig> getList();
	
}

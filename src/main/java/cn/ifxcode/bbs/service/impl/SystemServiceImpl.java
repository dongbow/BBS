package cn.ifxcode.bbs.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.ifxcode.bbs.dao.SystemConfigDao;
import cn.ifxcode.bbs.entity.SystemConfig;
import cn.ifxcode.bbs.service.SystemService;

@Service
public class SystemServiceImpl implements SystemService{

	@Resource
	private SystemConfigDao systemConfigDao;
	
	@Override
	public SystemConfig get() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int update(SystemConfig config) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<SystemConfig> getList() {
		return systemConfigDao.getSystemConfig();
	}

}

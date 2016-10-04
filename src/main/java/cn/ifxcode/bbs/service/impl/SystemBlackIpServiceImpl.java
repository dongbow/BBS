package cn.ifxcode.bbs.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.ifxcode.bbs.dao.SystemBlackIpDao;
import cn.ifxcode.bbs.service.SystemBlackIpService;

@Service
public class SystemBlackIpServiceImpl implements SystemBlackIpService {

	@Resource
	private SystemBlackIpDao systemBlackIpDao;
	
	public List<String> blackIps() {
		return systemBlackIpDao.findAllIpAddress();
	}

}

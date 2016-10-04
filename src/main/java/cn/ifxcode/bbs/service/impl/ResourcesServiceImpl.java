package cn.ifxcode.bbs.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.google.common.collect.Maps;

import cn.ifxcode.bbs.dao.ResourcesDao;
import cn.ifxcode.bbs.entity.Resources;
import cn.ifxcode.bbs.service.ResourcesService;

@Service
public class ResourcesServiceImpl implements ResourcesService {

	@Resource
	private ResourcesDao resourcesDao;
	
	public List<Resources> getResourcesByIds(List<Integer> roleIds) {
		Map<String, Object[]> map = Maps.newHashMap();
		map.put("array", roleIds.toArray());
		return resourcesDao.getResByRoleIds(map);
	}

}

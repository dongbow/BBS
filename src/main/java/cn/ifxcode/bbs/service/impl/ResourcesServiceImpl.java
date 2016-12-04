package cn.ifxcode.bbs.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.common.collect.Maps;

import cn.ifxcode.bbs.constant.BbsConstant;
import cn.ifxcode.bbs.dao.ResourcesDao;
import cn.ifxcode.bbs.entity.Resources;
import cn.ifxcode.bbs.logger.SysLog;
import cn.ifxcode.bbs.service.ResourcesService;
import cn.ifxcode.bbs.utils.FormValidate;

@Service
public class ResourcesServiceImpl implements ResourcesService {

	@Resource
	private ResourcesDao resourcesDao;
	
	public List<Resources> getResourcesByIds(List<Integer> roleIds) {
		Map<String, Object[]> map = Maps.newHashMap();
		map.put("array", roleIds.toArray());
		return resourcesDao.getResByRoleIds(map);
	}

	@Override
	@SysLog(module = "系统管理", methods = "资源管理-添加")
	@Transactional
	public int addResources(String name, String link, String sign, int pid,
			String icon, int type, int sort, int status, HttpServletRequest request) {
		if(FormValidate.stringUtils(name, link, sign, icon)) {
			return BbsConstant.OK;
		} 
		return BbsConstant.ERROR;
	}
	
	

}

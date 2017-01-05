package cn.ifxcode.bbs.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import com.google.common.collect.Maps;

import cn.ifxcode.bbs.bean.Page;
import cn.ifxcode.bbs.dao.SystemLogDao;
import cn.ifxcode.bbs.entity.SystemLog;
import cn.ifxcode.bbs.service.OperationLogService;

@Service
public class OperationLogServiceImpl implements OperationLogService {

	@Resource
	private SystemLogDao systemLogDao;
	
	@Override
	public List<SystemLog> getAllOperationLog(Page page, String startTime,
			String endTime, String module, String name, int status) {
		Map<String, Object> map = Maps.newHashMap();
		map.put("page", page);
		if(StringUtils.isNotBlank(startTime)) {
			map.put("starttime", startTime);
		}
		if(StringUtils.isNotBlank(endTime)) {
			map.put("endtime", endTime);
		}
		if(!"-1".equals(module)) {
			map.put("module", module);
		}
		if(StringUtils.isNotBlank(name)) {
			map.put("name", name);
		}
		if(status != -1) {
			map.put("status", status);
		}
		return systemLogDao.getAllOperationLog(map);
	}

}

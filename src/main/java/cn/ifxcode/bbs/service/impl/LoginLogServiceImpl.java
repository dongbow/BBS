package cn.ifxcode.bbs.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import com.google.common.collect.Maps;

import cn.ifxcode.bbs.bean.Page;
import cn.ifxcode.bbs.dao.LoginLogDao;
import cn.ifxcode.bbs.entity.LoginLog;
import cn.ifxcode.bbs.enumtype.LoginError;
import cn.ifxcode.bbs.service.LoginLogService;
import cn.ifxcode.bbs.utils.DateUtils;

@Service
public class LoginLogServiceImpl implements LoginLogService {

	@Resource
	private LoginLogDao loginLogDao;
	
	public int insertLog(LoginLog loginLog) {
		synchronized (this) {
			return loginLogDao.insertLog(loginLog);
		}
	}

	public List<LoginLog> getAllLoginlog(Page page, String startTime,
			String endTime, String loginName, int status) {
		Map<String, Object> map = Maps.newHashMap();
		map.put("page", page);
		if(StringUtils.isNotBlank(startTime)) {
			map.put("starttime", startTime);
		}
		if(StringUtils.isNotBlank(endTime)) {
			map.put("endtime", endTime);
		}
		if(StringUtils.isNotBlank(loginName)) {
			map.put("loginname", loginName);
		}
		if(status != -1) {
			map.put("status", status);
		}
		return formatLog(loginLogDao.getAllLoginLog(map));
	}
	
	private List<LoginLog> formatLog(List<LoginLog> logs) {
		List<LoginLog> list = new ArrayList<LoginLog>();
		for (LoginLog loginLog : logs) {
			if(loginLog.getErrorType() != null && loginLog.getErrorType() == 0) {
				loginLog.setErrorText(LoginError.PASSWORD_ERROR.getValue());
			}
			loginLog.setLoginCreateTime(DateUtils.dt14LongFormat(DateUtils.dt14FromStr(loginLog.getLoginCreateTime())));
			list.add(loginLog);
		}
		return list;
	}

}

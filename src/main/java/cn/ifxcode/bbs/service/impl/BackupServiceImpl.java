package cn.ifxcode.bbs.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.google.common.collect.Maps;

import cn.ifxcode.bbs.bean.Page;
import cn.ifxcode.bbs.constant.BbsConstant;
import cn.ifxcode.bbs.dao.BackupDao;
import cn.ifxcode.bbs.entity.Backup;
import cn.ifxcode.bbs.logger.SysLog;
import cn.ifxcode.bbs.service.BackupService;
import cn.ifxcode.bbs.service.UserService;
import cn.ifxcode.bbs.utils.BackUpUtils;

@Service
public class BackupServiceImpl implements BackupService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Resource
	private UserService userService;
	
	@Resource
	private BackupDao backupDao;
	
	@SysLog(module = "系統备份", methods = "添加")
	public int addBackup(String name, String exec, HttpServletRequest request) {
		Backup backup = null;
		String url = "";
		try {
			if(StringUtils.isNotBlank(name)) {
				url = BackUpUtils.backupDB(name);
			} else {
				url = BackUpUtils.backupDB();
			}
			backup = new Backup(url, userService.getUserIdFromCookie(request), userService.getNicknameFromCookie(request));
			backupDao.insert(backup);
			return BbsConstant.OK;
		} catch(Exception e) {
			logger.error("backup error: {}", e);
		}
		return BbsConstant.ERROR;
	}

	@Override
	public List<Backup> searchBackups(Page page) {
		return this.searchBackups(page, null, null);
	}

	@Override
	public List<Backup> searchBackups(Page page, String startTime, String endTime) {
		Map<String, Object> map = Maps.newHashMap();
		map.put("page", page);
		if(StringUtils.isNotBlank(startTime)) {
			map.put("starttime", startTime);
		}
		if(StringUtils.isNotBlank(endTime)) {
			map.put("endtime", endTime);
		}
		return backupDao.getAllBacks(map);
	}

}

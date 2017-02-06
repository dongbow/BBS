package cn.ifxcode.bbs.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import cn.ifxcode.bbs.bean.Page;
import cn.ifxcode.bbs.entity.Backup;

public interface BackupService {

	public int addBackup(String name, String exec, HttpServletRequest request);

	public List<Backup> searchBackups(Page page);
	
	public List<Backup> searchBackups(Page page, String startTime, String endTime);

	public int deleteBack(String ids);
	
}

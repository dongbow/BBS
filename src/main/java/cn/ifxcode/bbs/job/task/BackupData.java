package cn.ifxcode.bbs.job.task;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import cn.ifxcode.bbs.dao.BackupDao;
import cn.ifxcode.bbs.entity.Backup;
import cn.ifxcode.bbs.utils.BackUpUtils;

@Service
public class BackupData {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Resource
	private BackupDao backupDao;
	
	public void backup() {
		
	}
	
	public void backupDB() {
		try {
			String url = BackUpUtils.backupDB();
			Backup backup = new Backup(url);
			backupDao.insert(backup);
		} catch (Exception e) {
			logger.error("start backupDB fail", e);
		}
	}
	
}

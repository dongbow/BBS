package cn.ifxcode.bbs.dao;

import java.util.List;
import java.util.Map;

import cn.ifxcode.bbs.entity.Backup;

public interface BackupDao {

	public int insert(Backup backup);

	public List<Backup> getAllBacks(Map<String, Object> map);

}

package cn.ifxcode.bbs.dao;

import java.util.List;
import java.util.Map;

import cn.ifxcode.bbs.entity.PastHistory;

public interface PastHistoryDao {

	public Integer insertPastHistory(PastHistory pastHistory);

	public List<PastHistory> getAllHistory(Map<String, Object> map);

	public List<PastHistory> getUserSignsByUid(Map<String, Object> map);

}

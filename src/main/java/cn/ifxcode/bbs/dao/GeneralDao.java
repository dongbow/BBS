package cn.ifxcode.bbs.dao;

import java.util.List;
import java.util.Map;

import cn.ifxcode.bbs.entity.ExperienceHistory;
import cn.ifxcode.bbs.entity.GoldHistory;
import cn.ifxcode.bbs.entity.SwfArea;

public interface GeneralDao {

	public List<SwfArea> getAllArea();

	public Integer insertGoldHistory(GoldHistory goldHistory);

	public Integer insertExperienceHistory(ExperienceHistory experienceHistory);

	public List<GoldHistory> getAllGoldHistory(Map<String, Object> map);

	public List<GoldHistory> getUserGoldsByUid(Map<String, Object> map);

	public List<ExperienceHistory> getAllExps(Map<String, Object> map);

	public List<ExperienceHistory> getUserExpsByUid(Map<String, Object> map);

	public void insertTodayCount(Map<String, Object> map);
	
}

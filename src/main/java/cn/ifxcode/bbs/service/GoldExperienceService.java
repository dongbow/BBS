package cn.ifxcode.bbs.service;

import java.util.List;

import cn.ifxcode.bbs.bean.Page;
import cn.ifxcode.bbs.entity.ExperienceHistory;
import cn.ifxcode.bbs.entity.GoldHistory;

public interface GoldExperienceService {

	public int insertGE(GoldHistory goldHistory, ExperienceHistory experienceHistory);

	public List<GoldHistory> getAllUserGolds(Page page, long uid);

	public List<GoldHistory> getUserGoldsByUid(Page page, String startTime, String endTime, long uid);

	public List<ExperienceHistory> getAllUserExps(Page page, long uid);

	public List<ExperienceHistory> getUserExpsByUid(Page page, String starttime, String endtime, long uid);
	
}

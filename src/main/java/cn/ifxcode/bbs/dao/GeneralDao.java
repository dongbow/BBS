package cn.ifxcode.bbs.dao;

import java.util.List;

import cn.ifxcode.bbs.entity.ExperienceHistory;
import cn.ifxcode.bbs.entity.GoldHistory;
import cn.ifxcode.bbs.entity.SwfArea;

public interface GeneralDao {

	public List<SwfArea> getAllArea();

	public Integer insertGoldHistory(GoldHistory goldHistory);

	public Integer insertExperienceHistory(ExperienceHistory experienceHistory);
	
}

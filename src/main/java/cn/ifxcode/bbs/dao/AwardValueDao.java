package cn.ifxcode.bbs.dao;

import java.util.List;

import cn.ifxcode.bbs.entity.AwardValue;

public interface AwardValueDao {

	public List<AwardValue> getAllFromDB();
	
	public int updateAwardValue(List<AwardValue> values);
	
}

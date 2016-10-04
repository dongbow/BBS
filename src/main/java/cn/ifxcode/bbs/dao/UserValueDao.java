package cn.ifxcode.bbs.dao;

import cn.ifxcode.bbs.entity.UserValue;

public interface UserValueDao {

	public int insertUserValue(UserValue userValue);

	public UserValue getUserValue(Long userId);

	public Integer updateUserValue(UserValue userValue);
	
}

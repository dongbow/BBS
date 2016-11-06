package cn.ifxcode.bbs.dao;

import cn.ifxcode.bbs.entity.UserForget;

public interface UserForgetDao {

	public int insert(UserForget userForget);
	
	public UserForget getByName(String name);
	
}

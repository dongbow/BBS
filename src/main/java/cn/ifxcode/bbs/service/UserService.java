package cn.ifxcode.bbs.service;

import cn.ifxcode.bbs.entity.User;

public interface UserService {

	public User authLogin(String name, String password);

	public Integer valueCheck(String type, String value);
	
}

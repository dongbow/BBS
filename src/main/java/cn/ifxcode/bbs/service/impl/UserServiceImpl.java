package cn.ifxcode.bbs.service.impl;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import cn.ifxcode.bbs.dao.UserDao;
import cn.ifxcode.bbs.entity.User;
import cn.ifxcode.bbs.service.UserService;

@Service
public class UserServiceImpl implements UserService{

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Resource
	private UserDao userDao;
	
	public User authLogin(String name, String password) {
		return userDao.authLogin(name, password);
	}

	public Integer valueCheck(String type, String value) {
		type = "name".equals(type) ? "user_name" : "user_email";
		return userDao.valueCheck(type, value);
	}

}

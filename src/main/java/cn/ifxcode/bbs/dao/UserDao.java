package cn.ifxcode.bbs.dao;

import org.apache.ibatis.annotations.Param;

import cn.ifxcode.bbs.entity.User;

public interface UserDao {

	public User authLogin(@Param("name")String name, @Param("password")String password);

	public Integer valueCheck(@Param("type")String type, @Param("value")String value);

}

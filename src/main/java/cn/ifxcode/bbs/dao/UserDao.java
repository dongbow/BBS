package cn.ifxcode.bbs.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import cn.ifxcode.bbs.entity.User;
import cn.ifxcode.bbs.entity.UserAccess;
import cn.ifxcode.bbs.entity.UserInfo;
import cn.ifxcode.bbs.entity.UserPrivacy;

public interface UserDao {

	public User authLogin(Map<String, Object> map);

	public Integer valueCheck(Map<String, Object> map);

	public int updateUserLastestTimeAndIp(@Param("userId")Long userId,
			@Param("userLastestLoginIp")String userLastestLoginIp, 
			@Param("userLastestLoginTime")String userLastestLoginTime);

	public List<User> getAllUser(Map<String, Object> map);

	public Integer insertUserAccess(UserAccess access);

	public Integer insertUserInfo(UserInfo info);

	public Integer insertUserPrivacy(UserPrivacy privacy);

	public User loginCheck(Map<String, Object> map);

	public User getUserById(long userId);

	public String getUserNickname(String userId);
	
	public User getUserByUserNickname(String userNickname);

	public Integer mate(Map<String, Object> map);

	public int resetPassword(Map<String, Object> map);

}

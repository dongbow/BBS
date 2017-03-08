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

	public String getUserImage(long imgUserId);

	public List<Integer> getAllBoardManageId(long userId);

	public int updateUserPrivacy(UserPrivacy privacy);

	public int vaildEmail(Map<String, Object> map);

	public int updateUserEmail(@Param("email")String email, @Param("uid")long uid);

	public int vaildPassword(Map<String, Object> map);

	public int updatePassword(@Param("password")String password, @Param("uid")long uid);

	public List<User> getAllNotTalkUser(Map<String, Object> map);

	public int speak(Map<String, Object> map);

	public void updateHeadImg(@Param("userId")long userId, @Param("path")String path);

	public int vaildNickname(String nickName);

	public int updateNickname(@Param("nickName")String nickName, @Param("uid")long uid);

	public int updateUserInfo(UserInfo userInfo);

}

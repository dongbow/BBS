package cn.ifxcode.bbs.dao;

import java.util.List;
import java.util.Map;

import cn.ifxcode.bbs.entity.UserFriends;

public interface UserFriendsDao {

	public int validFriend(Map<String, Object> map);

	public int insert(UserFriends friends);

	public Integer dealFriendStatus(Map<String, Object> map);

	public List<UserFriends> getAllFriendsRequest(Map<String, Object> map);

	public List<UserFriends> getFriendsList(Map<String, Object> map);

}

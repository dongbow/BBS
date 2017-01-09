package cn.ifxcode.bbs.dao;

import java.util.List;
import java.util.Map;

import cn.ifxcode.bbs.entity.FriendLink;

public interface FriendLinkDao {

	public List<FriendLink> getAllFriendLinks();

	public int insert(FriendLink friendLink);

	public List<FriendLink> getFriendList(Map<String, Object> map);

	public FriendLink get(int id);

	public int delete(Map<String, Object> map);

	public int update(FriendLink friendLink);

}

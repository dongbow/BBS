package cn.ifxcode.bbs.service;

import java.util.List;

import cn.ifxcode.bbs.entity.FriendLink;

public interface FriendLinkService {

	public List<FriendLink> getAllFriendLinks();

	public int addLink(String linkname, String link, String contact);
	
}

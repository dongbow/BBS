package cn.ifxcode.bbs.service;

import java.util.List;

import cn.ifxcode.bbs.bean.Page;
import cn.ifxcode.bbs.entity.FriendLink;

public interface FriendLinkService {

	public List<FriendLink> getAllFriendLinks();

	public int addLink(String linkname, String link, String contact);

	public List<FriendLink> getFriendList(Page page);
	
	public List<FriendLink> getFriendList(Page page, String startTime, String endTime, String name, int sign, int status);

	public FriendLink getFriendLink(int id);

	public int deleteLink(String ids);

	public int updateLink(int id, String name, String link, String contact,
			String endtime, int sign, int status);

	public int addLink(String name, String link, String contact,
			String endtime, int sign, int status);
	
}

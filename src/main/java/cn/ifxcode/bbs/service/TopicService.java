package cn.ifxcode.bbs.service;

import javax.servlet.http.HttpServletRequest;

import cn.ifxcode.bbs.entity.Topic;

public interface TopicService {

	public long insertTopic(int cid, String ttitle, String tcontent, long uid,
			int bid, int gid, int isreply, int iselite, int istop,
			int isglobaltop, int ishome, HttpServletRequest request);

	public Topic getTopicByTopicId(long topicId);

}

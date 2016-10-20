package cn.ifxcode.bbs.service;

import javax.servlet.http.HttpServletRequest;

import com.alibaba.fastjson.JSONObject;

import cn.ifxcode.bbs.entity.Topic;
import cn.ifxcode.bbs.entity.TopicData;
import cn.ifxcode.bbs.enumtype.TopicSign;

public interface TopicService {

	public long insertTopic(int cid, String ttitle, String tcontent, long uid,
			int bid, int gid, int isreply, int iselite, int istop,
			int isglobaltop, int ishome, HttpServletRequest request);

	public Topic getTopicByTopicId(long topicId);

	public JSONObject saveOrUpdateTopicData(long topicId, TopicSign topicSign, String topicTitleStyle, String lastestReplyUser,
			String lastestReplyTime, long topicUpdateUserId, String topicUpdateUser, String topicUpdateTime);
	
	public TopicData getTopicDateFromRedis(long topicId);
	
}

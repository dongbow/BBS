package cn.ifxcode.bbs.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.alibaba.fastjson.JSONObject;

import cn.ifxcode.bbs.bean.Page;
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
	
	public TopicData getTopicDateFromRedis(long topicId, Integer boardId);

	public List<Topic> getTopicListByUserId(Long userId, Page page);

	public List<Topic> getGlobalTopTopic();

	public List<Topic> getHomeTopic();

	public List<Topic> getTopicsByNavId(Page page, long navId, String type,
			String filter, String orderby);

	public List<Topic> getLocalTopTopic(int boardId);

	public List<Topic> getTopicsByBoardId(Page page, long boardId, String type, String filter, String orderby);

	public List<Topic> getTopicsByClassId(Page page, long classId, String type, String filter, String orderby);

	public int updateTopic(String tid, String ttitle, String tcontent, int isreply, int iselite, int istop, 
			int isglobaltop, int ishome, HttpServletRequest request);

}

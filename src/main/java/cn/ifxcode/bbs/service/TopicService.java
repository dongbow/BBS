package cn.ifxcode.bbs.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.alibaba.fastjson.JSONObject;

import cn.ifxcode.bbs.bean.Page;
import cn.ifxcode.bbs.entity.Topic;
import cn.ifxcode.bbs.entity.TopicData;
import cn.ifxcode.bbs.enumtype.TopicSign;

public interface TopicService {

	public long insertTopic(int cid, String ttitle, String tcontent, long uid,
			int bid, int gid, String filelist, int isreply, int iselite, int istop,
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
	
	public Topic getTopicForReplyByTopicId(long topicId);

	public List<Topic> getHomeTopic(Page page);
	
	public List<Topic> getHomeTopic(Page page, String startTime, String endTime, long tid, long uid);

	public List<Topic> getTopicList(Page page, int status, int audit);
	
	public List<Topic> getTopicList(Page page, int bid);
	
	public List<Topic> getTopicList(Page page, String startTime, String endTime, long uid, long topicId, int navId, int boardId, int classId, int status, int audit);

	public List<Topic> getTopicSpecList(Page page, int all);
	
	public List<Topic> getTopicSpecList(Page page, String startTime, String endTime, long uid, long topicId, int navId, int boardId, int type);
	
	public List<Topic> getTopicList(Page page, String sql, String startTime, String endTime, long uid, long topicId, int navId, int boardId, int classId);

	public List<Topic> getTopicTopList(Page page, int all);

	public List<Topic> getTopicListForIndex();

	public List<Topic> getTopicCloseReplyList(Page page, long topicId, int navId, int boardId);

	public int updateTopicTime(long tid, String time, String roleSign);

	public int cancelHomeTopic(String ids, String roleSign);

	public int audit(String ids, int value);

	public int restore(String ids, String sign);

	public int openReply(String ids, String sign);

	public int deleteTopic(String tid, String reason, String sign);

	public int closeReply(String ids, String sign);

	public int cream(String ids, int cream, String role);

	public int localTop(String ids, String time, int local, String role);

	public int home(String ids, String time, int home);

	public int globalTop(String ids, String time, int global);

	public int move(String ids, String destbid, String cid, String gid, String role);

	public int hot(String ids, int hot);

	public List<TopicData> getTopicDateFromRedis(List<Map<String, Long>> tidsAndBids);

}

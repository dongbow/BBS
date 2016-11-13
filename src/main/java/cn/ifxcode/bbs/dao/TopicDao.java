package cn.ifxcode.bbs.dao;

import java.util.List;
import java.util.Map;

import cn.ifxcode.bbs.entity.Topic;

public interface TopicDao {

	public Integer insertTopic(Topic topic);

	public Topic getTopicByTopicId(long topicId);

	public List<Topic> getTopicListByUserId(Map<String, Object> map);

	public List<Topic> getGlobalTopTopic();

	public List<Topic> getHomeTopTopic();

	public List<Topic> getTopicsByNavId(Map<String, Object> map);

	public List<Topic> getBoardTopTopic(int boardId);

	public List<Topic> getTopicsByBoardId(Map<String, Object> map);

	public List<Topic> getTopicsByClassId(Map<String, Object> map);

}

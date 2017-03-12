package cn.ifxcode.bbs.dao;

import java.util.List;
import java.util.Map;

import cn.ifxcode.bbs.entity.Topic;

public interface TopicDao {

	public Integer insertTopic(Topic topic);

	public Topic getTopicByTopicId(long topicId);

	public List<Topic> getTopicListByUserId(Map<String, Object> map);

	public List<Topic> getGlobalTopTopic();

	public List<Topic> getHomeTopTopic(Map<String, Object> map);

	public List<Topic> getTopicsByNavId(Map<String, Object> map);

	public List<Topic> getBoardTopTopic(int boardId);

	public List<Topic> getTopicsByBoardId(Map<String, Object> map);

	public List<Topic> getTopicsByClassId(Map<String, Object> map);

	public int updateTopic(Topic topic);

	public List<Topic> getTopicListForTrash(Map<String, Object> map);

	public List<Topic> getTopicList(Map<String, Object> map);

	public List<Topic> getTopicInfoList(Map<String, Object> map);

	public List<Topic> getTopicListForIndex();

	public List<Topic> getTopicCloseReplyList(Map<String, Object> map);

	public int restore(Map<String, Object> map);

	public int delete(Map<String, Object> map);

	public int move(Map<String, Object> map);

}

package cn.ifxcode.bbs.dao;

import java.util.List;
import java.util.Map;

import cn.ifxcode.bbs.entity.Topic;

public interface TopicDao {

	public Integer insertTopic(Topic topic);

	public Topic getTopicByTopicId(long topicId);

	public List<Topic> getTopicListByUserId(Map<String, Object> map);

}

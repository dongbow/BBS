package cn.ifxcode.bbs.dao;

import cn.ifxcode.bbs.entity.Topic;

public interface TopicDao {

	public Integer insertTopic(Topic topic);

	public Topic getTopicByTopicId(long topicId);

}

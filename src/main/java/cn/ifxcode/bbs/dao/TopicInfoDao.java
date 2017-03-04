package cn.ifxcode.bbs.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Param;

import cn.ifxcode.bbs.entity.TopicInfo;

public interface TopicInfoDao {

	public Integer insert(TopicInfo topicInfo);

	public int update(TopicInfo topicInfo);

	public int updateHomeTopicTime(@Param("time")String time, @Param("tid")long tid);

	public int cancelHomeTopic(Map<String, Object> map);

	public int execAudit(Map<String, Object> map);

	public int openReply(Map<String, Object> map);

}

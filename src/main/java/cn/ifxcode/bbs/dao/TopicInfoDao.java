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

	public int closeReply(Map<String, Object> map);

	public int cream(Map<String, Object> map);

	public int localTop(Map<String, Object> map);

	public int home(Map<String, Object> map);

	public int globalTop(Map<String, Object> map);

}

package cn.ifxcode.bbs.entity;

import java.io.Serializable;

public class Topic implements Serializable {

	private static final long serialVersionUID = -1239566708889747050L;

	private long topicId;
	private long userId;
	private Integer boardId;
	private Integer classId;
	private Integer navId;
	private String topicTitle;
	private String topicContent;
	private int topicStatus;
	private String topicCreateTime;
	private String topicCreateIp;
	private TopicInfo topicInfo;
	private TopicData topicData;

	public long getTopicId() {
		return topicId;
	}

	public void setTopicId(long topicId) {
		this.topicId = topicId;
	}

	public long getUserId() {
		return userId;
	}

	public void setUserId(long userId) {
		this.userId = userId;
	}

	public Integer getBoardId() {
		return boardId;
	}

	public void setBoardId(Integer boardId) {
		this.boardId = boardId;
	}

	public Integer getClassId() {
		return classId;
	}

	public void setClassId(Integer classId) {
		this.classId = classId;
	}

	public Integer getNavId() {
		return navId;
	}

	public void setNavId(Integer navId) {
		this.navId = navId;
	}

	public String getTopicTitle() {
		return topicTitle;
	}

	public void setTopicTitle(String topicTitle) {
		this.topicTitle = topicTitle;
	}

	public String getTopicContent() {
		return topicContent;
	}

	public void setTopicContent(String topicContent) {
		this.topicContent = topicContent;
	}

	public int getTopicStatus() {
		return topicStatus;
	}

	public void setTopicStatus(int topicStatus) {
		this.topicStatus = topicStatus;
	}

	public String getTopicCreateTime() {
		return topicCreateTime;
	}

	public void setTopicCreateTime(String topicCreateTime) {
		this.topicCreateTime = topicCreateTime;
	}

	public String getTopicCreateIp() {
		return topicCreateIp;
	}

	public void setTopicCreateIp(String topicCreateIp) {
		this.topicCreateIp = topicCreateIp;
	}

	public TopicInfo getTopicInfo() {
		return topicInfo;
	}

	public void setTopicInfo(TopicInfo topicInfo) {
		this.topicInfo = topicInfo;
	}

	public TopicData getTopicData() {
		return topicData;
	}

	public void setTopicData(TopicData topicData) {
		this.topicData = topicData;
	}

}
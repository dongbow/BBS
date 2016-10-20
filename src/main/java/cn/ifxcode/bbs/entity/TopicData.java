package cn.ifxcode.bbs.entity;

import java.io.Serializable;

public class TopicData implements Serializable {

	private static final long serialVersionUID = 9102324956317006368L;

	private long topicId;
	private long topicReplyCount;
	private long topicViewCount;
	private Integer topicFavoriteCount;
	private String topicTitleStyle;
	private String lastestReplyUser;
	private String lastestReplyTime;
	private long topicUpdateUserId;
	private String topicUpdateUser;
	private String topicUpdateTime;
	
	public long getTopicId() {
		return topicId;
	}

	public void setTopicId(long topicId) {
		this.topicId = topicId;
	}

	public long getTopicReplyCount() {
		return topicReplyCount;
	}

	public void setTopicReplyCount(long topicReplyCount) {
		this.topicReplyCount = topicReplyCount;
	}

	public long getTopicViewCount() {
		return topicViewCount;
	}

	public void setTopicViewCount(long topicViewCount) {
		this.topicViewCount = topicViewCount;
	}

	public Integer getTopicFavoriteCount() {
		return topicFavoriteCount;
	}

	public void setTopicFavoriteCount(Integer topicFavoriteCount) {
		this.topicFavoriteCount = topicFavoriteCount;
	}

	public String getTopicTitleStyle() {
		return topicTitleStyle;
	}

	public void setTopicTitleStyle(String topicTitleStyle) {
		this.topicTitleStyle = topicTitleStyle;
	}

	public String getLastestReplyUser() {
		return lastestReplyUser;
	}

	public void setLastestReplyUser(String lastestReplyUser) {
		this.lastestReplyUser = lastestReplyUser;
	}

	public String getLastestReplyTime() {
		return lastestReplyTime;
	}

	public void setLastestReplyTime(String lastestReplyTime) {
		this.lastestReplyTime = lastestReplyTime;
	}

	public long getTopicUpdateUserId() {
		return topicUpdateUserId;
	}

	public void setTopicUpdateUserId(long topicUpdateUserId) {
		this.topicUpdateUserId = topicUpdateUserId;
	}

	public String getTopicUpdateUser() {
		return topicUpdateUser;
	}

	public void setTopicUpdateUser(String topicUpdateUser) {
		this.topicUpdateUser = topicUpdateUser;
	}

	public String getTopicUpdateTime() {
		return topicUpdateTime;
	}

	public void setTopicUpdateTime(String topicUpdateTime) {
		this.topicUpdateTime = topicUpdateTime;
	}

}

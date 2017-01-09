package cn.ifxcode.bbs.entity;

import java.io.Serializable;

public class Reply implements Serializable {

	private static final long serialVersionUID = -3676557302657494140L;

	private long replyId;
	private long userId;
	private long topicId;
	private Integer boardId;
	private long replyParentId;
	private String replyContent;
	private int replyIsCheck;
	private int replyStatus;
	private long replyUpdateUserId;
	private String replyUpdateUser;
	private String replyUpdateTime;
	private String replyCreateTime;
	private String replyIp;
	private String delReason;
	private Reply reply;
	private User user;
	private UserValue userValue;
	private Topic topic;

	public long getReplyId() {
		return replyId;
	}

	public void setReplyId(long replyId) {
		this.replyId = replyId;
	}

	public long getUserId() {
		return userId;
	}

	public void setUserId(long userId) {
		this.userId = userId;
	}

	public long getTopicId() {
		return topicId;
	}

	public void setTopicId(long topicId) {
		this.topicId = topicId;
	}

	public Integer getBoardId() {
		return boardId;
	}

	public void setBoardId(Integer boardId) {
		this.boardId = boardId;
	}

	public long getReplyParentId() {
		return replyParentId;
	}

	public void setReplyParentId(long replyParentId) {
		this.replyParentId = replyParentId;
	}

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public int getReplyStatus() {
		return replyStatus;
	}

	public void setReplyStatus(int replyStatus) {
		this.replyStatus = replyStatus;
	}

	public long getReplyUpdateUserId() {
		return replyUpdateUserId;
	}

	public void setReplyUpdateUserId(long replyUpdateUserId) {
		this.replyUpdateUserId = replyUpdateUserId;
	}

	public String getReplyUpdateUser() {
		return replyUpdateUser;
	}

	public void setReplyUpdateUser(String replyUpdateUser) {
		this.replyUpdateUser = replyUpdateUser;
	}

	public String getReplyUpdateTime() {
		return replyUpdateTime;
	}

	public void setReplyUpdateTime(String replyUpdateTime) {
		this.replyUpdateTime = replyUpdateTime;
	}

	public String getReplyCreateTime() {
		return replyCreateTime;
	}

	public void setReplyCreateTime(String replyCreateTime) {
		this.replyCreateTime = replyCreateTime;
	}

	public String getReplyIp() {
		return replyIp;
	}

	public void setReplyIp(String replyIp) {
		this.replyIp = replyIp;
	}

	public Reply getReply() {
		return reply;
	}

	public void setReply(Reply reply) {
		this.reply = reply;
	}

	public int getReplyIsCheck() {
		return replyIsCheck;
	}

	public void setReplyIsCheck(int replyIsCheck) {
		this.replyIsCheck = replyIsCheck;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public UserValue getUserValue() {
		return userValue;
	}

	public void setUserValue(UserValue userValue) {
		this.userValue = userValue;
	}

	public Topic getTopic() {
		return topic;
	}

	public void setTopic(Topic topic) {
		this.topic = topic;
	}

	public String getDelReason() {
		return delReason;
	}

	public void setDelReason(String delReason) {
		this.delReason = delReason;
	}

}

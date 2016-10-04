package cn.ifxcode.bbs.entity;

import java.io.Serializable;

public class UserPrivacy implements Serializable {

	private static final long serialVersionUID = 1715695458318156786L;

	private long userId;
	private int baseIsPublic;
	private int friendIsPublic;
	private int isAddFriend;
	private int topicIsPublic;
	private int replyIsPublic;

	public long getUserId() {
		return userId;
	}

	public void setUserId(long userId) {
		this.userId = userId;
	}

	public int getBaseIsPublic() {
		return baseIsPublic;
	}

	public void setBaseIsPublic(int baseIsPublic) {
		this.baseIsPublic = baseIsPublic;
	}

	public int getFriendIsPublic() {
		return friendIsPublic;
	}

	public void setFriendIsPublic(int friendIsPublic) {
		this.friendIsPublic = friendIsPublic;
	}

	public int getIsAddFriend() {
		return isAddFriend;
	}

	public void setIsAddFriend(int isAddFriend) {
		this.isAddFriend = isAddFriend;
	}

	public int getTopicIsPublic() {
		return topicIsPublic;
	}

	public void setTopicIsPublic(int topicIsPublic) {
		this.topicIsPublic = topicIsPublic;
	}

	public int getReplyIsPublic() {
		return replyIsPublic;
	}

	public void setReplyIsPublic(int replyIsPublic) {
		this.replyIsPublic = replyIsPublic;
	}

}

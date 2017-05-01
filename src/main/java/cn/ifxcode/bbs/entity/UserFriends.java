package cn.ifxcode.bbs.entity;

import java.io.Serializable;

public class UserFriends implements Serializable {

	private static final long serialVersionUID = 1L;

	private long friendId;
	private long sendUserId;
	private String sendUserName;
	private long recUserId;
	private String recUserName;
	private int friendStatus;
	private String sendTime;
	private String updateTime;
	private String friendIp;
	//头像
	private String image;
	//角色  只取一个
	private String role;

	public long getFriendId() {
		return friendId;
	}

	public void setFriendId(long friendId) {
		this.friendId = friendId;
	}

	public long getSendUserId() {
		return sendUserId;
	}

	public void setSendUserId(long sendUserId) {
		this.sendUserId = sendUserId;
	}

	public String getSendUserName() {
		return sendUserName;
	}

	public void setSendUserName(String sendUserName) {
		this.sendUserName = sendUserName;
	}

	public long getRecUserId() {
		return recUserId;
	}

	public void setRecUserId(long recUserId) {
		this.recUserId = recUserId;
	}

	public String getRecUserName() {
		return recUserName;
	}

	public void setRecUserName(String recUserName) {
		this.recUserName = recUserName;
	}

	public int getFriendStatus() {
		return friendStatus;
	}

	public void setFriendStatus(int friendStatus) {
		this.friendStatus = friendStatus;
	}

	public String getSendTime() {
		return sendTime;
	}

	public void setSendTime(String sendTime) {
		this.sendTime = sendTime;
	}

	public String getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(String updateTime) {
		this.updateTime = updateTime;
	}

	public String getFriendIp() {
		return friendIp;
	}

	public void setFriendIp(String friendIp) {
		this.friendIp = friendIp;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

}

package cn.ifxcode.bbs.entity;

import java.io.Serializable;

public class UserValue implements Serializable {

	private static final long serialVersionUID = 5657864311812171035L;

	private long userId;
	private long userExperience;
	private int todayExp;
	private String todayExpTime;
	private long userGold;
	private int todayGold;
	private String todayGoldTime;
	private int userTopicCount;
	private int userReplyCount;
	private int userFriendCount;
	private int userPastCount;
	private int userPastSerialCount;
	private String userLastestPastTime;

	public long getUserId() {
		return userId;
	}

	public void setUserId(long userId) {
		this.userId = userId;
	}

	public long getUserExperience() {
		return userExperience;
	}

	public void setUserExperience(long userExperience) {
		this.userExperience = userExperience;
	}

	public long getUserGold() {
		return userGold;
	}

	public void setUserGold(long userGold) {
		this.userGold = userGold;
	}

	public int getUserTopicCount() {
		return userTopicCount;
	}

	public void setUserTopicCount(int userTopicCount) {
		this.userTopicCount = userTopicCount;
	}

	public int getUserReplyCount() {
		return userReplyCount;
	}

	public void setUserReplyCount(int userReplyCount) {
		this.userReplyCount = userReplyCount;
	}

	public int getUserPastCount() {
		return userPastCount;
	}

	public void setUserPastCount(int userPastCount) {
		this.userPastCount = userPastCount;
	}

	public int getUserPastSerialCount() {
		return userPastSerialCount;
	}

	public void setUserPastSerialCount(int userPastSerialCount) {
		this.userPastSerialCount = userPastSerialCount;
	}

	public String getUserLastestPastTime() {
		return userLastestPastTime;
	}

	public void setUserLastestPastTime(String userLastestPastTime) {
		this.userLastestPastTime = userLastestPastTime;
	}

	public int getTodayExp() {
		return todayExp;
	}

	public void setTodayExp(int todayExp) {
		this.todayExp = todayExp;
	}

	public String getTodayExpTime() {
		return todayExpTime;
	}

	public void setTodayExpTime(String todayExpTime) {
		this.todayExpTime = todayExpTime;
	}

	public int getTodayGold() {
		return todayGold;
	}

	public void setTodayGold(int todayGold) {
		this.todayGold = todayGold;
	}

	public String getTodayGoldTime() {
		return todayGoldTime;
	}

	public void setTodayGoldTime(String todayGoldTime) {
		this.todayGoldTime = todayGoldTime;
	}

	public int getUserFriendCount() {
		return userFriendCount;
	}

	public void setUserFriendCount(int userFriendCount) {
		this.userFriendCount = userFriendCount;
	}

}

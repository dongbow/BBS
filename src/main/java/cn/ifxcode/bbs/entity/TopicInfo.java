package cn.ifxcode.bbs.entity;

import java.io.Serializable;

public class TopicInfo implements Serializable {

	private static final long serialVersionUID = 7457544038984703537L;

	private long topicId;
	private int topicIsCheck;
	private int topicIsHome;
	private String topicIsHomeEndTime;
	private int topicIsReply;
	private int topicIsLocalTop;
	private String topicIsLocalTopEndTime;
	private int topicIsGlobalTop;
	private String topicIsGlobalTopEndTime;
	private int topicIsHot;
	private int topicIsCream;

	public long getTopicId() {
		return topicId;
	}

	public void setTopicId(long topicId) {
		this.topicId = topicId;
	}

	public int getTopicIsCheck() {
		return topicIsCheck;
	}

	public void setTopicIsCheck(int topicIsCheck) {
		this.topicIsCheck = topicIsCheck;
	}

	public int getTopicIsHome() {
		return topicIsHome;
	}

	public void setTopicIsHome(int topicIsHome) {
		this.topicIsHome = topicIsHome;
	}

	public String getTopicIsHomeEndTime() {
		return topicIsHomeEndTime;
	}

	public void setTopicIsHomeEndTime(String topicIsHomeEndTime) {
		this.topicIsHomeEndTime = topicIsHomeEndTime;
	}

	public int getTopicIsReply() {
		return topicIsReply;
	}

	public void setTopicIsReply(int topicIsReply) {
		this.topicIsReply = topicIsReply;
	}

	public int getTopicIsLocalTop() {
		return topicIsLocalTop;
	}

	public void setTopicIsLocalTop(int topicIsLocalTop) {
		this.topicIsLocalTop = topicIsLocalTop;
	}

	public String getTopicIsLocalTopEndTime() {
		return topicIsLocalTopEndTime;
	}

	public void setTopicIsLocalTopEndTime(String topicIsLocalTopEndTime) {
		this.topicIsLocalTopEndTime = topicIsLocalTopEndTime;
	}

	public int getTopicIsGlobalTop() {
		return topicIsGlobalTop;
	}

	public void setTopicIsGlobalTop(int topicIsGlobalTop) {
		this.topicIsGlobalTop = topicIsGlobalTop;
	}

	public String getTopicIsGlobalTopEndTime() {
		return topicIsGlobalTopEndTime;
	}

	public void setTopicIsGlobalTopEndTime(String topicIsGlobalTopEndTime) {
		this.topicIsGlobalTopEndTime = topicIsGlobalTopEndTime;
	}

	public int getTopicIsHot() {
		return topicIsHot;
	}

	public void setTopicIsHot(int topicIsHot) {
		this.topicIsHot = topicIsHot;
	}

	public int getTopicIsCream() {
		return topicIsCream;
	}

	public void setTopicIsCream(int topicIsCream) {
		this.topicIsCream = topicIsCream;
	}

	@Override
	public String toString() {
		return "TopicInfo [topicId=" + topicId + ", topicIsCheck="
				+ topicIsCheck + ", topicIsHome=" + topicIsHome
				+ ", topicIsHomeEndTime=" + topicIsHomeEndTime
				+ ", topicIsReply=" + topicIsReply + ", topicIsLocalTop="
				+ topicIsLocalTop + ", topicIsLocalTopEndTime="
				+ topicIsLocalTopEndTime + ", topicIsGlobalTop="
				+ topicIsGlobalTop + ", topicIsGlobalTopEndTime="
				+ topicIsGlobalTopEndTime + ", topicIsHot=" + topicIsHot
				+ ", topicIsCream=" + topicIsCream + "]";
	}
	
	

}

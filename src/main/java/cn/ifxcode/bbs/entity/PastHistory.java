package cn.ifxcode.bbs.entity;

import java.io.Serializable;

public class PastHistory implements Serializable {

	private static final long serialVersionUID = -3141140489261391692L;

	private long id;
	private long userId;
	private String nickname;
	private String ip;
	private String pastTime;
	private int totalSign;
	private int serialSign;

	public PastHistory() {}
	
	public PastHistory(long userId, String nickname, String ip, String pastTime) {
		this.userId = userId;
		this.nickname = nickname;
		this.ip = ip;
		this.pastTime = pastTime;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public long getUserId() {
		return userId;
	}

	public void setUserId(long userId) {
		this.userId = userId;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public String getPastTime() {
		return pastTime;
	}

	public void setPastTime(String pastTime) {
		this.pastTime = pastTime;
	}

	public int getTotalSign() {
		return totalSign;
	}

	public void setTotalSign(int totalSign) {
		this.totalSign = totalSign;
	}

	public int getSerialSign() {
		return serialSign;
	}

	public void setSerialSign(int serialSign) {
		this.serialSign = serialSign;
	}

}

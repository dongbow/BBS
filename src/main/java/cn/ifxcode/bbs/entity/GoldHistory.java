package cn.ifxcode.bbs.entity;

import java.io.Serializable;

public class GoldHistory implements Serializable {

	private static final long serialVersionUID = 6661620711504283662L;

	private long id;
	private long userId;
	private String nickname;
	private int goldValue;
	private int goldFrom;
	private String glodDesc;
	private String createTime;

	public GoldHistory() {
	}

	public GoldHistory(long userId, String nickname, int goldValue,
			int goldFrom, String createTime) {
		this.userId = userId;
		this.nickname = nickname;
		this.goldValue = goldValue;
		this.goldFrom = goldFrom;
		this.createTime = createTime;
	}

	public GoldHistory(long userId, String nickname, int goldValue,
			int goldFrom, String glodDesc, String createTime) {
		this.userId = userId;
		this.nickname = nickname;
		this.goldValue = goldValue;
		this.goldFrom = goldFrom;
		this.glodDesc = glodDesc;
		this.createTime = createTime;
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

	public int getGoldValue() {
		return goldValue;
	}

	public void setGoldValue(int goldValue) {
		this.goldValue = goldValue;
	}

	public int getGoldFrom() {
		return goldFrom;
	}

	public void setGoldFrom(int goldFrom) {
		this.goldFrom = goldFrom;
	}

	public String getGlodDesc() {
		return glodDesc;
	}

	public void setGlodDesc(String glodDesc) {
		this.glodDesc = glodDesc;
	}

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

}

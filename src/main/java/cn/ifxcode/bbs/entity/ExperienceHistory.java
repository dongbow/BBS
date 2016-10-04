package cn.ifxcode.bbs.entity;

import java.io.Serializable;

public class ExperienceHistory implements Serializable {

	private static final long serialVersionUID = -4919536410385946612L;

	private long id;
	private long userId;
	private String nickname;
	private int expValue;
	private String expDesc;
	private String createTime;

	public ExperienceHistory() {
	}

	public ExperienceHistory(long userId, String nickname, int expValue,
			String createTime) {
		this.userId = userId;
		this.nickname = nickname;
		this.expValue = expValue;
		this.createTime = createTime;
	}

	public ExperienceHistory(long userId, String nickname, int expValue,
			String expDesc, String createTime) {
		this.userId = userId;
		this.nickname = nickname;
		this.expValue = expValue;
		this.expDesc = expDesc;
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

	public int getExpValue() {
		return expValue;
	}

	public void setExpValue(int expValue) {
		this.expValue = expValue;
	}

	public String getExpDesc() {
		return expDesc;
	}

	public void setExpDesc(String expDesc) {
		this.expDesc = expDesc;
	}

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

}

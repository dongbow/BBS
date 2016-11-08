package cn.ifxcode.bbs.entity;

import java.io.Serializable;

public class UserFavorite implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private long favId;
	private long userId;
	private long needId1;
	private long needId2;
	private int favSign;
	private String favName;
	private String createTime;
	private String favIp;

	public long getFavId() {
		return favId;
	}

	public void setFavId(long favId) {
		this.favId = favId;
	}

	public long getUserId() {
		return userId;
	}

	public void setUserId(long userId) {
		this.userId = userId;
	}

	public int getFavSign() {
		return favSign;
	}

	public void setFavSign(int favSign) {
		this.favSign = favSign;
	}

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	public String getFavIp() {
		return favIp;
	}

	public void setFavIp(String favIp) {
		this.favIp = favIp;
	}

	public long getNeedId1() {
		return needId1;
	}

	public void setNeedId1(long needId1) {
		this.needId1 = needId1;
	}

	public long getNeedId2() {
		return needId2;
	}

	public void setNeedId2(long needId2) {
		this.needId2 = needId2;
	}

	public String getFavName() {
		return favName;
	}

	public void setFavName(String favName) {
		this.favName = favName;
	}

}

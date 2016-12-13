package cn.ifxcode.bbs.entity;

import java.io.Serializable;

public class BbsFileDown implements Serializable {

	private static final long serialVersionUID = 6205635258221225231L;

	private long id;
	private String uuid;
	private long uid;
	private String nickname;
	private String ip;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	public long getUid() {
		return uid;
	}

	public void setUid(long uid) {
		this.uid = uid;
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

}

package cn.ifxcode.bbs.entity;

import java.io.Serializable;
import java.util.Calendar;

import cn.ifxcode.bbs.constant.BbsConstant;
import cn.ifxcode.bbs.utils.DateUtils;

public class Backup implements Serializable {

	private static final long serialVersionUID = 3549080988348933861L;

	private long id;
	private String url;
	private String backTime;
	private long uid;
	private String nickname;
	
	public Backup() {
	}

	public Backup(String url, long uid, String nickname) {
		this.id = System.currentTimeMillis();
		this.url = url;
		this.uid = uid;
		this.nickname = nickname;
		this.backTime = DateUtils.dt14LongFormat(Calendar.getInstance().getTime());
	}

	
	public Backup(String url) {
		this.id = System.currentTimeMillis();
		this.url = url;
		this.uid = 99999L;
		this.nickname = BbsConstant.SYSTEM;
		this.backTime = DateUtils.dt14LongFormat(Calendar.getInstance().getTime());
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getBackTime() {
		return DateUtils.dt14LongFormat(DateUtils.dt14FromStr(backTime));
	}

	public void setBackTime(String backTime) {
		this.backTime = backTime;
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
	
}

package cn.ifxcode.bbs.entity;

import java.io.Serializable;
import java.util.Calendar;
import java.util.Date;

public class BadWord implements Serializable {

	private static final long serialVersionUID = 1030741601987443628L;

	private int id;
	private String badWord;
	private Date createTime;

	public BadWord() {
	}
	
	public BadWord(String badWord) {
		this.badWord = badWord;
		this.createTime = Calendar.getInstance().getTime();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getBadWord() {
		return badWord;
	}

	public void setBadWord(String badWord) {
		this.badWord = badWord;
	}

}

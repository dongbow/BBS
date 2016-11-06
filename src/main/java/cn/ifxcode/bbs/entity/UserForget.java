package cn.ifxcode.bbs.entity;

import java.io.Serializable;
import java.util.Date;

public class UserForget implements Serializable {

	private static final long serialVersionUID = 1856883760443551625L;

	private long id;
	private String username;
	private Date startTime;
	private Date endTime;
	private String params;
	
	public UserForget() {
	}

	public UserForget(String username, Date startTime) {
		this.username = username;
		this.startTime = startTime;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	public String getParams() {
		return params;
	}

	public void setParams(String params) {
		this.params = params;
	}

}

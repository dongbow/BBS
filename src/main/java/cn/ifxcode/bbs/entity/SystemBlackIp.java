package cn.ifxcode.bbs.entity;

import java.io.Serializable;

import cn.ifxcode.bbs.utils.DateUtils;

public class SystemBlackIp implements Serializable{

	private static final long serialVersionUID = 3788901343180619316L;
	
	private Integer id;
	private String blackIp;
	private String blackCreateTime;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getBlackIp() {
		return blackIp;
	}

	public void setBlackIp(String blackIp) {
		this.blackIp = blackIp;
	}

	public String getBlackCreateTime() {
		return DateUtils.dt14LongFormat(DateUtils.dt14FromStr(blackCreateTime));
	}

	public void setBlackCreateTime(String blackCreateTime) {
		this.blackCreateTime = blackCreateTime;
	}
}

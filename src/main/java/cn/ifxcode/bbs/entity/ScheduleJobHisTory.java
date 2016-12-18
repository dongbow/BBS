package cn.ifxcode.bbs.entity;

import java.io.Serializable;
import java.util.Date;

import cn.ifxcode.bbs.constant.BbsConstant;
import cn.ifxcode.bbs.utils.DateUtils;

public class ScheduleJobHisTory implements Serializable {

	private static final long serialVersionUID = 7106486296405301619L;

	private long id;
	private String jobName;
	private String execStatus;
	private long uid;
	private String nickname;
	private String execTime;

	public ScheduleJobHisTory(String jobName, String execStatus) {
		this.jobName = jobName;
		this.execStatus = execStatus;
		this.uid = 99999L;
		this.nickname = BbsConstant.SYSTEM;
		this.execTime = DateUtils.dt14LongFormat(new Date());
	}

	public ScheduleJobHisTory(String jobName, String execStatus, long uid, String nickname) {
		this.jobName = jobName;
		this.execStatus = execStatus;
		this.uid = uid;
		this.nickname = nickname;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getJobName() {
		return jobName;
	}

	public void setJobName(String jobName) {
		this.jobName = jobName;
	}

	public String getExecStatus() {
		return execStatus;
	}

	public void setExecStatus(String execStatus) {
		this.execStatus = execStatus;
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

	public String getExecTime() {
		return execTime;
	}

	public void setExecTime(String execTime) {
		this.execTime = execTime;
	}

}
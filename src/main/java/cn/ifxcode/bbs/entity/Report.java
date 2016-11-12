package cn.ifxcode.bbs.entity;

import java.io.Serializable;

public class Report implements Serializable {

	private static final long serialVersionUID = 2978442255037392215L;

	private long reportId;
	private long beUid;
	private long beTid;
	private long beRid;
	private int beFloor;
	private String reason;
	private String cusReason;
	private String beUrl;
	private long uid;
	private String nickname;
	private String reportIp;
	private String reportTime;
	private int reportStatus;
	private String updateTime;

	public long getReportId() {
		return reportId;
	}

	public void setReportId(long reportId) {
		this.reportId = reportId;
	}

	public long getBeUid() {
		return beUid;
	}

	public void setBeUid(long beUid) {
		this.beUid = beUid;
	}

	public long getBeTid() {
		return beTid;
	}

	public void setBeTid(long beTid) {
		this.beTid = beTid;
	}

	public long getBeRid() {
		return beRid;
	}

	public void setBeRid(long beRid) {
		this.beRid = beRid;
	}

	public int getBeFloor() {
		return beFloor;
	}

	public void setBeFloor(int beFloor) {
		this.beFloor = beFloor;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public String getCusReason() {
		return cusReason;
	}

	public void setCusReason(String cusReason) {
		this.cusReason = cusReason;
	}

	public String getBeUrl() {
		return beUrl;
	}

	public void setBeUrl(String beUrl) {
		this.beUrl = beUrl;
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

	public String getReportIp() {
		return reportIp;
	}

	public void setReportIp(String reportIp) {
		this.reportIp = reportIp;
	}

	public String getReportTime() {
		return reportTime;
	}

	public void setReportTime(String reportTime) {
		this.reportTime = reportTime;
	}

	public int getReportStatus() {
		return reportStatus;
	}

	public void setReportStatus(int reportStatus) {
		this.reportStatus = reportStatus;
	}

	public String getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(String updateTime) {
		this.updateTime = updateTime;
	}

}

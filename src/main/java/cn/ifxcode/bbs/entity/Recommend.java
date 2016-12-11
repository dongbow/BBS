package cn.ifxcode.bbs.entity;

import java.io.Serializable;

public class Recommend implements Serializable {

	private static final long serialVersionUID = 7324741915852254205L;

	private int rcId;
	private String rcName;
	private String rcHref;
	private int rcSort;
	private int rcStatus;
	private String createTime;
	private int location;

	public int getRcId() {
		return rcId;
	}

	public void setRcId(int rcId) {
		this.rcId = rcId;
	}

	public String getRcName() {
		return rcName;
	}

	public void setRcName(String rcName) {
		this.rcName = rcName;
	}

	public String getRcHref() {
		return rcHref;
	}

	public void setRcHref(String rcHref) {
		this.rcHref = rcHref;
	}

	public int getRcSort() {
		return rcSort;
	}

	public void setRcSort(int rcSort) {
		this.rcSort = rcSort;
	}

	public int getRcStatus() {
		return rcStatus;
	}

	public void setRcStatus(int rcStatus) {
		this.rcStatus = rcStatus;
	}

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	public int getLocation() {
		return location;
	}

	public void setLocation(int location) {
		this.location = location;
	}

}

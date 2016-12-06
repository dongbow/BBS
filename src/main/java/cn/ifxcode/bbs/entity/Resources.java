package cn.ifxcode.bbs.entity;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class Resources implements Serializable, Comparable<Resources> {

	private static final long serialVersionUID = -4940735715008958259L;
	
	private Integer resId;
	private String resName;
	private String resLink;
	private String resSign;
	private Integer resType;
	private int resStatus;
	private int resSort;
	private Integer resParentId;
	private String resCreateTime;
	private String resIcon;
	private List<Role> roles;
	private List<Resources> resources = new ArrayList<Resources>();

	public Integer getResId() {
		return resId;
	}

	public void setResId(Integer resId) {
		this.resId = resId;
	}

	public String getResName() {
		return resName;
	}

	public void setResName(String resName) {
		this.resName = resName;
	}

	public String getResLink() {
		return resLink;
	}

	public void setResLink(String resLink) {
		this.resLink = resLink;
	}

	public String getResSign() {
		return resSign;
	}

	public void setResSign(String resSign) {
		this.resSign = resSign;
	}

	public Integer getResType() {
		return resType;
	}

	public void setResType(Integer resType) {
		this.resType = resType;
	}

	public int getResStatus() {
		return resStatus;
	}

	public void setResStatus(int resStatus) {
		this.resStatus = resStatus;
	}

	public int getResSort() {
		return resSort;
	}

	public void setResSort(int resSort) {
		this.resSort = resSort;
	}

	public Integer getResParentId() {
		return resParentId;
	}

	public void setResParentId(Integer resParentId) {
		this.resParentId = resParentId;
	}

	public String getResCreateTime() {
		return resCreateTime;
	}

	public void setResCreateTime(String resCreateTime) {
		this.resCreateTime = resCreateTime;
	}

	public List<Role> getRoles() {
		return roles;
	}

	public void setRoles(List<Role> roles) {
		this.roles = roles;
	}

	public List<Resources> getResources() {
		return resources;
	}

	public void setResources(List<Resources> resources) {
		this.resources = resources;
	}

	public void addChild(Resources res) {
		this.resources.add(res);
	}

	public String toString() {
		return "Resources [resId=" + resId + ", resName=" + resName
				+ ", resLink=" + resLink + ", resSign=" + resSign
				+ ", resType=" + resType + ", resStatus=" + resStatus
				+ ", resSort=" + resSort + ", resParentId=" + resParentId
				+ ", resCreateTime=" + resCreateTime + ", roles=" + roles
				+ ", resources=" + resources + "]";
	}

	public String getResIcon() {
		return resIcon;
	}

	public void setResIcon(String resIcon) {
		this.resIcon = resIcon;
	}

	@Override
	public int compareTo(Resources res) {
		return this.resId.compareTo(res.resId);
	}
	
}

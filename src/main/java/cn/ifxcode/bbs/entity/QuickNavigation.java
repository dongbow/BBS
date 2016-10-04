package cn.ifxcode.bbs.entity;

import java.io.Serializable;

public class QuickNavigation implements Serializable {

	private static final long serialVersionUID = 7203315934723578137L;

	private int id;
	private String quickName;
	private String quickLink;
	private String quickColor;
	private int quickSort;
	private int quickStatus;
	private String quickCreateTime;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getQuickName() {
		return quickName;
	}

	public void setQuickName(String quickName) {
		this.quickName = quickName;
	}

	public String getQuickLink() {
		return quickLink;
	}

	public void setQuickLink(String quickLink) {
		this.quickLink = quickLink;
	}

	public String getQuickColor() {
		return quickColor;
	}

	public void setQuickColor(String quickColor) {
		this.quickColor = quickColor;
	}

	public int getQuickSort() {
		return quickSort;
	}

	public void setQuickSort(int quickSort) {
		this.quickSort = quickSort;
	}

	public int getQuickStatus() {
		return quickStatus;
	}

	public void setQuickStatus(int quickStatus) {
		this.quickStatus = quickStatus;
	}

	public String getQuickCreateTime() {
		return quickCreateTime;
	}

	public void setQuickCreateTime(String quickCreateTime) {
		this.quickCreateTime = quickCreateTime;
	}

}

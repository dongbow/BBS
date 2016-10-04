package cn.ifxcode.bbs.entity;

import java.io.Serializable;

public class HomeImage implements Serializable {

	private static final long serialVersionUID = 1201449977007694487L;

	private int id;
	private String homeTitle;
	private String homeLink;
	private String homeImgLink;
	private int homeSort;
	private int homeStatus;
	private String homeCreateTime;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getHomeTitle() {
		return homeTitle;
	}

	public void setHomeTitle(String homeTitle) {
		this.homeTitle = homeTitle;
	}

	public String getHomeLink() {
		return homeLink;
	}

	public void setHomeLink(String homeLink) {
		this.homeLink = homeLink;
	}

	public String getHomeImgLink() {
		return homeImgLink;
	}

	public void setHomeImgLink(String homeImgLink) {
		this.homeImgLink = homeImgLink;
	}

	public int getHomeSort() {
		return homeSort;
	}

	public void setHomeSort(int homeSort) {
		this.homeSort = homeSort;
	}

	public int getHomeStatus() {
		return homeStatus;
	}

	public void setHomeStatus(int homeStatus) {
		this.homeStatus = homeStatus;
	}

	public String getHomeCreateTime() {
		return homeCreateTime;
	}

	public void setHomeCreateTime(String homeCreateTime) {
		this.homeCreateTime = homeCreateTime;
	}

}

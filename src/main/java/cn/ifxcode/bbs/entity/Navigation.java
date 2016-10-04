package cn.ifxcode.bbs.entity;

import java.io.Serializable;
import java.util.List;

public class Navigation implements Serializable{

	private static final long serialVersionUID = -6987826886022157275L;
	
	private Integer navId;
	private String navName;
	private String navDesc;
	private int navSort;
	private int navStatus;
	private String navCreateTime;
	private List<Board> boards;

	public Integer getNavId() {
		return navId;
	}

	public void setNavId(Integer navId) {
		this.navId = navId;
	}

	public String getNavName() {
		return navName;
	}

	public void setNavName(String navName) {
		this.navName = navName;
	}

	public String getNavDesc() {
		return navDesc;
	}

	public void setNavDesc(String navDesc) {
		this.navDesc = navDesc;
	}

	public int getNavSort() {
		return navSort;
	}

	public void setNavSort(int navSort) {
		this.navSort = navSort;
	}

	public int getNavStatus() {
		return navStatus;
	}

	public void setNavStatus(int navStatus) {
		this.navStatus = navStatus;
	}

	public String getNavCreateTime() {
		return navCreateTime;
	}

	public void setNavCreateTime(String navCreateTime) {
		this.navCreateTime = navCreateTime;
	}

	public String toString() {
		return "Navigation [navId=" + navId + ", navName=" + navName
				+ ", navDesc=" + navDesc + ", navSort=" + navSort
				+ ", navStatus=" + navStatus + ", navCreateTime="
				+ navCreateTime + "]";
	}

	public List<Board> getBoards() {
		return boards;
	}

	public void setBoards(List<Board> boards) {
		this.boards = boards;
	}

}

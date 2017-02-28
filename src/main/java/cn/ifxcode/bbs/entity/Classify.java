package cn.ifxcode.bbs.entity;

import java.io.Serializable;

public class Classify implements Serializable {

	private static final long serialVersionUID = -4733336835739534873L;

	private Integer classId;
	private Integer boardId;
	private Integer navId;
	private String className;
	private int classStatus;
	private String classColor;
	private int classSort;
	private long classTopicCount;
	private String classCreateTime;
	private int auth;

	public Integer getClassId() {
		return classId;
	}

	public void setClassId(Integer classId) {
		this.classId = classId;
	}

	public Integer getBoardId() {
		return boardId;
	}

	public void setBoardId(Integer boardId) {
		this.boardId = boardId;
	}

	public Integer getNavId() {
		return navId;
	}

	public void setNavId(Integer navId) {
		this.navId = navId;
	}

	public String getClassName() {
		return className;
	}

	public void setClassName(String className) {
		this.className = className;
	}

	public int getClassStatus() {
		return classStatus;
	}

	public void setClassStatus(int classStatus) {
		this.classStatus = classStatus;
	}

	public String getClassColor() {
		return classColor;
	}

	public void setClassColor(String classColor) {
		this.classColor = classColor;
	}

	public int getClassSort() {
		return classSort;
	}

	public void setClassSort(int classSort) {
		this.classSort = classSort;
	}

	public long getClassTopicCount() {
		return classTopicCount;
	}

	public void setClassTopicCount(long classTopicCount) {
		this.classTopicCount = classTopicCount;
	}

	public String getClassCreateTime() {
		return classCreateTime;
	}

	public void setClassCreateTime(String classCreateTime) {
		this.classCreateTime = classCreateTime;
	}

	public int getAuth() {
		return auth;
	}

	public void setAuth(int auth) {
		this.auth = auth;
	}

	@Override
	public String toString() {
		return "Classify [classId=" + classId + ", boardId=" + boardId
				+ ", navId=" + navId + ", className=" + className
				+ ", classStatus=" + classStatus + ", classColor=" + classColor
				+ ", classSort=" + classSort + ", classTopicCount="
				+ classTopicCount + ", classCreateTime=" + classCreateTime
				+ ", auth=" + auth + "]";
	}

}

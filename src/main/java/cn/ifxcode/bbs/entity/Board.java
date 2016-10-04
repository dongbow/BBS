package cn.ifxcode.bbs.entity;

import java.io.Serializable;
import java.util.List;

public class Board implements Serializable {

	private static final long serialVersionUID = -6609658722104367678L;

	private int boardId;
	private int navId;
	private String boardName;
	private String boardColor;
	private String boardDesc;
	private int boardStatus;
	private int boardSort;
	private String boardManager;
	private int boardIsOpen;
	private String boardCreateTime;
	private List<String> boardManagerName;

	public int getBoardId() {
		return boardId;
	}

	public void setBoardId(int boardId) {
		this.boardId = boardId;
	}

	public int getNavId() {
		return navId;
	}

	public void setNavId(int navId) {
		this.navId = navId;
	}

	public String getBoardName() {
		return boardName;
	}

	public void setBoardName(String boardName) {
		this.boardName = boardName;
	}

	public String getBoardColor() {
		return boardColor;
	}

	public void setBoardColor(String boardColor) {
		this.boardColor = boardColor;
	}

	public String getBoardDesc() {
		return boardDesc;
	}

	public void setBoardDesc(String boardDesc) {
		this.boardDesc = boardDesc;
	}

	public int getBoardStatus() {
		return boardStatus;
	}

	public void setBoardStatus(int boardStatus) {
		this.boardStatus = boardStatus;
	}

	public int getBoardSort() {
		return boardSort;
	}

	public void setBoardSort(int boardSort) {
		this.boardSort = boardSort;
	}

	public String getBoardManager() {
		return boardManager;
	}

	public void setBoardManager(String boardManager) {
		this.boardManager = boardManager;
	}

	public int getBoardIsOpen() {
		return boardIsOpen;
	}

	public void setBoardIsOpen(int boardIsOpen) {
		this.boardIsOpen = boardIsOpen;
	}

	public String getBoardCreateTime() {
		return boardCreateTime;
	}

	public void setBoardCreateTime(String boardCreateTime) {
		this.boardCreateTime = boardCreateTime;
	}

	public List<String> getBoardManagerName() {
		return boardManagerName;
	}

	public void setBoardManagerName(List<String> boardManagerName) {
		this.boardManagerName = boardManagerName;
	}

}

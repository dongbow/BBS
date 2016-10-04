package cn.ifxcode.bbs.entity;

import java.io.Serializable;

public class BoardInfo implements Serializable {

	private static final long serialVersionUID = -8244699778328295651L;

	private int boardId;
	private long boardClickCount;
	private int boardTopicCount;
	private int boardReplyCount;
	private int boardFavoriteCount;

	public int getBoardId() {
		return boardId;
	}

	public void setBoardId(int boardId) {
		this.boardId = boardId;
	}

	public long getBoardClickCount() {
		return boardClickCount;
	}

	public void setBoardClickCount(long boardClickCount) {
		this.boardClickCount = boardClickCount;
	}

	public int getBoardTopicCount() {
		return boardTopicCount;
	}

	public void setBoardTopicCount(int boardTopicCount) {
		this.boardTopicCount = boardTopicCount;
	}

	public int getBoardReplyCount() {
		return boardReplyCount;
	}

	public void setBoardReplyCount(int boardReplyCount) {
		this.boardReplyCount = boardReplyCount;
	}

	public int getBoardFavoriteCount() {
		return boardFavoriteCount;
	}

	public void setBoardFavoriteCount(int boardFavoriteCount) {
		this.boardFavoriteCount = boardFavoriteCount;
	}

}

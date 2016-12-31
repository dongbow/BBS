package cn.ifxcode.bbs.dao;

import cn.ifxcode.bbs.entity.BoardInfo;

public interface BoardInfoDao {

	public BoardInfo getBoardInfoByBoardId(int boardId);

	public int updateBoardInfo(BoardInfo info);

}

package cn.ifxcode.bbs.service;

import com.alibaba.fastjson.JSONObject;

import cn.ifxcode.bbs.entity.Board;
import cn.ifxcode.bbs.entity.BoardInfo;
import cn.ifxcode.bbs.enumtype.BoardSign;

public interface BoardService {

	public Board getBoardByBoardId(JSONObject object, int boardId);

	public BoardInfo getBoardInfoByBoardId(int boardId);

	public Board getBoardByBoardId(Integer navId, Integer boardId);

	public JSONObject saveOrUpdateBoardInfo(int boardId, BoardSign sign, int favorite);
	
	public BoardInfo getBoardInfoFromRedis(int boardId);

}

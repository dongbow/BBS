package cn.ifxcode.bbs.service;

import java.util.List;

import com.alibaba.fastjson.JSONObject;

import cn.ifxcode.bbs.bean.Page;
import cn.ifxcode.bbs.entity.Board;
import cn.ifxcode.bbs.entity.BoardInfo;
import cn.ifxcode.bbs.enumtype.BoardSign;

public interface BoardService {

	public Board getBoardByBoardId(JSONObject object, int boardId);

	public BoardInfo getBoardInfoByBoardId(int boardId);
	
	public List<Board> getBoardByNavId(Integer navId);

	public Board getBoardByBoardId(Integer navId, Integer boardId);

	public JSONObject saveOrUpdateBoardInfo(int boardId, BoardSign sign, int favorite);
	
	public BoardInfo getBoardInfoFromRedis(int boardId);

	public List<Board> getBMC(List<Integer> boardIds);

	public List<Board> getAllBoard();
	
	public List<Board> getAllBoard(Page page);

	public List<Board> getAllBoards();

	public boolean isExists(String bid);

}

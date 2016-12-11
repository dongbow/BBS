package cn.ifxcode.bbs.dao;

import java.util.List;
import java.util.Map;

import cn.ifxcode.bbs.entity.Board;

public interface BoardDao {

	public List<Board> getBoardsByNavId(Integer navId);

	public List<Integer> getBoardId();

	public List<Board> getAllBoard(Map<String, Object> map);

}

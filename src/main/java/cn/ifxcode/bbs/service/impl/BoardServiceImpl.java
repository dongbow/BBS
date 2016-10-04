package cn.ifxcode.bbs.service.impl;

import java.util.List;

import javax.annotation.Resource;

import ltang.redis.service.RedisObjectMapService;

import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

import cn.ifxcode.bbs.dao.BoardDao;
import cn.ifxcode.bbs.dao.BoardInfoDao;
import cn.ifxcode.bbs.entity.Board;
import cn.ifxcode.bbs.entity.BoardInfo;
import cn.ifxcode.bbs.service.BoardService;
import cn.ifxcode.bbs.utils.JsonUtils;
import cn.ifxcode.bbs.utils.RedisKeyUtils;

@Service
public class BoardServiceImpl implements BoardService {

	@Resource
	private BoardDao boardDao;
	
	@Resource
	private BoardInfoDao boardInfoDao;

	@Resource
	private RedisObjectMapService redisObjectMapService;
	
	@Override
	public Board getBoardByBoardId(JSONObject object, int boardId) {
		JSONArray array = JSONArray.parseArray(object.getString("boards"));
		List<Board> boards = JsonUtils.decodeJson(array, Board.class);
		for (Board board : boards) {
			if(board.getBoardId() == boardId) {
				return board;
			}
		}
		return null;
	}

	@Override
	public BoardInfo getBoardInfoByBoardId(int boardId) {
		return boardInfoDao.getBoardInfoByBoardId(boardId);
	}

	@Override
	public Board getBoardByBoardId(Integer navId, Integer boardId) {
		JSONObject object = redisObjectMapService.get(RedisKeyUtils.getBoardsByNavId((int) navId), JSONObject.class);
		return this.getBoardByBoardId(object, boardId);
	}
	
}

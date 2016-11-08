package cn.ifxcode.bbs.service.impl;

import java.util.List;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

import javax.annotation.Resource;

import ltang.redis.service.RedisObjectMapService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

import cn.ifxcode.bbs.dao.BoardDao;
import cn.ifxcode.bbs.dao.BoardInfoDao;
import cn.ifxcode.bbs.entity.Board;
import cn.ifxcode.bbs.entity.BoardInfo;
import cn.ifxcode.bbs.enumtype.BoardSign;
import cn.ifxcode.bbs.service.BoardService;
import cn.ifxcode.bbs.utils.JsonUtils;
import cn.ifxcode.bbs.utils.RedisKeyUtils;

@Service
public class BoardServiceImpl implements BoardService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
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

	public JSONObject saveOrUpdateBoardInfo(int boardId, BoardSign sign, int favorite) {
		synchronized (this) {
			JSONObject object = redisObjectMapService.get(RedisKeyUtils.getBoardInfoByBoardId(boardId), JSONObject.class);
			BoardInfo boardInfo = new BoardInfo();
			if(object == null) {
				boardInfo.setBoardId(boardId);
				boardInfo.setBoardClickCount(1);
				boardInfo.setBoardReplyCount(0);
				boardInfo.setBoardFavoriteCount(0);
				boardInfo.setBoardTopicCount(0);
			} else {
				boardInfo = JSON.toJavaObject(object, BoardInfo.class);
				if(sign.getCode() == 0) {
					boardInfo.setBoardTopicCount(boardInfo.getBoardTopicCount() + 1);
				} else if(sign.getCode() == 1) {
					boardInfo.setBoardReplyCount(boardInfo.getBoardReplyCount() + 1);
				} else if(sign.getCode() == 2) {
					boardInfo.setBoardFavoriteCount(boardInfo.getBoardFavoriteCount() + favorite);
				} else if(sign.getCode() == 3) {
					boardInfo.setBoardClickCount(boardInfo.getBoardClickCount() + 1);
				}
			}
			object = JSONObject.parseObject(JSON.toJSONString(boardInfo));
			redisObjectMapService.save(RedisKeyUtils.getBoardInfoByBoardId(boardId), object, JSONObject.class);
			return object;
		}
	}
	
	@Override
	public BoardInfo getBoardInfoFromRedis(int boardId) {
		Lock lock = new ReentrantLock();
		BoardInfo boardInfo = null;
		try {
			lock.lock();
			JSONObject object = this.saveOrUpdateBoardInfo(boardId, BoardSign.CLICK, 0);
			boardInfo = JSON.toJavaObject(object, BoardInfo.class);
		} catch (Exception e) {
			logger.error("insertBoardInfo fail", e.getMessage());
		} finally {
			lock.unlock();
		}
		return boardInfo;
	}

}

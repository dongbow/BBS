package cn.ifxcode.bbs.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

import javax.annotation.Resource;

import ltang.redis.service.RedisObjectMapService;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.google.common.collect.Maps;

import cn.ifxcode.bbs.bean.Page;
import cn.ifxcode.bbs.dao.BoardDao;
import cn.ifxcode.bbs.dao.BoardInfoDao;
import cn.ifxcode.bbs.entity.Board;
import cn.ifxcode.bbs.entity.BoardInfo;
import cn.ifxcode.bbs.entity.Navigation;
import cn.ifxcode.bbs.enumtype.BoardSign;
import cn.ifxcode.bbs.service.BoardService;
import cn.ifxcode.bbs.service.NavigationService;
import cn.ifxcode.bbs.utils.DateUtils;
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
	
	@Resource
	private NavigationService navigationService;
	
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

	@Override
	public List<Board> getBMC(List<Integer> boardIds) {
		JSONObject object = redisObjectMapService.get(RedisKeyUtils.getNavigations(), JSONObject.class);
		JSONArray array = JSONArray.parseArray(object.getString("navigations"));
		List<Navigation> navigations = JsonUtils.decodeJson(array, Navigation.class);
		List<Board> list = new ArrayList<Board>();
		for (Navigation n : navigations) {
			JSONObject boardObject = redisObjectMapService.get(RedisKeyUtils.getBoardsByNavId((int) n.getNavId()), JSONObject.class);
			JSONArray boardArray = JSONArray.parseArray(boardObject.getString("boards"));
			List<Board> boards = JsonUtils.decodeJson(boardArray, Board.class);
			for (Board board : boards) {
				for (Integer id : boardIds) {
					if(id.equals(board.getBoardId())) {
						list.add(board);
					}
				}
			}
		}
		return list;
	}

	public List<Board> getAllBoard() {
		List<Navigation> navigations = navigationService.getAllNavigations();
		List<Board> list = new ArrayList<Board>();
		for (Navigation nav : navigations) {
			JSONObject object = redisObjectMapService.get(RedisKeyUtils.getBoardsByNavId(nav.getNavId()), JSONObject.class);
			JSONArray array = JSONArray.parseArray(object.getString("boards"));
			List<Board> boards = JsonUtils.decodeJson(array, Board.class);
			list.addAll(boards);
		}
		return list;
	}
	
	@Override
	public List<Board> getAllBoard(Page page) {
		return this.getAllBoardWithCondition(page, null, null, 0, null, -1, 0, -1, -1);
	}
	
	public List<Board> getAllBoardWithCondition(Page page, String startTime, String endTime, int boardId, 
			String boardName, int status, int navId, int isOpen, int access) {
		Map<String, Object> map = Maps.newHashMap();
		if (page != null) {
			map.put("page", page);
		}
		if (StringUtils.isNotBlank(startTime)) {
			map.put("starttime", startTime);
		}
		if(StringUtils.isNotBlank(endTime)) {
			map.put("endtime", endTime);
		}
		if(boardId != 0) {
			map.put("bid", boardId);
		}
		if(StringUtils.isNotBlank(boardName)) {
			map.put("name", "%" + boardName + "%");
		}
		if(status != -1) {
			map.put("status", status);
		}
		if(navId != 0) {
			map.put("navId", navId);
		}
		if(isOpen != -1) {
			map.put("isOpen", isOpen);
		}
		if(access != -1) {
			map.put("access", access);
		}
		List<Board> boards = boardDao.getAllBoard(map);
		for (Board board : boards) {
			board.setBoardCreateTime(DateUtils.dt14LongFormat(DateUtils.dt14FromStr(board.getBoardCreateTime())));
		}
		return boards;
	}

	@Override
	public List<Board> getAllBoards() {
		return this.getAllBoard(null);
	}

}

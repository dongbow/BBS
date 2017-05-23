package cn.ifxcode.bbs.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import ltang.redis.service.RedisObjectMapService;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.util.HtmlUtils;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;

import cn.ifxcode.bbs.bean.CookieBean;
import cn.ifxcode.bbs.bean.Page;
import cn.ifxcode.bbs.constant.BbsConstant;
import cn.ifxcode.bbs.dao.TopicDao;
import cn.ifxcode.bbs.dao.TopicDataDao;
import cn.ifxcode.bbs.dao.TopicInfoDao;
import cn.ifxcode.bbs.dao.UserValueDao;
import cn.ifxcode.bbs.entity.Board;
import cn.ifxcode.bbs.entity.Topic;
import cn.ifxcode.bbs.entity.TopicData;
import cn.ifxcode.bbs.entity.TopicInfo;
import cn.ifxcode.bbs.enumtype.Audit;
import cn.ifxcode.bbs.enumtype.BoardSign;
import cn.ifxcode.bbs.enumtype.EGHistory;
import cn.ifxcode.bbs.enumtype.TopicSign;
import cn.ifxcode.bbs.logger.BmcLogAnno;
import cn.ifxcode.bbs.logger.SysLog;
import cn.ifxcode.bbs.lucene.LuceneIndexUtils;
import cn.ifxcode.bbs.service.BoardService;
import cn.ifxcode.bbs.service.ClassifyService;
import cn.ifxcode.bbs.service.GeneralService;
import cn.ifxcode.bbs.service.TopicService;
import cn.ifxcode.bbs.service.UserService;
import cn.ifxcode.bbs.utils.DateUtils;
import cn.ifxcode.bbs.utils.GetRemoteIpUtil;
import cn.ifxcode.bbs.utils.JsonUtils;
import cn.ifxcode.bbs.utils.NumberUtils;
import cn.ifxcode.bbs.utils.RedisKeyUtils;
import cn.ifxcode.bbs.utils.SystemConfigUtils;

@Service
public class TopicServiceImpl implements TopicService{

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Resource
	private TopicDao topicDao;
	
	@Resource
	private UserService userService;
	
	@Resource
	private TopicInfoDao topicInfoDao;
	
	@Resource
	private TopicDataDao topicDataDao;
	
	@Resource
	private UserValueDao userValueDao;
	
	@Resource
	private GeneralService generalService;
	
	@Resource
	private BoardService boardService;
	
	@Resource
	private ClassifyService classifyService;
	
	@Resource
	private RedisObjectMapService redisObjectMapService;
	
	private Lock lock = new ReentrantLock();
	
	@Override
	@Transactional
	public long insertTopic(int cid, String ttitle, String tcontent, long uid,
			int bid, int gid, String filelist, int isreply, int iselite, int istop,
			int isglobaltop, int ishome, HttpServletRequest request) {
		if (lock.tryLock()) {
			try {
				Topic topic = new Topic();
				topic.setBoardId(bid);
				topic.setClassId(cid);
				topic.setNavId(gid);
				topic.setUserId(uid);
				topic.setTopicTitle(ttitle);
				topic.setTopicContent(HtmlUtils.htmlEscape(tcontent));
				topic.setTopicCreateIp(GetRemoteIpUtil.getRemoteIp(request));
				topic.setTopicCreateTime(DateUtils.dt14LongFormat(new Date()));
				topic.setTopicStatus(0);
				topic.setTopicFileIds(filelist);
				if(topicDao.insertTopic(topic) == BbsConstant.OK) {
					TopicInfo topicInfo = new TopicInfo();
					topicInfo.setTopicId(topic.getTopicId());
					if(SystemConfigUtils.getIsOpenTopicAudit()) {
						topicInfo.setTopicIsCheck(0);
					} else {
						topicInfo.setTopicIsCheck(1);
					}
					topicInfo.setTopicIsCream(iselite);
					topicInfo.setTopicIsGlobalTop(isglobaltop);
					topicInfo.setTopicIsHome(ishome);
					topicInfo.setTopicIsHot(0);
					topicInfo.setTopicIsLocalTop(istop);
					topicInfo.setTopicIsReply(isreply);
					if(topicInfoDao.insert(topicInfo) == BbsConstant.OK) {
						TopicData topicData = new TopicData();
						topicData.setTopicFavoriteCount(0);
						topicData.setTopicId(topic.getTopicId());
						topicData.setTopicReplyCount(0);
						topicData.setTopicViewCount(0);
						if(topicDataDao.insert(topicData) == BbsConstant.OK
								&& generalService.UserAward(EGHistory.TOPIC, uid, request) == BbsConstant.OK) {
							boardService.saveOrUpdateBoardInfo(bid, BoardSign.TOPIC, 0);
							classifyService.saveOrUpdateCount(bid, cid);
							LuceneIndexUtils.addIndex(topic);
							return topic.getTopicId();
						}
					}
				}
			} catch (Exception e) {
				logger.error("insertTopic fail", e);
			} finally {
				lock.unlock();
			}
		}
		return BbsConstant.ERROR;
	}

	@Override
	public Topic getTopicByTopicId(long topicId) {
		return topicDao.getTopicByTopicId(topicId);
	}

	@Override
	public JSONObject saveOrUpdateTopicData(long topicId, TopicSign topicSign, String topicTitleStyle, String lastestReplyUser,
			String lastestReplyTime, long topicUpdateUserId, String topicUpdateUser, String topicUpdateTime) {
		synchronized (this) {
			JSONObject object = redisObjectMapService.get(RedisKeyUtils.getTopicData(topicId), JSONObject.class);
			TopicData topicData = new TopicData();
			if(object == null) {
				topicData.setTopicId(topicId);
				topicData.setTopicViewCount(1);
			} else {
				topicData = JSON.toJavaObject(object, TopicData.class);
				if(topicSign != null) {
					if(topicSign.getCode() == 0) {
						topicData.setTopicViewCount(topicData.getTopicViewCount() + 1);
					} else if(topicSign.getCode() == 1) {
						topicData.setTopicReplyCount(topicData.getTopicReplyCount() + 1);
					} else if(topicSign.getCode() == 2) {
						if(topicData.getTopicFavoriteCount() == null) {
							topicData.setTopicFavoriteCount(1);
						} else{
							topicData.setTopicFavoriteCount(topicData.getTopicFavoriteCount() + 1);
						}
					}
				}
				if(StringUtils.isNotBlank(lastestReplyTime)) {
					topicData.setLastestReplyTime(lastestReplyTime);
				}
				if(StringUtils.isNotBlank(lastestReplyUser)) {
					topicData.setLastestReplyUser(lastestReplyUser);
				}
				if(StringUtils.isNotBlank(topicUpdateTime)) {
					topicData.setTopicUpdateTime(topicUpdateTime);
				}
				if(StringUtils.isNotBlank(topicUpdateUser)) {
					topicData.setTopicUpdateUser(topicUpdateUser);
				}
				if(topicUpdateUserId != -1) {
					topicData.setTopicUpdateUserId(topicUpdateUserId);
				}
				if(StringUtils.isNotBlank(topicTitleStyle)) {
					topicData.setTopicTitleStyle(topicTitleStyle);
				}
			}
			object = JSONObject.parseObject(JSON.toJSONString(topicData));
			redisObjectMapService.save(RedisKeyUtils.getTopicData(topicId), object, JSONObject.class);
			return object;
		}
	}
	
	@Override
	public TopicData getTopicDateFromRedis(long topicId, Integer boardId) {
		synchronized (this) {
			TopicData topicData = null;
			try{
				JSONObject object = saveOrUpdateTopicData(topicId, TopicSign.VIEW, null, null, null, -1, null, null);
				boardService.saveOrUpdateBoardInfo(boardId, BoardSign.CLICK, 0);
				topicData = JSON.toJavaObject(object, TopicData.class);
				if (StringUtils.isNotBlank(topicData.getTopicUpdateTime())) {
					topicData.setTopicUpdateTime(DateUtils.dt14LongFormat(DateUtils.dt14FromStr(topicData.getTopicUpdateTime())));
				}
			} catch (Exception e) {
				logger.error("insertTopicData fail", e);
			}
			return topicData;
		}
	}

	@Override
	public List<Topic> getTopicListByUserId(Long userId, Page page) {
		Map<String, Object> map = Maps.newHashMap();
		map.put("page", page);
		map.put("userId", userId);
		List<Topic> topics = topicDao.getTopicListByUserId(map);
		formatTopic(topics);
		return topics;
	}
	
	public Topic getTopicForReplyByTopicId(long topicId) {
		Topic topic = topicDao.getTopicByTopicId(topicId);
		try {
			topic.setBoard(boardService.getBoardByBoardId(topic.getNavId(), topic.getBoardId()));
		} catch (Exception e) {
			long gid = topic.getNavId();
			long bid = topic.getBoardId();
			logger.debug("gid:{}, bid:{}", gid, bid);
		}
		JSONObject object = saveOrUpdateTopicData(topic.getTopicId(), null, null, null, null, -1, null, null);
		topic.setTopicData(JSON.toJavaObject(object, TopicData.class));
		return topic;
	}
	
	private void formatTopic(List<Topic> topics) {
		if(!topics.isEmpty() && topics.size() > 0) {
			for (Topic topic : topics) {
				topic.setBoard(boardService.getBoardByBoardId(topic.getNavId(), topic.getBoardId()));
				JSONObject object = saveOrUpdateTopicData(topic.getTopicId(), null, null, null, null, -1, null, null);
				topic.setTopicData(JSON.toJavaObject(object, TopicData.class));
			}
		}
	}

	public List<Topic> getGlobalTopTopic() {
		List<Topic> topics = topicDao.getGlobalTopTopic();
		formatTopicData(topics);
		return topics;
	}
	
	public List<Topic> getHomeTopic() {
		return getHomeTopic(null);
	}
	
	public List<Topic> getHomeTopic(Page page) {
		return getHomeTopic(page, null, null, 0, 0);
	} 
	
	public List<Topic> getHomeTopic(Page page, String startTime, String endTime, long tid, long uid) {
		Map<String, Object> map = Maps.newHashMap();
		if(page != null) {
			map.put("page", page);
		}
		if(tid != 0) {
			map.put("tid", tid);
		}
		if(uid != 0) {
			map.put("uid", uid);
		}
		if(StringUtils.isNotBlank(startTime)) {
			map.put("starttime", startTime);
		}
		if(StringUtils.isNotBlank(endTime)) {
			map.put("endtime", endTime);
		}
		List<Topic> topics = topicDao.getHomeTopTopic(map);
		formatTopicData(topics);
		return topics;
	} 
	
	public List<Topic> getTopicsByNavId(Page page, long navId, String type,
			String filter, String orderby) {
		JSONObject object = redisObjectMapService.get(RedisKeyUtils.getBoardsByNavId((int) navId), JSONObject.class);
		JSONArray array = JSONArray.parseArray(object.getString("boards"));
		List<Board> boards = JsonUtils.decodeJson(array, Board.class);
		List<Integer> filterBids = Lists.newArrayList();
		for (Board board : boards) {
			if(board.getIsAccess() == 1) {
				filterBids.add(board.getBoardId());
			}
		}
		// TODO type搁置（代表主题和投票）
		int f = 0;
		switch (filter) {
			case "lastpost": f = 0; break;
			case "cream": f = 1; break;
			case "hot": f = 2; break;
		}
		Map<String, Object> map = Maps.newHashMap();
		map.put("page", page);
		map.put("navId", navId);
		if(f != 0) {
			map.put("filter", f);
		}
		if("dateline".equals(orderby)) {
			map.put("orderby", "topic_create_time");
		} else {
			orderby = "lastest_reply_time";
		}
		if(!filterBids.isEmpty() && filterBids.size() > 0) {
			map.put("bids", filterBids);
		}
		List<Topic> topics = topicDao.getTopicsByNavId(map);
		formatTopicData(topics);
		if(orderby.equals("lastest_reply_time")) {
			sort(topics);
		}
		return topics;
	}
	
	//TODO 逻辑问题
	private void sort(List<Topic> topics) {
		Map<Long, Topic> map = Maps.newHashMap();
		List<TopicData> datas = new ArrayList<TopicData>();
		for (Topic t : topics) {
			map.put(t.getTopicId(), t);
			datas.add(t.getTopicData());
		}
//		Collections.sort(datas);
//		List<Topic> list = new ArrayList<Topic>();
//		for (TopicData d : datas) {
//			list.add(map.get(d.getTopicId()));
//		}
	}

	private void formatTopicData(List<Topic> topics) {
		for (Topic topic : topics) {
			topic.setTopicContent(HtmlUtils.htmlUnescape(topic.getTopicContent()));
			topic.setTopicCreateTime(DateUtils.dt14LongFormat(DateUtils.dt14FromStr(topic.getTopicCreateTime())));
			topic.setTopicData(getTopicDateForListFromRedis(topic.getTopicId(), topic.getBoardId()));
			topic.setUser(userService.getUserById(topic.getUserId()));
			topic.setBoard(boardService.getBoardByBoardId(topic.getNavId(), topic.getBoardId()));
		}
	}
	
	private void formatTopicDataForBoard(List<Topic> topics) {
		for (Topic topic : topics) {
			topic.setTopicContent(HtmlUtils.htmlUnescape(topic.getTopicContent()));
			topic.setTopicCreateTime(DateUtils.dt14LongFormat(DateUtils.dt14FromStr(topic.getTopicCreateTime())));
			topic.setTopicData(getTopicDateForListFromRedis(topic.getTopicId(), topic.getBoardId()));
			topic.setUser(userService.getUserById(topic.getUserId()));
			topic.setClassify(classifyService.getClassifyByCid(topic.getBoardId(), topic.getClassId()));
		}
	}
	
	public TopicData getTopicDateForListFromRedis(long topicId, Integer boardId) {
		synchronized (this) {
			TopicData topicData = null;
			try{
				JSONObject object = saveOrUpdateTopicData(topicId, null, null, null, null, -1, null, null);
				boardService.saveOrUpdateBoardInfo(boardId, BoardSign.CLICK, 0);
				topicData = JSON.toJavaObject(object, TopicData.class);
			} catch (Exception e) {
				logger.error("insertTopicData fail", e);
			}
			return topicData;
		}
	}

	@Override
	public List<Topic> getLocalTopTopic(int boardId) {
		List<Topic> topics = topicDao.getBoardTopTopic(boardId);
		formatTopicDataForBoard(topics);
		return topics;
	}

	@Override
	public List<Topic> getTopicsByBoardId(Page page, long boardId, String type,
			String filter, String orderby) {
		// TODO type搁置（代表主题和投票）
		int f = 0;
		switch (filter) {
			case "lastpost": f = 0; break;
			case "cream": f = 1; break;
			case "hot": f = 2; break;
		}
		Map<String, Object> map = Maps.newHashMap();
		map.put("page", page);
		map.put("boardId", boardId);
		if(f != 0) {
			map.put("filter", f);
		}
		if("dateline".equals(orderby)) {
			map.put("orderby", "t.topic_create_time");
		} else {
			orderby = "d.lastest_reply_time";
		}
		List<Topic> topics = topicDao.getTopicsByBoardId(map);
		formatTopicDataForBoard(topics);
		if(orderby.equals("d.lastest_reply_time")) {
			sort(topics);
		}
		return topics;
	}

	@Override
	public List<Topic> getTopicsByClassId(Page page, long classId, String type,
			String filter, String orderby) {
		// TODO type搁置（代表主题和投票）
		int f = 0;
		switch (filter) {
			case "lastpost": f = 0; break;
			case "cream": f = 1; break;
			case "hot": f = 2; break;
		}
		Map<String, Object> map = Maps.newHashMap();
		map.put("page", page);
		map.put("classId", classId);
		if(f != 0) {
			map.put("filter", f);
		}
		if("dateline".equals(orderby)) {
			map.put("orderby", "t.topic_create_time");
		} else {
			orderby = "d.lastest_reply_time";
		}
		List<Topic> topics = topicDao.getTopicsByClassId(map);
		formatTopicDataForBoard(topics);
		if(orderby.equals("d.lastest_reply_time")) {
			sort(topics);
		}
		return topics;
	}

	@Override
	@Transactional
	public int updateTopic(String tid, String ttitle, String tcontent,
			int isreply, int iselite, int istop, int isglobaltop, int ishome,
			HttpServletRequest request) {
		if (lock.tryLock()) {
			try {
				if(NumberUtils.getAllNumber(tid) > 0) {
					Topic topic = getTopicByTopicId(NumberUtils.getAllNumber(tid));
					if(topic == null) {
						return BbsConstant.ERROR;
					}
					topic.setTopicTitle(ttitle);
					topic.setTopicContent(HtmlUtils.htmlEscape(tcontent));
					if(topicDao.updateTopic(topic) == BbsConstant.OK) {
						TopicInfo topicInfo = new TopicInfo();
						topicInfo.setTopicId(topic.getTopicId());
						if(SystemConfigUtils.getIsOpenTopicAudit()) {
							topicInfo.setTopicIsCheck(0);
						} else {
							topicInfo.setTopicIsCheck(1);
						}
						topicInfo.setTopicIsCream(iselite);
						topicInfo.setTopicIsGlobalTop(isglobaltop);
						topicInfo.setTopicIsHome(ishome);
						topicInfo.setTopicIsHot(0);
						topicInfo.setTopicIsLocalTop(istop);
						topicInfo.setTopicIsReply(isreply);
						if(topicInfoDao.update(topicInfo) == BbsConstant.OK) {
							TopicData topicData = getTopicDateFromRedis(topic.getTopicId(), topic.getBoardId());
							CookieBean bean = userService.getCookieBeanFromCookie(request);
							topicData.setTopicId(topic.getTopicId());
							if(topicData.getTopicFavoriteCount() == null) {
								topicData.setTopicFavoriteCount(0);
							}
							topicData.setTopicUpdateUserId(bean.getUser_id());
							topicData.setTopicUpdateUserId(bean.getUser_id());
							topicData.setTopicUpdateUser(bean.getNick_name());
							topicData.setTopicUpdateTime(DateUtils.dt14LongFormat(new Date()));
							if(topicDataDao.update(topicData) == BbsConstant.OK) {
								saveOrUpdateTopicData(topic.getTopicId(), null, null, null, null, bean.getUser_id(), bean.getNick_name(), topicData.getTopicUpdateTime());
								return BbsConstant.OK;
							}
						}
					}
				}
			} catch (Exception e) {
				logger.error("update topic fail", e);
			} finally {
				lock.unlock();
			}
		}
		return BbsConstant.ERROR;
	}

	@Override
	public List<Topic> getTopicList(Page page, int status, int audit) {
		return getTopicList(page, null, null, 0, 0, 0, 0, 0, status, audit);
	}
	
	@Override
	public List<Topic> getTopicList(Page page, int bid) {
		return getTopicList(page, null, null, 0, 0, 0, bid, 0, 0, 0);
	}

	@Override
	public List<Topic> getTopicList(Page page, String startTime, String endTime, 
			long uid, long topicId, int navId, int boardId, int classId, int status, int audit) {
		Map<String, Object> map = Maps.newHashMap();
		map.put("page", page);
		map.put("status", status);
		map.put("audit", audit);
		if(StringUtils.isNotBlank(startTime)) {
			map.put("starttime", startTime);
		}
		if(StringUtils.isNotBlank(endTime)) {
			map.put("endtime", endTime);
		}
		if(uid != 0) {
			map.put("uid", uid);
		}
		if(topicId != 0) {
			map.put("topicId", topicId);
		}
		if(navId != 0) {
			map.put("navId", navId);
		}
		if(boardId != 0) {
			map.put("boardId", boardId);
		}
		if (classId != 0) {
			map.put("classId", classId);
		}
		List<Topic> topics = null;
		if(audit == 2) {
			topics = topicDao.getTopicListForTrash(map);
		} else {
			topics = topicDao.getTopicList(map);
		}
		for (Topic topic : topics) {
			topic.setTopicContent(HtmlUtils.htmlUnescape(topic.getTopicContent()));
			topic.setTopicCreateTime(DateUtils.dt14LongFormat(DateUtils.dt14FromStr(topic.getTopicCreateTime())));
			topic.setTopicData(getTopicDateForListFromRedis(topic.getTopicId(), topic.getBoardId()));
			topic.setUser(userService.getUserById(topic.getUserId()));
			topic.setBoard(boardService.getBoardByBoardId(topic.getNavId(), topic.getBoardId()));
			topic.setClassify(classifyService.getClassifyByCid(topic.getBoardId(), topic.getClassId()));
		}
		return topics;
	}

	@Override
	public List<Topic> getTopicSpecList(Page page, int all) {
		String sql = "";
		if(all == -1) {
			sql = "(i.topic_is_hot = 1 or i.topic_is_cream = 1)";
		} else if(all == 1) {
			sql = "i.topic_is_hot = 1";
		} else {
			sql = "i.topic_is_cream = 1";
		}
		return getTopicList(page, sql, null, null, 0, 0, 0, 0, 0);
	}
	
	public List<Topic> getTopicSpecList(Page page, String startTime, String endTime, 
			long uid, long topicId, int navId, int boardId, int type) {
		String sql = "";
		if(type == -1) {
			sql = "(i.topic_is_hot = 1 or i.topic_is_cream = 1)";
		} else if(type == 1) {
			sql = "i.topic_is_hot = 1";
		} else {
			sql = "i.topic_is_cream = 1";
		}
		return getTopicList(page, sql, startTime, endTime, uid, topicId, navId, boardId, 0);
	}

	@Override
	public List<Topic> getTopicList(Page page, String sql, String startTime,
			String endTime, long uid, long topicId, int navId, int boardId, int classId) {
		Map<String, Object> map = Maps.newHashMap();
		map.put("page", page);
		map.put("sql", sql);
		if(StringUtils.isNotBlank(startTime)) {
			map.put("starttime", startTime);
		}
		if(StringUtils.isNotBlank(endTime)) {
			map.put("endtime", endTime);
		}
		if(uid != 0) {
			map.put("uid", uid);
		}
		if(topicId != 0) {
			map.put("topicId", topicId);
		}
		if(navId != 0) {
			map.put("navId", navId);
		}
		if(boardId != 0) {
			map.put("boardId", boardId);
		}
		if (classId != 0) {
			map.put("classId", classId);
		}
		List<Topic> topics = topicDao.getTopicInfoList(map);
		for (Topic topic : topics) {
			topic.setTopicContent(HtmlUtils.htmlUnescape(topic.getTopicContent()));
			topic.setTopicCreateTime(DateUtils.dt14LongFormat(DateUtils.dt14FromStr(topic.getTopicCreateTime())));
			topic.setTopicData(getTopicDateForListFromRedis(topic.getTopicId(), topic.getBoardId()));
			topic.setUser(userService.getUserById(topic.getUserId()));
			topic.setBoard(boardService.getBoardByBoardId(topic.getNavId(), topic.getBoardId()));
			topic.setClassify(classifyService.getClassifyByCid(topic.getBoardId(), topic.getClassId()));
		}
		return topics;
	}

	@Override
	public List<Topic> getTopicTopList(Page page, int all) {
		String sql_local = "i.topic_is_local_top = 1 AND (DATE_FORMAT(i.topic_is_local_top_end_time, '%Y-%m-%d') <= DATE_FORMAT(NOW(), '%Y-%m-%d') OR i.topic_is_local_top_end_time IS NULL)";
		String sql_global = "i.topic_is_global_top = 1 AND (DATE_FORMAT(i.topic_is_global_top_end_time, '%Y-%m-%d') <= DATE_FORMAT(NOW(), '%Y-%m-%d') OR i.topic_is_global_top_end_time IS NULL)";
		String sql = "";
		if(all == -1) {
			sql = "((" + sql_local + ") or (" + sql_global + "))";
		} else if(all == 1) {
			sql = sql_local;
		} else {
			sql = sql_global;
		}
		return getTopicList(page, sql, null, null, 0, 0, 0, 0, 0);
	}

	@Override
	public List<Topic> getTopicListForIndex() {
		return topicDao.getTopicListForIndex();
	}

	@Override
	public List<Topic> getTopicCloseReplyList(Page page, long topicId, int navId, int boardId) {
		Map<String, Object> map = Maps.newHashMap();
		map.put("page", page);
		if(topicId != 0) {
			map.put("topicId", topicId);
		}
		if(navId != 0) {
			map.put("navId", navId);
		}
		if(boardId != 0) {
			map.put("boardId", boardId);
		}
		List<Topic> topics = topicDao.getTopicCloseReplyList(map);
		for (Topic topic : topics) {
			topic.setTopicContent(HtmlUtils.htmlUnescape(topic.getTopicContent()));
			topic.setTopicCreateTime(DateUtils.dt14LongFormat(DateUtils.dt14FromStr(topic.getTopicCreateTime())));
			topic.setUser(userService.getUserById(topic.getUserId()));
		}
		return topics;
	}

	//TODO 这里有多表查询的缓存问题
	@Override
	@SysLog(module = "首页管理", methods = "首页主题-修改时间")
	public int updateTopicTime(long tid, String time, String roleSign) {
		int result = 0;
		try {
			if(topicInfoDao.updateHomeTopicTime(time, tid) == BbsConstant.OK) {
				result = BbsConstant.OK;
			}
		} catch (Exception e) {
			logger.error("update topic home end time error", e);
		}
		return result;
	}

	@Override
	@Transactional
	@SysLog(module = "首页管理", methods = "首页主题-取消首页")
	public int cancelHomeTopic(String ids, String roleSign) {
		int result = 0;
		String[] topicIds = ids.split(",");
		try {
			Map<String, Object> map = Maps.newHashMap();
			map.put("topicIds", topicIds);
			if (topicIds.length == topicInfoDao.cancelHomeTopic(map)) {
				result = BbsConstant.OK;
			}
		} catch (Exception e) {
			logger.error("cancel topic home fail", e);
		}
		return result;
	}

	@Override
	@BmcLogAnno(modules = "帖子待审核")
	@Transactional
	@SysLog(module = "帖子管理", methods = "待审核-审核")
	public int audit(String ids, int value) {
		String[] topicIds = ids.split(",");
		try {
			Map<String, Object> map = Maps.newHashMap();
			map.put("topicIds", topicIds);
			map.put("check", value);
			if (topicIds.length == topicInfoDao.execAudit(map)) {
				return BbsConstant.OK;
			}
		} catch (Exception e) {
			logger.error("audit topic fail, ids : {}", ids, e);
		}
		return BbsConstant.ERROR;
	}

	@Override
	@BmcLogAnno(modules = "帖子回收站")
	@Transactional
	public int restore(String ids, String sign) {
		String[] topicIds = ids.split(",");
		try {
			Map<String, Object> map = Maps.newHashMap();
			map.put("topicIds", topicIds);
			topicDao.restore(map);
			map.put("check", Audit.PASS.getValue());
			topicInfoDao.execAudit(map);
			return BbsConstant.OK;
		} catch (Exception e) {
			logger.error("resore topic fail, ids : {}", ids, e);
		}
		return BbsConstant.ERROR;
	}

	@Override
	@Transactional
	@BmcLogAnno(modules = "开启帖子回复")
	@SysLog(module = "帖子管理", methods = "已关闭评论")
	public int openReply(String ids, String sign) {
		String[] topicIds = ids.split(",");
		try {
			Map<String, Object> map = Maps.newHashMap();
			map.put("topicIds", topicIds);
			topicInfoDao.openReply(map);
			return BbsConstant.OK;
		} catch (Exception e) {
			logger.error("open topic reply fail, ids : {}", ids, e);
		}
		return BbsConstant.ERROR;
	}

	@Override
	@Transactional
	@SysLog(module = "帖子管理", methods = "帖子列表-删除")
	@BmcLogAnno(modules = "删除帖子")
	public int deleteTopic(String ids, String reason, String role) {
		int result = 0;
		String tids[] = ids.split(",");
		try {
			Map<String, Object> map = Maps.newHashMap();
			map.put("tids", tids);
			//map.put("reason", reason + "<br/>---<font color=\"red\">" + role + "</font>");
			if(tids.length == topicDao.delete(map)) {
				result = BbsConstant.OK;
			}
		} catch (Exception e) {
			logger.error("topic delete error", e);
		}
		return result;
	}

	@Override
	@Transactional
	@BmcLogAnno(modules = "关闭帖子回复")
	@SysLog(module = "帖子管理", methods = "帖子列表-关闭回复")
	public int closeReply(String ids, String sign) {
		String[] topicIds = ids.split(",");
		try {
			Map<String, Object> map = Maps.newHashMap();
			map.put("topicIds", topicIds);
			topicInfoDao.closeReply(map);
			return BbsConstant.OK;
		} catch (Exception e) {
			logger.error("close topic reply fail, ids : {}", ids, e);
		}
		return BbsConstant.ERROR;
	}

	@Override
	@Transactional
	@BmcLogAnno(modules = "帖子加精")
	@SysLog(module = "帖子管理", methods = "帖子列表-加精")
	public int cream(String ids, int cream, String role) {
		String[] topicIds = ids.split(",");
		try {
			Map<String, Object> map = Maps.newHashMap();
			map.put("topicIds", topicIds);
			map.put("cream", cream);
			topicInfoDao.cream(map);
			return BbsConstant.OK;
		} catch (Exception e) {
			logger.error("topic cream fail, ids : {}", ids, e);
		}
		return BbsConstant.ERROR;
	}

	@Override
	@Transactional
	@BmcLogAnno(modules = "本版置顶")
	@SysLog(module = "帖子管理", methods = "帖子列表-本版置顶")
	public int localTop(String ids, String time, int local, String role) {
		String[] topicIds = ids.split(",");
		try {
			Map<String, Object> map = Maps.newHashMap();
			map.put("topicIds", topicIds);
			map.put("local", local);
			if (local == 1) {
				map.put("time", time);
			}
			topicInfoDao.localTop(map);
			return BbsConstant.OK;
		} catch (Exception e) {
			logger.error("topic localTop fail, ids : {}", ids, e);
		}
		return BbsConstant.ERROR;
	}

	@Override
	@Transactional
	@SysLog(module = "帖子管理", methods = "帖子列表-推送首页")
	public int home(String ids, String time, int home) {
		String[] topicIds = ids.split(",");
		try {
			Map<String, Object> map = Maps.newHashMap();
			map.put("topicIds", topicIds);
			map.put("home", home);
			if (home == 1) {
				map.put("time", time);
			}
			topicInfoDao.home(map);
			return BbsConstant.OK;
		} catch (Exception e) {
			logger.error("topic home fail, ids : {}", ids, e);
		}
		return BbsConstant.ERROR;
	}

	@Override
	@Transactional
	@SysLog(module = "帖子管理", methods = "帖子列表-全局置顶")
	public int globalTop(String ids, String time, int global) {
		String[] topicIds = ids.split(",");
		try {
			Map<String, Object> map = Maps.newHashMap();
			map.put("topicIds", topicIds);
			map.put("global", global);
			if (global == 1) {
				map.put("time", time);
			}
			topicInfoDao.globalTop(map);
			return BbsConstant.OK;
		} catch (Exception e) {
			logger.error("topic global fail, ids : {}", ids, e);
		}
		return BbsConstant.ERROR;
	}

	@Override
	@Transactional
	@BmcLogAnno(modules = "移动")
	@SysLog(module = "帖子管理", methods = "帖子列表-移动")
	public int move(String ids, String destbid, String cid, String gid, String role) {
		String[] topicIds = ids.split(",");
		try {
			Map<String, Object> map = Maps.newHashMap();
			map.put("topicIds", topicIds);
			map.put("bid", destbid);
			map.put("cid", cid);
			map.put("gid", gid);
			topicDao.move(map);
			return BbsConstant.OK;
		} catch (Exception e) {
			logger.error("topic move fail, ids : {}", ids, e);
		}
		return BbsConstant.ERROR;
	}

	@Override
	@Transactional
	@SysLog(module = "帖子管理", methods = "帖子列表-热门")
	public int hot(String ids, int hot) {
		String[] topicIds = ids.split(",");
		try {
			Map<String, Object> map = Maps.newHashMap();
			map.put("topicIds", topicIds);
			map.put("hot", hot);
			topicInfoDao.hot(map);
			return BbsConstant.OK;
		} catch (Exception e) {
			logger.error("topic hot fail, ids : {}", ids, e);
		}
		return BbsConstant.ERROR;
	}

	@Override
	public List<TopicData> getTopicDateFromRedis(List<Map<String, Long>> tidsAndBids) {
		List<TopicData> datas = Lists.newArrayList();
		for (Map<String, Long> map : tidsAndBids) {
			TopicData topicData = null;
			JSONObject object = saveOrUpdateTopicData(map.get("tid"), null, null, null, null, -1, null, null);
			topicData = JSON.toJavaObject(object, TopicData.class);
			datas.add(topicData);
		}
		return datas;
	}

}

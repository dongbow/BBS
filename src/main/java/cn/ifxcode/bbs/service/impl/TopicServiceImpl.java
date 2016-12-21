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
import cn.ifxcode.bbs.enumtype.BoardSign;
import cn.ifxcode.bbs.enumtype.EGHistory;
import cn.ifxcode.bbs.enumtype.TopicSign;
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
	
	@Override
	@Transactional
	public long insertTopic(int cid, String ttitle, String tcontent, long uid,
			int bid, int gid, int isreply, int iselite, int istop,
			int isglobaltop, int ishome, HttpServletRequest request) {
		Lock lock = new ReentrantLock();
		try {
			lock.lock();
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
						return topic.getTopicId();
					}
				}
			}
		} catch (Exception e) {
			logger.error("insertTopic fail", e);
		} finally {
			lock.unlock();
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
		Lock lock = new ReentrantLock();
		TopicData topicData = null;
		try{
			lock.lock();
			JSONObject object = this.saveOrUpdateTopicData(topicId, TopicSign.VIEW, null, null, null, -1, null, null);
			boardService.saveOrUpdateBoardInfo(boardId, BoardSign.CLICK, 0);
			topicData = JSON.toJavaObject(object, TopicData.class);
			if (StringUtils.isNotBlank(topicData.getTopicUpdateTime())) {
				topicData.setTopicUpdateTime(DateUtils.dt14LongFormat(DateUtils.dt14FromStr(topicData.getTopicUpdateTime())));
			}
		} catch (Exception e) {
			logger.error("insertTopicData fail", e.getMessage());
		} finally {
			lock.unlock();
		}
		return topicData;
	}

	@Override
	public List<Topic> getTopicListByUserId(Long userId, Page page) {
		Map<String, Object> map = Maps.newHashMap();
		map.put("page", page);
		map.put("userId", userId);
		List<Topic> topics = topicDao.getTopicListByUserId(map);
		this.formatTopic(topics);
		return topics;
	}
	
	public Topic getTopicForReplyByTopicId(long topicId) {
		Topic topic = topicDao.getTopicByTopicId(topicId);
		topic.setBoard(boardService.getBoardByBoardId(topic.getNavId(), topic.getBoardId()));
		JSONObject object = this.saveOrUpdateTopicData(topic.getTopicId(), null, null, null, null, -1, null, null);
		topic.setTopicData(JSON.toJavaObject(object, TopicData.class));
		return topic;
	}
	
	private void formatTopic(List<Topic> topics) {
		if(!topics.isEmpty() && topics.size() > 0) {
			for (Topic topic : topics) {
				topic.setBoard(boardService.getBoardByBoardId(topic.getNavId(), topic.getBoardId()));
				JSONObject object = this.saveOrUpdateTopicData(topic.getTopicId(), null, null, null, null, -1, null, null);
				topic.setTopicData(JSON.toJavaObject(object, TopicData.class));
			}
		}
	}

	public List<Topic> getGlobalTopTopic() {
		List<Topic> topics = topicDao.getGlobalTopTopic();
		this.formatTopicData(topics);
		return topics;
	}
	
	public List<Topic> getHomeTopic() {
		return this.getHomeTopic(null);
	}
	
	public List<Topic> getHomeTopic(Page page) {
		return this.getHomeTopic(page, null, null, 0, 0);
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
		this.formatTopicData(topics);
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
		this.formatTopicData(topics);
		if(orderby.equals("lastest_reply_time")) {
			this.sort(topics);
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
			topic.setTopicData(this.getTopicDateForListFromRedis(topic.getTopicId(), topic.getBoardId()));
			topic.setUser(userService.getUserById(topic.getUserId()));
			topic.setBoard(boardService.getBoardByBoardId(topic.getNavId(), topic.getBoardId()));
		}
	}
	
	private void formatTopicDataForBoard(List<Topic> topics) {
		for (Topic topic : topics) {
			topic.setTopicContent(HtmlUtils.htmlUnescape(topic.getTopicContent()));
			topic.setTopicCreateTime(DateUtils.dt14LongFormat(DateUtils.dt14FromStr(topic.getTopicCreateTime())));
			topic.setTopicData(this.getTopicDateForListFromRedis(topic.getTopicId(), topic.getBoardId()));
			topic.setUser(userService.getUserById(topic.getUserId()));
			topic.setClassify(classifyService.getClassifyByCid(topic.getBoardId(), topic.getClassId()));
		}
	}
	
	public TopicData getTopicDateForListFromRedis(long topicId, Integer boardId) {
		Lock lock = new ReentrantLock();
		TopicData topicData = null;
		try{
			lock.lock();
			JSONObject object = this.saveOrUpdateTopicData(topicId, null, null, null, null, -1, null, null);
			boardService.saveOrUpdateBoardInfo(boardId, BoardSign.CLICK, 0);
			topicData = JSON.toJavaObject(object, TopicData.class);
		} catch (Exception e) {
			logger.error("insertTopicData fail", e.getMessage());
		} finally {
			lock.unlock();
		}
		return topicData;
	}

	@Override
	public List<Topic> getLocalTopTopic(int boardId) {
		List<Topic> topics = topicDao.getBoardTopTopic(boardId);
		this.formatTopicDataForBoard(topics);
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
		this.formatTopicDataForBoard(topics);
		if(orderby.equals("d.lastest_reply_time")) {
			this.sort(topics);
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
		this.formatTopicDataForBoard(topics);
		if(orderby.equals("d.lastest_reply_time")) {
			this.sort(topics);
		}
		return topics;
	}

	@Override
	@Transactional
	public int updateTopic(String tid, String ttitle, String tcontent,
			int isreply, int iselite, int istop, int isglobaltop, int ishome,
			HttpServletRequest request) {
		Lock lock = new ReentrantLock();
		try {
			lock.lock();
			if(NumberUtils.getAllNumber(tid) > 0) {
				Topic topic = this.getTopicByTopicId(NumberUtils.getAllNumber(tid));
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
						TopicData topicData = this.getTopicDateFromRedis(topic.getTopicId(), topic.getBoardId());
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
							this.saveOrUpdateTopicData(topic.getTopicId(), null, null, null, null, bean.getUser_id(), bean.getNick_name(), topicData.getTopicUpdateTime());
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
		return BbsConstant.ERROR;
	}

}

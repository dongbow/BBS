package cn.ifxcode.bbs.service.impl;

import java.util.Date;
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
import com.alibaba.fastjson.JSONObject;

import cn.ifxcode.bbs.constant.BbsConstant;
import cn.ifxcode.bbs.dao.TopicDao;
import cn.ifxcode.bbs.dao.TopicDataDao;
import cn.ifxcode.bbs.dao.TopicInfoDao;
import cn.ifxcode.bbs.dao.UserValueDao;
import cn.ifxcode.bbs.entity.Topic;
import cn.ifxcode.bbs.entity.TopicData;
import cn.ifxcode.bbs.entity.TopicInfo;
import cn.ifxcode.bbs.enumtype.EGHistory;
import cn.ifxcode.bbs.enumtype.TopicSign;
import cn.ifxcode.bbs.service.GeneralService;
import cn.ifxcode.bbs.service.TopicService;
import cn.ifxcode.bbs.utils.DateUtils;
import cn.ifxcode.bbs.utils.GetRemoteIpUtil;
import cn.ifxcode.bbs.utils.RedisKeyUtils;
import cn.ifxcode.bbs.utils.SystemConfigUtils;

@Service
public class TopicServiceImpl implements TopicService{

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Resource
	private TopicDao topicDao;
	
	@Resource
	private TopicInfoDao topicInfoDao;
	
	@Resource
	private TopicDataDao topicDataDao;
	
	@Resource
	private UserValueDao userValueDao;
	
	@Resource
	private GeneralService generalService;
	
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
						return topic.getTopicId();
					}
				}
			}
		} catch (Exception e) {
			logger.error("insertTopic fail", e.getMessage());
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
		JSONObject object = redisObjectMapService.get(RedisKeyUtils.getTopicData(topicId), JSONObject.class);
		TopicData topicData = new TopicData();
		if(object == null) {
			topicData.setTopicId(topicId);
			topicData.setTopicViewCount(1);
		} else {
			topicData = JSON.toJavaObject(object, TopicData.class);
			if(topicSign.getCode() == 0) {
				topicData.setTopicViewCount(topicData.getTopicViewCount() + 1);
			} else if(topicSign.getCode() == 1) {
				topicData.setTopicReplyCount(topicData.getTopicReplyCount() + 1);
			} else if(topicSign.getCode() == 1) {
				topicData.setTopicFavoriteCount(topicData.getTopicFavoriteCount() + 1);
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
	
	@Override
	public TopicData getTopicDateFromRedis(long topicId) {
		Lock lock = new ReentrantLock();
		TopicData topicData = null;
		try{
			lock.lock();
			JSONObject object = this.saveOrUpdateTopicData(topicId, TopicSign.VIEW, null, null, null, -1, null, null);
			topicData = JSON.toJavaObject(object, TopicData.class);
		} catch (Exception e) {
			logger.error("insertTopic fail", e.getMessage());
		} finally {
			lock.unlock();
		}
		return topicData;
	}
	
}

package cn.ifxcode.bbs.service.impl;

import java.util.Date;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.util.HtmlUtils;

import cn.ifxcode.bbs.constant.BbsConstant;
import cn.ifxcode.bbs.dao.TopicDao;
import cn.ifxcode.bbs.dao.TopicDataDao;
import cn.ifxcode.bbs.dao.TopicInfoDao;
import cn.ifxcode.bbs.dao.UserValueDao;
import cn.ifxcode.bbs.entity.Topic;
import cn.ifxcode.bbs.entity.TopicData;
import cn.ifxcode.bbs.entity.TopicInfo;
import cn.ifxcode.bbs.enumtype.EGHistory;
import cn.ifxcode.bbs.service.GeneralService;
import cn.ifxcode.bbs.service.TopicService;
import cn.ifxcode.bbs.utils.DateUtils;
import cn.ifxcode.bbs.utils.GetRemoteIpUtil;
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

}

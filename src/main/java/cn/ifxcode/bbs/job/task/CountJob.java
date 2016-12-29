package cn.ifxcode.bbs.job.task;

import java.util.Map;

import javax.annotation.Resource;

import ltang.redis.service.RedisObjectMapService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import cn.ifxcode.bbs.dao.GeneralDao;
import cn.ifxcode.bbs.utils.DateUtils;
import cn.ifxcode.bbs.utils.RedisKeyUtils;

import com.alibaba.fastjson.JSONObject;
import com.google.common.collect.Maps;

@Service
public class CountJob {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Resource
	private RedisObjectMapService mapService;
	
	@Resource
	private GeneralDao generalDao;
	
	public void saveCount() {
		logger.info("start count today data");
		try {
			Map<String, Object> map = Maps.newConcurrentMap();
			map.put("time", DateUtils.getYesterday());
			map.put("topic", getTodayTopicCount());
			map.put("reply", getTodayReplyCount());
			map.put("usersign", getTodayUserSignCount());
			map.put("newuser", getTodayNewUserCount());
			generalDao.insertTodayCount(map);
		} catch (Exception e) {
			logger.error("start count today data fail", e);
		}
	}
	
	public long getTodayTopicCount() {
		JSONObject object = mapService.get(RedisKeyUtils.getCount("topic"), JSONObject.class);
		String yesterday = DateUtils.getYesterday();
		if(object != null && object.containsKey(yesterday)) {
			return object.getLongValue(yesterday);
		}
		return 0;
	}
	
	public long getTodayReplyCount() {
		JSONObject object = mapService.get(RedisKeyUtils.getCount("reply"), JSONObject.class);
		String yesterday = DateUtils.getYesterday();
		if(object != null && object.containsKey(yesterday)) {
			return object.getLongValue(yesterday);
		}
		return 0;
	}
	
	public long getTodayUserSignCount() {
		JSONObject object = mapService.get(RedisKeyUtils.getCount("usersign"), JSONObject.class);
		String yesterday = DateUtils.getYesterday();
		if(object != null && object.containsKey(yesterday)) {
			return object.getLongValue(yesterday);
		}
		return 0;
	}
	
	public long getTodayNewUserCount() {
		JSONObject object = mapService.get(RedisKeyUtils.getCount("newuser"), JSONObject.class);
		String yesterday = DateUtils.getYesterday();
		if(object != null && object.containsKey(yesterday)) {
			return object.getLongValue(yesterday);
		}
		return 0;
	}
}

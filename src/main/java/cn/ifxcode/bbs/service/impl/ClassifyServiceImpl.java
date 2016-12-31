package cn.ifxcode.bbs.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import ltang.redis.service.RedisObjectMapService;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.google.common.collect.Maps;

import cn.ifxcode.bbs.bean.Page;
import cn.ifxcode.bbs.constant.BbsConstant;
import cn.ifxcode.bbs.dao.ClassifyDao;
import cn.ifxcode.bbs.entity.Classify;
import cn.ifxcode.bbs.service.ClassifyService;
import cn.ifxcode.bbs.utils.DateUtils;
import cn.ifxcode.bbs.utils.JsonUtils;
import cn.ifxcode.bbs.utils.RedisKeyUtils;

@Service
public class ClassifyServiceImpl implements ClassifyService {

	@Resource
	private ClassifyDao classifyDao;
	
	@Resource
	private RedisObjectMapService redisObjectMapService;

	@Override
	public List<Classify> getClassifyByBoardId(int boardId) {
		JSONObject object = redisObjectMapService.get(RedisKeyUtils.getClassifyByBoardId(boardId), JSONObject.class);
		if(object != null) {
			JSONArray array = JSONArray.parseArray(object.getString("classifies"));
			List<Classify> classifies = JsonUtils.decodeJson(array, Classify.class);
			return classifies;
		}
		return null;
	}

	@Override
	public Classify getClassifyByCid(Integer boardId, Integer classId) {
		List<Classify> classifies = this.getClassifyByBoardId(boardId);
		for (Classify c : classifies) {
			if(c.getClassId().equals(classId)) {
				return c;
			}
		}
		return null;
	}

	@Override
	public int saveOrUpdateCount(int bid, int cid) {
		synchronized (this) {
			List<Classify> classifies = this.getClassifyByBoardId(bid);
			for (Classify c : classifies) {
				if(c.getClassId().equals(cid)) {
					if(c.getClassTopicCount() == 0) {
						c.setClassTopicCount(1);
					} else {
						c.setClassTopicCount(c.getClassTopicCount() + 1);
					}
				}
			}
			JSONArray jsonArray = JSONArray.parseArray(JSON.toJSONString(classifies));
			JSONObject jsonObject = new JSONObject(true);
			jsonObject.put("classifies", jsonArray.toJSONString());
			redisObjectMapService.save(RedisKeyUtils.getClassifyByBoardId(bid), jsonObject, JSONObject.class);
			return BbsConstant.OK;
		}
	}

	@Override
	public List<Classify> getAllClassify(Page page) {
		return this.getAllClassify(page, null, null, null, 0, -1, -1);
	}

	@Override
	public List<Classify> getAllClassify(Page page, String startTime,
			String endTime, String name, int bid, int status, int auth) {
		Map<String, Object> map = Maps.newHashMap();
		map.put("page", page);
		if(StringUtils.isNotBlank(startTime)) {
			map.put("starttime", startTime);
		}
		if(StringUtils.isNotBlank(endTime)) {
			map.put("endtime", endTime);
		}
		if(StringUtils.isNotBlank(name)) {
			map.put("name", "%" + name + "%");
		}
		if(bid != 0) {
			map.put("bid", bid);
		}
		if(status != 0) {
			map.put("status", status);
		}
		if(auth != 0) {
			map.put("auth", auth);
		}
		List<Classify> classifies = classifyDao.getAllClassify(map);
		for (Classify classify : classifies) {
			classify.setClassCreateTime(DateUtils.dt14LongFormat(DateUtils.dt14FromStr(classify.getClassCreateTime())));
			Classify c = this.getClassifyByCid(classify.getBoardId(), classify.getClassId());
			classify.setClassTopicCount(c.getClassTopicCount());
		}
		return classifies;
	}
	
}

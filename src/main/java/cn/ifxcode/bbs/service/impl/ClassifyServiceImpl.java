package cn.ifxcode.bbs.service.impl;

import java.util.List;

import javax.annotation.Resource;

import ltang.redis.service.RedisObjectMapService;

import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

import cn.ifxcode.bbs.dao.ClassifyDao;
import cn.ifxcode.bbs.entity.Classify;
import cn.ifxcode.bbs.service.ClassifyService;
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
		JSONArray array = JSONArray.parseArray(object.getString("classifies"));
		List<Classify> classifies = JsonUtils.decodeJson(array, Classify.class);
		return classifies;
	}
	
}

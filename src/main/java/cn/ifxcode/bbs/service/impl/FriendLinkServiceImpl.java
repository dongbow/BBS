package cn.ifxcode.bbs.service.impl;

import java.util.List;

import javax.annotation.Resource;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

import ltang.redis.service.RedisObjectMapService;

import cn.ifxcode.bbs.dao.FriendLinkDao;
import cn.ifxcode.bbs.entity.FriendLink;
import cn.ifxcode.bbs.service.FriendLinkService;
import cn.ifxcode.bbs.utils.JsonUtils;
import cn.ifxcode.bbs.utils.RedisKeyUtils;

public class FriendLinkServiceImpl implements FriendLinkService {

	@Resource
	private FriendLinkDao friendLinkDao;
	
	@Resource
	private RedisObjectMapService mapService;
	
	@Override
	public List<FriendLink> getAllFriendLinks() {
		JSONObject object = mapService.get(RedisKeyUtils.getFriendLinks(), JSONObject.class);
		JSONArray array = JSONArray.parseArray(object.getString("friendlinks"));
		return JsonUtils.decodeJson(array, FriendLink.class);
	}

}

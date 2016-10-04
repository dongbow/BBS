package cn.ifxcode.bbs.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import ltang.redis.service.RedisObjectMapService;

import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.google.common.collect.Maps;

import cn.ifxcode.bbs.bean.Page;
import cn.ifxcode.bbs.dao.QuickNavigationDao;
import cn.ifxcode.bbs.entity.QuickNavigation;
import cn.ifxcode.bbs.service.QuickNavigationService;
import cn.ifxcode.bbs.utils.DateUtils;
import cn.ifxcode.bbs.utils.JsonUtils;
import cn.ifxcode.bbs.utils.RedisKeyUtils;

@Service
public class QuickNavigationServiceImpl implements QuickNavigationService {

	@Resource
	private QuickNavigationDao quickNavigationDao;
	
	@Resource
	private RedisObjectMapService redisObjectMapService;
	
	@Override
	public List<QuickNavigation> getAllQuickNavigations() {
		JSONObject object = redisObjectMapService.get(
				RedisKeyUtils.getQuickNavigations(), JSONObject.class);
		JSONArray array = JSONArray.parseArray(object.getString("quickNavigations"));
		return JsonUtils.decodeJson(array, QuickNavigation.class);
	}

	@Override
	public List<QuickNavigation> getAllQuickNavigations(Page page) {
		Map<String, Object> map = Maps.newHashMap();
		map.put("page", page);
		return this.formatQuickNavigations(quickNavigationDao.getAllQuickNavigationsPage(map));
	}
	
	private List<QuickNavigation> formatQuickNavigations(List<QuickNavigation> list) {
		List<QuickNavigation> navigations = new ArrayList<QuickNavigation>();
		for (QuickNavigation q : list) {
			q.setQuickCreateTime(DateUtils.dt14LongFormat(DateUtils.dt14FromStr(q.getQuickCreateTime())));
			navigations.add(q);
		}
		return navigations;
	}

}

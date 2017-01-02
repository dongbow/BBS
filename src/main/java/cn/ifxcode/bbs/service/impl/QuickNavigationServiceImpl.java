package cn.ifxcode.bbs.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import ltang.redis.service.RedisObjectMapService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.google.common.collect.Maps;

import cn.ifxcode.bbs.bean.Page;
import cn.ifxcode.bbs.constant.BbsConstant;
import cn.ifxcode.bbs.dao.QuickNavigationDao;
import cn.ifxcode.bbs.entity.QuickNavigation;
import cn.ifxcode.bbs.logger.SysLog;
import cn.ifxcode.bbs.service.QuickNavigationService;
import cn.ifxcode.bbs.utils.DateUtils;
import cn.ifxcode.bbs.utils.JsonUtils;
import cn.ifxcode.bbs.utils.RedisKeyUtils;

@Service
public class QuickNavigationServiceImpl implements QuickNavigationService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
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

	@Override
	@SysLog(module = "首页管理", methods = "快速导航-添加")
	public int addQuick(String name, String link, String color, int sort, int status) {
		try {
			QuickNavigation navigation = new QuickNavigation();
			navigation.setQuickName(name);
			navigation.setQuickLink(link);
			navigation.setQuickColor(color);
			navigation.setQuickSort(sort);
			navigation.setQuickStatus(status);
			navigation.setQuickCreateTime(DateUtils.dt14LongFormat(new Date()));
			if(quickNavigationDao.insert(navigation) == BbsConstant.OK) {
				refreshQuickNav();
				return BbsConstant.OK;
			}
		} catch (Exception e) {
			logger.error("add home quick nav fail", e);
		}
		return BbsConstant.ERROR;
	}

	public void refreshQuickNav() {
		List<QuickNavigation> quickNavigations = quickNavigationDao.getAllQuickNavigations();
		JSONArray array = JSONArray.parseArray(JSON.toJSONString(quickNavigations));
		JSONObject object = new JSONObject(true);
		object.put("quickNavigations", array.toJSONString());
		redisObjectMapService.save(RedisKeyUtils.getQuickNavigations(), object, JSONObject.class);
	}
}

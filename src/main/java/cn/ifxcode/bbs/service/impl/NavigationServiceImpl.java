package cn.ifxcode.bbs.service.impl;

import java.util.List;

import javax.annotation.Resource;

import ltang.redis.service.RedisObjectMapService;

import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

import cn.ifxcode.bbs.dao.NavigationDao;
import cn.ifxcode.bbs.entity.Navigation;
import cn.ifxcode.bbs.service.NavigationService;
import cn.ifxcode.bbs.utils.JsonUtils;
import cn.ifxcode.bbs.utils.RedisKeyUtils;

@Service
public class NavigationServiceImpl implements NavigationService{

	@Resource
	private NavigationDao navigationDao;
	
	@Resource
	private RedisObjectMapService redisObjectMapService;
	
	public List<Navigation> getAllNavigations() {
		return navigationDao.getAllNavigations();
	}

	@Override
	public Navigation getNavigation(int navId) {
		JSONObject object = redisObjectMapService.get(RedisKeyUtils.getNavigations(), JSONObject.class);
		JSONArray array = JSONArray.parseArray(object.getString("navigations"));
		List<Navigation> navigations = JsonUtils.decodeJson(array, Navigation.class);
		for (Navigation navigation : navigations) {
			if(navigation.getNavId() == navId) {
				return navigation;
			}
		}
		return null;
	}

}

package cn.ifxcode.bbs.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import ltang.redis.service.RedisObjectMapService;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.google.common.collect.Maps;

import cn.ifxcode.bbs.bean.Page;
import cn.ifxcode.bbs.dao.NavigationDao;
import cn.ifxcode.bbs.entity.Board;
import cn.ifxcode.bbs.entity.Navigation;
import cn.ifxcode.bbs.service.NavigationService;
import cn.ifxcode.bbs.utils.DateUtils;
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

	@Override
	public List<Navigation> getBCMNavs(List<Integer> boardIds) {
		List<Navigation> navs = new ArrayList<Navigation>();
		JSONObject object = redisObjectMapService.get(RedisKeyUtils.getNavigations(), JSONObject.class);
		JSONArray array = JSONArray.parseArray(object.getString("navigations"));
		List<Navigation> navigations = JsonUtils.decodeJson(array, Navigation.class);
		for (Navigation n : navigations) {
			JSONObject boardObject = redisObjectMapService.get(RedisKeyUtils.getBoardsByNavId((int) n.getNavId()), JSONObject.class);
			JSONArray boardArray = JSONArray.parseArray(boardObject.getString("boards"));
			List<Board> boards = JsonUtils.decodeJson(boardArray, Board.class);
			List<Board> list = new ArrayList<Board>();
			for (Board board : boards) {
				for (Integer id : boardIds) {
					if(id.equals(board.getBoardId())) {
						list.add(board);
					}
				}
			}
			n.setBoards(list);
			if(!n.getBoards().isEmpty() && n.getBoards().size() > 0) {
				navs.add(n);
			}
		}
		
		return navs;
	}

	@Override
	public List<Navigation> getAllNavigation(Page page) {
		return this.getAllNavigation(page, null, null, null, -1);
	}

	@Override
	public List<Navigation> getAllNavigation(Page page, String startTime,
			String endTime, String navName, int status) {
		Map<String, Object> map = Maps.newHashMap();
		map.put("page", page);
		if(StringUtils.isNotBlank(startTime)) {
			map.put("starttime", startTime);
		}
		if(StringUtils.isNotBlank(endTime)) {
			map.put("endtime", endTime);
		}
		if(StringUtils.isNotBlank(navName)) {
			map.put("name", "%" + navName + "%");
		}
		if(status != -1) {
			map.put("status", status);
		}
		List<Navigation> navigations = navigationDao.getAllNavigationsToAdmin(map);
		this.format(navigations);
		return navigations;
	}
	
	private void format(List<Navigation> navigations) {
		for (Navigation nav : navigations) {
			nav.setNavCreateTime(DateUtils.dt14LongFormat(DateUtils.dt14FromStr(nav.getNavCreateTime())));
		}
	}

}

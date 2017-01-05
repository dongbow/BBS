package cn.ifxcode.bbs.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import ltang.redis.service.RedisObjectMapService;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.google.common.collect.Maps;

import cn.ifxcode.bbs.bean.Page;
import cn.ifxcode.bbs.constant.BbsConstant;
import cn.ifxcode.bbs.dao.NavigationDao;
import cn.ifxcode.bbs.entity.Board;
import cn.ifxcode.bbs.entity.Navigation;
import cn.ifxcode.bbs.logger.SysLog;
import cn.ifxcode.bbs.service.NavigationService;
import cn.ifxcode.bbs.utils.DateUtils;
import cn.ifxcode.bbs.utils.JsonUtils;
import cn.ifxcode.bbs.utils.RedisKeyUtils;

@Service
public class NavigationServiceImpl implements NavigationService{

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Resource
	private NavigationDao navigationDao;
	
	@Resource
	private RedisObjectMapService redisObjectMapService;
	
	public List<Navigation> getAllNavigations() {
		return navigationDao.getAllNavigations();
	}
	
	public List<Navigation> getAllNavigationsFromCache() {
		JSONObject object = redisObjectMapService.get(RedisKeyUtils.getNavigations(), JSONObject.class);
		JSONArray array = JSONArray.parseArray(object.getString("navigations"));
		List<Navigation> navigations = JsonUtils.decodeJson(array, Navigation.class);
		return navigations;
	}

	@Override
	public Navigation getNavigation(int navId) {
		List<Navigation> navigations = this.getAllNavigationsFromCache();
		for (Navigation navigation : navigations) {
			if(navigation.getNavId() == navId) {
				return navigation;
			}
		}
		return null;
	}

	@Override
	public Navigation getNavigationFromDB(int id) {
		return navigationDao.get(id);
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

	@Override
	@SysLog(module = "导航版块", methods = "导航管理-添加")
	public int addNavigation(String name, String desc, int sort, int status) {
		try {
			Navigation navigation = new Navigation();
			navigation.setNavName(name);
			navigation.setNavDesc(desc);
			navigation.setNavSort(sort);
			navigation.setNavStatus(status);
			navigation.setNavCreateTime(DateUtils.dt14LongFormat(new Date()));
			if(navigationDao.insert(navigation) == BbsConstant.OK) {
				refresh();
				return BbsConstant.OK;
			}
		} catch (Exception e) {
			logger.error("add navigation fail", e);
		}
		return BbsConstant.ERROR;
	}

	@Override
	@SysLog(module = "导航版块", methods = "导航管理-编辑")
	public int updateNavigation(int id, String name, String desc, int sort, int status) {
		try {
			Navigation navigation = new Navigation();
			navigation.setNavId(id);
			navigation.setNavName(name);
			navigation.setNavDesc(desc);
			navigation.setNavSort(sort);
			navigation.setNavStatus(status);
			if(navigationDao.update(navigation) == BbsConstant.OK) {
				refresh();
				return BbsConstant.OK;
			}
		} catch (Exception e) {
			logger.error("update navigation fail", e);
		}
		return BbsConstant.ERROR;
	}

	@Override
	@Transactional
	@SysLog(module = "导航版块", methods = "导航管理-删除")
	public int deleteNavigation(String ids) {
		String navIds[] = ids.split(",");
		int result = 0;
		try {
			Map<String, Object> map = Maps.newHashMap();
			map.put("navIds", navIds);
			if(navIds.length == navigationDao.delete(map)) {
				refresh();
				result = BbsConstant.OK;
			}
		} catch (Exception e) {
			logger.error("delete navigation fail", e);
		}
		return result;
	}
	
	public void refresh() {
		List<Navigation> navigations = navigationDao.getAllNavigations();
		JSONArray array = JSONArray.parseArray(JSON.toJSONString(navigations));
		JSONObject object = new JSONObject(true);
		object.put("navigations", array.toJSONString());
		redisObjectMapService.save(RedisKeyUtils.getNavigations(), object, JSONObject.class);
	}

}

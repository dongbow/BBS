package cn.ifxcode.bbs.init;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;

import ltang.redis.service.RedisObjectMapService;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import cn.ifxcode.bbs.dao.BoardDao;
import cn.ifxcode.bbs.dao.ClassifyDao;
import cn.ifxcode.bbs.dao.GeneralDao;
import cn.ifxcode.bbs.dao.NavigationDao;
import cn.ifxcode.bbs.dao.QuickNavigationDao;
import cn.ifxcode.bbs.dao.ResourcesDao;
import cn.ifxcode.bbs.dao.RoleDao;
import cn.ifxcode.bbs.dao.SystemBlackIpDao;
import cn.ifxcode.bbs.dao.UserDao;
import cn.ifxcode.bbs.entity.Board;
import cn.ifxcode.bbs.entity.Classify;
import cn.ifxcode.bbs.entity.Navigation;
import cn.ifxcode.bbs.entity.QuickNavigation;
import cn.ifxcode.bbs.entity.Resources;
import cn.ifxcode.bbs.entity.Role;
import cn.ifxcode.bbs.entity.SwfArea;
import cn.ifxcode.bbs.utils.JsonUtils;
import cn.ifxcode.bbs.utils.RedisKeyUtils;
import cn.ifxcode.bbs.utils.TreeUtils;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

@Service
public class InitSystemData {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Resource
	private RedisObjectMapService redisObjectMapService;
	
	@Resource
	private SystemBlackIpDao systemBlackIpDao;
	
	@Resource
	private ResourcesDao resourcesDao;
	
	@Resource
	private RoleDao roleDao;
	
	@Resource
	private GeneralDao generalDao;
	
	@Resource
	private NavigationDao navigationDao;
	
	@Resource
	private QuickNavigationDao quickNavigationDao;
	
	@Resource
	private BoardDao boardDao;
	
	@Resource
	private UserDao userDao;
	
	@Resource
	private ClassifyDao classifyDao;
	
	@PostConstruct
	public void initSystem() {
		this.initBlackIp();
		this.initRsources();
		this.initRoles();
		this.initSwfArea();
		this.initNavigation();
		this.initQuickNavigation();
		this.initNavBoard();
		this.initClassify();
	}
	
	public void initBlackIp() {
		logger.info("init black ip list to redis start...");
		List<String> ips = systemBlackIpDao.findAllIpAddress();
		StringBuilder builder = new StringBuilder();
		builder.append("{\"ips\":\"");
		for (String ip : ips) {
			builder.append(ip + ";");
		}
		builder.append("\"}");
		redisObjectMapService.save(RedisKeyUtils.getBlackIps(), 
				JSONObject.parseObject(builder.toString()), JSONObject.class);
		logger.info("init black ip list to redis end...");
	}
	
	public void initRsources() {
		List<Integer> roleIds = roleDao.getRoleIds();
		for (Integer id : roleIds) {
			JSONObject jsonObject = new JSONObject();
			List<Resources> resources = TreeUtils.formatResources(resourcesDao.getResourcesByRoleId(id));
			JSONArray jsonArray = JSONArray.parseArray(JSON.toJSONString(resources));
			if(jsonArray != null){
				jsonObject.put("resources", jsonArray.toJSONString());
			}
			redisObjectMapService.save(RedisKeyUtils.getResourcesByRoleId(id), jsonObject, JSONObject.class);
		}
	}
	
	public void initRoles() {
		List<Role> roles = roleDao.getAllRoles();
		JSONArray array = JSONArray.parseArray(JSON.toJSONString(roles));
		JSONObject object = new JSONObject(true);
		object.put("roles", array.toJSONString());
		redisObjectMapService.save(RedisKeyUtils.getRoles(), object, JSONObject.class);
	}
	
	public void initSwfArea() {
		List<SwfArea> areas = generalDao.getAllArea();
		JSONArray array = JSONArray.parseArray(JSON.toJSONString(areas));
		JSONObject object = new JSONObject(true);
		object.put("areas", array.toJSONString());
		redisObjectMapService.save(RedisKeyUtils.getAreas(), object, JSONObject.class);
	}
	
	public void initNavigation() {
		List<Navigation> navigations = navigationDao.getAllNavigations();
		JSONArray array = JSONArray.parseArray(JSON.toJSONString(navigations));
		JSONObject object = new JSONObject(true);
		object.put("navigations", array.toJSONString());
		redisObjectMapService.save(RedisKeyUtils.getNavigations(), object, JSONObject.class);
	}
	
	public void initQuickNavigation() {
		List<QuickNavigation> quickNavigations = quickNavigationDao.getAllQuickNavigations();
		JSONArray array = JSONArray.parseArray(JSON.toJSONString(quickNavigations));
		JSONObject object = new JSONObject(true);
		object.put("quickNavigations", array.toJSONString());
		redisObjectMapService.save(RedisKeyUtils.getQuickNavigations(), object, JSONObject.class);
	}
	
	public void initNavBoard() {
		JSONObject object = redisObjectMapService.get(RedisKeyUtils.getNavigations(), JSONObject.class);
		JSONArray array = JSONArray.parseArray(object.getString("navigations"));
		List<Navigation> navigations = JsonUtils.decodeJson(array, Navigation.class);
		for (Navigation nav : navigations) {
			List<Board> boards = boardDao.getBoardsByNavId(nav.getNavId());
			for (Board board : boards) {
				if(StringUtils.isNotBlank(board.getBoardManager())) {
					String ids[] = board.getBoardManager().split(",");
					List<String> nickname = new ArrayList<String>();
					for (int i = 0; i < ids.length; i++) {
						nickname.add(userDao.getUserNickname(ids[i]));
					}
					board.setBoardManagerName(nickname);
				}
			}
			JSONArray jsonArray = JSONArray.parseArray(JSON.toJSONString(boards));
			JSONObject jsonObject = new JSONObject(true);
			jsonObject.put("boards", jsonArray.toJSONString());
			redisObjectMapService.save(RedisKeyUtils.getBoardsByNavId(nav.getNavId()), 
					jsonObject, JSONObject.class);
		}
	}
	
	public void initClassify() {
		List<Integer> boardIds = boardDao.getBoardId();
		for (Integer id : boardIds) {
			List<Classify> classifies = classifyDao.getClassifyByBoardId(id);
			JSONArray jsonArray = JSONArray.parseArray(JSON.toJSONString(classifies));
			JSONObject jsonObject = new JSONObject(true);
			jsonObject.put("classifies", jsonArray.toJSONString());
			redisObjectMapService.save(RedisKeyUtils.getClassifyByBoardId(id), jsonObject, JSONObject.class);
		}
	}
	
}

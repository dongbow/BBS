package cn.ifxcode.bbs.init;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;

import ltang.redis.service.RedisObjectMapService;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import cn.ifxcode.bbs.dao.BoardDao;
import cn.ifxcode.bbs.dao.ClassifyDao;
import cn.ifxcode.bbs.dao.FriendLinkDao;
import cn.ifxcode.bbs.dao.GeneralDao;
import cn.ifxcode.bbs.dao.NavigationDao;
import cn.ifxcode.bbs.dao.QuickNavigationDao;
import cn.ifxcode.bbs.dao.ResourcesDao;
import cn.ifxcode.bbs.dao.RoleDao;
import cn.ifxcode.bbs.dao.SystemBlackIpDao;
import cn.ifxcode.bbs.dao.SystemConfigDao;
import cn.ifxcode.bbs.dao.UserDao;
import cn.ifxcode.bbs.entity.Board;
import cn.ifxcode.bbs.entity.Classify;
import cn.ifxcode.bbs.entity.FriendLink;
import cn.ifxcode.bbs.entity.Navigation;
import cn.ifxcode.bbs.entity.QuickNavigation;
import cn.ifxcode.bbs.entity.Resources;
import cn.ifxcode.bbs.entity.Role;
import cn.ifxcode.bbs.entity.ScheduleJob;
import cn.ifxcode.bbs.entity.SwfArea;
import cn.ifxcode.bbs.entity.SystemConfig;
import cn.ifxcode.bbs.service.QuartzService;
import cn.ifxcode.bbs.utils.JsonUtils;
import cn.ifxcode.bbs.utils.RedisKeyUtils;

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
	
	@Resource
	private SystemConfigDao systemConfigDao;
	
	@Resource
	private FriendLinkDao friendLinkDao;
	
	@Resource
	private QuartzService quartzService;
	
	//private ScheduledExecutorService executorService = Executors.newScheduledThreadPool(1);
	
	@PostConstruct
	public void initSystem() {
		long start = System.currentTimeMillis();
		this.initSystemConfig();
		this.initBlackIp();
		this.initRsources();
		this.initRoles();
		this.initSwfArea();
		this.initNavigation();
		this.initQuickNavigation();
		this.initNavBoard();
		this.initClassify();
		this.initFriendLink();
		//this.initJob();
		long end = System.currentTimeMillis();
		logger.info("init system time: {}", (end - start) / 1000);
		//executorService.shutdown();
	}
	
	public void initBlackIp() {
		//Runnable runnable = new Runnable() {
			//public void run() {
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
			//}
		//};
		//executorService.scheduleWithFixedDelay(runnable, 1, 10, TimeUnit.SECONDS);
	}
	
	public void initRsources() {
		//Runnable runnable = new Runnable() {
			//public void run() {
				List<Integer> roleIds = roleDao.getRoleIds();
				for (Integer id : roleIds) {
					JSONObject jsonObject = new JSONObject();
					List<Resources> resources = resourcesDao.getResourcesByRoleId(id);
					JSONArray jsonArray = JSONArray.parseArray(JSON.toJSONString(resources));
					if(jsonArray != null){
						jsonObject.put("resources", jsonArray.toJSONString());
					}
					redisObjectMapService.save(RedisKeyUtils.getResourcesByRoleId(id), jsonObject, JSONObject.class);
				}
			//}
		//};
		//executorService.scheduleWithFixedDelay(runnable, 1, 10, TimeUnit.SECONDS);
	}
	
	public void initRoles() {
//		Runnable runnable = new Runnable() {
//			public void run() {
				List<Role> roles = roleDao.getAllRoles();
				JSONArray array = JSONArray.parseArray(JSON.toJSONString(roles));
				JSONObject object = new JSONObject(true);
				object.put("roles", array.toJSONString());
				redisObjectMapService.save(RedisKeyUtils.getRoles(), object, JSONObject.class);
//			}
//		};
//		executorService.scheduleWithFixedDelay(runnable, 1, 10, TimeUnit.SECONDS);
	}
	
	public void initSwfArea() {
//		Runnable runnable = new Runnable() {
//			public void run() {
				List<SwfArea> areas = generalDao.getAllArea();
				JSONArray array = JSONArray.parseArray(JSON.toJSONString(areas));
				JSONObject object = new JSONObject(true);
				object.put("areas", array.toJSONString());
				redisObjectMapService.save(RedisKeyUtils.getAreas(), object, JSONObject.class);
//			}
//		};
//		executorService.scheduleWithFixedDelay(runnable, 1, 10, TimeUnit.SECONDS);
	}
	
	public void initNavigation() {
//		Runnable runnable = new Runnable() {
//			public void run() {
				List<Navigation> navigations = navigationDao.getAllNavigations();
				JSONArray array = JSONArray.parseArray(JSON.toJSONString(navigations));
				JSONObject object = new JSONObject(true);
				object.put("navigations", array.toJSONString());
				redisObjectMapService.save(RedisKeyUtils.getNavigations(), object, JSONObject.class);
//			}
//		};
//		executorService.scheduleWithFixedDelay(runnable, 1, 10, TimeUnit.SECONDS);
	}
	
	public void initQuickNavigation() {
//		Runnable runnable = new Runnable() {
//			public void run() {
				List<QuickNavigation> quickNavigations = quickNavigationDao.getAllQuickNavigations();
				JSONArray array = JSONArray.parseArray(JSON.toJSONString(quickNavigations));
				JSONObject object = new JSONObject(true);
				object.put("quickNavigations", array.toJSONString());
				redisObjectMapService.save(RedisKeyUtils.getQuickNavigations(), object, JSONObject.class);
//			}
//		};
//		executorService.scheduleWithFixedDelay(runnable, 1, 10, TimeUnit.SECONDS);
	}
	
	public void initNavBoard() {
//		Runnable runnable = new Runnable() {
//			public void run() {
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
//			}
//		};
//		executorService.scheduleWithFixedDelay(runnable, 1, 10, TimeUnit.SECONDS);
	}
	
	public void initClassify() {
//		Runnable runnable = new Runnable() {
//			public void run() {
				List<Integer> boardIds = boardDao.getBoardId();
				for (Integer id : boardIds) {
					List<Classify> classifies = classifyDao.getClassifyByBoardId(id);
					JSONArray jsonArray = JSONArray.parseArray(JSON.toJSONString(classifies));
					JSONObject jsonObject = new JSONObject(true);
					jsonObject.put("classifies", jsonArray.toJSONString());
					redisObjectMapService.save(RedisKeyUtils.getClassifyByBoardId(id), jsonObject, JSONObject.class);
				}
//			}
//		};
//		executorService.scheduleWithFixedDelay(runnable, 1, 10, TimeUnit.SECONDS);
	}
	
	public void initSystemConfig() {
//		Runnable runnable = new Runnable() {
//			public void run() {
				List<SystemConfig> configs = systemConfigDao.getSystemConfig();
				JSONObject object = new JSONObject(true);
				for (SystemConfig sc : configs) {
					object.put(sc.getAttrName(), sc.getAttrValue());
				}
				redisObjectMapService.save(RedisKeyUtils.getSystemConfig(), object, JSONObject.class);
//			}
//		};
//		executorService.scheduleWithFixedDelay(runnable, 1, 10, TimeUnit.SECONDS);
	}
	
	public void initFriendLink() {
//		Runnable runnable = new Runnable() {
//			public void run() {
				List<FriendLink> links = friendLinkDao.getAllFriendLinks();
				JSONArray array = JSONArray.parseArray(JSON.toJSONString(links));
				JSONObject object = new JSONObject(true);
				object.put("friendlinks", array.toJSONString());
				redisObjectMapService.save(RedisKeyUtils.getFriendLinks(), object, JSONObject.class);
//			}
//		};
//		executorService.scheduleWithFixedDelay(runnable, 1, 10, TimeUnit.SECONDS);
	}
	
	public void initJob() {
		List<ScheduleJob> jobs = quartzService.getAllJobFromDB(null);
		if(jobs != null && jobs.size() > 0) {
			for (ScheduleJob job : jobs) {
				quartzService.addJob(job);
			}
		}
	}
	
}

package cn.ifxcode.bbs.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;
import java.util.regex.Pattern;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import ltang.redis.service.RedisObjectMapService;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;

import cn.ifxcode.bbs.bean.CookieBean;
import cn.ifxcode.bbs.constant.BbsConstant;
import cn.ifxcode.bbs.dao.AwardValueDao;
import cn.ifxcode.bbs.dao.GeneralDao;
import cn.ifxcode.bbs.dao.UserValueDao;
import cn.ifxcode.bbs.entity.AwardValue;
import cn.ifxcode.bbs.entity.Board;
import cn.ifxcode.bbs.entity.BoardInfo;
import cn.ifxcode.bbs.entity.Classify;
import cn.ifxcode.bbs.entity.ExperienceHistory;
import cn.ifxcode.bbs.entity.GoldHistory;
import cn.ifxcode.bbs.entity.Resources;
import cn.ifxcode.bbs.entity.SwfArea;
import cn.ifxcode.bbs.entity.User;
import cn.ifxcode.bbs.entity.UserValue;
import cn.ifxcode.bbs.enumtype.EGHistory;
import cn.ifxcode.bbs.enumtype.MsgType;
import cn.ifxcode.bbs.exception.StopException;
import cn.ifxcode.bbs.msg.entity.Message;
import cn.ifxcode.bbs.service.BoardService;
import cn.ifxcode.bbs.service.ClassifyService;
import cn.ifxcode.bbs.service.GeneralService;
import cn.ifxcode.bbs.service.MessageService;
import cn.ifxcode.bbs.service.UserService;
import cn.ifxcode.bbs.utils.DateUtils;
import cn.ifxcode.bbs.utils.FormValidate;
import cn.ifxcode.bbs.utils.GetRemoteIpUtil;
import cn.ifxcode.bbs.utils.JsonUtils;
import cn.ifxcode.bbs.utils.RedisKeyUtils;
import cn.ifxcode.bbs.utils.RoleIdUtils;
import cn.ifxcode.bbs.utils.UserValueUtils;

@Service
public class GeneralServiceImpl implements GeneralService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Resource
	private UserService userService;
	
	@Resource
	private UserValueDao userValueDao;
	
	@Resource
	private GeneralDao generalDao;
	
	@Resource
	private ClassifyService classifyService;
	
	boolean result = false;
	
	@Resource
	private BoardService boardService;
	
	@Resource
	private RedisObjectMapService redisObjectMapService;
	
	@Resource
	private AwardValueDao awardValueDao;
	
	@Resource
	private MessageService messageService;
	
	private ScheduledExecutorService executorService = Executors.newScheduledThreadPool(5);
	
	public boolean checkIp(HttpServletRequest request) {
		String ip = GetRemoteIpUtil.getRemoteIp(request);
		List<String> ips = getBlackIpsFromCache();
		if(ips != null && ips.size() > 0) {
			for (String string : ips) {
				Pattern pattern = Pattern.compile(string);
				if(pattern.matcher(ip).find()) {
					return true;
				}
			}
		}
		return false;
	}
	
	private List<String> getBlackIpsFromCache() {
		List<String> list = new ArrayList<String>();
		JSONObject ips = redisObjectMapService.get(RedisKeyUtils.getBlackIps(), JSONObject.class);
		if(ips.containsKey("ips")) {
			String s[] = ips.getString("ips").split(";");
			for (int i = 0; i < s.length; i++) {
				if(StringUtils.isNotBlank(s[i])) {
					list.add(s[i]);
				}
			}
		}
		return list.size() > 0 ? list : null;
	}

	@Override
	public boolean checkBbsIsClose() {
		JSONObject object = redisObjectMapService.get(RedisKeyUtils.getSystemConfig(), JSONObject.class);
		if(object != null && object.containsKey("isOpenBbs")) {
			if(Integer.parseInt(object.getString("isOpenBbs")) == 1) {
				return true;
			}
		}
		return false;
	}

	@Override
	@Transactional
	public int UserAward(EGHistory eg, long uid, HttpServletRequest request) {
		GoldHistory goldHistory = null;
		ExperienceHistory experienceHistory = null;
		UserValue userValue = null;
		if(eg.getFrom() == 3) {
			userValue = UserValueUtils.topic(userService.getUserValue(uid));
			userValue.setUserTopicCount(userValue.getUserTopicCount() + 1);
		}
		if(eg.getFrom() == 4) {
			userValue = UserValueUtils.reply(userService.getUserValue(uid));
			userValue.setUserReplyCount(userValue.getUserReplyCount() + 1);
		}
		CookieBean cookieBean = userService.getCookieBeanFromCookie(request);
		if(userValue.isGoldChange()) {
			goldHistory = new GoldHistory(userValue.getUserId(), cookieBean.getNick_name(), userValue.getThisGold(), eg.getFrom(), 
					eg.getDesc(), userValue.getUserLastestPastTime());
			generalDao.insertGoldHistory(goldHistory);
		}
		if(userValue.isExpChange()) {
			experienceHistory = new ExperienceHistory(userValue.getUserId(), cookieBean.getNick_name(), userValue.getThisExp(), 
					eg.getDesc(), userValue.getUserLastestPastTime());
			generalDao.insertExperienceHistory(experienceHistory);
		}
		userValueDao.updateUserValue(userValue);
		Message message = new Message.builder().to(userService.getUserIdFromCookie(request)).text("金币+" + userValue.getThisGold() + "，经验+" + userValue.getThisExp()).type(MsgType.DIALOG.getCode()).status(1).build();
		delayMsg(request, message);
		return BbsConstant.OK;
	}

	@Override
	public Board getBoardByBoardId(int boardId) {
		List<Classify> classifies = classifyService.getClassifyByBoardId(boardId);
		if(classifies != null && classifies.size() > 0) {
			Board board = boardService.getBoardByBoardId(classifies.get(0).getNavId(), boardId);
			if(board != null) {
				return board;
			}
		}
		return null;
	}

	@Override
	public boolean isLogin(HttpServletRequest request) {
		CookieBean cookieBean = userService.getCookieBeanFromCookie(request);
		if(cookieBean != null) {
			JSONObject object = redisObjectMapService.get(RedisKeyUtils.getUserInfo(cookieBean.getUser_id()), JSONObject.class);
			if(object != null) {
				return false;
			}
		}
		return true;
	}

	@Override
	public boolean isBoardAccess(HttpServletRequest request) {
		CookieBean cookieBean = userService.getCookieBeanFromCookie(request);
		if(cookieBean != null) {
			JSONObject object = redisObjectMapService.get(RedisKeyUtils.getUserInfo(cookieBean.getUser_id()), JSONObject.class);
			if(object != null) {
				User user = JsonUtils.decodeJson(object);
				if(user.getUserAccess().getUserIsAdmin() == BbsConstant.OK 
						|| user.getUserAccess().getUserIsBoderManager() == BbsConstant.OK) {
					return false;
				}
			}
		}
		return true;
	}

	@Override
	public boolean adminCheck(HttpServletRequest request) {
		CookieBean cookieBean = userService.getCookieBeanFromCookie(request);
		if(cookieBean != null) {
			JSONObject object = redisObjectMapService.get(RedisKeyUtils.getUserInfo(cookieBean.getUser_id()), JSONObject.class);
			if(object != null) {
				User user = JsonUtils.decodeJson(object);
				if(user.getUserAccess().getUserIsAdmin() == BbsConstant.OK) {
					return false;
				}
			}
		}
		return true;
	}

	@Override
	public List<SwfArea> getAllProvinces() {
		JSONArray array = JSONArray.parseArray(redisObjectMapService.get(RedisKeyUtils.getAreas(), JSONObject.class).getString("areas"));
		List<SwfArea> areas = JsonUtils.decodeJson(array, SwfArea.class);
		List<SwfArea> provinces = Lists.newArrayList();
		for (SwfArea swfArea : areas) {
			if(swfArea.getParentId() == 0) {
				provinces.add(swfArea);
			}
		}
		return provinces;
	}

	@Override
	public List<SwfArea> getCitys(String userProvince) {
		long pid = Integer.parseInt(userProvince);
		JSONArray array = JSONArray.parseArray(redisObjectMapService.get(RedisKeyUtils.getAreas(), JSONObject.class).getString("areas"));
		List<SwfArea> areas = JsonUtils.decodeJson(array, SwfArea.class);
		List<SwfArea> citys = Lists.newArrayList();
		for (SwfArea swfArea : areas) {
			if(swfArea.getParentId() == pid) {
				citys.add(swfArea);
			}
		}
		return citys;
	}

	@Override
	public int click(String... sign) {
		String time = DateUtils.dt10FromDate(new Date());
		JSONObject object = redisObjectMapService.get(RedisKeyUtils.getClick(sign), JSONObject.class);
		if(object != null && object.containsKey(time)) {
			object.put(time, Long.parseLong(object.getString(time).toString()) + 1);
		} else {
			object = new JSONObject(true);
			object.put(time, 1);
		}
		redisObjectMapService.save(RedisKeyUtils.getClick(sign), object, JSONObject.class);
		return BbsConstant.OK;
	}

	@Override
	public boolean authCheck(HttpServletRequest request) {
		CookieBean bean = userService.getCookieBeanFromCookie(request);
		User user = userService.getUserByIdFromRedis(Long.toString(bean.getUser_id()));
		if(bean.getIs_admin() == 1 && user.getUserAccess().getUserIsAdmin() == 1) {
			return true;
		}
		return false;
	}

	@Override
	public boolean bmcCheck(HttpServletRequest request) {
		CookieBean bean = userService.getCookieBeanFromCookie(request);
		User user = userService.getUserByIdFromRedis(Long.toString(bean.getUser_id()));
		if(user.getUserAccess().getUserIsAdmin() == 1 || user.getUserAccess().getUserIsBoderManager() == 1) {
			return true;
		}
		return false;
	}

	@Override
	public boolean isLocalBMC(HttpServletRequest request) {
		String uri = request.getRequestURI();
		int id = 0;
		if(uri.indexOf("/post") > 0) {
			id = Integer.parseInt(uri.replace("/bbs/post/new/board/", "").split("/")[0]);
		} else {
			id = Integer.parseInt(uri.replace("/bbs/board/", "").split("/")[0]);
		}
		long uid = userService.getUserIdFromCookie(request);
		User user = userService.getUserByIdFromRedis(Long.toString(uid));
		if(user != null && user.getUserAccess().getUserIsBoderManager() == 1) {
			List<Integer> list = userService.getAllBoardManageId(uid);
			for (Integer bid : list) {
				if(bid.equals(id)) {
					return true;
				}
			}
		}
		return false;
	}
	
	public boolean isLocalBMCByBoardId(int bid, HttpServletRequest request) {
		long uid = userService.getUserIdFromCookie(request);
		User user = userService.getUserByIdFromRedis(Long.toString(uid));
		if(user != null && user.getUserAccess().getUserIsAdmin() == 1) {
			return true;
		}
		if(user != null && user.getUserAccess().getUserIsBoderManager() == 1) {
			List<Integer> list = userService.getAllBoardManageId(uid);
			for (Integer id : list) {
				if(id.equals(bid)) {
					return true;
				}
			}
		}
		return false;
	}

	@Override
	public boolean checkUpdate(HttpServletRequest request, long userId) {
		long uid = userService.getUserIdFromCookie(request);
		if(uid == userId) {
			return true;
		}
		User user = userService.getUserByIdFromRedis(Long.toString(uid));
		if(user.getUserAccess().getUserIsAdmin() == 1) {
			return true;
		}
		if(user.getUserAccess().getUserIsBoderManager() == 1) {
			return isLocalBMC(request);
		}
		return false;
	}

	@Override
	public boolean authResources(HttpServletRequest request) {
		String url = request.getRequestURI();
		if(url.indexOf("/auth") > 0 || url.indexOf(BbsConstant.AUTH_HOME) > 0) {
			return true;
		}
		CookieBean bean = userService.getCookieBeanFromCookie(request);
		List<Integer> rids = RoleIdUtils.getRoleIds(bean.getRole_ids());
		String ids = RoleIdUtils.getRoleIdsFromCookie(rids);
		JSONObject object = redisObjectMapService.get(RedisKeyUtils.getResourcesByRoleId(Integer.parseInt(ids)), JSONObject.class);
		List<Resources> resources = JsonUtils.decodeJson(JSONArray.parseArray(object.getString("resources")), Resources.class);
		try {
			authHref(url, resources);
		} catch (StopException e) {
			return true;
		}
		return result;
	}
	
	private boolean authHref(String url, List<Resources> resources) {
		for (Resources res : resources) {
			if(url.endsWith(res.getResLink())) {
				throw new StopException();
			}
			if(res.getResources() != null && res.getResources().size() > 0) {
				authHref(url, res.getResources());
			}
		}
		return false;
	}

	@Override
	public synchronized void saveCount(String key) {
		String realKey = RedisKeyUtils.getCount(key);
		String today = DateUtils.getToday();
		JSONObject object = redisObjectMapService.get(realKey, JSONObject.class);
		if(object != null) {
			if(object.containsKey(today)) {
				object.put(today, object.getLongValue(today) + 1);
			} else {
				object.put(today, 1);
			}
		} else {
			object = new JSONObject(true);
			object.put(today, 1);
		}
		redisObjectMapService.save(realKey, object, JSONObject.class);
	}

	@Override
	public JSONObject getChartData(int day, String start, String end) {
		JSONObject object = new JSONObject(true);
		try {
			if(!FormValidate.stringUtils(start, end)) {
				end = DateUtils.getYesterday();
				start = DateUtils.getYesSeven(end);
			}
			Map<String, Object> params = Maps.newHashMap();
			params.put("start", start);
			params.put("end", end);
			List<Map<String, Object>> maps = generalDao.getChartData(params);
			
			List<String> date = Lists.newArrayList();
			List<Long> sign = Lists.newArrayList();
			List<Long> user = Lists.newArrayList();
			List<Long> topic = Lists.newArrayList();
			List<Long> reply = Lists.newArrayList();
			for (Map<String, Object> map : maps) {
				date.add(map.get("time").toString());
				sign.add(Long.parseLong(map.get("user_sign_count").toString()));
				user.add(Long.parseLong(map.get("newuser_count").toString()));
				topic.add(Long.parseLong(map.get("topic_count").toString()));
				reply.add(Long.parseLong(map.get("reply_count").toString()));
			}
			object.put("date", net.sf.json.JSONArray.fromObject(date));
			object.put("sign", net.sf.json.JSONArray.fromObject(sign));
			object.put("user", net.sf.json.JSONArray.fromObject(user));
			object.put("topic", net.sf.json.JSONArray.fromObject(topic));
			object.put("reply", net.sf.json.JSONArray.fromObject(reply));
			
			List<Board> boards = boardService.getAllBoard();
			List<String> names = Lists.newArrayList();
			List<Map<String, Object>> boardsData = Lists.newArrayList();
			for (Board board : boards) {
				names.add(board.getBoardName());
				Map<String, Object> map = Maps.newHashMap();
				map.put("name", board.getBoardName());
				BoardInfo info = boardService.getBoardInfoFromRedis(board.getBoardId());
				map.put("value", info.getBoardClickCount());
				boardsData.add(map);
			}
			object.put("boardname", net.sf.json.JSONArray.fromObject(names));
			object.put("clicks", net.sf.json.JSONArray.fromObject(boardsData));
		} catch (Exception e) {
			logger.error("get chart data fail", e);
		}
		return object;
	}

	@Override
	public List<AwardValue> getAllFromDB() {
		return awardValueDao.getAllFromDB();
	}

	@Override
	public List<AwardValue> getAllFromRedis() {
		JSONObject object = redisObjectMapService.get(RedisKeyUtils.getAwards(), JSONObject.class);
		return JsonUtils.decodeJson(JSONArray.parseArray(object.getString("awards")), AwardValue.class);
	}

	public AwardValue getAwardValue(String type) {
		List<AwardValue> list = getAllFromRedis();
		for (AwardValue av : list) {
			if (av.getValueType().equals(type)) {
				return av;
			}
		}
		return null;
	}
	
	@Override
	public void refreashAwardValue() {
		List<AwardValue> list = getAllFromDB();
		JSONArray array = JSONArray.parseArray(JSON.toJSONString(list));
		JSONObject object = new JSONObject(true);
		object.put("awards", array.toJSONString());
		redisObjectMapService.save(RedisKeyUtils.getAwards(), object, JSONObject.class);
	}

	@Override
	public int updateAwardValue(List<AwardValue> values) {
		return 0;
	}

	@Override
	public void delayMsg(final HttpServletRequest request, final Message message) {
		executorService.schedule(new Runnable() {
			@Override
			public void run() {
				messageService.sendMsg(request, message);
			}
		}, 3, TimeUnit.SECONDS);
	}

}

package cn.ifxcode.bbs.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.regex.Pattern;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import ltang.redis.service.RedisObjectMapService;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.google.common.collect.Lists;

import cn.ifxcode.bbs.bean.CookieBean;
import cn.ifxcode.bbs.constant.BbsConstant;
import cn.ifxcode.bbs.dao.GeneralDao;
import cn.ifxcode.bbs.dao.UserValueDao;
import cn.ifxcode.bbs.entity.Board;
import cn.ifxcode.bbs.entity.Classify;
import cn.ifxcode.bbs.entity.ExperienceHistory;
import cn.ifxcode.bbs.entity.GoldHistory;
import cn.ifxcode.bbs.entity.Resources;
import cn.ifxcode.bbs.entity.SwfArea;
import cn.ifxcode.bbs.entity.User;
import cn.ifxcode.bbs.entity.UserValue;
import cn.ifxcode.bbs.enumtype.EGHistory;
import cn.ifxcode.bbs.exception.StopException;
import cn.ifxcode.bbs.service.BoardService;
import cn.ifxcode.bbs.service.ClassifyService;
import cn.ifxcode.bbs.service.GeneralService;
import cn.ifxcode.bbs.service.UserService;
import cn.ifxcode.bbs.utils.DateUtils;
import cn.ifxcode.bbs.utils.GetRemoteIpUtil;
import cn.ifxcode.bbs.utils.JsonUtils;
import cn.ifxcode.bbs.utils.RedisKeyUtils;
import cn.ifxcode.bbs.utils.RoleIdUtils;
import cn.ifxcode.bbs.utils.UserValueUtils;

@Service
public class GeneralServiceImpl implements GeneralService {

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
	
	public boolean checkIp(HttpServletRequest request) {
		String ip = GetRemoteIpUtil.getRemoteIp(request);
		List<String> ips = this.getBlackIpsFromCache();
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
		List<SwfArea> areas = JsonUtils.decodeAreaJson(JSONArray
				.parseArray(redisObjectMapService.get(RedisKeyUtils.getAreas(),
						JSONObject.class).getString("areas")));
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
		List<SwfArea> areas = JsonUtils.decodeAreaJson(JSONArray
				.parseArray(redisObjectMapService.get(RedisKeyUtils.getAreas(),
						JSONObject.class).getString("areas")));
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
			return this.isLocalBMC(request);
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
		String ids = RoleIdUtils.getRoleIdsFromCookie(RoleIdUtils.getRoleIds(bean.getRole_ids()));
		JSONObject object = redisObjectMapService.get(RedisKeyUtils.getResourcesByRoleId(Integer.parseInt(ids)), JSONObject.class);
		List<Resources> resources = JsonUtils.decodeJson(JSONArray.parseArray(object.getString("resources")));
		try {
			this.authHref(url, resources);
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
				this.authHref(url, res.getResources());
			}
		}
		return false;
	}

}

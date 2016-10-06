package cn.ifxcode.bbs.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import ltang.redis.service.RedisObjectMapService;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.google.common.collect.Maps;

import cn.ifxcode.bbs.bean.CookieBean;
import cn.ifxcode.bbs.bean.Page;
import cn.ifxcode.bbs.constant.BbsConstant;
import cn.ifxcode.bbs.dao.PastHistoryDao;
import cn.ifxcode.bbs.dao.RoleDao;
import cn.ifxcode.bbs.dao.UserDao;
import cn.ifxcode.bbs.dao.UserValueDao;
import cn.ifxcode.bbs.entity.ExperienceHistory;
import cn.ifxcode.bbs.entity.GoldHistory;
import cn.ifxcode.bbs.entity.PastHistory;
import cn.ifxcode.bbs.entity.SwfArea;
import cn.ifxcode.bbs.entity.User;
import cn.ifxcode.bbs.entity.UserAccess;
import cn.ifxcode.bbs.entity.UserInfo;
import cn.ifxcode.bbs.entity.UserPrivacy;
import cn.ifxcode.bbs.entity.UserValue;
import cn.ifxcode.bbs.enumtype.EGHistory;
import cn.ifxcode.bbs.service.GoldExperienceService;
import cn.ifxcode.bbs.service.UserService;
import cn.ifxcode.bbs.utils.Base64Utils;
import cn.ifxcode.bbs.utils.CookieUtils;
import cn.ifxcode.bbs.utils.DateUtils;
import cn.ifxcode.bbs.utils.GetRemoteIpUtil;
import cn.ifxcode.bbs.utils.JsonUtils;
import cn.ifxcode.bbs.utils.MD5Utils;
import cn.ifxcode.bbs.utils.RedisKeyUtils;
import cn.ifxcode.bbs.utils.ReflectUtils;
import cn.ifxcode.bbs.utils.RoleIdUtils;

@Service
public class UserServiceImpl implements UserService{

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Resource
	private UserDao userDao;
	
	@Resource
	private UserValueDao userValueDao;
	
	@Resource
	private RoleDao roleDao;
	
	@Resource
	private PastHistoryDao pastHistoryDao;
	
	@Resource
	private RedisObjectMapService redisObjectMapService;
	
	@Resource
	private GoldExperienceService goldExperienceService;
	
	public User authLogin(String name, String password) {
		Map<String, Object> map = Maps.newHashMap();
		map.put("name", name);
		map.put("password", password);
		User user = userDao.authLogin(map);
		return user == null ? null : this.formatUser(user);
	}

	public synchronized Integer valueCheck(String type, String value) {
		type = "name".equals(type) ? "user_name" : "user_email";
		Map<String, Object> map = Maps.newHashMap();
		map.put("type", type);
		map.put("value", value);
		return userDao.valueCheck(map);
	}

	public synchronized int updateUserLastestTimeAndIp(Long userId,
			String userLastestLoginIp, String userLastestLoginTime) {
		return userDao.updateUserLastestTimeAndIp(userId, userLastestLoginIp, userLastestLoginTime);
	}

	public long getUserIdFromCookie(HttpServletRequest request) {
		String cookie = Base64Utils.getFromBase64(CookieUtils.getUserCookieValue(request));
		return Long.parseLong(cookie.split(";")[0]);
	}

	public CookieBean getCookieBeanFromCookie(HttpServletRequest request) {
		String cookie = Base64Utils.getFromBase64(CookieUtils.getUserCookieValue(request));
		CookieBean bean = null;
		if(StringUtils.isNotBlank(cookie)) {
			String s[] = cookie.split(";");
			if(s.length != 4) {
				return null;
			}
			bean = ReflectUtils.returnEntity(CookieBean.class, cookie.split(";"));
		}
		return (bean != null && bean.getUser_id() > 0) ? bean : null;
	}

	@Override
	public List<User> getAllUser(Page page, long userId, String username,
			String nickname, int sex, int role, int status, String startTime,
			String endTime) {
		Map<String, Object> map = Maps.newHashMap();
		map.put("page", page);
		if(userId != 0) {
			map.put("userid", userId);
		}
		if(StringUtils.isNotBlank(username)) {
			map.put("username", "%" + username + "%");
		}
		if(StringUtils.isNotBlank(nickname)) {
			map.put("nickname", "%" + nickname + "%");
		}
		if(sex != -1) {
			map.put("sex", sex);
		}
		if(role != -1) {
			map.put("role", role);
		}
		if(status != -1) {
			map.put("status", status);
		}
		if(StringUtils.isNotBlank(startTime)) {
			map.put("starttime", startTime);
		}
		if(StringUtils.isNotBlank(endTime)) {
			map.put("endtime", endTime);
		}
		return this.formatUser(userDao.getAllUser(map));
	}
	
	private List<User> formatUser(List<User> users) {
		List<SwfArea> areas = JsonUtils.decodeAreaJson(JSONArray
				.parseArray(redisObjectMapService.get(RedisKeyUtils.getAreas(),
						JSONObject.class).getString("areas")));
		List<User> list = new ArrayList<User>();
		for (User user : users) {
			for (SwfArea area : areas) {
				if(StringUtils.equals(user.getUserInfo().getUserProvince(), Integer.toString(area.getId()))) {
					user.getUserInfo().setUserProvince(area.getName());
				}
				if(StringUtils.equals(user.getUserInfo().getUserCity(), Integer.toString(area.getId()))) {
					user.getUserInfo().setUserCity(area.getName());
				}
			}
			list.add(user);
		}
		return list;
	}

	@Transactional
	public synchronized Integer insertUser(String userName, String password, String email, 
			 int isAdmin, int boardManager, String roleIds, HttpServletRequest request) {
		int result = 0;
		UserAccess access = new UserAccess();
		access.setUserName(userName);
		access.setUserNickname(userName);
		access.setUserPassword(MD5Utils.getMD5String(password));
		access.setUserEmail(email);
		access.setUserIsAdmin(isAdmin);
		access.setUserCreateTime(DateUtils.dt14LongFormat(new Date()));
		access.setUserIsBoderManager(boardManager);
		access.setUserIsDelete(0);
		access.setUserIsLocked(0);
		access.setUserIsOnline(0);
		access.setUserIsSpeak(0);
		access.setUserRegIp(GetRemoteIpUtil.getRemoteIp(request));
		if(BbsConstant.OK == userDao.insertUserAccess(access)) {
			logger.info("insert access : userid = " + access.getUserId());
			UserInfo info = new UserInfo();
			info.setUserId(access.getUserId());
			info.setUserHeadImg(BbsConstant.DEFAULT_IMAGE);
			UserPrivacy privacy = new UserPrivacy();
			privacy.setUserId(access.getUserId());
			UserValue value = new UserValue();
			value.setUserId(access.getUserId());
			value.setUserExperience(1);
			value.setTodayExp(1);
			value.setTodayExpTime(DateUtils.dt14LongFormat(new Date()));
			value.setUserGold(50);
			value.setTodayGold(50);
			value.setTodayGoldTime(DateUtils.dt14LongFormat(new Date()));
			value.setUserReplyCount(0);
			value.setUserTopicCount(0);
			value.setUserFriendCount(0);
			if(BbsConstant.OK == userDao.insertUserInfo(info)
					&& BbsConstant.OK == userDao.insertUserPrivacy(privacy)
					&& BbsConstant.OK == userValueDao.insertUserValue(value)) {
				List<Integer> userRole = RoleIdUtils.getRoleIds(roleIds);
				for (Integer roleId : userRole) {
					roleDao.insertUserRole(access.getUserId(), roleId);
				}
				result = BbsConstant.OK;
				logger.info("insert userinfo and user_role : userid = " + access.getUserId());
				GoldHistory goldHistory = new GoldHistory(access.getUserId(), access.getUserNickname(), 50, EGHistory.REG.getFrom(), 
						EGHistory.REG.getDesc(), access.getUserCreateTime());
				ExperienceHistory experienceHistory = new ExperienceHistory(access.getUserId(), access.getUserNickname(), 1, 
						EGHistory.REG.getDesc(), access.getUserCreateTime());
				goldExperienceService.insertGE(goldHistory, experienceHistory);
			}
		}
		return result;
	}

	@Override
	public User loginCheck(String userName, String password) {
		Map<String, Object> map = Maps.newHashMap();
		map.put("name", userName);
		map.put("password", password);
		User user = userDao.loginCheck(map);
		return user == null ? null : this.formatUser(user);
	}

	@Override
	public UserValue getUserValue(Long userId) {
		return userValueDao.getUserValue(userId);
	}

	@Override
	public User getUserById(long userId) {
		User user = userDao.getUserById(userId);
		return user == null ? null : this.formatUser(user);
	}
	
	private User formatUser(User user) {
		if(StringUtils.isNotBlank(user.getUserInfo().getUserProvince())
				&& StringUtils.isNotBlank(user.getUserInfo().getUserCity())) {
			List<SwfArea> areas = JsonUtils.decodeAreaJson(JSONArray
					.parseArray(redisObjectMapService.get(RedisKeyUtils.getAreas(),
							JSONObject.class).getString("areas")));
			for (SwfArea area : areas) {
				if(StringUtils.equals(user.getUserInfo().getUserProvince(), Integer.toString(area.getId()))) {
					user.getUserInfo().setUserProvince(area.getName());
				}
				if(StringUtils.equals(user.getUserInfo().getUserCity(), Integer.toString(area.getId()))) {
					user.getUserInfo().setUserCity(area.getName());
				}
			}
		}
		user.getUserAccess().setUserCreateTime(DateUtils.dt14LongFormat(DateUtils.dt14FromStr(user.getUserAccess().getUserCreateTime())));
		if(StringUtils.isNotBlank(user.getUserAccess().getUserLastestLoginTime())) {
			user.getUserAccess().setUserLastestLoginTime(DateUtils.dt14LongFormat(DateUtils.dt14FromStr(user.getUserAccess().getUserLastestLoginTime())));
		}
		return user;
	}

	@Override
	public User getUserByUserNickname(String nickname) {
		User user = userDao.getUserByUserNickname(nickname);
		return user == null ? null : this.formatUser(user);
	}

	@Override
	public CookieBean checkIsLogin(HttpServletRequest request) {
		CookieBean cookieBean = this.getCookieBeanFromCookie(request);
		if(cookieBean != null) {
			JSONObject object = redisObjectMapService.get(RedisKeyUtils.getUserInfo(cookieBean.getUser_id()), JSONObject.class);
			if(object != null) {
				return cookieBean;
			}
		}
		return null;
	}

	@Transactional
	public synchronized Integer addSign(UserValue userValue, PastHistory pastHistory) {
		if(userValueDao.updateUserValue(userValue) == BbsConstant.OK
				&& pastHistoryDao.insertPastHistory(pastHistory) == BbsConstant.OK) {
			return BbsConstant.OK;
		}
		return BbsConstant.ERROR;
	}

	@Override
	public boolean isTodayFirstLogin(String userLastestLoginTime) {
		if(DateUtils.getDateDifferenceBegin(userLastestLoginTime, DateUtils.dt14LongFormat(new Date())) > 24 * 60) {
			return true;
		}
		return false;
	}

	@Override
	public int updateUserValue(UserValue userValue) {
		return userValueDao.updateUserValue(userValue);
	}


}

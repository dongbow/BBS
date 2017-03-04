package cn.ifxcode.bbs.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

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
import com.google.common.collect.Maps;

import cn.ifxcode.bbs.bean.CookieBean;
import cn.ifxcode.bbs.bean.Page;
import cn.ifxcode.bbs.constant.BbsConstant;
import cn.ifxcode.bbs.constant.BbsErrorCode;
import cn.ifxcode.bbs.dao.PastHistoryDao;
import cn.ifxcode.bbs.dao.RoleDao;
import cn.ifxcode.bbs.dao.UserDao;
import cn.ifxcode.bbs.dao.UserFavoriteDao;
import cn.ifxcode.bbs.dao.UserForgetDao;
import cn.ifxcode.bbs.dao.UserFriendsDao;
import cn.ifxcode.bbs.dao.UserValueDao;
import cn.ifxcode.bbs.entity.ExperienceHistory;
import cn.ifxcode.bbs.entity.GoldHistory;
import cn.ifxcode.bbs.entity.PastHistory;
import cn.ifxcode.bbs.entity.SwfArea;
import cn.ifxcode.bbs.entity.User;
import cn.ifxcode.bbs.entity.UserAccess;
import cn.ifxcode.bbs.entity.UserFavorite;
import cn.ifxcode.bbs.entity.UserForget;
import cn.ifxcode.bbs.entity.UserFriends;
import cn.ifxcode.bbs.entity.UserInfo;
import cn.ifxcode.bbs.entity.UserPrivacy;
import cn.ifxcode.bbs.entity.UserValue;
import cn.ifxcode.bbs.enumtype.BoardSign;
import cn.ifxcode.bbs.enumtype.EGHistory;
import cn.ifxcode.bbs.enumtype.Favorite;
import cn.ifxcode.bbs.enumtype.TopicSign;
import cn.ifxcode.bbs.logger.BmcLogAnno;
import cn.ifxcode.bbs.logger.SysLog;
import cn.ifxcode.bbs.service.BoardService;
import cn.ifxcode.bbs.service.GoldExperienceService;
import cn.ifxcode.bbs.service.TopicService;
import cn.ifxcode.bbs.service.UserService;
import cn.ifxcode.bbs.utils.CookieUtils;
import cn.ifxcode.bbs.utils.DateUtils;
import cn.ifxcode.bbs.utils.FormValidate;
import cn.ifxcode.bbs.utils.GetRemoteIpUtil;
import cn.ifxcode.bbs.utils.JsonUtils;
import cn.ifxcode.bbs.utils.MD5Utils;
import cn.ifxcode.bbs.utils.NumberUtils;
import cn.ifxcode.bbs.utils.RedisKeyUtils;
import cn.ifxcode.bbs.utils.ReflectUtils;
import cn.ifxcode.bbs.utils.RoleIdUtils;

@Service
public class UserServiceImpl implements UserService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Resource
	private UserDao userDao;
	
	@Resource
	private UserValueDao userValueDao;
	
	@Resource
	private UserForgetDao forgetDao;
	
	@Resource
	private RoleDao roleDao;
	
	@Resource
	private PastHistoryDao pastHistoryDao;
	
	@Resource
	private UserFavoriteDao favoriteDao;
	
	@Resource
	private UserFriendsDao friendsDao;
	
	@Resource
	private TopicService topicService;
	
	@Resource
	private BoardService boardService;
	
	@Resource
	private RedisObjectMapService redisObjectMapService;
	
	@Resource
	private GoldExperienceService goldExperienceService;
	
	public User authLogin(String name, String password) {
		Map<String, Object> map = Maps.newHashMap();
		map.put("name", name);
		map.put("password", password);
		User user = userDao.authLogin(map);
		if(user != null) {
			formatEmail(user);
		}
		return user == null ? null : user;
	}

	public Integer valueCheck(String type, String value) {
		synchronized (this) {
			type = "name".equals(type) ? "user_name" : "user_email";
			Map<String, Object> map = Maps.newHashMap();
			map.put("type", type);
			map.put("value", value);
			return userDao.valueCheck(map);
		}
	}

	public int updateUserLastestTimeAndIp(Long userId,
			String userLastestLoginIp, String userLastestLoginTime) {
		synchronized (this) {
			return userDao.updateUserLastestTimeAndIp(userId, userLastestLoginIp, userLastestLoginTime);
		}
	}

	public long getUserIdFromCookie(HttpServletRequest request) {
		String cookie = CookieUtils.getUserCookieValue(request);
		if(StringUtils.isEmpty(cookie)) {
			return 0;
		}
		return Long.parseLong(cookie.split(";")[0]);
	}

	public CookieBean getCookieBeanFromCookie(HttpServletRequest request) {
		String cookie = CookieUtils.getUserCookieValue(request);
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
			String endTime, int isAdmin) {
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
		map.put("isadmin", isAdmin);
		return formatUser(userDao.getAllUser(map));
	}
	
	private List<User> formatUser(List<User> users) {
		JSONArray array = JSONArray.parseArray(redisObjectMapService.get(RedisKeyUtils.getAreas(), JSONObject.class).getString("areas"));
		List<SwfArea> areas = JsonUtils.decodeJson(array, SwfArea.class);
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
			user.getUserAccess().setUserCreateTime(DateUtils.dt14LongFormat(DateUtils.dt14FromStr(user.getUserAccess().getUserCreateTime())));
			list.add(user);
		}
		return list;
	}

	@Transactional
	public Integer insertUser(String userName, String password, String email, 
			 int isAdmin, int boardManager, String roleIds, HttpServletRequest request) {
		Lock lock = new ReentrantLock();
		int result = 0;
		if(lock.tryLock()) {
			try {
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
			} catch(Exception e) {
				logger.error("插入用户失败", e);
			} finally {
				lock.unlock();
			}
		} else {
			logger.error("插入用户超时");
		}
		return result;
	}

	@Override
	public User loginCheck(String userName, String password) {
		Lock lock = new ReentrantLock();
		User user = null;
		if(lock.tryLock()) {
			try {
				lock.lock();
				Map<String, Object> map = Maps.newHashMap();
				map.put("name", userName);
				map.put("password", password);
				user = userDao.loginCheck(map);
			} catch (Exception e) {
				logger.error("login fail", e);
			} finally {
				lock.unlock();
			}
		} else {
			logger.error("login timeout, name{}, password{}", userName, password);
		}
		if(user != null) {
			formatEmail(user);
		}
		return user == null ? null : user;
	}

	@Override
	public UserValue getUserValue(Long userId) {
		return userValueDao.getUserValue(userId);
	}

	@Override
	public User getUserById(long userId) {
		User user = userDao.getUserById(userId);
		return user == null ? null : formatUser(user);
	}
	
	public User getUserByIdToRedis(long userId) {
		return userDao.getUserById(userId);
	}
	
	private void formatEmail(User user) {
		String email = user.getUserAccess().getUserEmail();
		String first = email.split("@")[0];
		if(first.length() < 4) {
			first = first.substring(0, 1) + "****";
		} else {
			first = first.substring(0, 4) + "****";
		}
		email = first + "@" + email.split("@")[1];
		user.getUserAccess().setUserEmail(email);
	}
	
	private User formatUser(User user) {
		formatEmail(user);
		if(StringUtils.isNotBlank(user.getUserInfo().getUserProvince())
				&& StringUtils.isNotBlank(user.getUserInfo().getUserCity())) {
			JSONArray array = JSONArray.parseArray(redisObjectMapService.get(RedisKeyUtils.getAreas(), JSONObject.class).getString("areas"));
			List<SwfArea> areas = JsonUtils.decodeJson(array, SwfArea.class);
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
		return user == null ? null : formatUser(user);
	}

	@Override
	public CookieBean checkIsLogin(HttpServletRequest request) {
		synchronized (this) {
			CookieBean cookieBean = getCookieBeanFromCookie(request);
			if(cookieBean != null) {
				JSONObject object = redisObjectMapService.get(RedisKeyUtils.getUserInfo(cookieBean.getUser_id()), JSONObject.class);
				if(object != null) {
					return cookieBean;
				}
			}
		}
		return null;
	}

	@Transactional
	public Integer addSign(UserValue userValue, PastHistory pastHistory) {
		Lock lock = new ReentrantLock();
		if(lock.tryLock()) {
			try {
				lock.lock();
				if(userValueDao.updateUserValue(userValue) == BbsConstant.OK
						&& pastHistoryDao.insertPastHistory(pastHistory) == BbsConstant.OK) {
					return BbsConstant.OK;
				}
			} catch (Exception e) {
				logger.error("user sign error", e);
				return BbsConstant.ERROR;
			} finally {
				lock.unlock();
			}
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
		Lock lock = new ReentrantLock();
		if(lock.tryLock()) {
			try {
				lock.lock();
				return userValueDao.updateUserValue(userValue);
			} catch (Exception e) {
				logger.error("user update uservalue error", e);
			} finally {
				lock.unlock();
			}
		}
		return BbsConstant.ERROR;
	}

	@Override
	public User getUserByIdFromRedis(String uid) {
		long userId = NumberUtils.getAllNumber(uid);
		JSONObject object = redisObjectMapService.get(RedisKeyUtils.getUserInfo(userId), JSONObject.class);
		if(object != null) {
			return JsonUtils.decodeJson(object);
		}
		return null;
	}

	@Override
	public Integer mate(String name, String email) {
		Map<String, Object> map = Maps.newHashMap();
		map.put("name", name);
		map.put("email", email);
		return userDao.mate(map);
	}

	@Override
	public int insertUserForget(UserForget uf) {
		return forgetDao.insert(uf);
	}

	@Override
	public UserForget getForgetByName(String name) {
		synchronized (this) {
			return forgetDao.getByName(name);
		}
	}

	@Override
	public int resetPassword(long uid, String name, String password) {
		String type = uid == 0 ? "user_name" : "user_id";
		Map<String, Object> map = Maps.newHashMap();
		map.put("type", type);
		if("user_name".equals(type)) {
			map.put("value", name);
		} else {
			map.put("value", uid);
		}
		map.put("password", password);
		return userDao.resetPassword(map);
	}

	@Override
	public int addFavorite(long needId1, long needId2, String sign, String name, HttpServletRequest request) {
		Lock lock = new ReentrantLock();
		if(lock.tryLock()) {
			try {
				lock.lock();
				long userId = getUserIdFromCookie(request);
				Map<String, Object> map = Maps.newHashMap();
				map.put("userId", userId);
				map.put("needId1", needId1);
				map.put("needId2", needId2);
				if("board".equals(sign)) {
					map.put("sign", Favorite.BOARD.getCode());
				} else {
					map.put("sign", Favorite.TOPIC.getCode());
				}
				int result = favoriteDao.vaildFavorite(map);
				if(result == 0) {
					UserFavorite favorite = new UserFavorite();
					favorite.setUserId(userId);
					favorite.setNeedId1(needId1);
					favorite.setNeedId2(needId2);
					if("board".equals(sign)) {
						favorite.setFavSign(Favorite.BOARD.getCode());
					} else {
						favorite.setFavSign(Favorite.TOPIC.getCode());
					}
					favorite.setFavName(name);
					favorite.setCreateTime(DateUtils.dt14LongFormat(new Date()));
					favorite.setFavIp(GetRemoteIpUtil.getRemoteIp(request));
					if(favoriteDao.insert(favorite) == BbsConstant.OK) {
						if(favorite.getFavSign() == Favorite.BOARD.getCode()) {
							boardService.saveOrUpdateBoardInfo((int) favorite.getNeedId2(), BoardSign.FAVORITE, 1);
						} else {
							topicService.saveOrUpdateTopicData(favorite.getNeedId2(), TopicSign.FAVORITE, null, null, null, -1, null, null);
						}
						return BbsConstant.OK;
					} else {
						return BbsConstant.ERROR;
					}
				} else {
					return BbsErrorCode.FAVORITE_REPEAT;
				}
			} catch (Exception e) {
				logger.error("insert favorite fail", e);
				return BbsConstant.ERROR;				
			} finally {
				lock.unlock();
			}
		}
		return BbsConstant.ERROR;
	}

	@Override
	@Transactional
	public int cancelFavorite(String ids) {
		String favIds[] = ids.split(",");
		int result = 0;
		try{
			Map<String, Object> map = Maps.newConcurrentMap();
			map.put("favIds", favIds);
			if(favIds.length == favoriteDao.cancelFavorite(map)) {
				result = BbsConstant.OK;
			}
		} catch(Exception e) {
			logger.error("删除收藏失败", e);
		}
		return result;
	}

	@Override
	public int addFriend(long recUserId, String recName, HttpServletRequest request) {
		Lock lock = new ReentrantLock();
		if(lock.tryLock()) {
			try {
				lock.lock();
				long userId = getUserIdFromCookie(request);
				Map<String, Object> map = Maps.newHashMap();
				map.put("sendUserId", userId);
				map.put("recUserId", recUserId);
				int result = friendsDao.validFriend(map);
				if(result == 0) {
					CookieBean bean = getCookieBeanFromCookie(request);
					UserFriends friends = new UserFriends();
					friends.setSendUserId(userId);
					friends.setSendUserName(bean.getNick_name());
					friends.setSendTime(DateUtils.dt14LongFormat(new Date()));
					friends.setRecUserId(recUserId);
					friends.setRecUserName(recName);
					friends.setFriendStatus(BbsConstant.FRIEND_STATUS_DEFAULT);
					friends.setFriendIp(GetRemoteIpUtil.getRemoteIp(request));
					if(friendsDao.insert(friends) == BbsConstant.OK) {
						return BbsConstant.OK;
					} else {
						return BbsConstant.ERROR;
					}
				} else {
					return BbsErrorCode.FRIEND_REPEAT;
				}
			} catch (Exception e) {
				logger.error("add friend fail", e);
				return BbsConstant.ERROR;				
			} finally {
				lock.unlock();
			}
		}
		return BbsConstant.ERROR;
	}

	@Override
	@Transactional
	public int dealFriendStatus(String status, String... friendIds) {
		int isStatus = 0, fs = 0;
		Map<String, Object> map = Maps.newHashMap();
		if(status.equals("pass")) {
			fs = BbsConstant.FRIEND_STATUS_PASS;
			isStatus = BbsConstant.FRIEND_STATUS_DEFAULT;
		} else if(status.equals("refause")) {
			fs = BbsConstant.FRIEND_STATUS_REFAUSE;
			isStatus = BbsConstant.FRIEND_STATUS_DEFAULT;
		} else if(status.equals("delete")) {
			fs = BbsConstant.FRIEND_STATUS_DELETE;
			isStatus = BbsConstant.FRIEND_STATUS_PASS;
		} else {
			return BbsConstant.ERROR;
		}
		map.put("status", fs);
		map.put("isStatus", isStatus);
		map.put("friendIds", friendIds);
		map.put("update", new Date());
		synchronized (this) {
			if(BbsConstant.OK == friendsDao.dealFriendStatus(map)) {
				return BbsConstant.OK;
			}
		}
		return BbsConstant.ERROR;
	}

	@Override
	public List<UserFriends> getAllFriendsRequest(long user_id, Page page) {
		Map<String, Object> map = Maps.newHashMap();
		map.put("userId", user_id);
		map.put("page", page);
		List<UserFriends> friends = friendsDao.getAllFriendsRequest(map);
		for (UserFriends f : friends) {
			f.setImage(userDao.getUserImage(f.getSendUserId()));
			f.setSendTime(DateUtils.dt14LongFormat(DateUtils.dt14FromStr(f.getSendTime())));
		}
		return friends;
	}

	@Override
	public List<UserFriends> getFriendsList(long user_id, Page page) {
		Map<String, Object> map = Maps.newHashMap();
		map.put("userId", user_id);
		map.put("page", page);
		List<UserFriends> friends = friendsDao.getFriendsList(map);
		for (UserFriends f : friends) {
			long imgUserId = f.getRecUserId() == user_id ? f.getSendUserId() : f.getRecUserId();
			f.setImage(userDao.getUserImage(imgUserId));
		}
		return friends;
	}

	@Override
	public List<UserFavorite> getAllFavorites(long user_id, Page page, int type) {
		Map<String, Object> map = Maps.newHashMap();
		map.put("userId", user_id);
		map.put("page", page);
		map.put("type", type);
		return favoriteDao.getAllFavorites(map);
	}

	@Override
	public List<Integer> getAllBoardManageId(long user_id) {
		return userDao.getAllBoardManageId(user_id);
	}

	@Override
	public int updateUserPrivacy(int ispublic, int isaddfriend,
			int ispublicfriend, int ispublictopic, int ispublicreply, HttpServletRequest request) {
		int result = 0;
		UserPrivacy privacy = new UserPrivacy();
		try {
			synchronized (privacy) {
				privacy.setBaseIsPublic(ispublic);
				privacy.setIsAddFriend(isaddfriend);
				privacy.setFriendIsPublic(ispublicfriend);
				privacy.setReplyIsPublic(ispublicreply);
				privacy.setTopicIsPublic(ispublictopic);
				privacy.setUserId(getUserIdFromCookie(request));
				result = userDao.updateUserPrivacy(privacy);
				if(result == BbsConstant.OK) {
					updateUserToRedis(request, null, privacy);
				}
			}
		} catch (Exception e) {
			logger.error("update user privacy fail",  e);
		}
		return result;
	}

	@Override
	public void updateUserToRedis(HttpServletRequest request, String mail, UserPrivacy privacy) {
		long uid = getUserIdFromCookie(request);
		User user = getUserByIdFromRedis(Long.toString(uid));
		if(StringUtils.isNotBlank(mail)) {
			user.getUserAccess().setUserEmail(mail);
			formatEmail(user);
		} else if (privacy != null) {
			user.setUserPrivacy(privacy);
		}
		JSONObject object = new JSONObject(true);
		object.put("user", JSON.toJSONString(user));
		redisObjectMapService.save(RedisKeyUtils.getUserInfo(user.getUserAccess().getUserId()), object, JSONObject.class);
	}

	@Override
	public int vaildEmail(String omail, HttpServletRequest request) {
		int result = 0;
		try {
			long uid = getUserIdFromCookie(request);
			Map<String, Object> map = Maps.newConcurrentMap();
			map.put("uid", uid);
			map.put("email", omail);
			result = userDao.vaildEmail(map);
		} catch (Exception e) {
			logger.error("vaild email fail");
		}
		return result;
	}

	@Override
	public int updateUserEmail(String nmail, HttpServletRequest request) {
		long uid = getUserIdFromCookie(request);
		return userDao.updateUserEmail(nmail, uid);
	}

	@Override
	public int vaildPassword(HttpServletRequest request, String opwd) {
		int result = 0;
		try {
			long uid = getUserIdFromCookie(request);
			Map<String, Object> map = Maps.newConcurrentMap();
			map.put("uid", uid);
			map.put("password", opwd);
			result = userDao.vaildPassword(map);
		} catch (Exception e) {
			logger.error("vaild pwd fail");
		}
		return result;
	}

	@Override
	public int updatePassword(String npwd, HttpServletRequest request) {
		long uid = getUserIdFromCookie(request);
		return userDao.updatePassword(npwd, uid);
	}

	@Override
	public String getNicknameFromCookie(HttpServletRequest request) {
		return getCookieBeanFromCookie(request).getNick_name();
	}

	@Override
	public List<PastHistory> getAllUserSigns(Page page, long userId) {
		Map<String, Object> map = Maps.newHashMap();
		if(page != null) {
			map.put("page", page);
		}
		if(userId != 0) {
			map.put("uid", userId);
		}
		List<PastHistory> histories = pastHistoryDao.getAllHistory(map);
		for (PastHistory ph : histories) {
			ph.setPastTime(DateUtils.dt14LongFormat(DateUtils.dt14FromStr(ph.getPastTime())));
			UserValue value = userValueDao.getUserValue(ph.getUserId());
			ph.setTotalSign(value.getUserPastCount());
			ph.setSerialSign(value.getUserPastSerialCount());
		}
		return histories;
	}

	@Override
	public List<PastHistory> getUserSignsByUid(Page page, String startTime, String endTime, long uid) {
		Map<String, Object> map = Maps.newHashMap();
		map.put("page", page);
		if(StringUtils.isNotBlank(startTime)) {
			map.put("starttime", startTime);
		}
		if(StringUtils.isNotBlank(endTime)) {
			map.put("endtime", endTime);
		}
		map.put("uid", uid);
		List<PastHistory> histories = pastHistoryDao.getUserSignsByUid(map);
		for (PastHistory ph : histories) {
			ph.setPastTime(DateUtils.dt14LongFormat(DateUtils.dt14FromStr(ph.getPastTime())));
		}
		return histories;
	}

	@Override
	public List<User> getAllNotTalkUser(Page page, long uid, String nickname) {
		Map<String, Object> map = Maps.newHashMap();
		map.put("page", nickname);
		if(uid != 0) {
			map.put("uid", uid);
		}
		if(StringUtils.isNotBlank(nickname)) {
			map.put("nickname", nickname);
		}
		List<User> users = userDao.getAllNotTalkUser(map);
		for (User user : users) {
			user.getUserAccess().setUserCreateTime(DateUtils.dt14LongFormat(DateUtils.dt14FromStr(user.getUserAccess().getUserCreateTime())));
		}
		return users;
	}

	@Override
	@BmcLogAnno(modules = "禁言用户")
	@SysLog(module = "系统管理", methods = "用户管理-禁言")
	@Transactional
	public int speak(String ids, int speak, String sign) {
		String[] userIds = ids.split(",");
		try {
			Map<String, Object> map = Maps.newHashMap();
			map.put("userIds", userIds);
			map.put("speak", speak);
			userDao.speak(map);
			for (int i = 0; i < userIds.length; i++) {
				if (FormValidate.number(userIds[i])) {
					User user = getUserByIdFromRedis(userIds[i]);
					if (user != null) {
						refreshUser(Long.parseLong(userIds[i]));
					}
				}
			}
			return BbsConstant.OK;
		} catch (Exception e) {
			logger.error("user speak fail", e);
		}
		return BbsConstant.ERROR;
	}
	
	public void refreshUser(long uid) {
		User user = getUserByIdToRedis(uid);
		if (user != null) {
			JSONObject object = new JSONObject(true);
			object.put("user", JSON.toJSONString(user));
			redisObjectMapService.save(RedisKeyUtils.getUserInfo(user.getUserAccess().getUserId()), object, JSONObject.class);
		}
	}

}

package cn.ifxcode.bbs.admin.controller;

import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ltang.redis.service.RedisObjectMapService;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;

import cn.ifxcode.bbs.bean.CookieBean;
import cn.ifxcode.bbs.bean.Result;
import cn.ifxcode.bbs.constant.BbsConstant;
import cn.ifxcode.bbs.constant.BbsErrorCode;
import cn.ifxcode.bbs.entity.ExperienceHistory;
import cn.ifxcode.bbs.entity.GoldHistory;
import cn.ifxcode.bbs.entity.LoginLog;
import cn.ifxcode.bbs.entity.User;
import cn.ifxcode.bbs.entity.UserValue;
import cn.ifxcode.bbs.enumtype.EGHistory;
import cn.ifxcode.bbs.enumtype.LoginError;
import cn.ifxcode.bbs.service.GoldExperienceService;
import cn.ifxcode.bbs.service.LoginLogService;
import cn.ifxcode.bbs.service.UserService;
import cn.ifxcode.bbs.utils.DateUtils;
import cn.ifxcode.bbs.utils.JsonUtils;
import cn.ifxcode.bbs.utils.RedisKeyUtils;
import cn.ifxcode.bbs.utils.RoleIdUtils;
import cn.ifxcode.bbs.utils.Base64Utils;
import cn.ifxcode.bbs.utils.CookieUtils;
import cn.ifxcode.bbs.utils.GetRemoteIpUtil;
import cn.ifxcode.bbs.utils.UserValueUtils;

@Controller
@RequestMapping("/system/admin/account")
public class LoginController {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	private boolean isTodayFirst = false;
	
	private Result result = null;
	
	@Resource
	private UserService userService;
	
	@Resource
	private RedisObjectMapService redisObjectMapService;
	
	@Resource
	private LoginLogService loginLogService;
	
	@Resource
	private GoldExperienceService goldExperienceService;
	
	private GoldHistory goldHistory = null;
	private ExperienceHistory experienceHistory = null;
	private UserValue userValue = null;
	
	@RequestMapping("/login")
	public String goLogin(HttpServletRequest request) {
		CookieBean cookieBean = userService.getCookieBeanFromCookie(request);
		if(cookieBean != null) {
			JSONObject object = redisObjectMapService.get(RedisKeyUtils.getUserInfo(cookieBean.getUser_id()), JSONObject.class);
			User user = JsonUtils.decodeJson(object);
			logger.info(GetRemoteIpUtil.getRemoteIp(request) + " on admin login page");
			if(cookieBean.getIs_admin() == BbsConstant.IS_ADMIN && user != null 
					&& user.getUserAccess().getUserIsAdmin() == BbsConstant.IS_ADMIN) {
				return "redirect:/system/admin/index";
			}
		}
		return "admin/account/login";
	}
	
	@ResponseBody
	@RequestMapping(value = "/dologin", method = RequestMethod.POST)
	public Result doLogin(String name, String password,
			@RequestParam(value = "remember", defaultValue = "0")int remember,
			HttpServletRequest request, HttpServletResponse response) {
		User user = null;
		if(StringUtils.isNotBlank(name) && StringUtils.isNotBlank(password) && remember != -1) {
			user = userService.authLogin(name, password);
			if(user != null) {
				if(remember == BbsConstant.REMEMBER_TRUE) {
					response.addCookie(CookieUtils.makeCookie(BbsConstant.REMEMBER, Base64Utils.getBase64(Integer.toString(BbsConstant.REMEMBER_TRUE)), 
							BbsConstant.DOMAIN, BbsConstant.REMEMBER_MAXAGE));
					JSONObject object = new JSONObject();
					object.put("expireTime", DateUtils.dt14LongFormat(DateUtils.getSevenDaysAfterDate(new Date())));
					redisObjectMapService.save(RedisKeyUtils.getRemember(user.getUserAccess().getUserId()), object, JSONObject.class);
				}
				CookieBean cookieBean = new CookieBean(user.getUserAccess().getUserId(), user.getUserAccess().getUserIsAdmin(), 
						RoleIdUtils.formatRoleIds(user.getRoles()), user.getUserAccess().getUserNickname());
				response.addCookie(CookieUtils.makeUserCookie(Base64Utils.getBase64(cookieBean.toString()), remember));
				result = new Result(BbsConstant.OK, null, BbsConstant.AUTH_HOME);
				if(!StringUtils.isNotBlank(user.getUserAccess().getUserLastestLoginTime()) || userService.isTodayFirstLogin(user.getUserAccess().getUserLastestLoginTime())) {
					UserValue userValue = UserValueUtils.login(userService.getUserValue(user.getUserAccess().getUserId()));
					userService.updateUserValue(userValue);
					isTodayFirst = true;
				}
				user.getUserAccess().setUserLastestLoginIp(GetRemoteIpUtil.getRemoteIp(request));
				user.getUserAccess().setUserLastestLoginTime(DateUtils.dt14LongFormat(new Date()));
				userService.updateUserLastestTimeAndIp(user.getUserAccess().getUserId(), 
						user.getUserAccess().getUserLastestLoginIp(), user.getUserAccess().getUserLastestLoginTime());
				if(isTodayFirst) {
					if(userValue.isGoldChange()) {
						goldHistory = new GoldHistory(cookieBean.getUser_id(), cookieBean.getNick_name(), 1, EGHistory.LOGIN.getFrom(), 
								EGHistory.LOGIN.getDesc(), user.getUserAccess().getUserLastestLoginTime());
					}
					if(userValue.isExpChange()) {
						experienceHistory = new ExperienceHistory(cookieBean.getUser_id(), cookieBean.getNick_name(), 1, 
								EGHistory.LOGIN.getDesc(), user.getUserAccess().getUserLastestLoginTime());
					}
					goldExperienceService.insertGE(goldHistory, experienceHistory);
				}
				JSONObject object = new JSONObject(true);
				object.put("user", JSON.toJSONString(user));
				redisObjectMapService.save(RedisKeyUtils.getUserInfo(user.getUserAccess().getUserId()), object, JSONObject.class);
				LoginLog loginLog = new LoginLog(user.getUserAccess().getUserName(), BbsConstant.ADMIN_LOGIN, 
						BbsConstant.OK, DateUtils.dt14LongFormat(new Date()), GetRemoteIpUtil.getRemoteIp(request));
				loginLogService.insertLog(loginLog);
				logger.info(name + " login successful, from ip " + GetRemoteIpUtil.getRemoteIp(request));
			} else {
				result = new Result(BbsErrorCode.PASSWORD_ERROR, BbsErrorCode.getDescribe(BbsErrorCode.PASSWORD_ERROR));
				LoginLog loginLog = new LoginLog(name, BbsConstant.ADMIN_LOGIN, BbsConstant.ERROR, LoginError.PASSWORD_ERROR.getCode(), 
						DateUtils.dt14LongFormat(new Date()), GetRemoteIpUtil.getRemoteIp(request));
				loginLogService.insertLog(loginLog);
				logger.info(name + BbsErrorCode.getDescribe(BbsErrorCode.PASSWORD_ERROR) + ", from ip " + GetRemoteIpUtil.getRemoteIp(request));
			}
		} else {
			result = new Result(BbsErrorCode.FORM_NULL, BbsErrorCode.getDescribe(BbsErrorCode.FORM_NULL));
			logger.info("unknown " + BbsErrorCode.getDescribe(BbsErrorCode.FORM_NULL) + ", from ip " + GetRemoteIpUtil.getRemoteIp(request));
		}
		return result;
	}
}

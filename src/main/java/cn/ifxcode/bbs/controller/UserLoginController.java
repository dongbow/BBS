package cn.ifxcode.bbs.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ltang.redis.service.RedisObjectMapService;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
import cn.ifxcode.bbs.utils.Base64Utils;
import cn.ifxcode.bbs.utils.CookieUtils;
import cn.ifxcode.bbs.utils.DateUtils;
import cn.ifxcode.bbs.utils.GetRemoteIpUtil;
import cn.ifxcode.bbs.utils.JsonUtils;
import cn.ifxcode.bbs.utils.MD5Utils;
import cn.ifxcode.bbs.utils.RedisKeyUtils;
import cn.ifxcode.bbs.utils.RoleIdUtils;
import cn.ifxcode.bbs.utils.SystemConfigUtils;
import cn.ifxcode.bbs.utils.UserValueUtils;
import cn.ifxcode.bbs.utils.ValidateCode;

@Controller
@RequestMapping("/account")
public class UserLoginController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	private boolean isTodayFirst = false;
	
	private Result result = null;
	
	@Resource
	private UserService userService;
	
	@Resource
	private RedisObjectMapService redisObjectMapService;
	
	@Resource
	private GoldExperienceService goldExperienceService;
	
	@Resource
	private LoginLogService loginLogService;
	
	private GoldHistory goldHistory = null;
	private ExperienceHistory experienceHistory = null;
	private UserValue userValue = null;
	
	@RequestMapping("/login")
	public String toLogin(HttpServletRequest request) {
		CookieBean cookieBean = userService.getCookieBeanFromCookie(request);
		if(cookieBean != null) {
			JSONObject object = redisObjectMapService.get(RedisKeyUtils.getUserInfo(cookieBean.getUser_id()), JSONObject.class);
			User user = JsonUtils.decodeJson(object);
			logger.info(GetRemoteIpUtil.getRemoteIp(request) + " on login page");
			if(user != null) {
				return "redirect:/index";
			}
		}
		return "account/login";
	}
	
	@RequestMapping(value = "/dologin")
	public String doLogin(String userName, String password,
			@RequestParam(value="remember", required = false, defaultValue = "0")int remember, 
			@RequestParam(value="backurl", required = false, defaultValue = "/index")String backurl, 
			HttpServletRequest request, HttpServletResponse response, Model model) {
		User user = null;
		if(StringUtils.isNotBlank(userName) && StringUtils.isNotBlank(password) && remember != -1) {
			user = userService.loginCheck(userName, MD5Utils.getMD5String(password));
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
				if(!StringUtils.isNotBlank(user.getUserAccess().getUserLastestLoginTime()) || userService.isTodayFirstLogin(user.getUserAccess().getUserLastestLoginTime())) {
					userValue = UserValueUtils.login(userService.getUserValue(user.getUserAccess().getUserId()));
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
				LoginLog loginLog = new LoginLog(user.getUserAccess().getUserName(), BbsConstant.SIMPLE_LOGIN, 
						BbsConstant.OK, DateUtils.dt14LongFormat(new Date()), GetRemoteIpUtil.getRemoteIp(request));
				loginLogService.insertLog(loginLog);
				if(!StringUtils.equals(backurl, "/index")) {
					backurl = this.decode(backurl);
				}
				backurl = "redirect:" + backurl;
			} else {
				LoginLog loginLog = new LoginLog(userName, BbsConstant.SIMPLE_LOGIN, BbsConstant.ERROR, LoginError.PASSWORD_ERROR.getCode(), 
						DateUtils.dt14LongFormat(new Date()), GetRemoteIpUtil.getRemoteIp(request));
				loginLogService.insertLog(loginLog);
				model.addAttribute("error", BbsErrorCode.getDescribe(BbsErrorCode.PASSWORD_ERROR));
				backurl = "forward:" + BbsConstant.SIMPLE_LOGIN;
			}
		} else {
			model.addAttribute("error", BbsErrorCode.getDescribe(BbsErrorCode.FORM_NULL));
			backurl = "forward:" + BbsConstant.SIMPLE_LOGIN;
		}
		return backurl;
	}
	
	@RequestMapping("/register")
	public String toRegister() {
		if(!SystemConfigUtils.getIsAllowRegister()) {
			return "account/register-stop";
		}
		return "account/register";
	}
	
	@RequestMapping(value = "/register/do", method = RequestMethod.POST)
	public String doRegister(String userName, String password, String email, 
			@RequestParam(value = "validatecode", required = false, defaultValue = "0")String validatecode, 
			@RequestParam(value = "isAdmin", required = false, defaultValue = "0")int isAdmin, 
			@RequestParam(value = "boardManager", required = false, defaultValue = "0")int boardManager, 
			@RequestParam(value = "roleIds", required = false, defaultValue = "4")String roleIds, 
			HttpServletRequest request) {
		String href = null;
		if("0".equals(validatecode)) {
			return "redirect:/account/register";
		}
		if(userService.valueCheck("name", userName) == 0
				&& userService.valueCheck("email", email) == 0
				&& StringUtils.equals(validatecode.toLowerCase(), 
						ValidateCode.getValidateCode(request).toLowerCase())) {
			if (userService.insertUser(userName, password, email, isAdmin, boardManager, roleIds, request) == BbsConstant.OK) {
				href = "redirect:/account/login";
			}
		} else {
			request.setAttribute("fail", "注册失败");
			href = "forward:/account/register";
		}
		return href;
	}
	
	@RequestMapping("/forget")
	public String toForget() {
		return "account/forget";
	}
	
	@RequestMapping("/logout")
	public String logout(@RequestParam(value = "from", required = false)String from,
			@RequestParam(value = "backurl", required = false, defaultValue = "/index")String backurl,
			HttpServletRequest request, HttpServletResponse response) {
		long id = userService.getUserIdFromCookie(request);
		response.addCookie(CookieUtils.makeCookieExpire(CookieUtils.CRED_LOCAL_SESS, 
				null, BbsConstant.DOMAIN));
		response.addCookie(CookieUtils.makeCookieExpire(BbsConstant.REMEMBER, 
				null, BbsConstant.DOMAIN));
		redisObjectMapService.delete(RedisKeyUtils.getUserInfo(id));
		redisObjectMapService.delete(RedisKeyUtils.getRemember(id));
		if(BbsConstant.SYSTEM.equals(from)) {
			return "redirect:" + BbsConstant.ADMIN_LOGIN;
		}
		return "redirect:" + backurl;
	}
	
	private String decode(String backurl) {
		try {
			backurl = URLDecoder.decode(backurl, BbsConstant.UTF8).split("/bbs")[1];
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return backurl;
	}
}

package cn.ifxcode.bbs.admin.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.ifxcode.bbs.bean.CookieBean;
import cn.ifxcode.bbs.bean.Result;
import cn.ifxcode.bbs.constant.BbsConstant;
import cn.ifxcode.bbs.constant.BbsErrorCode;
import cn.ifxcode.bbs.entity.User;
import cn.ifxcode.bbs.entity.UserAccess;
import cn.ifxcode.bbs.service.UserService;
import cn.ifxcode.bbs.utils.ArrayUtils;
import cn.ifxcode.bbs.utils.Base64Utils;
import cn.ifxcode.bbs.utils.CookieUtils;
import cn.ifxcode.bbs.utils.GetRemoteIpUtil;

@Controller
@RequestMapping("/system/admin/account")
public class LoginController {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	private Result result = null;
	
	@Resource
	private UserService userService;
	
	@RequestMapping("/login")
	public String goLogin(HttpServletRequest request) {
		logger.info(GetRemoteIpUtil.getRemoteIp(request) + " coming admin login");
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
				}
				CookieBean cookieBean = new CookieBean(user.getUserAccess().getUserId(), user.getUserAccess().getUserIsAdmin(), 
						ArrayUtils.getRoleIds(user.getRoles()), user.getUserAccess().getUserNickname());
				response.addCookie(CookieUtils.makeUserCookie(Base64Utils.getBase64(cookieBean.toString())));
				result = new Result(BbsConstant.OK, null, BbsConstant.AUTH_HOME);
				//TODO login error log
				logger.info(name + " login successful, from ip " + GetRemoteIpUtil.getRemoteIp(request));
			} else {
				result = new Result(BbsErrorCode.PASSWORD_ERROR, BbsErrorCode.getDescribe(BbsErrorCode.PASSWORD_ERROR));
				//TODO login error log
				logger.info(name + BbsErrorCode.getDescribe(BbsErrorCode.PASSWORD_ERROR) + ", from ip " + GetRemoteIpUtil.getRemoteIp(request));
			}
		} else {
			//TODO login error log
			result = new Result(BbsErrorCode.FORM_NULL, BbsErrorCode.getDescribe(BbsErrorCode.FORM_NULL));
			logger.info("unknown " + BbsErrorCode.getDescribe(BbsErrorCode.FORM_NULL) + ", from ip " + GetRemoteIpUtil.getRemoteIp(request));
		}
		return result;
	}
}

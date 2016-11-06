package cn.ifxcode.bbs.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import ltang.redis.service.RedisObjectMapService;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.ifxcode.bbs.bean.Result;
import cn.ifxcode.bbs.constant.BbsConstant;
import cn.ifxcode.bbs.constant.BbsErrorCode;
import cn.ifxcode.bbs.service.UserService;
import cn.ifxcode.bbs.utils.MD5Utils;
import cn.ifxcode.bbs.utils.ValidateCode;

@Controller
@RequestMapping("/account")
public class AccountController {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Resource
	private UserService userService;
	
	@Resource
	private RedisObjectMapService redisObjectMapService;
	
	private Result result = null;
	
	@ResponseBody
	@RequestMapping(value = "/{type}_exists", method = RequestMethod.POST)
	public Result valueExists(@PathVariable("type")String type, String text ) {
		if(userService.valueCheck(type, text) < BbsConstant.OK) {
			if("name".equals(type)) {
				result = new Result(BbsErrorCode.USERNAME_NOT_EXISTS, BbsErrorCode.getDescribe(BbsErrorCode.USERNAME_NOT_EXISTS)); 
			} else {
				result = new Result(BbsErrorCode.EMAIL_NOT_EXISTS, BbsErrorCode.getDescribe(BbsErrorCode.EMAIL_NOT_EXISTS)); 
			}
			logger.info(text + "is already exists");
		}
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value = "/mate", method = RequestMethod.POST)
	public Result mate(String email, String name) {
		if(userService.mate(name, email) != BbsConstant.OK) {
			result = new Result(BbsErrorCode.NOT_MATE, BbsErrorCode.getDescribe(BbsErrorCode.NOT_MATE));
		}
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value = "/validatecode", method = RequestMethod.POST)
	public Result codeValidate(String validatecode, HttpServletRequest request) {
		if(!StringUtils.equals(validatecode.toLowerCase(), 
				ValidateCode.getValidateCode(request).toLowerCase())) {
			result = new Result(BbsErrorCode.VALIDATE_CODE_ERROR, BbsErrorCode.getDescribe(BbsErrorCode.VALIDATE_CODE_ERROR));
		}
		return result;
	}
	
	@RequestMapping(value = "/resetpwd", method = RequestMethod.POST)
	public String resetPwd(@RequestParam(required = false, defaultValue = "0")long uid, 
			@RequestParam(required = false)String name, String password, String repassword) {
		if(uid == 0 && StringUtils.isEmpty(name)) {
			return "redirect:/index";
		}
		if(this.validPwd(password, repassword)) {
			userService.resetPassword(uid, name, MD5Utils.getMD5String(password));
			return "redirect:/account/logout?from=forget";
		}
		return "redirect:/index";
	}
	
	private boolean validPwd(String pwd, String repwd) {
		if(StringUtils.isNotBlank(pwd) && StringUtils.isNotBlank(repwd)
				&& StringUtils.equals(pwd, repwd)) {
			if(pwd.length() >= 6 && repwd.length() >= 6 
					&& pwd.length() <= 16 && repwd.length() <= 16) {
				return true;
			}
		}
		return false;
	}
	
}

package cn.ifxcode.bbs.controller;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.ifxcode.bbs.bean.Result;
import cn.ifxcode.bbs.constant.BbsConstant;
import cn.ifxcode.bbs.constant.BbsErrorCode;
import cn.ifxcode.bbs.service.UserService;

@Controller
@RequestMapping("/account")
public class AccountController {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Resource
	private UserService userService;
	
	private Result result = null;
	
	@ResponseBody
	@RequestMapping(value = "/{type}_exists", method = RequestMethod.POST)
	public Result valueExists(@PathVariable("type")String type, String text ) {
		if(userService.valueCheck(type, text) < BbsConstant.OK) {
			result = new Result(BbsErrorCode.USERNAME_NOT_EXISTS, BbsErrorCode.getDescribe(BbsErrorCode.USERNAME_NOT_EXISTS)); 
			logger.info(text + BbsErrorCode.getDescribe(BbsErrorCode.USERNAME_NOT_EXISTS));
		}
		return result;
	}
	
}

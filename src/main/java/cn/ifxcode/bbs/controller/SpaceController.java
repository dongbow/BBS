package cn.ifxcode.bbs.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import ltang.redis.service.RedisObjectMapService;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSONObject;

import cn.ifxcode.bbs.bean.CookieBean;
import cn.ifxcode.bbs.constant.BbsConstant;
import cn.ifxcode.bbs.entity.User;
import cn.ifxcode.bbs.entity.UserValue;
import cn.ifxcode.bbs.service.UserService;
import cn.ifxcode.bbs.utils.NumberUtils;
import cn.ifxcode.bbs.utils.RedisKeyUtils;

@Controller
@RequestMapping("/space")
public class SpaceController extends BaseUserController {

	@Resource
	private UserService userService;
	
	@Resource
	private RedisObjectMapService redisObjectMapService;
	
	@RequestMapping("/uid/{uid}")
	public String toSpace(@PathVariable("uid")String uid, HttpServletRequest request, 
			Model model) {
		if(!StringUtils.isNotBlank(uid)) {
			return "redirect:" + BbsConstant.DOMAIN;
		}
		long userId = NumberUtils.getAllNumber(uid);
		CookieBean cookieBean = userService.getCookieBeanFromCookie(request);
		JSONObject object = null;
		if(cookieBean != null) {
			object = redisObjectMapService.get(RedisKeyUtils.getUserInfo(cookieBean.getUser_id()), JSONObject.class);
		}
		User user = userService.getUserById(userId);
		if(user == null) {
			return "redirect:/index";
		}
		UserValue userValue = userService.getUserValue(userId);
		model.addAttribute("userinfo", user);
		model.addAttribute("uservalue", userValue);
		if(object == null) {
			model.addAttribute("islogin", 0);
		} else {
			model.addAttribute("islogin", 1);
		}
		return "space/space-uid";
	}
	
	@RequestMapping("/nickname/{nickname}")
	public String toSpaceByNickname(@PathVariable("nickname")String nickname, HttpServletRequest request, 
			Model model) {
		CookieBean cookieBean = userService.getCookieBeanFromCookie(request);
		JSONObject object = null;
		if(cookieBean != null) {
			object = redisObjectMapService.get(RedisKeyUtils.getUserInfo(cookieBean.getUser_id()), JSONObject.class);
		}
		User user = userService.getUserByUserNickname(nickname);
		if(user == null) {
			return "redirect:/index";
		}
		UserValue userValue = userService.getUserValue(user.getUserAccess().getUserId());
		model.addAttribute("userinfo", user);
		model.addAttribute("uservalue", userValue);
		if(object == null) {
			model.addAttribute("islogin", 0);
		} else {
			model.addAttribute("islogin", 1);
		}
		return "space/space-uid";
	}
	
}

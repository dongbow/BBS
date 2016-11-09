package cn.ifxcode.bbs.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import ltang.redis.service.RedisObjectMapService;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.google.common.collect.Lists;

import cn.ifxcode.bbs.bean.CookieBean;
import cn.ifxcode.bbs.constant.BbsConstant;
import cn.ifxcode.bbs.entity.SwfArea;
import cn.ifxcode.bbs.entity.User;
import cn.ifxcode.bbs.service.GeneralService;
import cn.ifxcode.bbs.service.UserService;
import cn.ifxcode.bbs.utils.JsonUtils;
import cn.ifxcode.bbs.utils.NumberUtils;
import cn.ifxcode.bbs.utils.RedisKeyUtils;

@Controller
@RequestMapping("/home")
public class SettingController extends BaseUserController{

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Resource
	private UserService userService;
	
	@Resource
	private GeneralService generalService;
	
	@Resource
	private RedisObjectMapService redisObjectMapService;
	
	@RequestMapping("/setting/profile")
	public String profile(@RequestParam(required = false)String type, Model model, 
			HttpServletRequest request) {
		CookieBean bean = userService.getCookieBeanFromCookie(request);
		User user = userService.getUserByIdFromRedis(Long.toString(bean.getUser_id()));
		if(StringUtils.isEmpty(type) || "info".equals(type)) {
			List<SwfArea> provinces = generalService.getAllProvinces();;
			List<SwfArea> citys = null;
			if(user != null) {
				if(StringUtils.isNotBlank(user.getUserInfo().getUserCity())) {
					citys = generalService.getCitys(user.getUserInfo().getUserProvince());
					model.addAttribute("citys", citys);
				}
			}
			model.addAttribute("provinces", provinces);
			model.addAttribute("huser", user);
			model.addAttribute("type", "info");
		} else if("headimg".equals(type)) {
			model.addAttribute("type", "headimg");
		} else if("password".equals(type)) {
			model.addAttribute("type", "password");
		} else if("email".equals(type)) {
			model.addAttribute("type", "email");
		} else if("privacy".equals(type)) {
			model.addAttribute("type", "privacy");
		} else {
			return "redirect:/index";
		}
		return "home/setting-profile";
	}

	@RequestMapping("/setting/credit")
	public String credit() {
		return "home/setting-credit";
	}
	
	@RequestMapping("/setting/usergroup")
	public String userGroup() {
		return "home/setting-usergroup";
	}
	
	@ResponseBody
	@RequestMapping("/get/citys/{pid}")
	public List<SwfArea> getCitys(@PathVariable("pid")String pid) {
		List<SwfArea> citys = generalService.getCitys(pid);
		return citys;
	}
	
}

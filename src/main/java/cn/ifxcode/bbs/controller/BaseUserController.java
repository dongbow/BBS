package cn.ifxcode.bbs.controller;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import ltang.redis.service.RedisObjectMapService;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

import cn.ifxcode.bbs.bean.CookieBean;
import cn.ifxcode.bbs.entity.Navigation;
import cn.ifxcode.bbs.entity.User;
import cn.ifxcode.bbs.entity.UserValue;
import cn.ifxcode.bbs.service.FriendLinkService;
import cn.ifxcode.bbs.service.NavigationService;
import cn.ifxcode.bbs.service.QuickNavigationService;
import cn.ifxcode.bbs.service.UserService;
import cn.ifxcode.bbs.utils.DateUtils;
import cn.ifxcode.bbs.utils.JsonUtils;
import cn.ifxcode.bbs.utils.RedisKeyUtils;

@Controller
public class BaseUserController {

	@Resource
	private UserService userService;
	
	@Resource
	private NavigationService navigationService;
	
	@Resource
	private QuickNavigationService quickNavigationService;
	
	@Resource
	private FriendLinkService friendLinkService;
	
	@Resource
	private RedisObjectMapService redisObjectMapService;
	
	@ModelAttribute
	public void getAllNavigations(Model model) {
		JSONObject object = redisObjectMapService.get(RedisKeyUtils.getNavigations(), JSONObject.class);
		JSONArray array = JSONArray.parseArray(object.getString("navigations"));
		List<Navigation> navigations = JsonUtils.decodeJson(array, Navigation.class);
		model.addAttribute("navigations", navigations);
	}
	
	@ModelAttribute
	public void getUserInfo(HttpServletRequest request, Model model) {
		CookieBean cookieBean = userService.getCookieBeanFromCookie(request);
		if(cookieBean != null) {
			JSONObject object = redisObjectMapService.get(RedisKeyUtils.getUserInfo(cookieBean.getUser_id()), JSONObject.class);
			if(object != null) {
				User user = JsonUtils.decodeJson(object);
				model.addAttribute("user", user);
				UserValue userValue = userService.getUserValue(user.getUserAccess().getUserId());
				model.addAttribute("userValue", userValue);
				if(StringUtils.isNotBlank(userValue.getUserLastestPastTime())
						&& DateUtils.getDateDifferenceBegin(userValue.getUserLastestPastTime(), DateUtils.dt14LongFormat(new Date())) == 0) {
					model.addAttribute("already", 1);
				} else {
					model.addAttribute("already", 0);
				}
			}
		}
	}
	
	@ModelAttribute
	public void getQuickNavigations(Model model) {
		model.addAttribute("quickNavigations", quickNavigationService.getAllQuickNavigations());
	}
	
	@ModelAttribute
	public void getFriendLinks(Model model) {
		model.addAttribute("links", friendLinkService.getAllFriendLinks());
	}
}

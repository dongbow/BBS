package cn.ifxcode.bbs.admin.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import ltang.redis.service.RedisObjectMapService;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

import cn.ifxcode.bbs.bean.Page;
import cn.ifxcode.bbs.entity.Role;
import cn.ifxcode.bbs.service.UserService;
import cn.ifxcode.bbs.utils.JsonUtils;
import cn.ifxcode.bbs.utils.RedisKeyUtils;

@Controller
@RequestMapping("/system/admin/sysmanage")
public class SystemManageController extends BaseController{

	private static final Integer DEFAULT_PAGE_SIZE = 10;
	
	@Resource
	private UserService userService;
	
	@Resource
	private RedisObjectMapService redisObjectMapService;
	
	@RequestMapping("/user")
	public String toUserList(
			@RequestParam(value="p", required = false, defaultValue = "1")int p,
			HttpServletRequest request, Model model) {
		Page page = Page.newBuilder(p, DEFAULT_PAGE_SIZE, request.getRequestURI());
		model.addAttribute("users", userService.getAllUser(page, 0, null, null, -1, -1, -1, null, null));
		model.addAttribute("page", page);
		return "admin/sysmanage/user-list";
	}
	
	@RequestMapping("/user/search")
	public String searchUserList(
			@RequestParam(value="p", required = false, defaultValue = "1")int p,
			long userId, String username, String nickname, int sex, int role, 
			int status, String startTime, String endTime,
			HttpServletRequest request, Model model) {
		Page page = Page.newBuilder(p, DEFAULT_PAGE_SIZE, request.getRequestURI());
		model.addAttribute("users", userService.getAllUser(page, userId, username, nickname, sex, role, status, startTime, endTime));
		model.addAttribute("page", page);
		return "admin/sysmanage/user-list";
	}
	
	@RequestMapping("/role")
	public String toRoleList(Model model) {
		JSONObject object = redisObjectMapService.get(RedisKeyUtils.getRoles(), JSONObject.class);
		List<Role> roles = JsonUtils.decodeRoleByJson(JSONArray.parseArray(object.getString("roles")));
		model.addAttribute("roles", roles);
		return "admin/sysmanage/role-list";
	}
	
	@RequestMapping("/resources")
	public String toResourcesList() {
		return "admin/sysmanage/resources-list";
	}
	
}

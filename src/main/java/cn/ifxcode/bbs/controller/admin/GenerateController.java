package cn.ifxcode.bbs.controller.admin;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import ltang.redis.service.RedisObjectMapService;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.ifxcode.bbs.bean.CookieBean;
import cn.ifxcode.bbs.entity.Resources;
import cn.ifxcode.bbs.entity.User;
import cn.ifxcode.bbs.service.ResourcesService;
import cn.ifxcode.bbs.service.UserService;
import cn.ifxcode.bbs.utils.JsonUtils;
import cn.ifxcode.bbs.utils.RedisKeyUtils;
import cn.ifxcode.bbs.utils.RoleIdUtils;
import cn.ifxcode.bbs.utils.TreeUtils;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

@Controller
public class GenerateController extends BaseController{

	@Resource
	private UserService userService;
	
	@Resource
	private ResourcesService resourcesService;
	
	@Resource
	private RedisObjectMapService redisObjectMapService;
	
	@RequestMapping("/system/admin/index")
	public String toIndex() {
		return "admin/index";
	}
	
	@RequestMapping("/system/admin/index/body")
	public String getIndexBody() {
		return "admin/index-body";
	}
	
	@ResponseBody
	@RequestMapping(value = "/system/auth/getuser", method  =RequestMethod.POST)
	public JSONObject getUserInfo(HttpServletRequest request) {
		long userId = userService.getUserIdFromCookie(request);
		JSONObject object = redisObjectMapService.get(RedisKeyUtils.getUserInfo(userId), JSONObject.class);
		User user = JsonUtils.decodeJson(object);
		JSONObject result = new JSONObject(true);
		result.put("name", user.getUserAccess().getUserNickname());
		result.put("img", user.getUserInfo().getUserHeadImg());
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value = "/system/auth/getmenu", method = RequestMethod.POST)
	public JSONArray getMenu(HttpServletRequest request) {
		JSONArray result = null;
		CookieBean bean = userService.getCookieBeanFromCookie(request);
		String ids = RoleIdUtils.getRoleIdsFromCookie(RoleIdUtils.getRoleIds(bean.getRole_ids()));
		JSONObject jsonObject = redisObjectMapService.get(RedisKeyUtils.getResourcesByRoleId(Integer.parseInt(ids)), JSONObject.class);
		if(jsonObject == null) {
			List<Resources> resources = TreeUtils.formatResources(resourcesService.getResourcesByIds(RoleIdUtils.getRoleIds(bean.getRole_ids())));
			result = JSONArray.parseArray(JSON.toJSONString(resources));
			jsonObject = new JSONObject();
			jsonObject.put("resources", result.toJSONString());
			redisObjectMapService.save(RedisKeyUtils.getResourcesByRoleId(Integer.parseInt(ids)), result, JSONObject.class);
		} else {
			result = JSONArray.parseArray(jsonObject.getString("resources"));
		}
		return result;
	}
	
	@RequestMapping("/system/admin/self")
	public String toSelf(HttpServletRequest request, Model model) {
		long uid = userService.getUserIdFromCookie(request);
		User user = userService.getUserByIdFromRedis(Long.toString(uid));
		model.addAttribute("uInfo", user);
		return "admin/self";
	}
	
}

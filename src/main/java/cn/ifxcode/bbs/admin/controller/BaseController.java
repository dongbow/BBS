package cn.ifxcode.bbs.admin.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import ltang.redis.service.RedisObjectMapService;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

import cn.ifxcode.bbs.bean.CookieBean;
import cn.ifxcode.bbs.entity.Resources;
import cn.ifxcode.bbs.service.ResourcesService;
import cn.ifxcode.bbs.service.UserService;
import cn.ifxcode.bbs.utils.DateUtils;
import cn.ifxcode.bbs.utils.JsonUtils;
import cn.ifxcode.bbs.utils.RedisKeyUtils;
import cn.ifxcode.bbs.utils.RoleIdUtils;
import cn.ifxcode.bbs.utils.TreeUtils;

@Controller
public class BaseController {
	
	@Resource
	private UserService userService;
	
	@Resource
	private ResourcesService resourcesService;
	
	@Resource
	private RedisObjectMapService redisObjectMapService;
	
	@ModelAttribute
	public void getMenuNotJson(HttpServletRequest request, Model model) {
		JSONArray result = null;
		CookieBean bean = userService.getCookieBeanFromCookie(request);
		String ids = RoleIdUtils.getRoleIdsFromCookie(RoleIdUtils.getRoleIds(bean.getRole_ids()));
		JSONObject jsonObject = redisObjectMapService.get(RedisKeyUtils.getResourcesByRoleId(Integer.parseInt(ids)), JSONObject.class);
		if(jsonObject == null) {
			List<Resources> resources = TreeUtils.formatResources(resourcesService.getResourcesByIds(RoleIdUtils.getRoleIds(bean.getRole_ids())));
			result = JSONArray.parseArray(JSON.toJSONString(resources));
			jsonObject = new JSONObject();
			jsonObject.put("resources", result.toJSONString());
			redisObjectMapService.save(RedisKeyUtils.getResourcesByRoleId(Integer.parseInt(ids)), jsonObject, JSONObject.class);
		} else {
			result = JSONArray.parseArray(jsonObject.getString("resources"));
		}
		List<Resources> resources = JsonUtils.decodeJson(result);
		this.formatResources(resources);
		model.addAttribute("resources", resources);
	}
	
	public void formatResources(List<Resources> resources) {
		if(!resources.isEmpty() && resources.size() > 0) {
			for (Resources res : resources) {
				res.setResCreateTime(DateUtils.dtlong14FromDate(DateUtils.dt14FromStr(res.getResCreateTime())));
				formatResources(res.getResources());
			}
		}
	}
	
}

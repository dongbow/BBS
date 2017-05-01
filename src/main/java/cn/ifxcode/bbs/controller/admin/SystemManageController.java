package cn.ifxcode.bbs.controller.admin;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import ltang.redis.service.RedisObjectMapService;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.ifxcode.bbs.bean.Page;
import cn.ifxcode.bbs.bean.Result;
import cn.ifxcode.bbs.bean.TreeNode;
import cn.ifxcode.bbs.constant.BbsConstant;
import cn.ifxcode.bbs.entity.Resources;
import cn.ifxcode.bbs.entity.Role;
import cn.ifxcode.bbs.service.ResourcesService;
import cn.ifxcode.bbs.service.RoleService;
import cn.ifxcode.bbs.service.UserService;
import cn.ifxcode.bbs.utils.ParamsBuildUtils;

@Controller
@RequestMapping("/system/admin/sysmanage")
public class SystemManageController extends BaseController{

	private static final Integer DEFAULT_PAGE_SIZE = 10;
	
	@Resource
	private UserService userService;
	
	@Resource
	private ResourcesService resourcesService;
	
	@Resource
	private RoleService roleService;
	
	@Resource
	private RedisObjectMapService redisObjectMapService;
	
	@RequestMapping("/user")
	public String toUserList(
			@RequestParam(value="page", required = false, defaultValue = "1")int p,
			HttpServletRequest request, Model model) {
		Page page = Page.newBuilder(p, DEFAULT_PAGE_SIZE, ParamsBuildUtils.createUrl(request));
		model.addAttribute("users", userService.getAllUser(page, 0, null, null, -1, -1, -1, null, null, 0));
		model.addAttribute("page", page);
		List<Role> roles = roleService.getAllRoles();
		model.addAttribute("roles", roles);
		return "admin/sysmanage/user-list";
	}
	
	@RequestMapping("/admin")
	public String toAdminList(
			@RequestParam(value="page", required = false, defaultValue = "1")int p,
			HttpServletRequest request, Model model) {
		Page page = Page.newBuilder(p, DEFAULT_PAGE_SIZE, ParamsBuildUtils.createUrl(request));
		model.addAttribute("users", userService.getAllUser(page, 0, null, null, -1, -1, -1, null, null, 1));
		model.addAttribute("page", page);
		return "admin/sysmanage/admin-list";
	}
	
	@RequestMapping("/{user}/search")
	public String searchUserList(
			@PathVariable("user")String user, 
			@RequestParam(value="page", required = false, defaultValue = "1")int p,
			long userId, String username, String nickname, int sex, int role, 
			int status, String from, String to,
			HttpServletRequest request, Model model) {
		Page page = Page.newBuilder(p, DEFAULT_PAGE_SIZE, ParamsBuildUtils.createUrl(request));
		model.addAttribute("users", userService.getAllUser(page, userId, username, nickname, sex, role, status, from, to, "admin".equals(user) ? 1 : 0));
		model.addAttribute("page", page);
		if("user".equals(user)) {
			List<Role> roles = roleService.getAllRoles();
			model.addAttribute("roles", roles);
		}
		ParamsBuildUtils.createModel(model, request);
		return "admin/sysmanage/" + user +"-list";
	}
	
	@RequestMapping(value = "/{user}/add", method = RequestMethod.GET)
	public String getUserAddPanel(@PathVariable("user")String user, Model model) {
		List<Role> roles = roleService.getAllRoles();
		model.addAttribute("roles", roles);
		model.addAttribute("sys", user);
		model.addAttribute("op", "add");
		return "admin/sysmanage/user-add";
	}
	
	@RequestMapping("/role")
	public String toRoleList(Model model, HttpServletRequest request) {
		List<Role> roles = roleService.getAllRoles();
		if(roleService.checkIsSuperAdmin(request)) {
			model.addAttribute("su", 1);
		} else {
			model.addAttribute("su", 0);
		}
		model.addAttribute("roles", roles);
		return "admin/sysmanage/role-list";
	}
	
	@RequestMapping(value = "/role/add", method = RequestMethod.GET)
	public String getRoleAddPanel() {
		return "admin/sysmanage/role-add";
	}
	
	@ResponseBody
	@RequestMapping(value = "/role/add", method = RequestMethod.POST)
	public Result addRole(String name, String desc, String color, int type, int status) {
		Result result = null;
		int row = roleService.addRole(name, desc, color, type, status);
		if(row == BbsConstant.OK) {
			result = new Result(BbsConstant.OK, "添加成功");
		} else {
			result = new Result(BbsConstant.ERROR, "添加失败，请重试");
		}
		return result;
	}
	
	@RequestMapping(value = "/role/authorize", method = RequestMethod.GET)
	public String getRoleAuthPanel(@RequestParam(value = "rid", required = true)int roleId, Model model) {
		model.addAttribute("rid", roleId);
		return "admin/sysmanage/role-auth";
	}
	
	@ResponseBody
	@RequestMapping("/role/tree")
	public List<TreeNode> getTreeNodes(@RequestParam(value = "rid", required = true)int roleId, HttpServletRequest request) {
		List<Resources> mRes = resourcesService.getMasterRes(request);
		List<Resources> sRes = resourcesService.getResourcesByRoleIdNotTree(roleId);
		List<TreeNode> nodes = TreeNode.buildTreeNode(mRes, sRes);
		return nodes;
	}
	
	@RequestMapping("/resources")
	public String toResourcesList() {
		return "admin/sysmanage/resources-list";
	}
	
	@RequestMapping(value = "/resources/add", method = RequestMethod.GET)
	public String getResourcesAddPanel(Model model, HttpServletRequest request) {
		List<Role> roles = roleService.getAllRoles();
		if(roleService.checkIsSuperAdmin(request)) {
			model.addAttribute("su", 1);
		} else {
			model.addAttribute("su", 0);
		}
		model.addAttribute("roles", roles);
		return "admin/sysmanage/resources-add";
	}
	
	@ResponseBody
	@RequestMapping(value = "/resources/add", method = RequestMethod.POST)
	public Result addResources(String name, String link, String sign, int pid, 
			String icon, int type, int sort, int status, int way, 
			@RequestParam("roles[]")int[] roles, HttpServletRequest request) {
		Result result = null;
		int row = resourcesService.addResources(name, link, sign, pid, icon, type, sort, status, way, roles, request);
		if(row == BbsConstant.OK) {
			result = new Result(BbsConstant.OK, "添加成功");
		} else {
			result = new Result(BbsConstant.ERROR, "添加失败，请重试");
		}
		return result;
	}
	
	@RequestMapping("/nottalk")
	public String toNotTalk(@RequestParam(value="page", required = false, defaultValue = "1")int p,
			HttpServletRequest request, Model model) {
		Page page = Page.newBuilder(p, DEFAULT_PAGE_SIZE, ParamsBuildUtils.createUrl(request));
		model.addAttribute("users", userService.getAllNotTalkUser(page, 0, null));
		model.addAttribute("page", page);
		return "admin/sysmanage/nottalk-list";
	}
}

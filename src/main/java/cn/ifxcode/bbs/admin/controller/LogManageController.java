package cn.ifxcode.bbs.admin.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cn.ifxcode.bbs.bean.Page;
import cn.ifxcode.bbs.service.GoldExperienceService;
import cn.ifxcode.bbs.service.LoginLogService;
import cn.ifxcode.bbs.service.OperationLogService;
import cn.ifxcode.bbs.service.ResourcesService;
import cn.ifxcode.bbs.service.UserService;
import cn.ifxcode.bbs.utils.ParamsBuildUtils;

@Controller
@RequestMapping("/system/admin/log")
public class LogManageController extends BaseController{

	private static final Integer DEFAULT_PAGE_SIZE = 10;
	
	@Resource
	private LoginLogService loginLogService;
	
	@Resource
	private OperationLogService operationLogService;
	
	@Resource
	private ResourcesService resourcesService;
	
	@Resource
	private UserService userService;
	
	@Resource
	private GoldExperienceService goldExperienceService;
	
	@RequestMapping("/login")
	public String toLoginLog(
			@RequestParam(value="page", required = false, defaultValue = "1")int p,
			HttpServletRequest request, Model model) {
		Page page = Page.newBuilder(p, DEFAULT_PAGE_SIZE, ParamsBuildUtils.createUrl(request));
		model.addAttribute("logs", loginLogService.getAllLoginlog(page, null, null, null, -1));
		model.addAttribute("page", page);
		return "admin/logmanage/loginlog-list";
	}
	
	@RequestMapping("/login/search")
	public String loginLogSearch(
			@RequestParam(value="page", required = false, defaultValue = "1")int pageNo, 
			String from,String to, String loginName, int status,
			HttpServletRequest request, Model model) {
		Page page = Page.newBuilder(pageNo, DEFAULT_PAGE_SIZE, ParamsBuildUtils.createUrl(request));
		model.addAttribute("logs", loginLogService.getAllLoginlog(page, from, to, loginName, status));
		model.addAttribute("page", page);
		ParamsBuildUtils.createModel(model, request);
		return "admin/logmanage/loginlog-list";
	}
	
	@RequestMapping("/operation")
	public String toOperationLog(
			@RequestParam(value="page", required = false, defaultValue = "1")int p,
			HttpServletRequest request, Model model) {
		Page page = Page.newBuilder(p, DEFAULT_PAGE_SIZE, ParamsBuildUtils.createUrl(request));
		model.addAttribute("logs", operationLogService.getAllOperationLog(page, null, null, null, null, -1));
		model.addAttribute("page", page);
		model.addAttribute("modules", resourcesService.getAllModules());
		return "admin/logmanage/operationlog-list";
	}
	
	@RequestMapping("/operation/search")
	public String toOperationLogSearch(String from, String to,
			String module, String name, int status, 
			@RequestParam(value="page", required = false, defaultValue = "1")int p,
			HttpServletRequest request, Model model) {
		Page page = Page.newBuilder(p, DEFAULT_PAGE_SIZE, ParamsBuildUtils.createUrl(request));
		model.addAttribute("logs", operationLogService.getAllOperationLog(page, from, to, module, name, status));
		model.addAttribute("page", page);
		model.addAttribute("modules", resourcesService.getAllModules());
		ParamsBuildUtils.createModel(model, request);
		if(StringUtils.isNotBlank(name)) {
			model.addAttribute("name", name);
		}
		if(StringUtils.isNotBlank(module)) {
			model.addAttribute("module", module);
		}
		return "admin/logmanage/operationlog-list";
	}
	
	@RequestMapping(value = {"/sign", "/sign/search"})
	public String toSign(@RequestParam(value="page", required = false, defaultValue = "1")int p,
			@RequestParam(required = false, defaultValue = "0")long uid, 
			HttpServletRequest request, Model model) {
		Page page = Page.newBuilder(p, DEFAULT_PAGE_SIZE, ParamsBuildUtils.createUrl(request));
		model.addAttribute("signs", userService.getAllUserSigns(page, uid));
		model.addAttribute("page", page);
		if(uid != 0) {
			model.addAttribute("uid", uid);
		}
		return "admin/logmanage/sign-list";
	}
	
	@RequestMapping(value = {"/sign/detail", "/sign/detail/search"})
	public String toSignDetail(long uid, String from, String to, 
			@RequestParam(value="page", required = false, defaultValue = "1")int p,
			HttpServletRequest request, Model model) {
		Page page = Page.newBuilder(p, DEFAULT_PAGE_SIZE, ParamsBuildUtils.createUrl(request));
		model.addAttribute("signs", userService.getUserSignsByUid(page, from, to, uid));
		model.addAttribute("page", page);
		model.addAttribute("uid", uid);
		if(StringUtils.isNotBlank(to) || StringUtils.isNotBlank(from)) {
			ParamsBuildUtils.createModel(model, request);
		}
		return "admin/logmanage/sign-detail";
	}
	
	@RequestMapping(value = {"/gold", "/gold/search"})
	public String toGold(@RequestParam(value="page", required = false, defaultValue = "1")int p,
			@RequestParam(required = false, defaultValue = "0")long uid,
			HttpServletRequest request, Model model) {
		Page page = Page.newBuilder(p, DEFAULT_PAGE_SIZE, ParamsBuildUtils.createUrl(request));
		model.addAttribute("golds", goldExperienceService.getAllUserGolds(page, uid));
		model.addAttribute("page", page);
		if(uid != 0) {
			model.addAttribute("uid", uid);
		}
		return "admin/logmanage/gold-list";
	}
	
	@RequestMapping(value = {"/gold/detail", "/gold/detail/search"})
	public String toGoldDetail(long uid, String from, String to, 
			@RequestParam(value="page", required = false, defaultValue = "1")int p,
			HttpServletRequest request, Model model) {
		Page page = Page.newBuilder(p, DEFAULT_PAGE_SIZE, ParamsBuildUtils.createUrl(request));
		model.addAttribute("golds", goldExperienceService.getUserGoldsByUid(page, from, to, uid));
		model.addAttribute("page", page);
		model.addAttribute("uid", uid);
		if(StringUtils.isNotBlank(to) || StringUtils.isNotBlank(from)) {
			ParamsBuildUtils.createModel(model, request);
		}
		return "admin/logmanage/gold-detail";
	}
	
	@RequestMapping(value = {"/experience", "/experience/search"})
	public String toExp(@RequestParam(value="page", required = false, defaultValue = "1")int p,
			@RequestParam(required = false, defaultValue = "0")long uid,
			HttpServletRequest request, Model model) {
		Page page = Page.newBuilder(p, DEFAULT_PAGE_SIZE, ParamsBuildUtils.createUrl(request));
		model.addAttribute("exps", goldExperienceService.getAllUserExps(page, uid));
		model.addAttribute("page", page);
		if(uid != 0) {
			model.addAttribute("uid", uid);
		}
		return "admin/logmanage/exp-list";
	}
	
	@RequestMapping(value = {"/experience/detail", "/experience/detail/search"})
	public String toExpDetail(long uid, String from, String to, 
			@RequestParam(value="page", required = false, defaultValue = "1")int p,
			HttpServletRequest request, Model model) {
		Page page = Page.newBuilder(p, DEFAULT_PAGE_SIZE, ParamsBuildUtils.createUrl(request));
		model.addAttribute("exps", goldExperienceService.getUserExpsByUid(page, from, to, uid));
		model.addAttribute("page", page);
		model.addAttribute("uid", uid);
		if(StringUtils.isNotBlank(to) || StringUtils.isNotBlank(from)) {
			ParamsBuildUtils.createModel(model, request);
		}
		return "admin/logmanage/exp-detail";
	}
	
}

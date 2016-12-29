package cn.ifxcode.bbs.admin.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

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
			String startTime,String endTime, String loginName, int status,
			HttpServletRequest request, Model model) {
		Page page = Page.newBuilder(pageNo, DEFAULT_PAGE_SIZE, ParamsBuildUtils.createUrl(request));
		model.addAttribute("logs", loginLogService.getAllLoginlog(page, startTime, endTime, loginName, status));
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
	public String toOperationLogSearch(String startTime, String endTime,
			String module, String name, int status, 
			@RequestParam(value="page", required = false, defaultValue = "1")int p,
			HttpServletRequest request, Model model) {
		Page page = Page.newBuilder(p, DEFAULT_PAGE_SIZE, ParamsBuildUtils.createUrl(request));
		model.addAttribute("logs", operationLogService.getAllOperationLog(page, startTime, endTime, module, name, status));
		model.addAttribute("page", page);
		model.addAttribute("modules", resourcesService.getAllModules());
		ParamsBuildUtils.createModel(model, request);
		return "admin/logmanage/operationlog-list";
	}
	
	@RequestMapping("/sign")
	public String toSign(@RequestParam(value="page", required = false, defaultValue = "1")int p,
			HttpServletRequest request, Model model) {
		Page page = Page.newBuilder(p, DEFAULT_PAGE_SIZE, ParamsBuildUtils.createUrl(request));
		model.addAttribute("signs", userService.getAllUserSigns(page, 0));
		model.addAttribute("page", page);
		return "admin/logmanage/sign-list";
	}
	
	@RequestMapping("/sign/detail")
	public String toSignDetail(long uid, String starttime, String endtime, 
			@RequestParam(value="page", required = false, defaultValue = "1")int p,
			HttpServletRequest request, Model model) {
		Page page = Page.newBuilder(p, DEFAULT_PAGE_SIZE, ParamsBuildUtils.createUrl(request));
		model.addAttribute("signs", userService.getUserSignsByUid(page, starttime, endtime, uid));
		model.addAttribute("page", page);
		return "admin/logmanage/sign-detail";
	}
	
	@RequestMapping("/gold")
	public String toGold(@RequestParam(value="page", required = false, defaultValue = "1")int p,
			HttpServletRequest request, Model model) {
		Page page = Page.newBuilder(p, DEFAULT_PAGE_SIZE, ParamsBuildUtils.createUrl(request));
		model.addAttribute("golds", goldExperienceService.getAllUserGolds(page, 0));
		model.addAttribute("page", page);
		return "admin/logmanage/gold-list";
	}
	
	@RequestMapping("/gold/detail")
	public String toGoldDetail(long uid, String starttime, String endtime, 
			@RequestParam(value="page", required = false, defaultValue = "1")int p,
			HttpServletRequest request, Model model) {
		Page page = Page.newBuilder(p, DEFAULT_PAGE_SIZE, ParamsBuildUtils.createUrl(request));
		model.addAttribute("golds", goldExperienceService.getUserGoldsByUid(page, starttime, endtime, uid));
		model.addAttribute("page", page);
		return "admin/logmanage/gold-detail";
	}
	
	@RequestMapping("/experience")
	public String toExp(@RequestParam(value="page", required = false, defaultValue = "1")int p,
			HttpServletRequest request, Model model) {
		Page page = Page.newBuilder(p, DEFAULT_PAGE_SIZE, ParamsBuildUtils.createUrl(request));
		model.addAttribute("exps", goldExperienceService.getAllUserExps(page, 0));
		model.addAttribute("page", page);
		return "admin/logmanage/exp-list";
	}
	
	@RequestMapping("/experience/detail")
	public String toExpDetail(long uid, String starttime, String endtime, 
			@RequestParam(value="page", required = false, defaultValue = "1")int p,
			HttpServletRequest request, Model model) {
		Page page = Page.newBuilder(p, DEFAULT_PAGE_SIZE, ParamsBuildUtils.createUrl(request));
		model.addAttribute("exps", goldExperienceService.getUserExpsByUid(page, starttime, endtime, uid));
		model.addAttribute("page", page);
		return "admin/logmanage/exp-detail";
	}
	
}

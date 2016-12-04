package cn.ifxcode.bbs.admin.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cn.ifxcode.bbs.bean.Page;
import cn.ifxcode.bbs.service.LoginLogService;

@Controller
@RequestMapping("/system/admin/log")
public class LogManageController extends BaseController{

	private static final Integer DEFAULT_PAGE_SIZE = 10;
	
	@Resource
	private LoginLogService loginLogService;
	
	@RequestMapping("/login")
	public String toLoginLog(
			@RequestParam(value="page", required = false, defaultValue = "1")int p,
			HttpServletRequest request, Model model) {
		Page page = Page.newBuilder(p, DEFAULT_PAGE_SIZE, request.getRequestURI());
		model.addAttribute("logs", loginLogService.getAllLoginlog(page, null, null, null, -1));
		model.addAttribute("page", page);
		return "admin/logmanage/loginlog-list";
	}
	
	@RequestMapping("/login/search")
	public String loginLogSearch(
			@RequestParam(value="page", required = false, defaultValue = "1")int pageNo, 
			String startTime,String endTime, String loginName, int status,
			HttpServletRequest request, Model model) {
		Page page = Page.newBuilder(pageNo, DEFAULT_PAGE_SIZE, request.getRequestURI());
		model.addAttribute("logs", loginLogService.getAllLoginlog(page, startTime, endTime, loginName, status));
		model.addAttribute("page", page);
		return "admin/logmanage/loginlog-list";
	}
	
}

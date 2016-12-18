package cn.ifxcode.bbs.admin.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cn.ifxcode.bbs.bean.Page;
import cn.ifxcode.bbs.service.QuartzService;
import cn.ifxcode.bbs.utils.ParamsBuildUtils;

@Controller
@RequestMapping("/system/admin/quartz")
public class QuartzController extends BaseController {

	private static final Integer DEFAULT_PAGE_SIZE = 10;
	
	@Resource
	private QuartzService quartzService;
	
	@RequestMapping("/list")
	public String toQuartz(@RequestParam(value="page", required = false, defaultValue = "1")int p,
			HttpServletRequest request, Model model) {
		Page page = Page.newBuilder(p, DEFAULT_PAGE_SIZE, ParamsBuildUtils.createUrl(request));
		model.addAttribute("jobs", quartzService.getAllJobFromDB(page));
		model.addAttribute("page", page);
		return "admin/quartz/quartz-list";
	}
	
}

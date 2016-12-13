package cn.ifxcode.bbs.admin.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cn.ifxcode.bbs.bean.Page;
import cn.ifxcode.bbs.service.BoardService;
import cn.ifxcode.bbs.service.ClassifyService;
import cn.ifxcode.bbs.service.NavigationService;
import cn.ifxcode.bbs.utils.ParamsBuildUtils;

@Controller
@RequestMapping("/system/admin/navboard")
public class NavBoardManageController extends BaseController{

	private static final Integer DEFAULT_PAGE_SIZE = 10;
	
	@Resource
	private NavigationService navigationService;
	
	@Resource
	private BoardService boardService;
	
	@Resource
	private ClassifyService classifyService;
	
	@RequestMapping("/navigation")
	public String toNavigation(@RequestParam(value="page", required = false, defaultValue = "1")int p,
			HttpServletRequest request, Model model) {
		Page page = Page.newBuilder(p, DEFAULT_PAGE_SIZE, ParamsBuildUtils.createUrl(request));
		model.addAttribute("roleNavs", navigationService.getAllNavigation(page));
		model.addAttribute("page", page);
		return "admin/navboardmanage/navigation-list";
	}
	
	@RequestMapping("/board")
	public String toBoard(@RequestParam(value="page", required = false, defaultValue = "1")int p,
			HttpServletRequest request, Model model) {
		Page page = Page.newBuilder(p, DEFAULT_PAGE_SIZE, ParamsBuildUtils.createUrl(request));
		model.addAttribute("boards", boardService.getAllBoard(page));
		model.addAttribute("navs", navigationService.getAllNavigations());
		model.addAttribute("page", page);
		return "admin/navboardmanage/board-list";
	}
	
	@RequestMapping("/classify")
	public String toClassify(@RequestParam(value="page", required = false, defaultValue = "1")int p,
			HttpServletRequest request, Model model) {
		Page page = Page.newBuilder(p, DEFAULT_PAGE_SIZE, ParamsBuildUtils.createUrl(request));
		model.addAttribute("clas", classifyService.getAllClassify(page));
		model.addAttribute("boards", boardService.getAllBoards());
		model.addAttribute("page", page);
		return "admin/navboardmanage/classify-list";
	}
	
}

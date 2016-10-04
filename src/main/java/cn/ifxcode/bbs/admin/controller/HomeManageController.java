package cn.ifxcode.bbs.admin.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.ifxcode.bbs.bean.Page;
import cn.ifxcode.bbs.entity.HomeImage;
import cn.ifxcode.bbs.entity.QuickNavigation;
import cn.ifxcode.bbs.service.HomeImageService;
import cn.ifxcode.bbs.service.QuickNavigationService;

@Controller
@RequestMapping("/system/admin/home")
public class HomeManageController extends BaseController {

	private static final int DEFAULT_PAGE_SIZE = 10;
	
	@Resource
	private HomeImageService homeImageService;
	
	@Resource
	private QuickNavigationService quickNavigationService;
	
	@RequestMapping("/image")
	public String toImage(HttpServletRequest request, Model model) {
		Page page = Page.newBuilder(1, DEFAULT_PAGE_SIZE, request.getRequestURI());
		List<HomeImage> images = homeImageService.searchImages(page);
		model.addAttribute("images", images);
		model.addAttribute("page", page);
		return "admin/homemanage/homeimage-list";
	}
	
	@RequestMapping("/quick")
	public String toQuick(HttpServletRequest request, Model model) {
		Page page = Page.newBuilder(1, DEFAULT_PAGE_SIZE, request.getRequestURI());
		List<QuickNavigation> quickNavigations = quickNavigationService.getAllQuickNavigations(page);
		model.addAttribute("quickNavigations", quickNavigations);
		model.addAttribute("page", page);
		return "admin/homemanage/quicknavigation-list";
	}
	
}

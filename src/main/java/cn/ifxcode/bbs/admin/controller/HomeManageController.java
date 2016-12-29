package cn.ifxcode.bbs.admin.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cn.ifxcode.bbs.bean.Page;
import cn.ifxcode.bbs.entity.HomeImage;
import cn.ifxcode.bbs.entity.QuickNavigation;
import cn.ifxcode.bbs.entity.Recommend;
import cn.ifxcode.bbs.service.HomeImageService;
import cn.ifxcode.bbs.service.QuickNavigationService;
import cn.ifxcode.bbs.service.RecommendService;
import cn.ifxcode.bbs.service.TopicService;
import cn.ifxcode.bbs.utils.ParamsBuildUtils;

@Controller
@RequestMapping("/system/admin/home")
public class HomeManageController extends BaseController {

	private static final int DEFAULT_PAGE_SIZE = 10;
	
	@Resource
	private HomeImageService homeImageService;
	
	@Resource
	private QuickNavigationService quickNavigationService;
	
	@Resource
	private RecommendService recommendService;
	
	@Resource
	private TopicService topicService;
	
	@RequestMapping("/image")
	public String toImage(@RequestParam(value="page", required = false, defaultValue = "1")int p, 
			HttpServletRequest request, Model model) {
		Page page = Page.newBuilder(p, DEFAULT_PAGE_SIZE, ParamsBuildUtils.createUrl(request));
		List<HomeImage> images = homeImageService.searchImages(page);
		model.addAttribute("images", images);
		model.addAttribute("page", page);
		return "admin/homemanage/homeimage-list";
	}
	
	@RequestMapping("/quick")
	public String toQuick(@RequestParam(value="page", required = false, defaultValue = "1")int p, 
			HttpServletRequest request, Model model) {
		Page page = Page.newBuilder(p, DEFAULT_PAGE_SIZE, ParamsBuildUtils.createUrl(request));
		List<QuickNavigation> quickNavigations = quickNavigationService.getAllQuickNavigations(page);
		model.addAttribute("quickNavigations", quickNavigations);
		model.addAttribute("page", page);
		return "admin/homemanage/quicknavigation-list";
	}
	
	@RequestMapping("/recommend")
	public String toRecommend(@RequestParam(value="page", required = false, defaultValue = "1")int p, 
			HttpServletRequest request, Model model) {
		Page page = Page.newBuilder(p, DEFAULT_PAGE_SIZE, ParamsBuildUtils.createUrl(request));
		List<Recommend> recommends = recommendService.getAllRecommends(page);
		model.addAttribute("recommends", recommends);
		model.addAttribute("page", page);
		return "admin/homemanage/recommend-list";
	}
	
	@RequestMapping("/recommend/search")
	public String toRecommendSearch(String startTime, String endTime, int status, int location, 
			@RequestParam(value="page", required = false, defaultValue = "1")int p, 
			HttpServletRequest request, Model model) {
		Page page = Page.newBuilder(p, DEFAULT_PAGE_SIZE, ParamsBuildUtils.createUrl(request));
		List<Recommend> recommends = recommendService.getAllRecommends(page, startTime, endTime, status, location);
		model.addAttribute("recommends", recommends);
		model.addAttribute("page", page);
		ParamsBuildUtils.createModel(model, request);
		return "admin/homemanage/recommend-list";
	}
	
	@RequestMapping("/topic")
	public String toTopic(@RequestParam(value="page", required = false, defaultValue = "1")int p, 
			HttpServletRequest request, Model model) {
		Page page = Page.newBuilder(p, DEFAULT_PAGE_SIZE, ParamsBuildUtils.createUrl(request));
		model.addAttribute("topics", topicService.getHomeTopic(page));
		model.addAttribute("page", page);
		return "admin/homemanage/topic-list";
	}
	
	@RequestMapping("/topic/search")
	public String toTopicSearch(String startTime, String endTime, long tid, long uid, 
			@RequestParam(value="page", required = false, defaultValue = "1")int p, 
			HttpServletRequest request, Model model) {
		Page page = Page.newBuilder(p, DEFAULT_PAGE_SIZE, ParamsBuildUtils.createUrl(request));
		model.addAttribute("topics", topicService.getHomeTopic(page, startTime, endTime, tid, uid));
		model.addAttribute("page", page);
		ParamsBuildUtils.createModel(model, request);
		return "admin/homemanage/topic-list";
	}
	
}

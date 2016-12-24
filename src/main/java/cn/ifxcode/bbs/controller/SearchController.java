package cn.ifxcode.bbs.controller;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cn.ifxcode.bbs.entity.Navigation;
import cn.ifxcode.bbs.service.BoardService;
import cn.ifxcode.bbs.service.FriendLinkService;
import cn.ifxcode.bbs.service.NavigationService;

@Controller
public class SearchController {
	
	@Resource
	private FriendLinkService friendLinkService;
	
	@Resource
	private NavigationService navigationService;
	
	@Resource
	private BoardService boardService;

	@RequestMapping("/search")
	public String toSearch(@RequestParam(value = "adv", required = false)String adv, 
			@RequestParam(value = "page", required = false, defaultValue = "1")String page, 
			@RequestParam(value = "kw", required = false)String keyWord, 
			@RequestParam(value = "filter", required = false)String filter, 
			@RequestParam(value = "bid", required = false)String bid, 
			@RequestParam(value = "time", required = false)String time, 
			@RequestParam(value = "sort", required = false)String sort, Model model) {
		if(StringUtils.isNotBlank(keyWord)) {
			
		}
		if(StringUtils.isNotBlank(adv) && "yes".equals(adv)) {
			List<Navigation> navigations = navigationService.getAllNavigationsFromCache();
			for (Navigation navigation : navigations) {
				navigation.setBoards(boardService.getBoardByNavId(navigation.getNavId()));
			}
			model.addAttribute("navs", navigations);
			model.addAttribute("adv", 1);
		}
		return "search/search";
	}
	
	public void search(Model model, String page, String keyWord, String filter, 
			String bid, String time, String sort) {
		
	}
	
	@ModelAttribute
	public void getFriendLinks(Model model) {
		model.addAttribute("links", friendLinkService.getAllFriendLinks());
	}
	
}

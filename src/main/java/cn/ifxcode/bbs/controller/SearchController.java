package cn.ifxcode.bbs.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cn.ifxcode.bbs.bean.Page;
import cn.ifxcode.bbs.bean.SearchDto;
import cn.ifxcode.bbs.constant.BbsConstant;
import cn.ifxcode.bbs.entity.Board;
import cn.ifxcode.bbs.entity.Navigation;
import cn.ifxcode.bbs.entity.TopicData;
import cn.ifxcode.bbs.lucene.LuceneIndexUtils;
import cn.ifxcode.bbs.service.BoardService;
import cn.ifxcode.bbs.service.FriendLinkService;
import cn.ifxcode.bbs.service.NavigationService;
import cn.ifxcode.bbs.service.TopicService;
import cn.ifxcode.bbs.service.UserService;
import cn.ifxcode.bbs.utils.FormValidate;
import cn.ifxcode.bbs.utils.ParamsBuildUtils;

@Controller
public class SearchController {
	
	@Resource
	private FriendLinkService friendLinkService;
	
	@Resource
	private NavigationService navigationService;
	
	@Resource
	private BoardService boardService;
	
	@Resource
	private UserService userService;
	
	@Resource
	private TopicService topicService;

	@RequestMapping("/search")
	public String toSearch(@RequestParam(value = "adv", required = false)String adv, 
			@RequestParam(value = "page", required = false, defaultValue = "1")String page, 
			@RequestParam(value = "kw", required = false)String keyWord, 
			@RequestParam(value = "filter", required = false)String filter, 
			@RequestParam(value = "bid", required = false)String bid, 
			@RequestParam(value = "time", required = false)String time, 
			@RequestParam(value = "sort", required = false)String sort, Model model, 
			HttpServletRequest request) {
		if(StringUtils.isNotBlank(keyWord)) {
			model.addAttribute("kw", keyWord);
			search(model, page, keyWord, filter, bid, time, sort, request);
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
			String bid, String time, String sort, HttpServletRequest request) {
		int pageNo = FormValidate.number(page) == true ? Integer.parseInt(page) : 1;
		SearchDto searchDto = LuceneIndexUtils.search(keyWord, pageNo, SearchDto.DEFAULT_PAGE_SIZE);
		if (searchDto != null && searchDto.getTopics() != null 
				&& !searchDto.getTopics().isEmpty() && searchDto.getTopics().size() > 0) {
			List<Long> userIds = SearchDto.getIds(searchDto, BbsConstant.UID);
			List<Map<String, Long>> tidsAndBids = SearchDto.getTopicIdAndBoardId(searchDto);
			List<Map<String, Object>> users = userService.getUserNickname(userIds);
			List<TopicData> topicDatas = topicService.getTopicDateFromRedis(tidsAndBids);
			List<Board> boards = boardService.getAllBoard();
			searchDto.build(boards, users, topicDatas).searchUrl(ParamsBuildUtils.createUrl(request));
		}
		model.addAttribute("searchDto", searchDto);
		model.addAttribute("page", Page.clone(searchDto.getPage()));
	}
	
	@ModelAttribute
	public void getFriendLinks(Model model) {
		model.addAttribute("links", friendLinkService.getAllFriendLinks());
	}
	
}

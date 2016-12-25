package cn.ifxcode.bbs.admin.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cn.ifxcode.bbs.bean.Page;
import cn.ifxcode.bbs.service.BoardService;
import cn.ifxcode.bbs.service.NavigationService;
import cn.ifxcode.bbs.service.TopicService;
import cn.ifxcode.bbs.utils.ParamsBuildUtils;

@Controller
@RequestMapping("/system/admin/topicmanage")
public class TopicManageController extends BaseController {

	private static final Integer DEFAULT_PAGE_SIZE = 10;
	
	@Resource
	private TopicService topicService;
	
	@Resource
	private NavigationService navigationService;
	
	@Resource
	private BoardService boardService;
	
	@RequestMapping("/topiclist")
	public String toTopicList(@RequestParam(value="page", required = false, defaultValue = "1")int p,
			HttpServletRequest request, Model model) {
		Page page = Page.newBuilder(p, DEFAULT_PAGE_SIZE, ParamsBuildUtils.createUrl(request));
		model.addAttribute("topics", topicService.getTopicList(page, 0, 1));
		model.addAttribute("navs", navigationService.getAllNavigations());
		model.addAttribute("boards", boardService.getAllBoards());
		model.addAttribute("page", page);
		return "admin/topic/topic-list";
	}
	
	@RequestMapping("/audit")
	public String toTopicAudit(@RequestParam(value="page", required = false, defaultValue = "1")int p,
			HttpServletRequest request, Model model) {
		Page page = Page.newBuilder(p, DEFAULT_PAGE_SIZE, ParamsBuildUtils.createUrl(request));
		model.addAttribute("topics", topicService.getTopicList(page, 0, 0));
		model.addAttribute("navs", navigationService.getAllNavigations());
		model.addAttribute("boards", boardService.getAllBoards());
		model.addAttribute("page", page);
		return "admin/topic/topic-audit-list";
	}
	
	@RequestMapping("/trash")
	public String toTopicTrash(@RequestParam(value="page", required = false, defaultValue = "1")int p,
			HttpServletRequest request, Model model) {
		Page page = Page.newBuilder(p, DEFAULT_PAGE_SIZE, ParamsBuildUtils.createUrl(request));
		model.addAttribute("topics", topicService.getTopicList(page, 1, 2));
		model.addAttribute("navs", navigationService.getAllNavigations());
		model.addAttribute("boards", boardService.getAllBoards());
		model.addAttribute("page", page);
		return "admin/topic/topic-trash-list";
	}
	
	@RequestMapping("/spec")
	public String toSpec(@RequestParam(value="page", required = false, defaultValue = "1")int p,
			HttpServletRequest request, Model model) {
		Page page = Page.newBuilder(p, DEFAULT_PAGE_SIZE, ParamsBuildUtils.createUrl(request));
		model.addAttribute("topics", topicService.getTopicSpecList(page, -1));
		model.addAttribute("navs", navigationService.getAllNavigations());
		model.addAttribute("boards", boardService.getAllBoards());
		model.addAttribute("page", page);
		return "admin/topic/topic-spec-list";
	}
	
	@RequestMapping("/topsign")
	public String toTop(@RequestParam(value="page", required = false, defaultValue = "1")int p,
			HttpServletRequest request, Model model) {
		Page page = Page.newBuilder(p, DEFAULT_PAGE_SIZE, ParamsBuildUtils.createUrl(request));
		model.addAttribute("topics", topicService.getTopicTopList(page, -1));
		model.addAttribute("navs", navigationService.getAllNavigations());
		model.addAttribute("boards", boardService.getAllBoards());
		model.addAttribute("page", page);
		return "admin/topic/topic-top-list";
	}
	
	@RequestMapping("/closereply")
	public String toCloseReply(@RequestParam(value="page", required = false, defaultValue = "1")int p,
			HttpServletRequest request, Model model) {
		Page page = Page.newBuilder(p, DEFAULT_PAGE_SIZE, ParamsBuildUtils.createUrl(request));
		model.addAttribute("topics", topicService.getTopicCloseReplyList(page, 0, 0, 0));
		model.addAttribute("navs", navigationService.getAllNavigations());
		model.addAttribute("boards", boardService.getAllBoards());
		model.addAttribute("page", page);
		return "admin/topic/topic-close-list";
	}
	
}

package cn.ifxcode.bbs.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import ltang.redis.service.RedisObjectMapService;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cn.ifxcode.bbs.bean.Page;
import cn.ifxcode.bbs.entity.Board;
import cn.ifxcode.bbs.entity.BoardInfo;
import cn.ifxcode.bbs.entity.Classify;
import cn.ifxcode.bbs.entity.Navigation;
import cn.ifxcode.bbs.entity.Topic;
import cn.ifxcode.bbs.service.BoardService;
import cn.ifxcode.bbs.service.ClassifyService;
import cn.ifxcode.bbs.service.NavigationService;
import cn.ifxcode.bbs.service.TopicService;
import cn.ifxcode.bbs.service.UserService;
import cn.ifxcode.bbs.utils.FormValidate;
import cn.ifxcode.bbs.utils.ParamsBuildUtils;
import cn.ifxcode.bbs.utils.RedisKeyUtils;

import com.alibaba.fastjson.JSONObject;

@Controller
public class BoardController extends BaseUserController {

	private final int DEFAULT_PAGE_SIZE = 25;
	
	@Resource
	private UserService userService;
	
	@Resource
	private BoardService boardService;
	
	@Resource
	private TopicService topicService;
	
	@Resource
	private NavigationService navigationService;
	
	@Resource
	private RedisObjectMapService redisObjectMapService;
	
	@Resource
	private ClassifyService classifyService;
	
	@RequestMapping("/navigation/{gid:\\d+}/board/{bid:\\d+}")
	public String toBoard(@PathVariable("gid")int navId, @PathVariable("bid")int boardId, 
			@RequestParam(value = "page", required = false, defaultValue = "1")String p, 
			@RequestParam(required = false, defaultValue = "topic")String type,
			@RequestParam(required = false, defaultValue = "lastpost")String filter,
			@RequestParam(required = false, defaultValue = "lastpost")String orderby, 
			Model model, HttpServletRequest request) {
		JSONObject object = redisObjectMapService.get(RedisKeyUtils.getBoardsByNavId(navId), JSONObject.class);
		if(object == null) {
			return "redirect:/tip?tip=nav-notexists";
		}
		Navigation navigation = navigationService.getNavigation(navId);
		Board board = boardService.getBoardByBoardId(object, boardId);
		if(board == null) {
			return "redirect:/tip?tip=board-notexists";
		}
		BoardInfo boardInfo = boardService.getBoardInfoFromRedis(boardId);
		List<Classify> classifies = classifyService.getClassifyByBoardId(boardId);
		if(!FormValidate.number(p) || Integer.parseInt(p) <= 0) { p = "1"; }
		Page page = Page.newBuilder(Integer.parseInt(p), DEFAULT_PAGE_SIZE, ParamsBuildUtils.createUrl(request));
		List<Topic> gTopics = topicService.getGlobalTopTopic();
		List<Topic> lTopics = topicService.getLocalTopTopic(board.getBoardId());
		List<Topic> hTopics = topicService.getTopicsByBoardId(page, boardId, type, filter, orderby);
		model.addAttribute("navigation", navigation);
		model.addAttribute("board", board);
		model.addAttribute("boardInfo", boardInfo);
		model.addAttribute("classifies", classifies);
		model.addAttribute("gtopics", gTopics);
		model.addAttribute("ltopics", lTopics);
		model.addAttribute("htopics", hTopics);
		model.addAttribute("page", page);
		return "board/board";
	}
	
	@RequestMapping("/navigation/{gid:\\d+}/board/{bid:\\d+}/classify/{cid:\\d+}")
	public String toClassify(@PathVariable("gid")int navId, @PathVariable("bid")int boardId, 
			@PathVariable("cid")int classId, 
			@RequestParam(value = "page", required = false, defaultValue = "1")String p, 
			@RequestParam(required = false, defaultValue = "topic")String type,
			@RequestParam(required = false, defaultValue = "lastpost")String filter,
			@RequestParam(required = false, defaultValue = "lastpost")String orderby, 
			Model model, HttpServletRequest request) {
		JSONObject object = redisObjectMapService.get(RedisKeyUtils.getBoardsByNavId((int) navId), JSONObject.class);
		if(object == null) {
			return "redirect:/tip?tip=nav-notexists";
		}
		Navigation navigation = navigationService.getNavigation(navId);
		Board board = boardService.getBoardByBoardId(object, boardId);
		if(board == null) {
			return "redirect:/tip?tip=board-notexists";
		}
		Classify classify = classifyService.getClassifyByCid(board.getBoardId(), classId);
		if(classify == null) {
			return "redirect:/tip?tip=class-notexists";
		}
		BoardInfo boardInfo = boardService.getBoardInfoFromRedis((int) boardId);
		List<Classify> classifies = classifyService.getClassifyByBoardId((int) boardId);
		if(!FormValidate.number(p) || Integer.parseInt(p) <= 0) { p = "1"; }
		Page page = Page.newBuilder(Integer.parseInt(p), DEFAULT_PAGE_SIZE, ParamsBuildUtils.createUrl(request));
		List<Topic> gTopics = topicService.getGlobalTopTopic();
		List<Topic> lTopics = topicService.getLocalTopTopic(board.getBoardId());
		List<Topic> hTopics = topicService.getTopicsByClassId(page, classId, type, filter, orderby);
		model.addAttribute("navigation", navigation);
		model.addAttribute("board", board);
		model.addAttribute("boardInfo", boardInfo);
		model.addAttribute("classifies", classifies);
		model.addAttribute("gtopics", gTopics);
		model.addAttribute("ltopics", lTopics);
		model.addAttribute("htopics", hTopics);
		model.addAttribute("page", page);
		model.addAttribute("clz", classify);
		return "board/board";
	}
	
}

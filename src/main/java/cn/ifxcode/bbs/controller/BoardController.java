package cn.ifxcode.bbs.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import ltang.redis.service.RedisObjectMapService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
import cn.ifxcode.bbs.utils.NumberUtils;
import cn.ifxcode.bbs.utils.ParamsBuildUtils;
import cn.ifxcode.bbs.utils.RedisKeyUtils;

import com.alibaba.fastjson.JSONObject;

@Controller
public class BoardController extends BaseUserController {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
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
	
	@RequestMapping("/navigation/{gid}/board/{bid}")
	public String toBoard(@PathVariable("gid")String gid, @PathVariable("bid")String bid, 
			@RequestParam(value = "page", required = false, defaultValue = "1")int p, 
			@RequestParam(required = false, defaultValue = "topic")String type,
			@RequestParam(required = false, defaultValue = "lastpost")String filter,
			@RequestParam(required = false, defaultValue = "lastpost")String orderby, 
			Model model, HttpServletRequest request) {
		long navId = NumberUtils.getAllNumber(gid);
		if(navId == 0 || Long.toString(navId).length() > 10) {
			return "redirect:/tip?tip=nav-notexists";
		}
		JSONObject object = redisObjectMapService.get(RedisKeyUtils.getBoardsByNavId((int) navId), JSONObject.class);
		if(object == null) {
			return "redirect:/tip?tip=nav-notexists";
		}
		long boardId = NumberUtils.getAllNumber(bid);
		if(boardId == 0 || Long.toString(boardId).length() > 10) {
			return "redirect:/tip?tip=board-notexists";
		}
		Navigation navigation = navigationService.getNavigation((int) navId);
		Board board = boardService.getBoardByBoardId(object, (int) boardId);
		if(board == null) {
			return "redirect:/tip?tip=board-notexists";
		}
		//BoardInfo boardInfo = boardService.getBoardInfoByBoardId((int) boardId);
		BoardInfo boardInfo = boardService.getBoardInfoFromRedis((int) boardId);
		List<Classify> classifies = classifyService.getClassifyByBoardId((int) boardId);
		Page page = Page.newBuilder(p, DEFAULT_PAGE_SIZE, ParamsBuildUtils.createUrl(request));
		List<Topic> gTopics = topicService.getGlobalTopTopic();
		List<Topic> lTopics = topicService.getLocalTopTopic(board.getBoardId());
		List<Topic> hTopics = topicService.getTopicsByBoardId(page, navId, type, filter, orderby);
		model.addAttribute("navigation", navigation);
		model.addAttribute("board", board);
		model.addAttribute("boardInfo", boardInfo);
		model.addAttribute("classifies", classifies);
		model.addAttribute("gtopics", gTopics);
		model.addAttribute("lTopics", lTopics);
		model.addAttribute("htopics", hTopics);
		model.addAttribute("page", page);
		return "board/board";
	}
	
}

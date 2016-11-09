package cn.ifxcode.bbs.controller;

import java.util.List;

import javax.annotation.Resource;

import ltang.redis.service.RedisObjectMapService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.ifxcode.bbs.entity.Board;
import cn.ifxcode.bbs.entity.BoardInfo;
import cn.ifxcode.bbs.entity.Classify;
import cn.ifxcode.bbs.entity.Navigation;
import cn.ifxcode.bbs.service.BoardService;
import cn.ifxcode.bbs.service.ClassifyService;
import cn.ifxcode.bbs.service.NavigationService;
import cn.ifxcode.bbs.service.UserService;
import cn.ifxcode.bbs.utils.NumberUtils;
import cn.ifxcode.bbs.utils.RedisKeyUtils;

import com.alibaba.fastjson.JSONObject;

@Controller
public class BoardController extends BaseUserController {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Resource
	private UserService userService;
	
	@Resource
	private BoardService boardService;
	
	@Resource
	private NavigationService navigationService;
	
	@Resource
	private RedisObjectMapService redisObjectMapService;
	
	@Resource
	private ClassifyService classifyService;
	
	@RequestMapping("/navigation/{gid}/board/{bid}")
	public String toBoard(@PathVariable("gid")String gid, @PathVariable("bid")String bid, 
			Model model) {
		long navId = NumberUtils.getAllNumber(gid);
		if(Long.toString(navId).length() > 10) {
			return "redirect:/tip?tip=nav-notexists";
		}
		JSONObject object = redisObjectMapService.get(RedisKeyUtils.getBoardsByNavId((int) navId), JSONObject.class);
		if(object == null) {
			return "redirect:/tip?tip=nav-notexists";
		}
		long boardId = NumberUtils.getAllNumber(bid);
		if(Long.toString(boardId).length() > 10) {
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
		model.addAttribute("navigation", navigation);
		model.addAttribute("board", board);
		model.addAttribute("boardInfo", boardInfo);
		model.addAttribute("classifies", classifies);
		return "board/board";
	}
	
}

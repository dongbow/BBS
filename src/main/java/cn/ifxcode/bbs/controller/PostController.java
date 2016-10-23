package cn.ifxcode.bbs.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import ltang.redis.service.RedisObjectMapService;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import cn.ifxcode.bbs.constant.BbsConstant;
import cn.ifxcode.bbs.entity.Board;
import cn.ifxcode.bbs.entity.Classify;
import cn.ifxcode.bbs.entity.Navigation;
import cn.ifxcode.bbs.service.BoardService;
import cn.ifxcode.bbs.service.ClassifyService;
import cn.ifxcode.bbs.service.NavigationService;
import cn.ifxcode.bbs.service.TopicService;
import cn.ifxcode.bbs.service.UserService;
import cn.ifxcode.bbs.utils.JsonUtils;
import cn.ifxcode.bbs.utils.NumberUtils;
import cn.ifxcode.bbs.utils.RedisKeyUtils;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

@Controller
@RequestMapping("/post")
public class PostController extends BaseUserController {
	
	@Resource
	private UserService userService;
	
	@Resource
	private NavigationService navigationService;
	
	@Resource
	private BoardService boardService;
	
	@Resource
	private ClassifyService classifyService;
	
	@Resource
	private TopicService topicService;
	
	@Resource
	private RedisObjectMapService redisObjectMapService;
	
	public void data(Model model) {
		JSONObject object = redisObjectMapService.get(RedisKeyUtils.getNavigations(), JSONObject.class);
		JSONArray array = JSONArray.parseArray(object.getString("navigations"));
		List<Navigation> navigations = JsonUtils.decodeJson(array, Navigation.class);
		for (Navigation nav : navigations) {
			JSONObject boardJson = redisObjectMapService.get(RedisKeyUtils.getBoardsByNavId(nav.getNavId()), JSONObject.class);
			JSONArray boardArray = JSONArray.parseArray(boardJson.getString("boards"));
			List<Board> boards = JsonUtils.decodeJson(boardArray, Board.class);
			nav.setBoards(boards);
		}
		model.addAttribute("cnav", navigations);
	}
	
	@RequestMapping("/choose")
	public String cPost(Model model) {
		this.data(model);
		return "common/cpost";
	}
	
	@RequestMapping("/new/board/{bid}/topic")
	public String goPost(@PathVariable("bid")String bid, Model model) {
		long boardId = NumberUtils.getAllNumber(bid);
		if(Long.toString(boardId).length() > 10) {
			return "redirect:/tip?tip=board-notexists";
		}
		List<Classify> classifies = classifyService.getClassifyByBoardId((int) boardId);
		Navigation navigation = navigationService.getNavigation(classifies.get(0).getNavId());
		Board board = boardService.getBoardByBoardId(classifies.get(0).getNavId(), classifies.get(0).getBoardId());
		model.addAttribute("navigation", navigation);
		model.addAttribute("pboard", board);
		model.addAttribute("classifies", classifies);
		return "post/post";
	}
	
	@RequestMapping(value = "/new/topic/do", method = RequestMethod.POST)
	public String doPost(int cid, String ttitle, String tcontent, long uid, int bid, int gid, 
			@RequestParam(required = false, defaultValue = "0")int isreply,
			@RequestParam(required = false, defaultValue = "0")int iselite,
			@RequestParam(required = false, defaultValue = "0")int istop,
			@RequestParam(required = false, defaultValue = "0")int isglobaltop,
			@RequestParam(required = false, defaultValue = "0")int ishome, 
			HttpServletRequest request) {
		long topicId = topicService.insertTopic(cid, ttitle, tcontent, uid, bid, gid, 
				isreply, iselite, istop, isglobaltop, ishome, request);
		if(topicId > BbsConstant.OK) {
			return "redirect:/board/" + bid + "/topic/detail/" + topicId + "/1";
		}
		return "redirect:/tip?tip=post-fail";
	}

}

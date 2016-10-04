package cn.ifxcode.bbs.controller;

import java.util.List;

import javax.annotation.Resource;

import ltang.redis.service.RedisObjectMapService;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.ifxcode.bbs.entity.Board;
import cn.ifxcode.bbs.entity.Classify;
import cn.ifxcode.bbs.entity.Navigation;
import cn.ifxcode.bbs.service.BoardService;
import cn.ifxcode.bbs.service.ClassifyService;
import cn.ifxcode.bbs.service.NavigationService;
import cn.ifxcode.bbs.utils.JsonUtils;
import cn.ifxcode.bbs.utils.NumberUtils;
import cn.ifxcode.bbs.utils.RedisKeyUtils;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

@Controller
@RequestMapping("/post")
public class PostController extends BaseUserController {
	
	@Resource
	private NavigationService navigationService;
	
	@Resource
	private BoardService boardService;
	
	@Resource
	private ClassifyService classifyService;
	
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
	
	@RequestMapping("/new/topic/{bid}")
	public String goPost(@PathVariable("bid")String bid, Model model) {
		long boardId = NumberUtils.getAllNumber(bid);
		if(Long.toString(boardId).length() > 10) {
			return "redirect:/index";
		}
		List<Classify> classifies = classifyService.getClassifyByBoardId((int) boardId);
		Navigation navigation = navigationService.getNavigation(classifies.get(0).getNavId());
		Board board = boardService.getBoardByBoardId(classifies.get(0).getNavId(), classifies.get(0).getBoardId());
		model.addAttribute("pnav", navigation);
		model.addAttribute("pboard", board);
		model.addAttribute("classifies", classifies);
		return "post/post";
	}

}

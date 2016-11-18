package cn.ifxcode.bbs.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import ltang.redis.service.RedisObjectMapService;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

import cn.ifxcode.bbs.bean.CookieBean;
import cn.ifxcode.bbs.entity.Board;
import cn.ifxcode.bbs.entity.Navigation;
import cn.ifxcode.bbs.entity.User;
import cn.ifxcode.bbs.service.NavigationService;
import cn.ifxcode.bbs.service.UserService;
import cn.ifxcode.bbs.utils.JsonUtils;
import cn.ifxcode.bbs.utils.RedisKeyUtils;

@Controller
@RequestMapping("/manage/bmc")
public class BoardManagerController {

	@Resource
	private UserService userService;
	
	@Resource
	private NavigationService navigationService;
	
	@Resource
	private RedisObjectMapService redisObjectMapService;
	
	@RequestMapping("/bcm")
	public String bcm() {
		return "boardmanager/bcm";
	}
	
	@RequestMapping("/index")
	public String index(HttpServletRequest request, Model model) {
		CookieBean bean = userService.getCookieBeanFromCookie(request);
		User user = userService.getUserByIdFromRedis(Long.toString(bean.getUser_id()));
		List<Navigation> navigations = null;
		if(user.getUserAccess().getUserIsAdmin() == 1) {
			JSONObject object = redisObjectMapService.get(RedisKeyUtils.getNavigations(), JSONObject.class);
			JSONArray array = JSONArray.parseArray(object.getString("navigations"));
			navigations = JsonUtils.decodeJson(array, Navigation.class);
			for (Navigation n : navigations) {
				JSONObject boardObject = redisObjectMapService.get(RedisKeyUtils.getBoardsByNavId((int) n.getNavId()), JSONObject.class);
				JSONArray boardArray = JSONArray.parseArray(boardObject.getString("boards"));
				n.setBoards(JsonUtils.decodeJson(boardArray, Board.class));
			}
		} else {
			List<Integer> boardIds = userService.getAllBoardManageId(bean.getUser_id());
			navigations = navigationService.getBCMNavs(boardIds);
		}
		model.addAttribute("navigations", navigations);
		model.addAttribute("user", user);
		return "boardmanager/index";
	}
	
	@RequestMapping("/topic/notreply")
	public String notReply() {
		
		return "boardmanager/notreply";
	}
	
	@RequestMapping("/topic/notspeak")
	public String notSpeak() {
		
		return null;
	}
	
}

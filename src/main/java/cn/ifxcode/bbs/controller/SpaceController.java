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
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;

import cn.ifxcode.bbs.bean.CookieBean;
import cn.ifxcode.bbs.bean.Page;
import cn.ifxcode.bbs.constant.BbsConstant;
import cn.ifxcode.bbs.entity.Board;
import cn.ifxcode.bbs.entity.Reply;
import cn.ifxcode.bbs.entity.Topic;
import cn.ifxcode.bbs.entity.User;
import cn.ifxcode.bbs.entity.UserValue;
import cn.ifxcode.bbs.service.BoardService;
import cn.ifxcode.bbs.service.ReplyService;
import cn.ifxcode.bbs.service.TopicService;
import cn.ifxcode.bbs.service.UserService;
import cn.ifxcode.bbs.utils.FormValidate;
import cn.ifxcode.bbs.utils.ParamsBuildUtils;
import cn.ifxcode.bbs.utils.RedisKeyUtils;

@Controller
@RequestMapping("/space")
public class SpaceController extends BaseUserController {

	private final int DEFAULT_PAGE_SIZE = 15;
	
	@Resource
	private UserService userService;
	
	@Resource
	private TopicService topicService;
	
	@Resource
	private ReplyService replyService;
	
	@Resource
	private BoardService boardService;
	
	@Resource
	private RedisObjectMapService redisObjectMapService;
	
	@RequestMapping("/uid/{uid:\\d+}")
	public String toSpace(@PathVariable("uid")long userId, HttpServletRequest request, 
			Model model) {
		CookieBean cookieBean = userService.getCookieBeanFromCookie(request);
		JSONObject object = null;
		if(cookieBean != null) {
			object = redisObjectMapService.get(RedisKeyUtils.getUserInfo(cookieBean.getUser_id()), JSONObject.class);
		}
		User user = userService.getUserById(userId);
		if(user == null) {
			return "redirect:/tip?tip=space-notexists";
		}
		UserValue userValue = userService.getUserValue(userId);
		model.addAttribute("userinfo", user);
		model.addAttribute("uservalue", userValue);
		if(object == null) {
			model.addAttribute("islogin", 0);
		} else {
			model.addAttribute("islogin", 1);
		}
		if(user.getUserAccess().getUserIsBoderManager() == 1) {
			List<Integer> boardIds = userService.getAllBoardManageId(user.getUserAccess().getUserId());
			List<Board> boards = boardService.getBMC(boardIds);
			model.addAttribute("boards", boards);
		}
		return "space/space-uid";
	}
	
	@RequestMapping("/nickname/{nickname}")
	public String toSpaceByNickname(@PathVariable("nickname")String nickname, HttpServletRequest request, 
			Model model) {
		CookieBean cookieBean = userService.getCookieBeanFromCookie(request);
		JSONObject object = null;
		if(cookieBean != null) {
			object = redisObjectMapService.get(RedisKeyUtils.getUserInfo(cookieBean.getUser_id()), JSONObject.class);
		}
		User user = userService.getUserByUserNickname(nickname);
		if(user == null) {
			return "redirect:/tip?tip=space-notexists";
		}
		UserValue userValue = userService.getUserValue(user.getUserAccess().getUserId());
		model.addAttribute("userinfo", user);
		model.addAttribute("uservalue", userValue);
		if(object == null) {
			model.addAttribute("islogin", 0);
		} else {
			model.addAttribute("islogin", 1);
		}
		if(user.getUserAccess().getUserIsBoderManager() == 1) {
			List<Integer> boardIds = userService.getAllBoardManageId(user.getUserAccess().getUserId());
			List<Board> boards = boardService.getBMC(boardIds);
			model.addAttribute("boards", boards);
		}
		return "space/space-uid";
	}
	
	@RequestMapping("/uid/{uid:\\d+}/{bbs}")
	public ModelAndView toSpaceTopic(@PathVariable("uid")long userId, HttpServletRequest request, 
			@PathVariable("bbs")String bbs, @RequestParam(value="page", defaultValue = "1", required = false)String pageNo) {
		if(!bbsEquals(bbs)) {
			return new ModelAndView("redirect:" + BbsConstant.DOMAIN);
		}
		CookieBean cookieBean = userService.getCookieBeanFromCookie(request);
		JSONObject object = null;
		if(cookieBean != null) {
			object = redisObjectMapService.get(RedisKeyUtils.getUserInfo(cookieBean.getUser_id()), JSONObject.class);
		}
		User user = userService.getUserById(userId);
		if(user == null) {
			return new ModelAndView("redirect:/tip?tip=space-notexists");
		}
		ModelAndView mv = new ModelAndView();
		mv.addObject("userinfo", user);
		if(object == null) {
			mv.addObject("islogin", 0);
		} else {
			mv.addObject("islogin", 1);
		}
		if(!FormValidate.number(pageNo) || Integer.parseInt(pageNo) <= 0) {pageNo = "1";}
		if("topic".equals(bbs)) {
			if(user.getUserPrivacy().getTopicIsPublic() == 0 || (object != null && user.getUserAccess().getUserId() == cookieBean.getUser_id())) {
				Page page = Page.newBuilder(Integer.parseInt(pageNo), DEFAULT_PAGE_SIZE, ParamsBuildUtils.createUrl(request));
				List<Topic> topics = topicService.getTopicListByUserId(user.getUserAccess().getUserId(), page);
				mv.addObject("page", page);
				mv.addObject("topics", topics);
			}
			mv.setViewName("space/space-topic");
		} else if("reply".equals(bbs)) {
			mv.setViewName("space/space-reply");
			if(user.getUserPrivacy().getReplyIsPublic() == 0 || (object != null && user.getUserAccess().getUserId() == cookieBean.getUser_id())) {
				Page page = Page.newBuilder(Integer.parseInt(pageNo), DEFAULT_PAGE_SIZE, ParamsBuildUtils.createUrl(request));
				List<Reply> replies = replyService.getReplyListByUserId(page, user.getUserAccess().getUserId());
				mv.addObject("page", page);
				mv.addObject("replies", replies);
			}
		} else if("friends".equals(bbs)) {
			if(user.getUserPrivacy().getFriendIsPublic() == 0) {
				
			}
			mv.setViewName("space/space-friends");
		}
		return mv;
	}
	
	private boolean bbsEquals(String bbs) {
		if("topic".equals(bbs) || "reply".equals(bbs) || "friends".equals(bbs)) {
			return true;
		}
		return false;
	}
	
}

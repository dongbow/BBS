package cn.ifxcode.bbs.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import ltang.redis.service.RedisObjectMapService;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributesModelMap;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

import cn.ifxcode.bbs.bean.CookieBean;
import cn.ifxcode.bbs.bean.Page;
import cn.ifxcode.bbs.bean.Result;
import cn.ifxcode.bbs.constant.BbsConstant;
import cn.ifxcode.bbs.constant.BbsErrorCode;
import cn.ifxcode.bbs.entity.Board;
import cn.ifxcode.bbs.entity.ExperienceHistory;
import cn.ifxcode.bbs.entity.GoldHistory;
import cn.ifxcode.bbs.entity.HomeImage;
import cn.ifxcode.bbs.entity.Navigation;
import cn.ifxcode.bbs.entity.PastHistory;
import cn.ifxcode.bbs.entity.Topic;
import cn.ifxcode.bbs.entity.UserValue;
import cn.ifxcode.bbs.enumtype.EGHistory;
import cn.ifxcode.bbs.enumtype.MsgType;
import cn.ifxcode.bbs.msg.entity.Message;
import cn.ifxcode.bbs.service.FriendLinkService;
import cn.ifxcode.bbs.service.GeneralService;
import cn.ifxcode.bbs.service.GoldExperienceService;
import cn.ifxcode.bbs.service.HomeImageService;
import cn.ifxcode.bbs.service.MessageService;
import cn.ifxcode.bbs.service.NavigationService;
import cn.ifxcode.bbs.service.TopicService;
import cn.ifxcode.bbs.service.UserService;
import cn.ifxcode.bbs.utils.FormValidate;
import cn.ifxcode.bbs.utils.GetRemoteIpUtil;
import cn.ifxcode.bbs.utils.JsonUtils;
import cn.ifxcode.bbs.utils.ParamsBuildUtils;
import cn.ifxcode.bbs.utils.RedisKeyUtils;
import cn.ifxcode.bbs.utils.UserValueUtils;

@Controller
public class IndexController extends BaseUserController{

	private final int DEFAULT_PAGE_SIZE = 25;
	
	@Resource
	private HomeImageService homeImageService;
	
	@Resource
	private NavigationService navigationService;
	
	@Resource
	private UserService userService;
	
	@Resource
	private RedisObjectMapService redisObjectMapService;
	
	@Resource
	private GoldExperienceService goldExperienceService;
	
	@Resource
	private GeneralService generalService;
	
	@Resource
	private TopicService topicService;
	
	@Resource
	private FriendLinkService friendLinkService;
	
	@Resource
	private MessageService messageService;
	
	private GoldHistory goldHistory = null;
	private ExperienceHistory experienceHistory = null;
	
	@RequestMapping("/close")
	public String close() {
		if(generalService.checkBbsIsClose()) {
			return "close";
		}
		return "redirect:/index";
	}
	
	@RequestMapping("/index")
	public String toIndex(Model model) {
		List<HomeImage> images = homeImageService.getHomeImages();
		List<Topic> gTopics = topicService.getGlobalTopTopic();
		List<Topic> hTopics = topicService.getHomeTopic();
		model.addAttribute("images", images);
		model.addAttribute("gtopics", gTopics);
		model.addAttribute("htopics", hTopics);
		return "index";
	}
	
	@RequestMapping("/navigation/{gid:\\d+}")
	public String toNavigation(@PathVariable("gid")int navId, 
			@RequestParam(required = false, defaultValue = "topic")String type,
			@RequestParam(required = false, defaultValue = "lastpost")String filter,
			@RequestParam(required = false, defaultValue = "lastpost")String orderby, 
			@RequestParam(value = "page", required = false, defaultValue = "1")String p, 
			HttpServletRequest request, Model model) {
		JSONObject object = redisObjectMapService.get(RedisKeyUtils.getBoardsByNavId(navId), JSONObject.class);
		if(object == null) {
			return "redirect:/tip?tip=nav-notexists";
		}
		Navigation navigation = navigationService.getNavigation(navId);
		JSONArray array = JSONArray.parseArray(object.getString("boards"));
		List<Board> boards = JsonUtils.decodeJson(array, Board.class);
		if(!FormValidate.number(p) || Integer.parseInt(p) <= 0) {p = "1";}
		Page page = Page.newBuilder(Integer.parseInt(p), DEFAULT_PAGE_SIZE, ParamsBuildUtils.createUrl(request));
		List<Topic> gTopics = topicService.getGlobalTopTopic();
		List<Topic> hTopics = topicService.getTopicsByNavId(page, navId, type, filter, orderby);
		model.addAttribute("navigation", navigation);
		model.addAttribute("boards", boards);
		model.addAttribute("gtopics", gTopics);
		model.addAttribute("htopics", hTopics);
		model.addAttribute("page", page);
		return "navigation";
	}
	
	@ResponseBody
	@RequestMapping(value = "/sign/index", method = RequestMethod.POST)
	public JSONObject toSign(HttpServletRequest request) {
		JSONObject object = new JSONObject(true);
		Result result = null;
		CookieBean cookieBean = userService.checkIsLogin(request);
		if(cookieBean != null) {
			UserValue userValue = UserValueUtils.sign(userService.getUserValue(cookieBean.getUser_id()));
			if (userValue != null) {
				PastHistory pastHistory = new PastHistory(cookieBean.getUser_id(), cookieBean.getNick_name(), 
						GetRemoteIpUtil.getRemoteIp(request), userValue.getUserLastestPastTime());
				if (BbsConstant.OK == userService.addSign(userValue, pastHistory)) {
					if(userValue.isGoldChange()) {
						goldHistory = new GoldHistory(userValue.getUserId(), cookieBean.getNick_name(), 1, EGHistory.SIGN.getFrom(), 
								EGHistory.SIGN.getDesc(), userValue.getUserLastestPastTime());
					}
					if(userValue.isExpChange()) {
						experienceHistory = new ExperienceHistory(userValue.getUserId(), cookieBean.getNick_name(), 1, 
								EGHistory.SIGN.getDesc(), userValue.getUserLastestPastTime());
					}
					goldExperienceService.insertGE(goldHistory, experienceHistory);
					generalService.saveCount("usersign");
					result = new Result(BbsConstant.OK, "签到成功");
					object.put("uv", userValue);
					Message message = new Message.builder().to(userService.getUserIdFromCookie(request)).text("签到成功，金币+" + userValue.getThisGold() + "，经验+" + userValue.getThisExp()).type(MsgType.DIALOG.getCode()).status(1).build();
					messageService.sendMsg(request, message);
				} else {
					result = new Result(BbsConstant.ERROR, "签到失败，请稍后重试");
				}
			} else {
				result = new Result(BbsErrorCode.REPEAT_SIGN, BbsErrorCode.getDescribe(BbsErrorCode.REPEAT_SIGN));
			}
		} else {
			result = new Result(BbsErrorCode.NOT_LOGIN, BbsErrorCode.getDescribe(BbsErrorCode.NOT_LOGIN));
		}
		object.put("rc", result);
		return object;
	}
	
	@RequestMapping(value = "/click/{id:\\d+}", method = RequestMethod.POST)
	public Result click(@PathVariable("id")int fid) {
		Result result = null;
		if(fid != 0) {
			generalService.click("friendlinks", Long.toString(fid));
			result = new Result(BbsConstant.OK, BbsConstant.RC);
		} else {
			result = new Result(BbsConstant.ERROR, BbsConstant.RC);
		}
		return result;
	}
	
	@RequestMapping("/friendlink")
	public String toFriendLink() {
		return "friendlink";
	}
	
	@RequestMapping(value = "/friendlink/apply", method = RequestMethod.POST)
	public String friendLink(String linkname, String link, String contact, RedirectAttributesModelMap modelMap) {
		if(StringUtils.isNotBlank(link) && StringUtils.isNotBlank(linkname)
				&& StringUtils.isNotBlank(contact)) {
			int row = friendLinkService.addLink(linkname, link, contact);
			if(row == BbsConstant.OK) {
				modelMap.addFlashAttribute("status", 1);
			}
		}
		return "redirect:/friendlink";
	}
	
}

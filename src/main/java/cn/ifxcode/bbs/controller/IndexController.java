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
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

import cn.ifxcode.bbs.bean.CookieBean;
import cn.ifxcode.bbs.bean.Result;
import cn.ifxcode.bbs.constant.BbsConstant;
import cn.ifxcode.bbs.constant.BbsErrorCode;
import cn.ifxcode.bbs.entity.Board;
import cn.ifxcode.bbs.entity.BoardInfo;
import cn.ifxcode.bbs.entity.Classify;
import cn.ifxcode.bbs.entity.ExperienceHistory;
import cn.ifxcode.bbs.entity.GoldHistory;
import cn.ifxcode.bbs.entity.HomeImage;
import cn.ifxcode.bbs.entity.Navigation;
import cn.ifxcode.bbs.entity.PastHistory;
import cn.ifxcode.bbs.entity.UserValue;
import cn.ifxcode.bbs.enumtype.EGHistory;
import cn.ifxcode.bbs.service.BoardService;
import cn.ifxcode.bbs.service.ClassifyService;
import cn.ifxcode.bbs.service.GeneralService;
import cn.ifxcode.bbs.service.GoldExperienceService;
import cn.ifxcode.bbs.service.HomeImageService;
import cn.ifxcode.bbs.service.NavigationService;
import cn.ifxcode.bbs.service.UserService;
import cn.ifxcode.bbs.utils.DateUtils;
import cn.ifxcode.bbs.utils.GetRemoteIpUtil;
import cn.ifxcode.bbs.utils.JsonUtils;
import cn.ifxcode.bbs.utils.NumberUtils;
import cn.ifxcode.bbs.utils.RedisKeyUtils;
import cn.ifxcode.bbs.utils.UserValueUtils;

@Controller
public class IndexController extends BaseUserController{

	@Resource
	private HomeImageService homeImageService;
	
	@Resource
	private NavigationService navigationService;
	
	@Resource
	private BoardService boardService;
	
	@Resource
	private ClassifyService classifyService;
	
	@Resource
	private UserService userService;
	
	@Resource
	private RedisObjectMapService redisObjectMapService;
	
	@Resource
	private GoldExperienceService goldExperienceService;
	
	@Resource
	private GeneralService generalService;
	
	private GoldHistory goldHistory = null;
	private ExperienceHistory experienceHistory = null;
	
	@RequestMapping("/close")
	public String close() {
		if(generalService.checkBbsIsClose()) {
			return "close";
		}
		return "redirect:/index";
	}
	
	@RequestMapping("/tip/nologin")
	public String getTip() {
		return "tip/login_tip";
	}
	
	@RequestMapping("/index")
	public String toIndex(Model model) {
		List<HomeImage> images = homeImageService.getHomeImages();
		model.addAttribute("images", images);
		return "index";
	}
	
	@RequestMapping("/navigation/{gid}")
	public String toNavigation(@PathVariable("gid")String gid, 
			Model model) {
		long navId = NumberUtils.getAllNumber(gid);
		if(Long.toString(navId).length() > 10) {
			return "redirect:/index";
		}
		JSONObject object = redisObjectMapService.get(RedisKeyUtils.getBoardsByNavId((int) navId), JSONObject.class);
		if(object == null) {
			return "redirect:/index";
		}
		Navigation navigation = navigationService.getNavigation((int) navId);
		JSONArray array = JSONArray.parseArray(object.getString("boards"));
		List<Board> boards = JsonUtils.decodeJson(array, Board.class);
		model.addAttribute("navigation", navigation);
		model.addAttribute("boards", boards);
		return "navigation";
	}
	
	@RequestMapping("/navigation/{gid}/board/{bid}")
	public String toBoard(@PathVariable("gid")String gid, @PathVariable("bid")String bid, 
			Model model) {
		long navId = NumberUtils.getAllNumber(gid);
		if(Long.toString(navId).length() > 10) {
			return "redirect:/index";
		}
		JSONObject object = redisObjectMapService.get(RedisKeyUtils.getBoardsByNavId((int) navId), JSONObject.class);
		if(object == null) {
			return "redirect:/index";
		}
		long boardId = NumberUtils.getAllNumber(bid);
		if(Long.toString(boardId).length() > 10) {
			return "redirect:/index";
		}
		Navigation navigation = navigationService.getNavigation((int) navId);
		Board board = boardService.getBoardByBoardId(object, (int) boardId);
		if(board == null) {
			return "redirect:/index";
		}
		BoardInfo boardInfo = boardService.getBoardInfoByBoardId((int) boardId);
		List<Classify> classifies = classifyService.getClassifyByBoardId((int) boardId);
		model.addAttribute("navigation", navigation);
		model.addAttribute("board", board);
		model.addAttribute("boardInfo", boardInfo);
		model.addAttribute("classifies", classifies);
		return "board/board";
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
					result = new Result(BbsConstant.OK, "签到成功");
					object.put("uv", userValue);
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
}

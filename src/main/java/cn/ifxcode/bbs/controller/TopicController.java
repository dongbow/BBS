package cn.ifxcode.bbs.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.HtmlUtils;

import cn.ifxcode.bbs.bean.Page;
import cn.ifxcode.bbs.bean.Result;
import cn.ifxcode.bbs.constant.BbsConstant;
import cn.ifxcode.bbs.entity.Board;
import cn.ifxcode.bbs.entity.Classify;
import cn.ifxcode.bbs.entity.Navigation;
import cn.ifxcode.bbs.entity.Reply;
import cn.ifxcode.bbs.entity.Topic;
import cn.ifxcode.bbs.entity.User;
import cn.ifxcode.bbs.entity.UserValue;
import cn.ifxcode.bbs.service.BoardService;
import cn.ifxcode.bbs.service.ClassifyService;
import cn.ifxcode.bbs.service.GeneralService;
import cn.ifxcode.bbs.service.NavigationService;
import cn.ifxcode.bbs.service.ReplyService;
import cn.ifxcode.bbs.service.ReportService;
import cn.ifxcode.bbs.service.TopicService;
import cn.ifxcode.bbs.service.UserService;
import cn.ifxcode.bbs.utils.DateUtils;
import cn.ifxcode.bbs.utils.FormValidate;
import cn.ifxcode.bbs.utils.ParamsBuildUtils;

@Controller
public class TopicController extends BaseUserController{

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	private final int DEFAULT_PAGE_SIZE = 15;
	
	@Resource
	private TopicService topicService;
	
	@Resource
	private NavigationService navigationService;
	
	@Resource
	private BoardService boardService;
	
	@Resource
	private UserService userService;
	
	@Resource
	private ClassifyService classifyService;
	
	@Resource
	private ReplyService replyService;
	
	@Resource
	private ReportService reportService;
	
	@Resource
	private GeneralService generalService;
	
	@RequestMapping("/board/{bid:\\d+}/topic/detail/{tid:\\d+}")
	public String toTopic(@PathVariable("bid")int boardId, 
			@PathVariable("tid")long topicId, 
			@RequestParam(value = "page", required = false, defaultValue = "1")String pno, 
			@RequestParam(required = false, defaultValue = "0")String sort, 
			@RequestParam(required = false, defaultValue = "0")String uid, 
			Model model, HttpServletRequest request) {
		Topic topic = topicService.getTopicByTopicId(topicId);
		if(topic != null) {
			topic.setTopicContent(HtmlUtils.htmlUnescape(topic.getTopicContent()));
			topic.setTopicCreateTime(DateUtils.dt14LongFormat(DateUtils.dt14FromStr(topic.getTopicCreateTime())));
			topic.setTopicData(topicService.getTopicDateFromRedis(topic.getTopicId(), topic.getBoardId()));
			User user = userService.getUserById(topic.getUserId());
			UserValue userValue = userService.getUserValue(topic.getUserId());
			Classify classify = classifyService.getClassifyByCid(topic.getBoardId(), topic.getClassId());
			Navigation navigation = navigationService.getNavigation(topic.getNavId());
			Board board = boardService.getBoardByBoardId(topic.getNavId(), topic.getBoardId());
			if(!FormValidate.number(uid) || !FormValidate.number(sort, 0, 1) || !FormValidate.number(pno)) {
				uid = "0";
				sort = "0";
				pno = "1";
			}
			Page page = Page.newBuilder(Integer.parseInt(pno), DEFAULT_PAGE_SIZE, ParamsBuildUtils.createUrl(request));
			List<Reply> replies = replyService.getReplyListByTopicId(page, topic.getTopicId(), Long.parseLong(uid), Integer.parseInt(sort));
			model.addAttribute("navigation", navigation);
			model.addAttribute("pboard", board);
			model.addAttribute("clas", classify);
			model.addAttribute("ui", user);
			model.addAttribute("uv", userValue);
			model.addAttribute("topic", topic);
			model.addAttribute("page", page);
			model.addAttribute("replies", replies);
			model.addAttribute("sort", Integer.parseInt(sort));
			if(generalService.isLocalBMC(request)) {
				model.addAttribute("localbmc", 1);
			} else {
				model.addAttribute("localbmc", 0);
			}
			return "topic/topic";
		}
		logger.info("topic is not found");
		return "redirect:/tip?tip=topic-notexists";
	}
	
	@RequestMapping("/board/{bid:\\d+}/topic/detail/{tid:\\d+}/gofloor")
	public String toTopicFloor(@PathVariable("bid")int boardId, 
			@PathVariable("tid")long topicId, 
			@RequestParam(value = "page", required = false, defaultValue = "1")String pno, 
			@RequestParam(required = false)String floor, 
			@RequestParam(required = false, defaultValue = "0")String lastest) {
		if(!FormValidate.number(pno) || !FormValidate.number(lastest, 0, 1)) {
			pno = "1";
			lastest = "0";
		}
		if(Integer.parseInt(lastest) != 0) {
			int count = replyService.getCount(topicId);
			pno = Double.toString(Math.ceil((double) count / DEFAULT_PAGE_SIZE));
			floor = Integer.toString(count);
		}
		return "redirect:/board/" + boardId + "/topic/detail/" + topicId + "?page=" + pno + "#floor_" + floor;
	}
	
	@RequestMapping("/post/topic/report")
	public String report() {
		return "topic/report";
	}
	
	@ResponseBody
	@RequestMapping(value = "/post/topic/report/do", method = RequestMethod.POST)
	public Result doReport(String uid, String tid, String rid, String floor, String rs, 
			String other, String url, HttpServletRequest request) {
		Result result = null;
		if(this.isNotBlank(uid, tid, rid, floor, rs, url)) {
			if("其他".equals(rs)) {
				if(StringUtils.isEmpty(other) || other.length() < 5 || other.length() > 50) {
					return new Result(BbsConstant.ERROR, "举报原因过长或过短");
				}
			}
			if(reportService.addReport(uid, tid, rid, floor, rs, other, url, request) == BbsConstant.OK) {
				result = new Result(BbsConstant.OK, "举报成功");
			} else {
				result = new Result(BbsConstant.ERROR, "举报失败");
			}
		} else {
			result = new Result(BbsConstant.ERROR, "举报失败");
		}
		return result;
	}
	
	@RequestMapping(value = "/board/{bid:\\d+}/topic/detail/{tid:\\d+}/update", method = RequestMethod.GET)
	public String topicUpdate(@PathVariable("bid")int boardId, @PathVariable("tid")long topicId, 
			HttpServletRequest request, Model model) {
		Topic topic = topicService.getTopicByTopicId(topicId);
		if(topic != null) {
			if(generalService.checkUpdate(request, topic.getUserId())) {
				topic.setTopicContent(HtmlUtils.htmlUnescape(topic.getTopicContent()));
				Classify classify = classifyService.getClassifyByCid(topic.getBoardId(), topic.getClassId());
				Navigation navigation = navigationService.getNavigation(topic.getNavId());
				Board board = boardService.getBoardByBoardId(topic.getNavId(), topic.getBoardId());
				model.addAttribute("navigation", navigation);
				model.addAttribute("pboard", board);
				model.addAttribute("clas", classify);
				model.addAttribute("topic", topic);
				if(generalService.isLocalBMC(request)) {
					model.addAttribute("localbmc", 1);
				} else {
					model.addAttribute("localbmc", 0);
				}
				return "post/topic-update";
			} else {
				return "redirect:/tip?tip=noauth";
			}
		}
		logger.info("topic is not found");
		return "redirect:/tip?tip=topic-notexists";
	}
	
	@RequestMapping(value = "/board/{boardid:\\d+}/topic/update", method = RequestMethod.POST)
	public String topicUpdateDo(String bid, String tid, String ttitle, String tcontent, String uid, 
			@RequestParam(required = false, defaultValue = "0")int isreply,
			@RequestParam(required = false, defaultValue = "0")int iselite,
			@RequestParam(required = false, defaultValue = "0")int istop,
			@RequestParam(required = false, defaultValue = "0")int isglobaltop,
			@RequestParam(required = false, defaultValue = "0")int ishome, 
			HttpServletRequest request) {
		if(StringUtils.isEmpty(ttitle) || StringUtils.isEmpty(tcontent) || !FormValidate.number(uid) 
				|| !FormValidate.number(bid) || !FormValidate.number(tid)) {
			return "redirect:/tip?tip=update-fail";
		}
		if(generalService.checkUpdate(request, Long.parseLong(uid))) {
			int row = topicService.updateTopic(tid, ttitle, tcontent, isreply, iselite, istop, isglobaltop, ishome, request);
			if(row == BbsConstant.OK) {
				return "redirect:/board/" + bid + "/topic/detail/" + tid;
			} else {
				return "redirect:/tip?tip=update-fail";
			}
		} else {
			return "redirect:/tip?tip=noauth";
		}
	}
	
	private boolean isNotBlank(String... str) {
		for (String string : str) {
			if(StringUtils.isEmpty(string)) {
				return false;
			}
		}
		return true;
	}
}

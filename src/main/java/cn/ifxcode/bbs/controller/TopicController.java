package cn.ifxcode.bbs.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.HtmlUtils;

import cn.ifxcode.bbs.bean.Page;
import cn.ifxcode.bbs.entity.Board;
import cn.ifxcode.bbs.entity.Classify;
import cn.ifxcode.bbs.entity.Navigation;
import cn.ifxcode.bbs.entity.Topic;
import cn.ifxcode.bbs.entity.User;
import cn.ifxcode.bbs.entity.UserValue;
import cn.ifxcode.bbs.service.BoardService;
import cn.ifxcode.bbs.service.ClassifyService;
import cn.ifxcode.bbs.service.NavigationService;
import cn.ifxcode.bbs.service.TopicService;
import cn.ifxcode.bbs.service.UserService;
import cn.ifxcode.bbs.utils.DateUtils;
import cn.ifxcode.bbs.utils.NumberUtils;

@Controller
@RequestMapping("/topic")
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
	
	@RequestMapping("/detail/{tid}/{pno}")
	public String toTopic(@PathVariable("tid")String tid, @PathVariable("pno")int pno, 
			@RequestParam(required = false, defaultValue = "1")int sort, 
			@RequestParam(required = false)Integer floor, 
			@RequestParam(required = false, defaultValue = "0")long uid, Model model, 
			HttpServletRequest request) {
		long topicId = NumberUtils.getAllNumber(tid);
		if(Long.toString(topicId).length() > 15) {
			return "redirect:/index";
		}
		Topic topic = topicService.getTopicByTopicId(topicId);
		if(topic != null) {
			topic.setTopicContent(HtmlUtils.htmlUnescape(topic.getTopicContent()));
			topic.setTopicCreateTime(DateUtils.dt14LongFormat(DateUtils.dt14FromStr(topic.getTopicCreateTime())));
			User user = userService.getUserById(topic.getUserId());
			UserValue userValue = userService.getUserValue(topic.getUserId());
			Classify classify = classifyService.getClassifyByCid(topic.getBoardId(), topic.getClassId());
			Navigation navigation = navigationService.getNavigation(topic.getNavId());
			Board board = boardService.getBoardByBoardId(topic.getNavId(), topic.getBoardId());
			StringBuilder url = new StringBuilder(request.getRequestURI());
			if(StringUtils.isNotBlank(request.getQueryString())) {
				url.append("?").append(request.getQueryString());
			}
			Page page = Page.newBuilder(pno, DEFAULT_PAGE_SIZE, url.toString());
			model.addAttribute("navigation", navigation);
			model.addAttribute("pboard", board);
			model.addAttribute("clas", classify);
			model.addAttribute("ui", user);
			model.addAttribute("uv", userValue);
			model.addAttribute("topic", topic);
			model.addAttribute("page", page);
			return "topic/topic";
		}
		logger.info("topic is not found");
		return "redirect:/index";
	}
	
}

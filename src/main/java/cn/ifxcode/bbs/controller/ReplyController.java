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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.HtmlUtils;

import cn.ifxcode.bbs.constant.BbsConstant;
import cn.ifxcode.bbs.entity.Board;
import cn.ifxcode.bbs.entity.Navigation;
import cn.ifxcode.bbs.entity.Reply;
import cn.ifxcode.bbs.entity.Topic;
import cn.ifxcode.bbs.service.BoardService;
import cn.ifxcode.bbs.service.GeneralService;
import cn.ifxcode.bbs.service.NavigationService;
import cn.ifxcode.bbs.service.ReplyService;
import cn.ifxcode.bbs.service.TopicService;
import cn.ifxcode.bbs.utils.FormValidate;

@Controller
public class ReplyController extends BaseUserController{

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Resource
	private ReplyService replyService;
	
	@Resource
	private TopicService topicService;
	
	@Resource
	private GeneralService generalService;
	
	@Resource
	private NavigationService navigationService;
	
	@Resource
	private BoardService boardService;
	
	@RequestMapping(value = "/board/{bid:\\d+}/topic/{tid:\\d+}/new/reply/do", method = RequestMethod.POST)
	public String doReply(HttpServletRequest request, @PathVariable("bid")int boardId, 
			@PathVariable("tid")long topicId, String uid, String rcontext, 
			@RequestParam(value = "pid", required = false, defaultValue = "0")String pid) {
		try {
			if(StringUtils.isEmpty(rcontext) && FormValidate.number(uid) && FormValidate.number(pid)) {
				return "redirect:/tip?tip=reply-fail";
			}
			Topic topic = topicService.getTopicByTopicId(topicId);
			if(topic == null) {
				return "redirect:/tip?tip=topic-notexists";
			} else {
				if(topic.getTopicInfo().getTopicIsReply() == 0) {
					long replyId = replyService.insertReply(request, topic.getBoardId(), topicId, Long.parseLong(uid), rcontext, Long.parseLong(pid));
					if(replyId > BbsConstant.OK) {
						generalService.saveCount("reply");
						return "redirect:/board/" + topic.getBoardId()+ "/topic/detail/" + topic.getTopicId() + "/gofloor?lastest=1";
					}
				} else {
					return "redirect:/tip?tip=reply-notreply";
				}
			}
		} catch(Exception e) {
			logger.error("回复失败 {topic:" + topicId + ", pid:" + pid + "}", e.getMessage());
			return "redirect:/tip?tip=reply-fail";
		}
		return "redirect:/tip?tip=reply-fail";
	}
	
	@RequestMapping(value = "/board/{bid:\\d+}/topic/{tid:\\d+}/reply/{rid:\\d+}/update", method = RequestMethod.GET)
	public String updateReply(HttpServletRequest request, @PathVariable("bid")int boardId, 
			@PathVariable("tid")long topicId, @PathVariable("rid")long replyId, Model model) {
		Reply reply = replyService.getReplyByReplyId(replyId);
		if(reply != null) {
			Topic topic = topicService.getTopicByTopicId(reply.getTopicId());
			if((topic.getTopicStatus() == 0 && topic.getTopicInfo().getTopicIsCheck() == 1 
					&& generalService.checkUpdate(request, reply.getUserId())) || generalService.authCheck(request)) {
				reply.setReplyContent(HtmlUtils.htmlUnescape(reply.getReplyContent()));
				reply.setTopic(topic);
				Navigation navigation = navigationService.getNavigation(topic.getNavId());
				Board board = boardService.getBoardByBoardId(topic.getNavId(), topic.getBoardId());
				model.addAttribute("reply", reply);
				model.addAttribute("navigation", navigation);
				model.addAttribute("pboard", board);
				return "post/reply-update";
			} else {
				return "redirect:/tip?tip=noauth";
			}
		}
		return "redirect:/tip?tip=reply-notexists";
	}
	
}

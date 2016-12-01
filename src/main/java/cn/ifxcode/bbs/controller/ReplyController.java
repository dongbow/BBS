package cn.ifxcode.bbs.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import cn.ifxcode.bbs.constant.BbsConstant;
import cn.ifxcode.bbs.entity.Topic;
import cn.ifxcode.bbs.service.ReplyService;
import cn.ifxcode.bbs.service.TopicService;
import cn.ifxcode.bbs.utils.NumberUtils;

@Controller
public class ReplyController {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Resource
	private ReplyService replyService;
	
	@Resource
	private TopicService topicService;
	
	@RequestMapping(value = "/board/{bid}/topic/{tid}/new/reply/do", method = RequestMethod.POST)
	public String doReply(HttpServletRequest request, @PathVariable("bid")String bid, 
			@PathVariable("tid")String tid, long uid, String rcontext, 
			@RequestParam(value = "pid", required = false, defaultValue = "0")long pid) {
		try {
			if(StringUtils.isEmpty(rcontext)) {
				return "redirect:/tip?tip=reply-fail";
			}
			long boardId = NumberUtils.getAllNumber(bid);
			if(Long.toString(boardId).length() > 10) {
				return "redirect:/tip?tip=board-notexists";
			}
			long topicId = NumberUtils.getAllNumber(tid);
			if(Long.toString(topicId).length() > 15) {
				return "redirect:/tip?tip=topic-notexists";
			}
			Topic topic = topicService.getTopicByTopicId(topicId);
			if(topic == null) {
				return "redirect:/tip?tip=topic-notexists";
			} else {
				if(topic.getTopicInfo().getTopicIsReply() == 0) {
					long replyId = replyService.insertReply(request, topic.getBoardId(), topicId, uid, rcontext, pid);
					if(replyId > BbsConstant.OK) {
						return "redirect:/board/" + topic.getBoardId()+ "/topic/detail/" + topic.getTopicId() + "?lastest=1";
					}
				} else {
					return "redirect:/tip?tip=reply-notreply";
				}
			}
		} catch(Exception e) {
			logger.error("回复失败 {topic:" + tid + ", pid:" + pid + "}", e.getMessage());
			return "redirect:/tip?tip=reply-fail";
		}
		return "redirect:/tip?tip=reply-fail";
	}
	
	
	
}

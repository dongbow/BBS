package cn.ifxcode.bbs.controller;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cn.ifxcode.bbs.service.MessageService;

@Controller
@RequestMapping("/home")
public class MessageController extends BaseUserController {

	@Resource
	private MessageService messageService;
	
	@RequestMapping("/message/list")
	public String list(@RequestParam(value = "type", required = false)String type, Model model) {
		if (StringUtils.isBlank(type)) {
			model.addAttribute("type", "list");
		} else {
			model.addAttribute("type", "notice");
		}
		return "home/message-system";
	}
	
	@RequestMapping("/message/topic")
	public String topic() {
		return "home/message-topic";
	}
	
	@RequestMapping("/message/letter")
	public String letter() {
		return "home/message-letter";
	}
	
}

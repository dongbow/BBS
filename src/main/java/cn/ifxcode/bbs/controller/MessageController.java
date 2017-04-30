package cn.ifxcode.bbs.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import cn.ifxcode.bbs.service.MessageService;

@Controller
public class MessageController {

	@Resource
	private MessageService messageService;
	
}

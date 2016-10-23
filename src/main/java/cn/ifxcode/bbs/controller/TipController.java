package cn.ifxcode.bbs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class TipController extends BaseUserController{

	@RequestMapping("/tip/nologin")
	public String getNoLoginTip() {
		return "tip/login_tip";
	}
	
	@RequestMapping("/tip/noauth")
	public String getNoAuthTip() {
		return "tip/auth_tip";
	}
	
	@RequestMapping("/tip")
	public String getSystemTips(@RequestParam(value = "tip", defaultValue = "index", required = false)String tip, 
			@RequestParam(value = "back", defaultValue = "index", required = false)String back, Model model) {
		if("index".equals(tip)) {
			return "redirect:/index";
		} else if("nologin".equals(tip)) {
			model.addAttribute("tip", "nologin");
			model.addAttribute("back", back);
		} else if("noauth".equals(tip)) {
			model.addAttribute("tip", "noauth");
		} else if("board-noauth".equals(tip)) {
			model.addAttribute("tip", "board-noauth");
		} else if("topic-noauth".equals(tip)) {
			model.addAttribute("tip", "topic-noauth");
		} else if("post-noauth".equals(tip)) {
			model.addAttribute("tip", "post-noauth");
		} else if("class-noauth".equals(tip)) {
			model.addAttribute("tip", "class-noauth");
		} else if("nav-notexists".equals(tip)) {
			model.addAttribute("tip", "nav-notexists");
		} else if("board-notexists".equals(tip)) {
			model.addAttribute("tip", "board-notexists");
		} else if("topic-notexists".equals(tip)) {
			model.addAttribute("tip", "topic-notexists");
		} else if("class-notexists".equals(tip)) {
			model.addAttribute("tip", "class-notexists");
		} else if("space-notexists".equals(tip)) {
			model.addAttribute("tip", "space-notexists");
		} else if("post-fail".equals(tip)) {
			model.addAttribute("tip", "post-fail");
		}  else if("reply-fail".equals(tip)) {
			model.addAttribute("tip", "reply-fail");
		}  else if("reply-noauth".equals(tip)) {
			model.addAttribute("tip", "reply-noauth");
		}  else if("reply-notreply".equals(tip)) {
			model.addAttribute("tip", "reply-notreply");
		} else {
			return "redirect:/index";
		}
		return "tip/system_tip";
	}
	
}

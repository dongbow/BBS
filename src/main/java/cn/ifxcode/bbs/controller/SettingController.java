package cn.ifxcode.bbs.controller;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/home")
public class SettingController extends BaseUserController{

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping("/{uid}/setting/profile")
	public String profile(@PathVariable("uid")String uid, 
			@RequestParam(required = false)String type, Model model) {
		if(StringUtils.isEmpty(type) || "info".equals(type)) {
			model.addAttribute("type", "info");
		} else if("headimg".equals(type)) {
			model.addAttribute("type", "headimg");
		} else if("password".equals(type)) {
			model.addAttribute("type", "password");
		} else if("email".equals(type)) {
			model.addAttribute("type", "email");
		} else if("privacy".equals(type)) {
			model.addAttribute("type", "privacy");
		} else {
			return "redirect:/index";
		}
		return "home/profile";
	}
	
	@RequestMapping("/{uid}/setting/credit")
	public String credit() {
		return "home/credit";
	}
	
	@RequestMapping("/{uid}/setting/usergroup")
	public String userGroup() {
		return "home/usergroup";
	}
	
}

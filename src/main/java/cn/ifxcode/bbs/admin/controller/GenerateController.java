package cn.ifxcode.bbs.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class GenerateController {

	@RequestMapping("/system/admin/index")
	public String toIndex() {
		return "admin/index";
	}
	
}

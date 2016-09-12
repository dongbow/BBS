package cn.ifxcode.bbs.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/system/admin/sysmanage")
public class SystemManageController {

	@RequestMapping("/user")
	public String toUserList() {
		return "sysmanage/user-list";
	}
	
}

package cn.ifxcode.bbs.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ChartController extends BaseController {

	@RequestMapping("/system/admin/chart")
	public String toChart() {
		return "admin/chart/chart";
	}
	
}

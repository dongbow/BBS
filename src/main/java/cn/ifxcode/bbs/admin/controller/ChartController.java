package cn.ifxcode.bbs.admin.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.ifxcode.bbs.service.GeneralService;

import com.alibaba.fastjson.JSONObject;

@Controller
public class ChartController extends BaseController {

	@Resource
	private GeneralService generalService;
	
	@RequestMapping("/system/admin/chart")
	public String toChart() {
		return "admin/chart/chart";
	}
	
	@ResponseBody
	@RequestMapping(value = "/system/admin/chart/data", method = RequestMethod.POST)
	public JSONObject chartData(@RequestParam(required = false, defaultValue = "7")int day, 
			@RequestParam(required = false)String start, @RequestParam(required = false)String end) {
		JSONObject object = generalService.getChartData(day, start, end);
		return object;
	}
	
}

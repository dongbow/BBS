package cn.ifxcode.bbs.admin.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.ifxcode.bbs.bean.Page;
import cn.ifxcode.bbs.bean.Result;
import cn.ifxcode.bbs.constant.BbsConstant;
import cn.ifxcode.bbs.entity.Backup;
import cn.ifxcode.bbs.service.BackupService;
import cn.ifxcode.bbs.utils.ParamsBuildUtils;

@Controller
@RequestMapping("/system/admin")
public class BackUpController extends BaseController {

	private static final int DEFAULT_PAGE_SIZE = 10;
	
	@Resource
	private BackupService backupService;
	
	@RequestMapping("/backup")
	public String toBackUp(@RequestParam(value="page", required = false, defaultValue = "1")int p, 
			HttpServletRequest request, Model model) {
		Page page = Page.newBuilder(p, DEFAULT_PAGE_SIZE, ParamsBuildUtils.createUrl(request));
		List<Backup> backs = backupService.searchBackups(page);
		model.addAttribute("backs", backs);
		model.addAttribute("page", page);
		return "admin/backup-list";
	}
	
	@RequestMapping("/backup/search")
	public String toBackUpSearch(String startTime, String endTime, 
			@RequestParam(value="page", required = false, defaultValue = "1")int p, 
			HttpServletRequest request, Model model) {
		Page page = Page.newBuilder(p, DEFAULT_PAGE_SIZE, ParamsBuildUtils.createUrl(request));
		List<Backup> backs = backupService.searchBackups(page, startTime, endTime);
		model.addAttribute("backs", backs);
		model.addAttribute("page", page);
		ParamsBuildUtils.createModel(model, request);
		return "admin/backup-list";
	}
	
	@ResponseBody
	@RequestMapping(value = "/backup/add", method = RequestMethod.POST)
	public Result addBack(@RequestParam(required = false)String name, String exec, 
			HttpServletRequest request) {
		Result result = null;
		if(BbsConstant.OK == backupService.addBackup(name, exec, request)) {
			result = new Result(BbsConstant.OK, "备份成功");
		} else {
			result = new Result(BbsConstant.ERROR, "备份失败");
		}
		return result;
	}
}

package cn.ifxcode.bbs.controller.admin;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
import cn.ifxcode.bbs.utils.BackUpUtils;
import cn.ifxcode.bbs.utils.DownloadUtils;
import cn.ifxcode.bbs.utils.ParamsBuildUtils;

@Controller
@RequestMapping("/system/admin")
public class BackUpController extends BaseController {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
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
	public String toBackUpSearch(String from, String to, 
			@RequestParam(value="page", required = false, defaultValue = "1")int p, 
			HttpServletRequest request, Model model) {
		Page page = Page.newBuilder(p, DEFAULT_PAGE_SIZE, ParamsBuildUtils.createUrl(request));
		List<Backup> backs = backupService.searchBackups(page, from, to);
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
	
	@ResponseBody
	@RequestMapping(value = "/backup/delete", method = RequestMethod.POST)
	public Result deleteBack(@RequestParam(value = "ids[]", required = false)String ids) {
		Result result = null;
		if(StringUtils.isNotBlank(ids)) {
			try {
				if(BbsConstant.OK == backupService.deleteBack(ids)) {
					result = new Result(BbsConstant.OK, "删除成功");
				} else {
					result = new Result(BbsConstant.ERROR, "删除失败");
				}
			} catch (Exception e) {
				result = new Result(BbsConstant.ERROR, e.getMessage());
			}
		} else {
			result = new Result(BbsConstant.ERROR, "删除失败");
		}
		return result;
	}
	
	@RequestMapping("/backup/download")
	public void download(String id, HttpServletResponse response) {
		Backup backup = backupService.getBackup(id);
		
		try {
			if (backup == null) {
				response.getWriter().print("404");
			} else {
				DownloadUtils.downloadLocal(backup.getUrl(), backup.getId() + ".sql", response);
			}
		} catch (IOException e) {
			// ignore
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "/backup/restore", method = RequestMethod.POST)
	public Result restore(String id) {
		if (StringUtils.isNotBlank(id)) {
			Backup backup = backupService.getBackup(id);
			if (backup == null) {
				return new Result(BbsConstant.ERROR, "备份文件不存在");
			}
			try {
				if (BackUpUtils.restore(backup.getUrl())) {
					return new Result(BbsConstant.OK, "恢复成功");
				}
			} catch (Exception e) {
				logger.error("恢复失败", e);
			}
		}
		return new Result(BbsConstant.ERROR, "恢复失败");
	}
}

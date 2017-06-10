package cn.ifxcode.bbs.controller.admin;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.ifxcode.bbs.bean.Page;
import cn.ifxcode.bbs.bean.Result;
import cn.ifxcode.bbs.constant.BbsConstant;
import cn.ifxcode.bbs.entity.ScheduleJob;
import cn.ifxcode.bbs.service.QuartzService;
import cn.ifxcode.bbs.utils.ParamsBuildUtils;

@Controller
@RequestMapping("/system/admin/quartz")
public class QuartzController extends BaseController {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	private static final Integer DEFAULT_PAGE_SIZE = 10;
	
	@Resource
	private QuartzService quartzService;
	
	@RequestMapping("/list")
	public String toQuartz(@RequestParam(value="page", required = false, defaultValue = "1")int p,
			HttpServletRequest request, Model model) {
		Page page = Page.newBuilder(p, DEFAULT_PAGE_SIZE, ParamsBuildUtils.createUrl(request));
		model.addAttribute("jobs", quartzService.getAllJobFromDB(page));
		model.addAttribute("page", page);
		return "admin/quartz/quartz-list";
	}
	
	@RequestMapping("/list/search")
	public String searchQuartz(@RequestParam(value="page", required = false, defaultValue = "1")int p, 
			String name, int status, HttpServletRequest request, Model model) {
		Page page = Page.newBuilder(p, DEFAULT_PAGE_SIZE, ParamsBuildUtils.createUrl(request));
		model.addAttribute("jobs", quartzService.getAllJobFromDB(page, name, status));
		model.addAttribute("page", page);
		ParamsBuildUtils.createModel(model, request);
		if(StringUtils.isNotBlank(name)) {
			model.addAttribute("name", name);
		}
		return "admin/quartz/quartz-list";
	}
	
	@RequestMapping("/history")
	public String history() {
		return "admin/quartz/quartz-history";
	}
	
	@RequestMapping(value = "/{type}", method = RequestMethod.GET)
	public String addPanel(@PathVariable(value = "type")String type, 
			@RequestParam(value = "id", required = false)Integer jobId, Model model) {
		if (type.equals("update")) {
			ScheduleJob job = quartzService.getJobById(jobId);
			model.addAttribute("job", job);
		}
		return "admin/quartz/quartz-panel";
	}
	
	@ResponseBody
	@RequestMapping(value = "/runnow", method = RequestMethod.POST)
	public Result runJobNow(long id) {
		Result result = null;
		try {
			ScheduleJob job = quartzService.getJobById(id);
			if(quartzService.runAJobNow(job) == BbsConstant.OK) {
				result = new Result(BbsConstant.OK, "任务执行成功");
			} else {
				result = new Result(BbsConstant.ERROR, "任务执行失败");
			}
		} catch (Exception e) {
			logger.error("run job now fail", e);
			result = new Result(BbsConstant.ERROR, "任务执行失败");
		}
		return result;
	}
	
	@ResponseBody
	@RequestMapping("/pause")
	public Result pause(long id) {
		Result result = null;
		try {
			ScheduleJob job = quartzService.getJobById(id);
			if (job != null) {
				if (quartzService.pauseJob(job) == BbsConstant.OK) {
					result = new Result(BbsConstant.OK, "任务暂停成功");
				} else {
					result = new Result(BbsConstant.ERROR, "任务暂停失败");
				}
			} else {
				result = new Result(BbsConstant.ERROR, "任务暂停失败");
			}
		} catch (Exception e) {
			logger.error("pause job fail", e);
			result = new Result(BbsConstant.ERROR, "任务暂停失败");
		}
		return result;
	}
	
	@ResponseBody
	@RequestMapping("/start")
	public Result resume(long id) {
		Result result = null;
		try {
			ScheduleJob job = quartzService.getJobById(id);
			if (job != null) {
				if (quartzService.resumeJob(job) == BbsConstant.OK) {
					result = new Result(BbsConstant.OK, "任务启动成功");
				} else {
					result = new Result(BbsConstant.ERROR, "任务启动失败");
				}
			} else {
				result = new Result(BbsConstant.ERROR, "任务启动失败");
			}
		} catch (Exception e) {
			logger.error("resume job fail", e);
			result = new Result(BbsConstant.ERROR, "任务启动失败");
		}
		return result;
	}
	
}

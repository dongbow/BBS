package cn.ifxcode.bbs.controller.admin;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.ifxcode.bbs.bean.Page;
import cn.ifxcode.bbs.bean.Result;
import cn.ifxcode.bbs.constant.BbsConstant;
import cn.ifxcode.bbs.enumtype.Audit;
import cn.ifxcode.bbs.enumtype.RoleSign;
import cn.ifxcode.bbs.service.BoardService;
import cn.ifxcode.bbs.service.NavigationService;
import cn.ifxcode.bbs.service.TopicService;
import cn.ifxcode.bbs.utils.ParamsBuildUtils;

@Controller
@RequestMapping("/system/admin/topicmanage")
public class TopicManageController extends BaseController {

	private static final Integer DEFAULT_PAGE_SIZE = 10;
	
	@Resource
	private TopicService topicService;
	
	@Resource
	private NavigationService navigationService;
	
	@Resource
	private BoardService boardService;
	
	@RequestMapping("/topiclist")
	public String toTopicList(@RequestParam(value="page", required = false, defaultValue = "1")int p,
			HttpServletRequest request, Model model) {
		Page page = Page.newBuilder(p, DEFAULT_PAGE_SIZE, ParamsBuildUtils.createUrl(request));
		model.addAttribute("topics", topicService.getTopicList(page, 0, 1));
		model.addAttribute("navs", navigationService.getAllNavigations());
		model.addAttribute("boards", boardService.getAllBoards());
		model.addAttribute("page", page);
		return "admin/topic/topic-list";
	}
	
	@RequestMapping("/audit")
	public String toTopicAudit(@RequestParam(value="page", required = false, defaultValue = "1")int p,
			HttpServletRequest request, Model model) {
		Page page = Page.newBuilder(p, DEFAULT_PAGE_SIZE, ParamsBuildUtils.createUrl(request));
		model.addAttribute("topics", topicService.getTopicList(page, 0, 0));
		model.addAttribute("navs", navigationService.getAllNavigations());
		model.addAttribute("boards", boardService.getAllBoards());
		model.addAttribute("page", page);
		return "admin/topic/topic-audit-list";
	}
	
	@RequestMapping("/audit/search")
	public String searchTopicAudit(@RequestParam(value="page", required = false, defaultValue = "1")int p, 
			String from, String to, @RequestParam(required = false, defaultValue = "0")long uid, 
			@RequestParam(required = false, defaultValue = "0")long tid, int gid, int bid, 
			HttpServletRequest request, Model model) {
		Page page = Page.newBuilder(p, DEFAULT_PAGE_SIZE, ParamsBuildUtils.createUrl(request));
		model.addAttribute("topics", topicService.getTopicList(page, from, to, uid, tid, gid, bid, 0, 0, 0));
		model.addAttribute("navs", navigationService.getAllNavigations());
		model.addAttribute("boards", boardService.getAllBoards());
		model.addAttribute("page", page);
		ParamsBuildUtils.createModel(model, request);
		return "admin/topic/topic-audit-list";
	}
	
	@ResponseBody
	@RequestMapping(value = "/audit/pass", method = RequestMethod.POST)
	public Result auditPass(@RequestParam(value = "ids[]")String ids) {
		Result result = null;
		if (StringUtils.isBlank(ids)) {
			return new Result(BbsConstant.ERROR, "参数错误");
		}
		if (BbsConstant.OK == topicService.audit(ids, Audit.PASS.getValue())) {
			result = new Result(BbsConstant.OK, "审核通过成功");
		} else {
			result = new Result(BbsConstant.ERROR, "审核通过失败");
		}
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value = "/audit/refause", method = RequestMethod.POST)
	public Result auditRefause(@RequestParam(value = "ids[]")String ids) {
		Result result = null;
		if (StringUtils.isBlank(ids)) {
			return new Result(BbsConstant.ERROR, "参数错误");
		}
		if (BbsConstant.OK == topicService.audit(ids, Audit.REFAUSE.getValue())) {
			result = new Result(BbsConstant.OK, "成功");
		} else {
			result = new Result(BbsConstant.ERROR, "失败");
		}
		return result;
	}
	
	@RequestMapping("/trash")
	public String toTopicTrash(@RequestParam(value="page", required = false, defaultValue = "1")int p,
			HttpServletRequest request, Model model) {
		Page page = Page.newBuilder(p, DEFAULT_PAGE_SIZE, ParamsBuildUtils.createUrl(request));
		model.addAttribute("topics", topicService.getTopicList(page, 1, 2));
		model.addAttribute("navs", navigationService.getAllNavigations());
		model.addAttribute("boards", boardService.getAllBoards());
		model.addAttribute("page", page);
		return "admin/topic/topic-trash-list";
	}
	
	@RequestMapping("/spec")
	public String toSpec(@RequestParam(value="page", required = false, defaultValue = "1")int p,
			HttpServletRequest request, Model model) {
		Page page = Page.newBuilder(p, DEFAULT_PAGE_SIZE, ParamsBuildUtils.createUrl(request));
		model.addAttribute("topics", topicService.getTopicSpecList(page, -1));
		model.addAttribute("navs", navigationService.getAllNavigations());
		model.addAttribute("boards", boardService.getAllBoards());
		model.addAttribute("page", page);
		return "admin/topic/topic-spec-list";
	}
	
	@RequestMapping("/spec/search")
	public String searchSpec(@RequestParam(value="page", required = false, defaultValue = "1")int p,
			String from, String to, @RequestParam(required = false, defaultValue = "0")long uid, 
			@RequestParam(required = false, defaultValue = "0")long tid, int navid, int bid, int type, 
			HttpServletRequest request, Model model) {
		Page page = Page.newBuilder(p, DEFAULT_PAGE_SIZE, ParamsBuildUtils.createUrl(request));
		model.addAttribute("topics", topicService.getTopicSpecList(page, -1));
		model.addAttribute("navs", navigationService.getAllNavigations());
		model.addAttribute("boards", boardService.getAllBoards());
		model.addAttribute("page", page);
		ParamsBuildUtils.createModel(model, request);
		return "admin/topic/topic-spec-list";
	}
	
	@ResponseBody
	@RequestMapping(value = "/spec/cream", method = RequestMethod.POST)
	public Result specCream(String id) {
		Result result = null;
		if (StringUtils.isBlank(id)) {
			return new Result(BbsConstant.ERROR, "参数错误");
		}
		if (BbsConstant.OK == topicService.cream(id, 1, RoleSign.ADMIN.getSign())) {
			result = new Result(BbsConstant.OK, "成功");
		} else {
			result = new Result(BbsConstant.ERROR, "失败");
		}
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value = "/spec/qxcream", method = RequestMethod.POST)
	public Result specQxCream(String id) {
		Result result = null;
		if (StringUtils.isBlank(id)) {
			return new Result(BbsConstant.ERROR, "参数错误");
		}
		if (BbsConstant.OK == topicService.cream(id, 0, RoleSign.ADMIN.getSign())) {
			result = new Result(BbsConstant.OK, "成功");
		} else {
			result = new Result(BbsConstant.ERROR, "失败");
		}
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value = "/spec/hot", method = RequestMethod.POST)
	public Result specHot(String id) {
		Result result = null;
		if (StringUtils.isBlank(id)) {
			return new Result(BbsConstant.ERROR, "参数错误");
		}
		if (BbsConstant.OK == topicService.hot(id, 1)) {
			result = new Result(BbsConstant.OK, "成功");
		} else {
			result = new Result(BbsConstant.ERROR, "失败");
		}
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value = "/spec/qxhot", method = RequestMethod.POST)
	public Result specQxHot(String id) {
		Result result = null;
		if (StringUtils.isBlank(id)) {
			return new Result(BbsConstant.ERROR, "参数错误");
		}
		if (BbsConstant.OK == topicService.hot(id, 0)) {
			result = new Result(BbsConstant.OK, "成功");
		} else {
			result = new Result(BbsConstant.ERROR, "失败");
		}
		return result;
	}
	
	@RequestMapping("/topsign")
	public String toTop(@RequestParam(value="page", required = false, defaultValue = "1")int p,
			HttpServletRequest request, Model model) {
		Page page = Page.newBuilder(p, DEFAULT_PAGE_SIZE, ParamsBuildUtils.createUrl(request));
		model.addAttribute("topics", topicService.getTopicTopList(page, -1));
		model.addAttribute("navs", navigationService.getAllNavigations());
		model.addAttribute("boards", boardService.getAllBoards());
		model.addAttribute("page", page);
		return "admin/topic/topic-top-list";
	}
	
	@RequestMapping("/closereply")
	public String toCloseReply(@RequestParam(value="page", required = false, defaultValue = "1")int p,
			HttpServletRequest request, Model model) {
		Page page = Page.newBuilder(p, DEFAULT_PAGE_SIZE, ParamsBuildUtils.createUrl(request));
		model.addAttribute("topics", topicService.getTopicCloseReplyList(page, 0, 0, 0));
		model.addAttribute("navs", navigationService.getAllNavigations());
		model.addAttribute("boards", boardService.getAllBoards());
		model.addAttribute("page", page);
		return "admin/topic/topic-close-list";
	}
	
}

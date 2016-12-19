package cn.ifxcode.bbs.admin.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cn.ifxcode.bbs.bean.Page;
import cn.ifxcode.bbs.service.BoardService;
import cn.ifxcode.bbs.service.ReplyService;
import cn.ifxcode.bbs.utils.ParamsBuildUtils;

@Controller
@RequestMapping("/system/admin/replymanage")
public class ReplyManageController extends BaseController {

	private static final Integer DEFAULT_PAGE_SIZE = 10;
	
	@Resource
	private ReplyService replyService;
	
	@Resource
	private BoardService boardService;
	
	@RequestMapping("/reply")
	public String toReplyList(@RequestParam(value="page", required = false, defaultValue = "1")int p,
			HttpServletRequest request, Model model) {
		Page page = Page.newBuilder(p, DEFAULT_PAGE_SIZE, ParamsBuildUtils.createUrl(request));
		model.addAttribute("replys", replyService.getReplyList(page, 0, 1));
		model.addAttribute("boards", boardService.getAllBoards());
		model.addAttribute("page", page);
		return "admin/reply/reply-list";
	}
	
	@RequestMapping("/audit")
	public String toAuditList(@RequestParam(value="page", required = false, defaultValue = "1")int p,
			HttpServletRequest request, Model model) {
		Page page = Page.newBuilder(p, DEFAULT_PAGE_SIZE, ParamsBuildUtils.createUrl(request));
		model.addAttribute("replys", replyService.getReplyList(page, 0, 0));
		model.addAttribute("boards", boardService.getAllBoards());
		model.addAttribute("page", page);
		return "admin/reply/reply-audit-list";
	}
	
	@RequestMapping("/trash")
	public String toTrashList(@RequestParam(value="page", required = false, defaultValue = "1")int p,
			HttpServletRequest request, Model model) {
		Page page = Page.newBuilder(p, DEFAULT_PAGE_SIZE, ParamsBuildUtils.createUrl(request));
		model.addAttribute("replys", replyService.getReplyList(page, 1, 2));
		model.addAttribute("boards", boardService.getAllBoards());
		model.addAttribute("page", page);
		return "admin/reply/reply-trash-list";
	}
	
}

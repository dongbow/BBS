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
import cn.ifxcode.bbs.entity.Reply;
import cn.ifxcode.bbs.enumtype.RoleSign;
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
	
	@RequestMapping("/reply/search")
	public String searchReplyList(String from, String to, 
			@RequestParam(defaultValue = "0")long uid, 
			@RequestParam(defaultValue = "0")long tid, int bid, 
			@RequestParam(value="page", required = false, defaultValue = "1")int p,
			HttpServletRequest request, Model model) {
		Page page = Page.newBuilder(p, DEFAULT_PAGE_SIZE, ParamsBuildUtils.createUrl(request));
		model.addAttribute("replys", replyService.getReplyList(page, 0, 1, from, to, uid, tid, bid));
		model.addAttribute("boards", boardService.getAllBoards());
		model.addAttribute("page", page);
		ParamsBuildUtils.createModel(model, request);
		return "admin/reply/reply-list";
	}
	
	@ResponseBody
	@RequestMapping(value = "/reply/delete", method = RequestMethod.POST)
	public Result deleteReply(@RequestParam("ids[]")String ids, String reason) {
		Result result = null;
		if(StringUtils.isNotBlank(ids)) {
			if(BbsConstant.OK == replyService.deleteReply(ids, reason, "admin")) {
				result = new Result(BbsConstant.OK, "删除成功, 可至回收站恢复");
			} else {
				result = new Result(BbsConstant.ERROR, "删除失败");
			}
		} else {
			result = new Result(BbsConstant.ERROR, "删除失败");
		}
		return result;
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String toUpdate(long id, Model model) {
		Reply reply = replyService.getReplyByReplyId(id);
		model.addAttribute("reply", reply);
		return "admin/reply/reply-panel";
	}
	
	@ResponseBody
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public Result updateReply(long id, String content, HttpServletRequest request) {
		Result result = null;
		if(StringUtils.isNotBlank(content)) {
			if(replyService.updateReply(id, content, request) == BbsConstant.OK) {
				result = new Result(BbsConstant.OK, "修改成功");
			} else {
				result = new Result(BbsConstant.ERROR, "修改失败");
			}
		} else {
			result = new Result(BbsConstant.ERROR, "修改失败");
		}
		return result;
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
	
	@RequestMapping("/trash/search")
	public String searchTrashList(String from, String to, 
			@RequestParam(defaultValue = "0")long uid, 
			@RequestParam(defaultValue = "0")long tid, int bid, 
			@RequestParam(value="page", required = false, defaultValue = "1")int p,
			HttpServletRequest request, Model model) {
		Page page = Page.newBuilder(p, DEFAULT_PAGE_SIZE, ParamsBuildUtils.createUrl(request));
		model.addAttribute("replys", replyService.getReplyList(page, 1, 2, from, to, uid, tid, bid));
		model.addAttribute("boards", boardService.getAllBoards());
		model.addAttribute("page", page);
		ParamsBuildUtils.createModel(model, request);
		return "admin/reply/reply-trash-list";
	}
	
	@ResponseBody
	@RequestMapping(value = "/trash/restore", method = RequestMethod.POST)
	public Result trashRestore(@RequestParam("ids[]")String ids) {
		Result result = null;
		if(StringUtils.isNotBlank(ids)) {
			if(replyService.restore(ids, RoleSign.ADMIN.getSign()) == BbsConstant.OK) {
				result = new Result(BbsConstant.OK, "恢复成功");
			} else {
				result = new Result(BbsConstant.ERROR, "恢复失败");
			}
		} else {
			result = new Result(BbsConstant.ERROR, "恢复失败");
		}
		return result;
	}
	
	@RequestMapping("/report")
	public String report(@RequestParam(value="page", required = false, defaultValue = "1")int p,
			HttpServletRequest request, Model model) {
		return null;
	}
}

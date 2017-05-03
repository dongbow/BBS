package cn.ifxcode.bbs.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.ifxcode.bbs.bean.CookieBean;
import cn.ifxcode.bbs.bean.Page;
import cn.ifxcode.bbs.bean.Result;
import cn.ifxcode.bbs.constant.BbsConstant;
import cn.ifxcode.bbs.constant.BbsErrorCode;
import cn.ifxcode.bbs.entity.User;
import cn.ifxcode.bbs.entity.UserFriends;
import cn.ifxcode.bbs.service.UserService;
import cn.ifxcode.bbs.utils.FormValidate;
import cn.ifxcode.bbs.utils.ParamsBuildUtils;

@Controller
@RequestMapping("/home")
public class FriendsController extends BaseUserController {

	private final int PAGE_SIZE_DEFAULT = 12;
	
	@Resource
	private UserService userService;
	
	Result result = null;
	
	@ResponseBody
	@RequestMapping(value = "/friends/add", method = RequestMethod.POST)
	public Result addFriend(String recUid, String recName, HttpServletRequest request) {
		if(FormValidate.number(recUid) && StringUtils.isNotBlank(recUid) && StringUtils.isNotBlank(recName)) {
			if (Long.parseLong(recUid) == userService.getUserIdFromCookie(request)) {
				return new Result(BbsConstant.ERROR, "不允许添加自己为好友");
			}
			User user = userService.getUserById(Long.parseLong(recUid));
			if(user != null && user.getUserPrivacy().getIsAddFriend() == 0) {
				int row = userService.addFriendRequest(Long.parseLong(recUid), recName, request);
				if(row == BbsConstant.OK) {
					result = new Result(BbsConstant.OK, "加好友请求发送成功");
				} else if(row == BbsErrorCode.FRIEND_REPEAT) {
					result = new Result(BbsErrorCode.FRIEND_REPEAT, BbsErrorCode.getDescribe(BbsErrorCode.FRIEND_REPEAT));
				} else {
					result = new Result(BbsConstant.ERROR, "添加失败");
				}
			} else {
				result = new Result(BbsConstant.ERROR, "对方不允许加好友");
			}
		} else {
			result = new Result(BbsConstant.ERROR, "添加失败");
		}
		return result;
	}
	
	@RequestMapping("/friends/list")
	public String getFriendsList(@RequestParam(value = "page", required = false, defaultValue = "1")String pageNo, 
			HttpServletRequest request, Model model) {
		CookieBean bean = userService.getCookieBeanFromCookie(request);
		if(!FormValidate.number(pageNo) || Integer.parseInt(pageNo) <= 0) {pageNo = "1";}
		Page page = Page.newBuilder(Integer.parseInt(pageNo), 20, ParamsBuildUtils.createUrl(request));
		List<UserFriends> friends = userService.getFriendsList(bean.getUser_id(), page);
		model.addAttribute("page", page);
		model.addAttribute("friends", friends);
		return "home/friends-list";
	}
	
	@ResponseBody
	@RequestMapping(value = "/friends/delete", method = RequestMethod.POST)
	public Result deleteFriends(@RequestParam(value = "ids[]")String ids) {
		if(StringUtils.isNotBlank(ids)) {
			if(BbsConstant.OK == userService.dealFriendStatus("delete", ids)) {
				result = new Result(BbsConstant.OK, "删除好友成功");
			} else {
				result = new Result(BbsConstant.ERROR, "删除好友失败，请重试");
			}
		} else {
			result = new Result(BbsConstant.ERROR, "至少选择一个选项");
		}
		return result;
	}
	
	@RequestMapping("/friends/request")
	public String getFriendsRequest(@RequestParam(value = "page", required = false, defaultValue = "1")String pageNo, 
			@RequestParam(required = false, defaultValue="request")String type, HttpServletRequest request, Model model) {
		CookieBean bean = userService.getCookieBeanFromCookie(request);
		if(!validType(type)) {
			return "redirect:/index";
		}
		if(type.equals("request")) {
			if(!FormValidate.number(pageNo) || Integer.parseInt(pageNo) <= 0) {pageNo = "1";}
			Page page = Page.newBuilder(Integer.parseInt(pageNo), PAGE_SIZE_DEFAULT, ParamsBuildUtils.createUrl(request));
			List<UserFriends> friends = userService.getAllFriendsRequest(bean.getUser_id(), page);
			model.addAttribute("page", page);
			model.addAttribute("friends", friends);
			model.addAttribute("type", "request");
		} else {
			model.addAttribute("key", request.getParameter("key"));
			if (StringUtils.isNotBlank(request.getParameter("key"))) {
				List<UserFriends>  friends = userService.findUserToAddFriend(request.getParameter("key"), request);
				if (friends != null && friends.size() > 0) {
					model.addAttribute("friends", friends);
				}
			}
			model.addAttribute("type", "add");
		}
		return "home/friends-request";
	}
	
	@ResponseBody
	@RequestMapping(value = "/friends/add/{status}", method = RequestMethod.POST)
	public Result dealStatus(@PathVariable("status")String status, String id) {
		if(FormValidate.number(id) && StringUtils.isNotBlank(status)) {
			int row = userService.dealFriendStatus(status, id);
			if(row == BbsConstant.OK) {
				result = new Result(BbsConstant.OK, status.equals("pass") ? "已添加" : "已拒绝");
			} else {
				result = new Result(BbsConstant.ERROR, "处理失败");
			}
		} else {
			result = new Result(BbsConstant.ERROR, "处理失败");
		}
		return result;
	}
	
	private boolean validType(String type) {
		if(type.equals("request") || type.equals("add")) {
			return true;
		}
		return false;
	}
	
}

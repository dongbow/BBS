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
import cn.ifxcode.bbs.utils.NumberUtils;
import cn.ifxcode.bbs.utils.ParamsBuildUtils;

@Controller
@RequestMapping("/home")
public class FriendsController {

	private final int PAGE_SIZE_DEFAULT = 15;
	
	@Resource
	private UserService userService;
	
	Result result = null;
	
	@ResponseBody
	@RequestMapping(value = "/friends/add", method = RequestMethod.POST)
	public Result addFriend(String recUid, String recName, HttpServletRequest request) {
		long recUserId = NumberUtils.getAllNumber(recUid);
		if(recUserId != 0 && StringUtils.isNotBlank(recUid) && StringUtils.isNotBlank(recName)) {
			User user = userService.getUserById(recUserId);
			if(user != null && user.getUserPrivacy().getIsAddFriend() == 0) {
				int row = userService.addFriend(recUserId, recName, request);
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
	public String getFriendsList(@RequestParam(value = "page", required = false, defaultValue = "1")int pageNo, HttpServletRequest request, Model model) {
		CookieBean bean = userService.getCookieBeanFromCookie(request);
		Page page = Page.newBuilder(pageNo, 20, ParamsBuildUtils.createUrl(request));
		List<UserFriends> friends = userService.getFriendsList(bean.getUser_id(), page);
		model.addAttribute("page", page);
		model.addAttribute("friends", friends);
		return "home/friend-list";
	}
	
	@ResponseBody
	@RequestMapping(value = "/friend/delete", method = RequestMethod.POST)
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
	
	@RequestMapping("/friend/request")
	public String getFriendsRequest(@RequestParam(value = "page", required = false, defaultValue = "1")int pageNo, 
			@RequestParam(required = false, defaultValue="request")String type, HttpServletRequest request, Model model) {
		CookieBean bean = userService.getCookieBeanFromCookie(request);
		if(!this.validType(type)) {
			return "redirect:/index";
		}
		if(type.equals("request")) {
			Page page = Page.newBuilder(pageNo, PAGE_SIZE_DEFAULT, ParamsBuildUtils.createUrl(request));
			List<UserFriends> friends = userService.getAllFriendsRequest(bean.getUser_id(), page);
			model.addAttribute("page", page);
			model.addAttribute("friends", friends);
			model.addAttribute("type", "request");
		} else {
			model.addAttribute("type", "add");
		}
		return "home/request";
	}
	
	@ResponseBody
	@RequestMapping(value = "/friends/add/{status}", method = RequestMethod.POST)
	public Result dealStatus(@PathVariable("status")String status, String id) {
		long friendId = NumberUtils.getAllNumber(id);
		if(friendId != 0 && StringUtils.isNotBlank(status)) {
			int row = userService.dealFriendStatus(status, Long.toString(friendId));
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

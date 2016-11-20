package cn.ifxcode.bbs.controller;

import java.util.Collections;
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
import cn.ifxcode.bbs.entity.UserFavorite;
import cn.ifxcode.bbs.service.UserService;
import cn.ifxcode.bbs.utils.NumberUtils;
import cn.ifxcode.bbs.utils.ParamsBuildUtils;

@Controller
@RequestMapping("/home")
public class FavoriteController extends BaseUserController {

	private final int PAGE_SIZE_DEFAULT = 10;
	
	@Resource
	private UserService userService;
	
	@ResponseBody
	@RequestMapping(value = "/favorite/add", method = RequestMethod.POST)
	public Result doFavorite(String id1, String id2, String sign, String name, HttpServletRequest request) {
		Result result = null;
		CookieBean cookieBean = userService.checkIsLogin(request);
		if(cookieBean != null) { 
			long needId1 = NumberUtils.getAllNumber(id1);
			long needId2 = NumberUtils.getAllNumber(id2);
			if(needId1 != 0 && needId2 != 0 && StringUtils.isNotBlank(sign) && StringUtils.isNotBlank(name)) {
				int row = userService.addFavorite(needId1, needId2, sign, name, request);
				if(row == BbsConstant.OK) {
					result = new Result(BbsConstant.OK, "收藏成功");
				} else if(row == BbsErrorCode.FAVORITE_REPEAT) {
					result = new Result(BbsErrorCode.FAVORITE_REPEAT, BbsErrorCode.getDescribe(BbsErrorCode.FAVORITE_REPEAT));
				} else {
					result = new Result(BbsConstant.ERROR, "收藏失败，请重试");
				}
			} else {
				result = new Result(BbsConstant.ERROR, "收藏失败，请重试");
			}
		} else {
			result = new Result(BbsErrorCode.NOT_LOGIN, BbsErrorCode.getDescribe(BbsErrorCode.NOT_LOGIN));
		}
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value = "/favorite/cancel", method = RequestMethod.POST)
	public Result cancelFavorite(@RequestParam(value = "ids[]")String ids) {
		Result result = null;
		if(StringUtils.isNotBlank(ids)) {
			if(BbsConstant.OK == userService.cancelFavorite(ids)) {
				result = new Result(BbsConstant.OK, "取消收藏成功");
			} else {
				result = new Result(BbsConstant.ERROR, "取消收藏失败，请重试");
			}
		} else {
			result = new Result(BbsConstant.ERROR, "至少选择一个选项");
		}
		return result;
	}
	
	@RequestMapping("/favorite/{type}")
	public String getFavoriteList(@RequestParam(value = "page", required = false, defaultValue = "1")int pageNo, 
			@PathVariable("type")String type, HttpServletRequest request, Model model) {
		if(!validType(type)) {
			return "redirect:/index";
		}
		CookieBean bean = userService.getCookieBeanFromCookie(request);
		Page page = Page.newBuilder(pageNo, PAGE_SIZE_DEFAULT, ParamsBuildUtils.createUrl(request));
		List<UserFavorite> favorites = Collections.emptyList();
		if(type.equals("topic")) {
			favorites = userService.getAllFavorites(bean.getUser_id(), page, 1);
		} else {
			favorites = userService.getAllFavorites(bean.getUser_id(), page, 2);
		}
		model.addAttribute("page", page);
		model.addAttribute("favorites", favorites);
		return "home/favorite";
	}

	private boolean validType(String type) {
		if(type.equals("topic") || type.equals("board")) {
			return true;
		}
		return false;
	}
}

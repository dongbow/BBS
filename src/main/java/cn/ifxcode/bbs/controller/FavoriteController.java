package cn.ifxcode.bbs.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.ifxcode.bbs.bean.CookieBean;
import cn.ifxcode.bbs.bean.Result;
import cn.ifxcode.bbs.constant.BbsConstant;
import cn.ifxcode.bbs.constant.BbsErrorCode;
import cn.ifxcode.bbs.service.UserService;
import cn.ifxcode.bbs.utils.NumberUtils;

@Controller
@RequestMapping("/home")
public class FavoriteController {

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
	public Result cancelFavorite(String ids) {
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
	
}

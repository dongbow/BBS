package cn.ifxcode.bbs.controller;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ltang.redis.service.RedisObjectMapService;

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
import cn.ifxcode.bbs.entity.GoldHistory;
import cn.ifxcode.bbs.entity.SwfArea;
import cn.ifxcode.bbs.entity.User;
import cn.ifxcode.bbs.entity.UserInfo;
import cn.ifxcode.bbs.exception.BbsException;
import cn.ifxcode.bbs.service.FileService;
import cn.ifxcode.bbs.service.GeneralService;
import cn.ifxcode.bbs.service.GoldExperienceService;
import cn.ifxcode.bbs.service.UserService;
import cn.ifxcode.bbs.utils.CookieUtils;
import cn.ifxcode.bbs.utils.FormValidate;

@Controller
@RequestMapping("/home")
public class SettingController extends BaseUserController{

	@Resource
	private UserService userService;
	
	@Resource
	private GeneralService generalService;
	
	@Resource
	private RedisObjectMapService redisObjectMapService;
	
	@Resource
	private GoldExperienceService goldExperienceService;
	
	@Resource
	private FileService fileService;
	
	@RequestMapping("/setting/profile")
	public String profile(@RequestParam(required = false)String type, Model model, 
			HttpServletRequest request) {
		CookieBean bean = userService.getCookieBeanFromCookie(request);
		User user = userService.getUserByIdFromRedis(Long.toString(bean.getUser_id()));
		if(StringUtils.isEmpty(type) || "info".equals(type)) {
			List<SwfArea> provinces = generalService.getAllProvinces();;
			List<SwfArea> citys = null;
			if(user != null) {
				if(StringUtils.isNotBlank(user.getUserInfo().getUserCity())) {
					citys = generalService.getCitys(user.getUserInfo().getUserProvince());
					model.addAttribute("citys", citys);
				}
			}
			model.addAttribute("provinces", provinces);
			model.addAttribute("type", "info");
		} else if("headimg".equals(type)) {
			model.addAttribute("type", "headimg");
		} else if("password".equals(type)) {
			model.addAttribute("type", "password");
		} else if("email".equals(type)) {
			model.addAttribute("type", "email");
		} else if("privacy".equals(type)) {
			model.addAttribute("type", "privacy");
		} else {
			return "redirect:/index";
		}
		model.addAttribute("huser", user);
		return "home/setting-profile";
	}

	@RequestMapping("/setting/credit")
	public String credit(HttpServletRequest request, Model model) {
		Page page = Page.newBuilder(1, 10, request.getRequestURI() + "/get");
		long uid = userService.getUserIdFromCookie(request);
		List<GoldHistory> golds = goldExperienceService.getUserGoldsByUid(page, null, null, uid);
		model.addAttribute("page", page);
		model.addAttribute("golds", golds);
		return "home/setting-credit";
	}
	
	@ResponseBody
	@RequestMapping("/setting/credit/get")
	public Result getGold(@RequestParam(value = "page", required = false, defaultValue = "1")String pno, 
			HttpServletRequest request) {
		Result result = null;
		int pageNo = 1;
		if (StringUtils.isNotBlank(pno) && FormValidate.number(pno)) {
			pageNo = Integer.parseInt(pno);
		}
		Page page = Page.newBuilder(pageNo, 10, request.getRequestURI());
		long uid = userService.getUserIdFromCookie(request);
		List<GoldHistory> golds = goldExperienceService.getUserGoldsByUid(page, null, null, uid);
		result = new Result(BbsConstant.OK, "success", golds);
		return result;
	}
	
	@RequestMapping("/setting/usergroup")
	public String userGroup() {
		return "home/setting-usergroup";
	}
	
	@ResponseBody
	@RequestMapping("/get/citys/{pid}")
	public List<SwfArea> getCitys(@PathVariable("pid")String pid) {
		List<SwfArea> citys = generalService.getCitys(pid);
		return citys;
	}
	
	@ResponseBody
	@RequestMapping(value = "/setting/profile/update/privacy", method = RequestMethod.POST)
	public Result updatePrivacy(int ispublic, int isaddfriend, int ispublicfriend, 
			int ispublictopic, int ispublicreply, HttpServletRequest request) {
		Result result = null;
		if(userService.updateUserPrivacy(ispublic, isaddfriend, ispublicfriend, 
				ispublictopic, ispublicreply, request) == BbsConstant.OK) {
			result = new Result(BbsConstant.OK, "修改成功");
		} else {
			result = new Result(BbsConstant.ERROR, "修改失败");
		}
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value = "/setting/profile/update/email", method = RequestMethod.POST)
	public Result updateEmail(String omail, String nmail, HttpServletRequest request) {
		Result result = null;
		if(StringUtils.isNotBlank(omail) && StringUtils.isNotBlank(nmail)) {
			if(FormValidate.email(omail, nmail)) {
				if(userService.vaildEmail(omail, request) == BbsConstant.OK) {
					if(userService.valueCheck("email", nmail) == 0) {
						if(userService.updateUserEmail(nmail, request) == BbsConstant.OK) {
							userService.updateUserToRedis(request, nmail, null);
							result = new Result(BbsConstant.OK, "邮箱更新成功");
						} else {
							result = new Result(BbsConstant.ERROR, "邮箱更新失败，请重试");
						}
					} else {
						result = new Result(BbsConstant.ERROR, "邮箱被占用，请更换");
					}
				} else {
					result = new Result(BbsConstant.ERROR, "当前邮箱错误");
				}
			} else {
				result = new Result(BbsConstant.ERROR, "邮箱格式错误");
			}
		} else {
			result = new Result(BbsConstant.ERROR, "邮箱不能为空");
		}
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value = "/setting/profile/update/password", method = RequestMethod.POST)
	public Result updatePassword(String opwd, String npwd, String rnpwd, 
			HttpServletRequest request, HttpServletResponse response) {
		Result result = null;
		if(StringUtils.isNotBlank(opwd) && StringUtils.isNotBlank(npwd) && StringUtils.isNotBlank(rnpwd)) {
			if(userService.vaildPassword(request, opwd) == BbsConstant.OK) {
				if(userService.updatePassword(npwd, request) == BbsConstant.OK) {
					response.addCookie(CookieUtils.makeCookieExpire(CookieUtils.CRED_LOCAL_SESS, null, BbsConstant.DOMAIN));
					result = new Result(BbsConstant.OK, "密码更新成功，请重新登录", BbsConstant.SIMPLE_LOGIN);
				} else {
					result = new Result(BbsConstant.ERROR, "密码更新失败，请重试");
				}
			} else {
				result = new Result(BbsConstant.ERROR, "原密码错误");
			}
		} else {
			result = new Result(BbsConstant.ERROR, "密码不能为空");
		}
		return result;
	}
	
	@RequestMapping("/setting/profile/update/headimg")
	public void updateHeadImg(HttpServletRequest request, HttpServletResponse response) {
		try {
			String pic = request.getParameter("pic1");
			if (StringUtils.isBlank(pic)) {
				throw new BbsException("图片为空");
			}
			String path = fileService.uploadHeadImg(pic);
			if (StringUtils.isBlank(path)) {
				throw new BbsException("上传失败");
			}
			userService.updateHeadImg(request, path);
			response.getWriter().write("{\"status\":1,\"picUrl\":\""+path+"\"}");
		} catch (Exception e) {
			try {
				response.getWriter().write("{\"status\":0,\"picUrl\":\"\"}");
			} catch (IOException e1) {
				e1.printStackTrace();
			}
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "/setting/profile/update/info", method = RequestMethod.POST)
	public Result updateInfo(@RequestParam(required = false)String nickName, 
			@RequestParam(required = false)String sex, @RequestParam(required = false)String birthday, 
			@RequestParam(required = false)String province, @RequestParam(required = false)String city, 
			@RequestParam(required = false)String qq, @RequestParam(required = false)String phonenumber, 
			@RequestParam(required = false)String userlikes, @RequestParam(required = false)String signature, 
			HttpServletRequest request) {
		Result result = null;
		try {
			long uid = userService.getUserIdFromCookie(request);
			User user = userService.getUserByIdFromRedis(Long.toString(uid));
			if (StringUtils.isNotBlank(nickName)) {
				if (!StringUtils.equals(user.getUserAccess().getUserNickname(), nickName)) {
					boolean isUse = userService.validNickname(nickName);
					if (!isUse) {
						throw new BbsException("昵称不可用");
					}
					userService.updateNickname(nickName, uid);
				}
			}
			UserInfo userInfo = new UserInfo();
			userInfo.setUserId(uid);
			if (StringUtils.isNotBlank(sex)) {
				if (!FormValidate.number(sex, 0, 1, 2)) {
					throw new BbsException("性别错误");
				}
				userInfo.setUserSex(Integer.parseInt(sex));
			}
			if (StringUtils.isNotBlank(birthday)) {
				userInfo.setUserBirth(birthday);
			}
			if (StringUtils.isNotBlank(province)) {
				try {
					Long.parseLong(province);
					userInfo.setUserProvince(province);
				} catch (Exception e) {
					throw new BbsException("省份错误");
				}
			}
			if (StringUtils.isNotBlank(city)) {
				try {
					Long.parseLong(city);
					userInfo.setUserCity(city);
				} catch (Exception e) {
					throw new BbsException("城市错误");
				}
			}
			if (StringUtils.isNotBlank(qq)) {
				if (!FormValidate.number(qq)) {
					throw new BbsException("QQ错误");
				}
				userInfo.setUserQq(qq);
			}
			if (StringUtils.isNotBlank(phonenumber)) {
				if (!FormValidate.number(phonenumber)) {
					throw new BbsException("号码错误");
				}
				userInfo.setUserPhone(phonenumber);
			}
			if (StringUtils.isNotBlank(userlikes)) {
				userlikes = userlikes.replace("\n", ",");
				userInfo.setUserLike(userlikes);
			}
			if (StringUtils.isNotBlank(signature)) {
				signature = signature.replace("\n", ";");
				userInfo.setUserSign(signature);
			}
			userService.updateUserInfo(userInfo);
			userService.refreshUser(uid);
			result = new Result(BbsConstant.OK, "更新成功");
		} catch (Exception e) {
			result = new Result(BbsConstant.ERROR, e.getMessage());
		}
		return result;
		
	}
	
}

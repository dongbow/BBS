package cn.ifxcode.bbs.admin.controller;

import java.util.List;

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
import cn.ifxcode.bbs.entity.HomeImage;
import cn.ifxcode.bbs.entity.QuickNavigation;
import cn.ifxcode.bbs.entity.Recommend;
import cn.ifxcode.bbs.entity.Topic;
import cn.ifxcode.bbs.enumtype.RoleSign;
import cn.ifxcode.bbs.service.HomeImageService;
import cn.ifxcode.bbs.service.QuickNavigationService;
import cn.ifxcode.bbs.service.RecommendService;
import cn.ifxcode.bbs.service.TopicService;
import cn.ifxcode.bbs.utils.FormValidate;
import cn.ifxcode.bbs.utils.ParamsBuildUtils;

@Controller
@RequestMapping("/system/admin/home")
public class HomeManageController extends BaseController {

	private static final int DEFAULT_PAGE_SIZE = 10;
	
	@Resource
	private HomeImageService homeImageService;
	
	@Resource
	private QuickNavigationService quickNavigationService;
	
	@Resource
	private RecommendService recommendService;
	
	@Resource
	private TopicService topicService;
	
	@RequestMapping("/image")
	public String toImage(@RequestParam(value="page", required = false, defaultValue = "1")int p, 
			HttpServletRequest request, Model model) {
		Page page = Page.newBuilder(p, DEFAULT_PAGE_SIZE, ParamsBuildUtils.createUrl(request));
		List<HomeImage> images = homeImageService.searchImages(page);
		model.addAttribute("images", images);
		model.addAttribute("page", page);
		return "admin/homemanage/homeimage-list";
	}
	
	@RequestMapping(value = "/image/add", method = RequestMethod.GET)
	public String toImageAdd() {
		return "admin/homemanage/homeimage-panel";
	}
	
	@ResponseBody
	@RequestMapping(value = "/image/add", method = RequestMethod.POST)
	public Result addImage(String title, String link, String url, int way, int sort, int status) {
		Result result = null;
		if(FormValidate.stringUtils(title, link, url)) {
			int row = homeImageService.addImage(title, link, url, way, sort, status);
			if(row == BbsConstant.OK) {
				result = new Result(BbsConstant.OK, "添加成功");
			} else {
				result = new Result(BbsConstant.ERROR, "添加失败");
			}
		} else {
			result = new Result(BbsConstant.ERROR, "添加失败");
		}
		return result;
	}
	
	@RequestMapping(value = "/image/update", method = RequestMethod.GET)
	public String toImageUpdate(int id, Model model) {
		model.addAttribute("img", homeImageService.getHomeImage(id));
		return "admin/homemanage/homeimage-panel";
	}
	
	@ResponseBody
	@RequestMapping(value = "/image/update", method = RequestMethod.POST)
	public Result imageUpdate(int id, String title, String link, String url, int way, int sort, int status) {
		Result result = null;
		if(FormValidate.stringUtils(title, link, url)) {
			int row = homeImageService.updateImage(id, title, link, url, way, sort, status);
			if(row == BbsConstant.OK) {
				result = new Result(BbsConstant.OK, "更新成功");
			} else {
				result = new Result(BbsConstant.ERROR, "更新失败");
			}
		} else {
			result = new Result(BbsConstant.ERROR, "更新失败");
		}
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value = "/image/delete", method = RequestMethod.POST)
	public Result imageDelete(@RequestParam("ids[]")String ids) {
		Result result = null;
		if(StringUtils.isNotBlank(ids)) {
			if(homeImageService.deleteImage(ids) == BbsConstant.OK) {
				result = new Result(BbsConstant.OK, "删除成功");
			} else {
				result = new Result(BbsConstant.ERROR, "删除失败");
			}
		} else {
			result = new Result(BbsConstant.ERROR, "删除失败");
		}
		return result;
	}
	
	@RequestMapping("/quick")
	public String toQuick(@RequestParam(value="page", required = false, defaultValue = "1")int p, 
			HttpServletRequest request, Model model) {
		Page page = Page.newBuilder(p, DEFAULT_PAGE_SIZE, ParamsBuildUtils.createUrl(request));
		List<QuickNavigation> quickNavigations = quickNavigationService.getAllQuickNavigations(page);
		model.addAttribute("quickNavigations", quickNavigations);
		model.addAttribute("page", page);
		return "admin/homemanage/quicknavigation-list";
	}
	
	@RequestMapping(value = "/quick/add", method = RequestMethod.GET)
	public String toQuickAdd() {
		return "admin/homemanage/quicknavigation-panel";
	}
	
	@ResponseBody
	@RequestMapping(value = "/quick/add", method = RequestMethod.POST)
	public Result addQuick(String name, String link, String color, int sort, int status) {
		Result result = null;
		if(FormValidate.stringUtils(name, link, color)) {
			int row = quickNavigationService.addQuick(name, link, color, sort, status);
			if(row == BbsConstant.OK) {
				result = new Result(BbsConstant.OK, "添加成功");
			} else {
				result = new Result(BbsConstant.ERROR, "添加失败");
			}
		} else {
			result = new Result(BbsConstant.ERROR, "添加失败");
		}
		return result;
	}
	
	@RequestMapping(value = "/quick/update", method = RequestMethod.GET)
	public String toQuickUpdate(int id, Model model) {
		model.addAttribute("quick", quickNavigationService.getQuickNavigation(id));
		return "admin/homemanage/quicknavigation-panel";
	}
	
	@ResponseBody
	@RequestMapping(value = "/quick/update", method = RequestMethod.POST)
	public Result quickUpdate(int id, String name, String link, String color, int sort, int status) {
		Result result = null;
		if(FormValidate.stringUtils(name, link, color)) {
			int row = quickNavigationService.updateQuick(id, name, link, color, sort, status);
			if(row == BbsConstant.OK) {
				result = new Result(BbsConstant.OK, "更新成功");
			} else {
				result = new Result(BbsConstant.ERROR, "更新失败");
			}
		} else {
			result = new Result(BbsConstant.ERROR, "更新失败");
		}
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value = "/quick/delete", method = RequestMethod.POST)
	public Result quickDelete(@RequestParam("ids[]")String ids) {
		Result result = null;
		if(StringUtils.isNotBlank(ids)) {
			if(quickNavigationService.deleteQuick(ids) == BbsConstant.OK) {
				result = new Result(BbsConstant.OK, "删除成功");
			} else {
				result = new Result(BbsConstant.ERROR, "删除失败");
			}
		} else {
			result = new Result(BbsConstant.ERROR, "删除失败");
		}
		return result;
	}
	
	@RequestMapping("/recommend")
	public String toRecommend(@RequestParam(value="page", required = false, defaultValue = "1")int p, 
			HttpServletRequest request, Model model) {
		Page page = Page.newBuilder(p, DEFAULT_PAGE_SIZE, ParamsBuildUtils.createUrl(request));
		List<Recommend> recommends = recommendService.getAllRecommends(page);
		model.addAttribute("recommends", recommends);
		model.addAttribute("page", page);
		return "admin/homemanage/recommend-list";
	}
	
	@RequestMapping("/recommend/search")
	public String toRecommendSearch(String from, String to, int status, int location, 
			@RequestParam(value="page", required = false, defaultValue = "1")int p, 
			HttpServletRequest request, Model model) {
		Page page = Page.newBuilder(p, DEFAULT_PAGE_SIZE, ParamsBuildUtils.createUrl(request));
		List<Recommend> recommends = recommendService.getAllRecommends(page, from, to, status, location);
		model.addAttribute("recommends", recommends);
		model.addAttribute("page", page);
		ParamsBuildUtils.createModel(model, request);
		return "admin/homemanage/recommend-list";
	}
	
	@RequestMapping(value = "/recommend/add", method = RequestMethod.GET)
	public String toRecommendAdd() {
		return "admin/homemanage/recommend-panel";
	}
	
	@ResponseBody
	@RequestMapping(value = "/recommend/add", method = RequestMethod.POST)
	public Result addRecommend(String name, String link, int location, int sort, int status) {
		Result result = null;
		if(FormValidate.stringUtils(name, link)) {
			int row = recommendService.addRecommend(name, link, location, sort, status);
			if(row == BbsConstant.OK) {
				result = new Result(BbsConstant.OK, "添加成功");
			} else {
				result = new Result(BbsConstant.ERROR, "添加失败");
			}
		} else {
			result = new Result(BbsConstant.ERROR, "添加失败");
		}
		return result;
	}
	
	@RequestMapping(value = "/recommend/update", method = RequestMethod.GET)
	public String toRecommendUpdate(int id, Model model) {
		model.addAttribute("rec", recommendService.getRecommend(id));
		return "admin/homemanage/recommend-panel";
	}
	
	@ResponseBody
	@RequestMapping(value = "/recommend/update", method = RequestMethod.POST)
	public Result recommendUpdate(int id, String name, String link, int location, int sort, int status) {
		Result result = null;
		if(FormValidate.stringUtils(name, link)) {
			int row = recommendService.updateRecommend(id, name, link, location, sort, status);
			if(row == BbsConstant.OK) {
				result = new Result(BbsConstant.OK, "更新成功");
			} else {
				result = new Result(BbsConstant.ERROR, "更新失败");
			}
		} else {
			result = new Result(BbsConstant.ERROR, "更新失败");
		}
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value = "/recommend/delete", method = RequestMethod.POST)
	public Result recommendDelete(@RequestParam("ids[]")String ids) {
		Result result = null;
		if(StringUtils.isNotBlank(ids)) {
			if(recommendService.deleteRecommend(ids) == BbsConstant.OK) {
				result = new Result(BbsConstant.OK, "删除成功");
			} else {
				result = new Result(BbsConstant.ERROR, "删除失败");
			}
		} else {
			result = new Result(BbsConstant.ERROR, "删除失败");
		}
		return result;
	}
	
	@RequestMapping("/topic")
	public String toTopic(@RequestParam(value="page", required = false, defaultValue = "1")int p, 
			HttpServletRequest request, Model model) {
		Page page = Page.newBuilder(p, DEFAULT_PAGE_SIZE, ParamsBuildUtils.createUrl(request));
		model.addAttribute("topics", topicService.getHomeTopic(page));
		model.addAttribute("page", page);
		return "admin/homemanage/topic-list";
	}
	
	@RequestMapping("/topic/search")
	public String toTopicSearch(String from, String to, 
			@RequestParam(defaultValue = "0")long tid, @RequestParam(defaultValue = "0")long uid, 
			@RequestParam(value="page", required = false, defaultValue = "1")int p, 
			HttpServletRequest request, Model model) {
		Page page = Page.newBuilder(p, DEFAULT_PAGE_SIZE, ParamsBuildUtils.createUrl(request));
		model.addAttribute("topics", topicService.getHomeTopic(page, from, to, tid, uid));
		model.addAttribute("page", page);
		ParamsBuildUtils.createModel(model, request);
		return "admin/homemanage/topic-list";
	}
	
	@RequestMapping(value = "/topic/time", method = RequestMethod.GET)
	public String toUpdateHomeTopicTime(@RequestParam(required = false)long tid, Model model) {
		Topic topic = topicService.getTopicByTopicId(tid);
		model.addAttribute("topic", topic);
		return "admin/homemanage/topic-time";
	}
	
	@ResponseBody
	@RequestMapping(value = "/topic/time", method = RequestMethod.POST)
	public Result updateHomeTopicTime(@RequestParam(required = false)long tid, 
			@RequestParam(required = false)String time) {
		Result result = null;
		if(BbsConstant.OK == topicService.updateTopicTime(tid, time, RoleSign.ADMIN.getSign())) {
			result = new Result(BbsConstant.OK, "修改成功");
		} else {
			result = new Result(BbsConstant.OK, "修改失败");
		}
		return result;
	}
	
}

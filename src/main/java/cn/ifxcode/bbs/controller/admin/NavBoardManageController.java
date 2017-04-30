package cn.ifxcode.bbs.controller.admin;

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
import cn.ifxcode.bbs.entity.Classify;
import cn.ifxcode.bbs.entity.Navigation;
import cn.ifxcode.bbs.service.BoardService;
import cn.ifxcode.bbs.service.ClassifyService;
import cn.ifxcode.bbs.service.NavigationService;
import cn.ifxcode.bbs.utils.FormValidate;
import cn.ifxcode.bbs.utils.ParamsBuildUtils;

@Controller
@RequestMapping("/system/admin/navboard")
public class NavBoardManageController extends BaseController{

	private static final Integer DEFAULT_PAGE_SIZE = 10;
	
	@Resource
	private NavigationService navigationService;
	
	@Resource
	private BoardService boardService;
	
	@Resource
	private ClassifyService classifyService;
	
	@RequestMapping("/navigation")
	public String toNavigation(@RequestParam(value="page", required = false, defaultValue = "1")int p,
			HttpServletRequest request, Model model) {
		Page page = Page.newBuilder(p, DEFAULT_PAGE_SIZE, ParamsBuildUtils.createUrl(request));
		model.addAttribute("roleNavs", navigationService.getAllNavigation(page));
		model.addAttribute("page", page);
		return "admin/navboardmanage/navigation-list";
	}
	
	@RequestMapping("/navigation/search")
	public String searchNavigation(String from, String to, String name, int status, 
			@RequestParam(value="page", required = false, defaultValue = "1")int p,
			HttpServletRequest request, Model model) {
		Page page = Page.newBuilder(p, DEFAULT_PAGE_SIZE, ParamsBuildUtils.createUrl(request));
		model.addAttribute("roleNavs", navigationService.getAllNavigation(page, from, to, name, status));
		model.addAttribute("page", page);
		ParamsBuildUtils.createModel(model, request);
		return "admin/navboardmanage/navigation-list";
	}
	
	@RequestMapping(value = "/navigation/add", method = RequestMethod.GET)
	public String toNavAdd() {
		return "admin/navboardmanage/navigation-panel";
	}
	
	@ResponseBody
	@RequestMapping(value = "/navigation/add", method = RequestMethod.POST)
	public Result addNav(String name, String desc, int sort, int status) {
		Result result = null;
		if(FormValidate.stringUtils(name)) {
			int row = navigationService.addNavigation(name, desc, sort, status);
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
	
	@RequestMapping(value = "/navigation/update", method = RequestMethod.GET)
	public String toNavUpdate(int id, Model model) {
		Navigation navigation = navigationService.getNavigationFromDB(id);
		model.addAttribute("nav", navigation);
		return "admin/navboardmanage/navigation-panel";
	}
	
	@ResponseBody
	@RequestMapping(value = "/navigation/update", method = RequestMethod.POST)
	public Result updateNav(int id, String name, String desc, int sort, int status) {
		Result result = null;
		if(FormValidate.stringUtils(name)) {
			int row = navigationService.updateNavigation(id, name, desc, sort, status);
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
	@RequestMapping(value = "/navigation/delete", method = RequestMethod.POST)
	public Result deleteNav(@RequestParam("ids[]")String ids) {
		Result result = null;
		if(FormValidate.stringUtils(ids)) {
			int row = navigationService.deleteNavigation(ids);
			if(row == BbsConstant.OK) {
				result = new Result(BbsConstant.OK, "删除成功");
			} else {
				result = new Result(BbsConstant.ERROR, "删除失败");
			}
		} else {
			result = new Result(BbsConstant.ERROR, "删除失败");
		}
		return result;
	}
	
	@RequestMapping("/board")
	public String toBoard(@RequestParam(value="page", required = false, defaultValue = "1")int p,
			HttpServletRequest request, Model model) {
		Page page = Page.newBuilder(p, DEFAULT_PAGE_SIZE, ParamsBuildUtils.createUrl(request));
		model.addAttribute("boards", boardService.getAllBoard(page));
		model.addAttribute("navs", navigationService.getAllNavigations());
		model.addAttribute("page", page);
		return "admin/navboardmanage/board-list";
	}
	
//	@RequestMapping("/board/search")
//	public String searchBoard(@RequestParam(value="page", required = false, defaultValue = "1")int p, 
//			) {
//		
//	}
	
	@RequestMapping("/classify")
	public String toClassify(@RequestParam(value="page", required = false, defaultValue = "1")int p,
			HttpServletRequest request, Model model) {
		Page page = Page.newBuilder(p, DEFAULT_PAGE_SIZE, ParamsBuildUtils.createUrl(request));
		List<Classify> classifies = classifyService.getAllClassify(page);
		model.addAttribute("clas", classifies);
		model.addAttribute("boards", boardService.getAllBoards());
		model.addAttribute("page", page);
		return "admin/navboardmanage/classify-list";
	}
	
	@RequestMapping("/classify/search")
	public String searchClassify(@RequestParam(value="page", required = false, defaultValue = "1")int p,
			String from, String to, String name, int bid, int status, int auth, 
			HttpServletRequest request, Model model) {
		Page page = Page.newBuilder(p, DEFAULT_PAGE_SIZE, ParamsBuildUtils.createUrl(request));
		List<Classify> classifies = classifyService.getAllClassify(page, from, to, name, bid, status, auth);
		model.addAttribute("clas", classifies);
		model.addAttribute("boards", boardService.getAllBoards());
		model.addAttribute("page", page);
		ParamsBuildUtils.createModel(model, request);
		if (StringUtils.isNotBlank(name)) {
			model.addAttribute("name", name);
		}
		return "admin/navboardmanage/classify-list";
	}
	
}

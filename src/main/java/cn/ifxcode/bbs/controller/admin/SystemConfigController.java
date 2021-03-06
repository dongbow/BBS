package cn.ifxcode.bbs.controller.admin;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.stereotype.Controller;

import com.google.common.collect.Lists;

import cn.ifxcode.bbs.bean.Page;
import cn.ifxcode.bbs.bean.Result;
import cn.ifxcode.bbs.constant.BbsConstant;
import cn.ifxcode.bbs.entity.AwardValue;
import cn.ifxcode.bbs.entity.BadWord;
import cn.ifxcode.bbs.entity.FriendLink;
import cn.ifxcode.bbs.entity.SystemConfig;
import cn.ifxcode.bbs.entity.Topic;
import cn.ifxcode.bbs.lucene.LuceneIndexUtils;
import cn.ifxcode.bbs.service.BadWordService;
import cn.ifxcode.bbs.service.FriendLinkService;
import cn.ifxcode.bbs.service.GeneralService;
import cn.ifxcode.bbs.service.SystemBlackIpService;
import cn.ifxcode.bbs.service.SystemService;
import cn.ifxcode.bbs.service.TopicService;
import cn.ifxcode.bbs.utils.ExcelUtils;
import cn.ifxcode.bbs.utils.FormValidate;
import cn.ifxcode.bbs.utils.ParamsBuildUtils;
import cn.ifxcode.bbs.utils.UploadUtils;

@Controller
@RequestMapping("/system/admin/config")
public class SystemConfigController extends BaseController {

	private static final Integer DEFAULT_PAGE_SIZE = 10;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Resource
	private TopicService topicService;
	
	@Resource
	private FriendLinkService friendLinkService;
	
	@Resource
	private SystemBlackIpService ipService;
	
	@Resource
	private BadWordService badWordService;
	
	@Resource
	private GeneralService generalService;
	
	@Resource
	private SystemService systemService;
	
	@RequestMapping("/setting")
	public String toSetting(Model model) {
		List<AwardValue> avs = generalService.getAllFromRedis();
		List<SystemConfig> configs = systemService.getList();
		model.addAttribute("avs", avs);
		model.addAttribute("config", configs);
		return "admin/config/setting";
	}
	
	@ResponseBody
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public Result systemConfig(SystemConfig config) {
		return null;
	}
	
	@ResponseBody
	@RequestMapping(value = "/lucene/init")
	public Result initIndex() {
		Result result = null;
		List<Topic> topics = topicService.getTopicListForIndex();
		if(LuceneIndexUtils.initIndex(topics)) {
			result = new Result(BbsConstant.OK, "索引初始化成功！");
		} else {
			result = new Result(BbsConstant.ERROR, "索引初始化失败！");
		}
		return result;
	}
	
	@RequestMapping("/friendlink")
	public String toFriendLink(@RequestParam(value="page", required = false, defaultValue = "1")int p,
			HttpServletRequest request, Model model) {
		Page page = Page.newBuilder(p, DEFAULT_PAGE_SIZE, ParamsBuildUtils.createUrl(request));
		model.addAttribute("links", friendLinkService.getFriendList(page));
		model.addAttribute("page", page);
		return "admin/config/link-list";
	}
	
	@RequestMapping("/friendlink/search")
	public String searchFriendLink(@RequestParam(value="page", required = false, defaultValue = "1")int p, 
			String from, String to, String name, int sign, int status, 
			HttpServletRequest request, Model model) {
		Page page = Page.newBuilder(p, DEFAULT_PAGE_SIZE, ParamsBuildUtils.createUrl(request));
		model.addAttribute("links", friendLinkService.getFriendList(page, from, to, name, sign, status));
		model.addAttribute("page", page);
		ParamsBuildUtils.createModel(model, request);
		if(StringUtils.isNotBlank(name)) {
			model.addAttribute("name", name);
		}
		return "admin/config/link-list";
	}
	
	@RequestMapping(value = "/friendlink/add", method = RequestMethod.GET)
	public String friendLinkAdd() {
		return "admin/config/link-panel";
	}
	
	@ResponseBody
	@RequestMapping(value = "/friendlink/add", method = RequestMethod.POST)
	public Result addFriendLink(String name, String link, String contact, String endtime, 
			int sign, int status) {
		Result result = null;
		if(FormValidate.stringUtils(name, link)) {
			if(BbsConstant.OK == friendLinkService.addLink(name, link, contact, endtime, sign, status)) {
				result = new Result(BbsConstant.OK, "添加成功");
			} else {
				result = new Result(BbsConstant.ERROR, "添加失败");
			}
		} else {
			result = new Result(BbsConstant.ERROR, "添加失败");
		}
		return result;
	}
	
	@RequestMapping(value = "/friendlink/update", method = RequestMethod.GET)
	public String friendLinkAdd(int id, Model model) {
		FriendLink link = friendLinkService.getFriendLink(id);
		model.addAttribute("link", link);
		return "admin/config/link-panel";
	}
	
	@ResponseBody
	@RequestMapping(value = "/friendlink/update", method = RequestMethod.POST)
	public Result addFriendLink(int id, String name, String link, String contact, String endtime, 
			int sign, int status) {
		Result result = null;
		if(FormValidate.stringUtils(name, link)) {
			if(BbsConstant.OK == friendLinkService.updateLink(id, name, link, contact, endtime, sign, status)) {
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
	@RequestMapping(value = "/friendlink/delete", method = RequestMethod.POST)
	public Result addFriendLink(@RequestParam("ids[]")String ids) {
		Result result = null;
		if(FormValidate.stringUtils(ids)) {
			if(BbsConstant.OK == friendLinkService.deleteLink(ids)) {
				result = new Result(BbsConstant.OK, "删除成功");
			} else {
				result = new Result(BbsConstant.ERROR, "删除失败");
			}
		} else {
			result = new Result(BbsConstant.ERROR, "删除失败");
		}
		return result;
	}
	
	@RequestMapping("/black")
	public String toBlack(@RequestParam(value="page", required = false, defaultValue = "1")int p,
			HttpServletRequest request, Model model) {
		Page page = Page.newBuilder(p, DEFAULT_PAGE_SIZE, ParamsBuildUtils.createUrl(request));
		model.addAttribute("blacks", ipService.getBlackIps(page));
		model.addAttribute("page", page);
		return "admin/config/black-list";
	}
	
	@ResponseBody
	@RequestMapping(value = "/black/add", method = RequestMethod.POST)
	public Result addBlack(String ip) {
		Result result = null;
		if(StringUtils.isNotBlank(ip)) {
			if(BbsConstant.OK == ipService.addBlackIp(ip)) {
				result = new Result(BbsConstant.OK, "添加成功");
			} else {
				result = new Result(BbsConstant.ERROR, "添加失败");
			}
		} else {
			result = new Result(BbsConstant.ERROR, "添加失败");
		}
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value = "/black/delete", method = RequestMethod.POST)
	public Result deleteBlack(@RequestParam("ids[]")String ids) {
		Result result = null;
		if(StringUtils.isNotBlank(ids)) {
			if(BbsConstant.OK == ipService.deleteBlackIp(ids)) {
				result = new Result(BbsConstant.OK, "删除成功");
			} else {
				result = new Result(BbsConstant.ERROR, "删除失败");
			}
		} else {
			result = new Result(BbsConstant.ERROR, "删除失败");
		}
		return result;
	}
	
	@RequestMapping(value = "/badword")
	public String toBadWord(@RequestParam(value="page", required = false, defaultValue = "1")int p,
			HttpServletRequest request, Model model) {
		Page page = Page.newBuilder(p, DEFAULT_PAGE_SIZE, ParamsBuildUtils.createUrl(request));
		model.addAttribute("words", badWordService.getBadWords(page));
		model.addAttribute("page", page);
		return "admin/config/badword-list";
	}
	
	@RequestMapping(value = "/badword/search")
	public String searchBadWord(@RequestParam(value="page", required = false, defaultValue = "1")int p,
			@RequestParam(value = "word")String word, 
			HttpServletRequest request, Model model) {
		Page page = Page.newBuilder(p, DEFAULT_PAGE_SIZE, ParamsBuildUtils.createUrl(request));
		model.addAttribute("words", badWordService.getBadWords(page, word));
		model.addAttribute("page", page);
		if(StringUtils.isNotBlank(word)) {
			model.addAttribute("word", word);
		}
		return "admin/config/badword-list";
	}
	
	@ResponseBody
	@RequestMapping(value = "/badword/add", method = RequestMethod.POST)
	public Result addBadWord(String word) {
		Result result = null;
		if(StringUtils.isNotBlank(word)) {
			if(BbsConstant.OK == badWordService.add(word)) {
				result = new Result(BbsConstant.OK, "添加成功");
			} else {
				result = new Result(BbsConstant.ERROR, "添加失败");
			}
		} else {
			result = new Result(BbsConstant.ERROR, "添加失败");
		}
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value = "/badword/delete", method = RequestMethod.POST)
	public Result deleteBadWord(@RequestParam("ids[]")String ids) {
		Result result = null;
		if(StringUtils.isNotBlank(ids)) {
			if(BbsConstant.OK == badWordService.delete(ids)) {
				result = new Result(BbsConstant.OK, "删除成功");
			} else {
				result = new Result(BbsConstant.ERROR, "删除失败");
			}
		} else {
			result = new Result(BbsConstant.ERROR, "删除失败");
		}
		return result;
	}
	
	@RequestMapping(value = "/badword/import", method = RequestMethod.GET)
	public String toImport() {
		return "admin/config/badword-import";
	}
	
	@RequestMapping("/badword/export")
	public void export(HttpServletResponse response) {
		try {
			ExcelUtils.export(response, BadWord.TITLE, BadWord.PROPERTIES, "敏感词模板.xls", Lists.newArrayList());
		} catch (IOException e) {
			logger.error("导出失败", e);
		} catch (Exception e) {
			logger.error("导出失败", e);
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "/badword/upload", method = RequestMethod.POST)
	public Result upload(HttpServletRequest request) {
		try {
			String path = UploadUtils.upload(request);
			if (StringUtils.isNotBlank(path)) {
				return new Result(BbsConstant.OK, "上传成功", (Object) path);
			}
		} catch (Exception e) {
			logger.error("文件上传失败", e);
		}
		return new Result(BbsConstant.ERROR, "上传失败");
	}
	
	@ResponseBody
	@RequestMapping(value = "/badword/import", method = RequestMethod.POST)
	public Result doImport(String path) {
		if (StringUtils.isBlank(path)) {
			return new Result(BbsConstant.ERROR, "未找到上传文件");
		}
		try {
			List<BadWord> list = ExcelUtils.loadExcel(path, BadWord.class, true, BadWord.ZHTOEN);
			badWordService.batchSave(list);
		} catch (Exception e) {
			return new Result(BbsConstant.ERROR, e.getMessage());
		}
		return new Result(BbsConstant.OK, "后台导入中...");
	}
}

package cn.ifxcode.bbs.admin.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.ifxcode.bbs.bean.Page;
import cn.ifxcode.bbs.bean.Result;
import cn.ifxcode.bbs.constant.BbsConstant;
import cn.ifxcode.bbs.enumtype.FileEnum;
import cn.ifxcode.bbs.service.FileService;
import cn.ifxcode.bbs.utils.FormValidate;
import cn.ifxcode.bbs.utils.ParamsBuildUtils;

@Controller
@RequestMapping("/system/admin/upload")
public class UploadFileController extends BaseController {

	private static final Integer DEFAULT_PAGE_SIZE = 10;
	
	@Resource
	private FileService fileService;
	
	@RequestMapping("/image")
	public String toImage(@RequestParam(value="page", required = false, defaultValue = "1")int p,
			HttpServletRequest request, Model model) {
		Page page = Page.newBuilder(p, DEFAULT_PAGE_SIZE, ParamsBuildUtils.createUrl(request));
		model.addAttribute("images", fileService.getUploadFile(page, FileEnum.IMAGE));
		model.addAttribute("page", page);
		return "admin/uploadmanage/image-list";
	}
	
	@RequestMapping("/image/search")
	public String searchImage(@RequestParam(value="page", required = false, defaultValue = "1")int p,
			String from, String to, @RequestParam(required = false, defaultValue = "0")long uid, 
			String name, HttpServletRequest request, Model model) {
		Page page = Page.newBuilder(p, DEFAULT_PAGE_SIZE, ParamsBuildUtils.createUrl(request));
		model.addAttribute("images", fileService.getUploadFile(page, FileEnum.IMAGE, from, to, uid, name));
		model.addAttribute("page", page);
		ParamsBuildUtils.createModel(model, request);
		if (StringUtils.isNotBlank(name)) {
			model.addAttribute("name", name);
		}
		return "admin/uploadmanage/image-list";
	}
	
	@RequestMapping("/file")
	public String toFile(@RequestParam(value="page", required = false, defaultValue = "1")int p,
			HttpServletRequest request, Model model) {
		Page page = Page.newBuilder(p, DEFAULT_PAGE_SIZE, ParamsBuildUtils.createUrl(request));
		model.addAttribute("files", fileService.getUploadFile(page, FileEnum.FILE));
		model.addAttribute("page", page);
		return "admin/uploadmanage/file-list";
	}
	
	@RequestMapping("/file/search")
	public String searchFile(@RequestParam(value="page", required = false, defaultValue = "1")int p,
			String from, String to, @RequestParam(required = false, defaultValue = "0")long uid, 
			String name, HttpServletRequest request, Model model) {
		Page page = Page.newBuilder(p, DEFAULT_PAGE_SIZE, ParamsBuildUtils.createUrl(request));
		model.addAttribute("files", fileService.getUploadFile(page, FileEnum.FILE, from, to, uid, name));
		model.addAttribute("page", page);
		ParamsBuildUtils.createModel(model, request);
		if (StringUtils.isNotBlank(name)) {
			model.addAttribute("name", name);
		}
		return "admin/uploadmanage/file-list";
	}
	
	@RequestMapping("/file/downloaddetail")
	public String toFileDownloadDetail(@RequestParam(value="page", required = false, defaultValue = "1")int p, 
			String id, @RequestParam(value = "uid", required = false, defaultValue = "0")long uid, 
			Model model, HttpServletRequest request) {
		if(StringUtils.isNotBlank(id)) {
			Page page = Page.newBuilder(p, DEFAULT_PAGE_SIZE, ParamsBuildUtils.createUrl(request));
			model.addAttribute("page", page);
			model.addAttribute("files", fileService.getFileDownloadDetailList(page, id, uid));
			if(uid != 0) {
				model.addAttribute("uid", uid);
			}
		}
		return "admin/uploadmanage/file-download-detail";
	}
	
	@ResponseBody
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public Result delete(@RequestParam(value = "uuids[]")String uuids, 
			@RequestParam(value = "rmids[]")String rmids) {
		Result result = null;
		if (FormValidate.stringUtils(uuids, rmids)) {
			fileService.removeFile(uuids, rmids);
			result = new Result(BbsConstant.OK, "删除成功");
		} else {
			result = new Result(BbsConstant.OK, "删除失败");
		}
		return result;
	}
	
}

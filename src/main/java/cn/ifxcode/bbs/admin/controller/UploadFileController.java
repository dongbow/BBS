package cn.ifxcode.bbs.admin.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cn.ifxcode.bbs.bean.Page;
import cn.ifxcode.bbs.enumtype.FileEnum;
import cn.ifxcode.bbs.service.FileService;
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
	
	@RequestMapping("/file")
	public String toFile(@RequestParam(value="page", required = false, defaultValue = "1")int p,
			HttpServletRequest request, Model model) {
		Page page = Page.newBuilder(p, DEFAULT_PAGE_SIZE, ParamsBuildUtils.createUrl(request));
		model.addAttribute("files", fileService.getUploadFile(page, FileEnum.FILE));
		model.addAttribute("page", page);
		return "admin/uploadmanage/file-list";
	}
	
}

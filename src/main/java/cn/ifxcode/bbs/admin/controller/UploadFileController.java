package cn.ifxcode.bbs.admin.controller;

import javax.annotation.Resource;

import org.springframework.web.bind.annotation.RequestMapping;

import cn.ifxcode.bbs.service.FileService;

@RequestMapping("/systeem/admin/upload")
public class UploadFileController {

	@Resource
	private FileService fileService;
	
}

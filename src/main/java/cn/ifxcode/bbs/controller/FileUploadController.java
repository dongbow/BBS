package cn.ifxcode.bbs.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.ifxcode.bbs.service.FileService;

@Controller
@RequestMapping("/upload")
public class FileUploadController {

	@Resource
	private FileService fileService;
	
	
	
}

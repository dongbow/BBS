package cn.ifxcode.bbs.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

import cn.ifxcode.bbs.constant.BbsConstant;
import cn.ifxcode.bbs.exception.BbsException;
import cn.ifxcode.bbs.service.FileService;
import cn.ifxcode.bbs.utils.DownloadUtils;

@Controller
public class FileUploadController {

	@Resource
	private FileService fileService;
	
	@RequestMapping(value = "/upload/image", method = RequestMethod.POST)
	public void uploadImage(HttpServletRequest request, HttpServletResponse response) {
		try {
			String url = fileService.uploadPicture(request);
			if(StringUtils.isNotBlank(url)) {
				response.getWriter().print(url);
			}
		} catch (IOException e) {
			throw new BbsException("image upload fail", e);
		}
	}
	
	@RequestMapping(value = "/upload/file", method = RequestMethod.POST)
	public void uploadFile(HttpServletRequest request, HttpServletResponse response) {
		try {
			JSONArray data = fileService.uploadFile(request);
			if(data != null && !data.isEmpty()) {
				JSONObject object = new JSONObject();
				object.put("data", data);
				object.put("rc", BbsConstant.OK);
				response.setCharacterEncoding("UTF-8");  
			    response.setContentType("application/json; charset=utf-8");  
			    PrintWriter out = response.getWriter();  
			    out.append(object.toString());  
			}
		} catch (IOException e) {
			throw new BbsException("file upload fail", e);
		}
	}
	
	@RequestMapping("/download")
	public void download(String file, HttpServletRequest request, HttpServletResponse response) {
		if(StringUtils.isNotBlank(file)) {
			Map<String, Object> map = fileService.getFileLinkByUuid(file);
			if(map != null && map.containsKey("file_link")) {
				if(fileService.vaildOnce(file, request)) {
					fileService.AddDownCount(file, request);
					DownloadUtils.download(map, response);
				} else {
					try {
						response.setCharacterEncoding("UTF-8");
						response.getWriter().print("金币不足");
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			} else {
				try {
					response.setCharacterEncoding("UTF-8");
					response.getWriter().print("资源不存在");
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}
	
}

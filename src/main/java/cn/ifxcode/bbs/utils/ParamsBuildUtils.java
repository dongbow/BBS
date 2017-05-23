package cn.ifxcode.bbs.utils;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.ui.Model;

import cn.ifxcode.bbs.constant.BbsConstant;

import com.google.common.collect.Maps;

public class ParamsBuildUtils {

	public static String createUrl(HttpServletRequest request) {
		String uri = request.getRequestURI();
		try {
			String params = new String(request.getQueryString().getBytes("ISO-8859-1"), BbsConstant.UTF8);
			if(StringUtils.isNotBlank(params)) {
				String param[] = params.split("&");
				Map<String, Object> map = Maps.newHashMap();
				for (String s : param) {
					if(!s.split("=")[0].equals("page")) {
						if(s.split("=").length == 1) {
							map.put(s.split("=")[0], "");
						} else {
							map.put(s.split("=")[0], s.split("=")[1]);
						}
					}
				}
				params = "?";
				if(!map.isEmpty()) {
					for (Map.Entry<String, Object> entry : map.entrySet()) {
						params += (entry.getKey() + "=" + entry.getValue() + "&");
					}
				}
				params += "page=";
			}
			return uri + (StringUtils.isNotBlank(params) ? params : "?page=");
		} catch (Exception e) {
			return uri + "?page=";
		}
	}

	public static void createModel(Model model, HttpServletRequest request) {
		try {
			String params = new String(request.getQueryString().getBytes("ISO-8859-1"), BbsConstant.UTF8);
			if(StringUtils.isNotBlank(params)) {
				String param[] = params.split("&");
				for (String s : param) {
					if(!s.split("=")[0].equals("page")) {
						if(s.split("=").length == 1 || s.split("=")[0].equals("userId")) {
							model.addAttribute(s.split("=")[0], "");
						} else {
							model.addAttribute(s.split("=")[0], s.split("=")[1]);
						}
					}
				}
			}
		} catch (Exception e) {
			// ignore
		}
	}
	
}

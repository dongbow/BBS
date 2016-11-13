package cn.ifxcode.bbs.utils;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;

import com.google.common.collect.Maps;

public class ParamsBuildUtils {

	public static String createUrl(HttpServletRequest request) {
		String uri = request.getRequestURI();
		String params = request.getQueryString();
		if(StringUtils.isNotBlank(params)) {
			String param[] = params.split("&");
			Map<String, Object> map = Maps.newHashMap();
			for (String s : param) {
				if(!s.split("=")[0].equals("page")) {
					map.put(s.split("=")[0], s.split("=")[1]);
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
	}

	
}

package cn.ifxcode.bbs.interceptor;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import cn.ifxcode.bbs.service.GeneralService;
import cn.ifxcode.bbs.utils.GetRemoteIpUtil;

public class BbsInterceptor extends HandlerInterceptorAdapter{
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Resource
	private GeneralService generalService;
	
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		
		this.initService(request);
		
		if(generalService.checkIp(request)) {
			logger.info("black ip : " + GetRemoteIpUtil.getRemoteIp(request));
			return false;
		}
		
		if(generalService.checkLogin(request)) {
			logger.info("not login, ip : " + GetRemoteIpUtil.getRemoteIp(request));
			return false;
		}
		
		return true;
	}
	
	private void initService(HttpServletRequest request) {
		if(generalService == null) {
			WebApplicationContext webctx = WebApplicationContextUtils
					.getWebApplicationContext(request.getSession().getServletContext());
			generalService = (GeneralService) webctx.getBean("generalService");
		}
	}

}

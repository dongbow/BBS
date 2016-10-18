package cn.ifxcode.bbs.interceptor;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import cn.ifxcode.bbs.constant.BbsConstant;
import cn.ifxcode.bbs.service.GeneralService;
import cn.ifxcode.bbs.utils.GetRemoteIpUtil;
import cn.ifxcode.bbs.utils.PropertiesUtils;

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
		
		StringBuffer url = request.getRequestURL();
		
		if(generalService.checkBbsIsClose() && !request.getRequestURI().endsWith(BbsConstant.CLOSE)) {
			if(url.indexOf(BbsConstant.SYSTEM) > 0 || url.indexOf(BbsConstant.LOGOUT) > 0) {
				logger.info("bbs is closeing, but this ip is: " + GetRemoteIpUtil.getRemoteIp(request));
				this.auth(request, response);
			}
			response.sendRedirect(BbsConstant.ROOT + BbsConstant.CLOSE);
			logger.info("bbs is close");
			return false;
		}
		
		this.auth(request, response);
		
		return true;
	}
	
	private boolean auth(HttpServletRequest request, HttpServletResponse response) {
//		StringBuffer url = request.getRequestURL();
//		if(url.indexOf(PropertiesUtils.getValue("auth.map")) > 0 
//				&& url.indexOf(PropertiesUtils.getValue("auth.ex-map")) < 0
//				&& generalService.authCheck()) {
//			
//		}
		return false;
	}
	
	private void initService(HttpServletRequest request) {
		if(generalService == null) {
			WebApplicationContext webctx = WebApplicationContextUtils
					.getWebApplicationContext(request.getSession().getServletContext());
			generalService = (GeneralService) webctx.getBean("generalService");
		}
	}

}

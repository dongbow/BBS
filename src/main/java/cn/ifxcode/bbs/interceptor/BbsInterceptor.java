package cn.ifxcode.bbs.interceptor;

import java.net.URLEncoder;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import cn.ifxcode.bbs.constant.BbsConstant;
import cn.ifxcode.bbs.entity.Board;
import cn.ifxcode.bbs.service.GeneralService;
import cn.ifxcode.bbs.utils.GetRemoteIpUtil;
import cn.ifxcode.bbs.utils.NumberUtils;

public class BbsInterceptor extends HandlerInterceptorAdapter{
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Resource
	private GeneralService generalService;
	
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		
		this.initService(request);
		
		if(generalService.checkIp(request)) {
			logger.info("black ip : " + GetRemoteIpUtil.getRemoteIp(request));
			response.sendError(HttpServletResponse.SC_FORBIDDEN);
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
		
		String uri = request.getRequestURI();
		if(uri.indexOf(BbsConstant.BOARD) > 0) {
			int boardId = 0;
			if(uri.indexOf("/navigation") > 0 || uri.indexOf("/post") > 0) {
				boardId = (int) NumberUtils.getAllNumber(uri.split("/")[5]);
			} else {
				boardId = (int) NumberUtils.getAllNumber(uri.split("/")[3]);
			}
			Board board = generalService.getBoardByBoardId(boardId);
			if(board != null) {
				if(board.getBoardIsOpen() == 1) {
					if(generalService.adminCheck(request)) {
						response.sendRedirect(BbsConstant.ROOT + BbsConstant.TIP + "?tip=board-noauth");
						return false;
					}
				}
				if(board.getIsAccess() == 1) {
					if(generalService.isLogin(request)) {
						response.sendRedirect(BbsConstant.ROOT + BbsConstant.TIP + "?tip=nologin&back=" + URLEncoder.encode(request.getRequestURL().toString(), BbsConstant.UTF8));
						return false;
					}
					if(generalService.isBoardAccess(request)) {
						if(uri.indexOf("/post") > 0) {
							response.sendRedirect(BbsConstant.ROOT + BbsConstant.TIP + "?tip=post-noauth");
						} else if(uri.indexOf("/reply") > 0) {
							response.sendRedirect(BbsConstant.ROOT + BbsConstant.TIP + "?tip=reply-noauth");
						} else if(uri.indexOf("/topic") > 0) {
							response.sendRedirect(BbsConstant.ROOT + BbsConstant.TIP + "?tip=topic-noauth");
						} else {
							response.sendRedirect(BbsConstant.ROOT + BbsConstant.TIP + "?tip=board-noauth");
						}
						return false;
					}
				}
			} else {
				logger.info("board is not exist");
				response.sendRedirect(BbsConstant.ROOT + BbsConstant.TIP + "?tip=board-notexists");
				return false;
			}
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

package cn.ifxcode.bbs.interceptor;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.alibaba.fastjson.JSONObject;

import cn.ifxcode.bbs.bean.Result;
import cn.ifxcode.bbs.constant.BbsConstant;
import cn.ifxcode.bbs.constant.BbsErrorCode;
import cn.ifxcode.bbs.entity.Board;
import cn.ifxcode.bbs.service.GeneralService;
import cn.ifxcode.bbs.utils.GetRemoteIpUtil;
import cn.ifxcode.bbs.utils.NumberUtils;
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
			response.sendError(HttpServletResponse.SC_FORBIDDEN);
			return false;
		}
		
		StringBuffer url = request.getRequestURL();
		
		if(generalService.checkBbsIsClose() && request.getRequestURI().indexOf(BbsConstant.CLOSE) > 0) {
			if(url.indexOf(BbsConstant.SYSTEM) > 0 || url.indexOf(BbsConstant.LOGOUT) > 0) {
				logger.info("bbs is closeing, but this ip is: " + GetRemoteIpUtil.getRemoteIp(request));
				this.auth(request, response);
			}
			response.sendRedirect(BbsConstant.ROOT + BbsConstant.CLOSE);
			logger.info("bbs is close");
			return false;
		}
		
		String uri = request.getRequestURI();
		if(uri.indexOf(BbsConstant.BOARD) > 0 && uri.indexOf("/favorite/board") < 0 && uri.indexOf("/navboard/board") < 0) {
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
		
		if(!this.bmc(request, response)) {
			response.sendRedirect(BbsConstant.ROOT + BbsConstant.TIP + "?tip=noauth");
			logger.warn("bmc url found, ip is " + GetRemoteIpUtil.getRemoteIp(request) );
			return false;
		}
		
		if(!this.auth(request, response)) {
			if(isAjax(request)) {
				JSONObject responseJSONObject = new JSONObject(true);
				Result result = new Result(BbsErrorCode.NOT_AUTH, BbsErrorCode.getDescribe(BbsErrorCode.NOT_AUTH));
				responseJSONObject.put(BbsConstant.RC, result);
				response.setCharacterEncoding("UTF-8");  
			    response.setContentType("application/json; charset=utf-8");  
			    PrintWriter out = null;  
			    try {  
			        out = response.getWriter();  
			        out.append(responseJSONObject.toString());  
			    } catch (IOException e) {  
			        e.printStackTrace();  
			    } finally {  
			        if (out != null) {  
			            out.close();  
			        }  
			    }
			} else {
				response.sendRedirect(BbsConstant.ROOT + BbsConstant.TIP + "?tip=noauth");
			}
			logger.warn("admin url found, ip is " + GetRemoteIpUtil.getRemoteIp(request) );
			return false;
		}
		
		return true;
	}
	
	private boolean bmc(HttpServletRequest request, HttpServletResponse response) {
		StringBuffer url = request.getRequestURL();
		if(url.indexOf("/manage/bmc") > 0) {
			if(generalService.bmcCheck(request)) {
				return true;
			} else {
				return false;
			}
		}
		return true;
	}
	
	private boolean auth(HttpServletRequest request, HttpServletResponse response) {
		StringBuffer url = request.getRequestURL();
		if(this.dealUrl(url)) {
			if(!generalService.authCheck(request)) {
				return false;
			} else {
				return generalService.authResources(request);
			}
		}
		return true; 
	}
	
	private boolean dealUrl(StringBuffer url) {
		String fUrl[] = PropertiesUtils.getValue("auth.map").split(";");
		String nfUrl[] = PropertiesUtils.getValue("auth.ex-map").split(";");
		for (String s : fUrl) {
			if(url.indexOf(s) > 0) {
				for (String nf : nfUrl) {
					if(url.indexOf(nf) < 0) {
						return true;
					}
				}
			}
		}
		return false;
	}
	
	private boolean isAjax(HttpServletRequest request) {
		String requestType = request.getHeader("X-Requested-With");  
		return requestType != null && requestType.equals("XMLHttpRequest");  
	}
	
	private void initService(HttpServletRequest request) {
		if(generalService == null) {
			WebApplicationContext webctx = WebApplicationContextUtils
					.getWebApplicationContext(request.getSession().getServletContext());
			generalService = (GeneralService) webctx.getBean("generalService");
		}
	}

}

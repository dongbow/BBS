package cn.ifxcode.bbs.filter;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import redis.clients.jedis.Jedis;

import com.alibaba.fastjson.JSONObject;

import cn.ifxcode.bbs.bean.CookieBean;
import cn.ifxcode.bbs.bean.Result;
import cn.ifxcode.bbs.constant.BbsConstant;
import cn.ifxcode.bbs.constant.BbsErrorCode;
import cn.ifxcode.bbs.utils.CookieUtils;
import cn.ifxcode.bbs.utils.PropertiesUtils;
import cn.ifxcode.bbs.utils.RedisKeyUtils;
import cn.ifxcode.bbs.utils.ReflectUtils;

public class LoginFilter implements Filter {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public void destroy() {
		logger.info("login filter destory");
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		if (!(request instanceof HttpServletRequest) || !(response instanceof HttpServletResponse)) {  
            throw new ServletException("OncePerRequestFilter just supports HTTP requests");  
        }  
        HttpServletRequest httpRequest = (HttpServletRequest) request;  
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        String cookie = CookieUtils.getUserCookieValue(httpRequest);
        if(StringUtils.isNotBlank(cookie)) {
        	CookieBean cookieBean = ReflectUtils.returnEntity(CookieBean.class, cookie.split(";"));
            if(cookieBean != null && cookieBean.getUser_id() > 0) {
            	JSONObject object = this.getJsonObjectFromRedis(RedisKeyUtils.getUserInfo(cookieBean.getUser_id()));
            	if(object != null) {
            		chain.doFilter(request, response);
            		return;
            	}
            } 
        }
        StringBuffer uri = httpRequest.getRequestURL();
		String url[] = PropertiesUtils.getValue("url.map").split(";");
		for (String s : url) {
			if(uri.indexOf(s) > 0 && this.urlExmap(uri)) {
				this.result(httpRequest, httpResponse);
				return;
			}
		}
		chain.doFilter(request, response);
		return;
	}
	
	private void result(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		if(isAjax(request)) {
			JSONObject responseJSONObject = new JSONObject(true);
			Result result = new Result(BbsErrorCode.NOT_LOGIN, BbsErrorCode.getDescribe(BbsErrorCode.NOT_LOGIN), 
					(Object) BbsConstant.SIMPLE_LOGIN);
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
			response.sendRedirect(BbsConstant.ROOT + BbsConstant.TIP + "?tip=nologin&back=" + URLEncoder.encode(request.getRequestURL().toString(), BbsConstant.UTF8));
		}
	}
	
	private boolean isAjax(HttpServletRequest request) {
		String requestType = request.getHeader("X-Requested-With");  
		return requestType != null && requestType.equals("XMLHttpRequest");  
	}

	private boolean urlExmap(StringBuffer uri) {
		String url_ex[] = PropertiesUtils.getValue("url.ex-map").split(";");
		for (String s : url_ex) {
			if(uri.indexOf(s) > 0) {
				return false;
			}
		}
		return true;
	}
	
	public void init(FilterConfig fConfig) throws ServletException {
		logger.info("login filter init");

	}
	
	private JSONObject getJsonObjectFromRedis(String key) {
		Jedis jedis = new Jedis(PropertiesUtils.getValue("redis.host"), Integer.parseInt(PropertiesUtils.getValue("redis.port")));
		if(StringUtils.isNotBlank(PropertiesUtils.getValue("redis.pass"))) {
			jedis.auth(PropertiesUtils.getValue("redis.pass"));
		}
		List<String> list = jedis.hmget(key, "user");
		JSONObject object = null;
		if(list != null && list.size() > 0) {
			object = JSONObject.parseObject(list.get(0));
		}
		return object;
	}

}

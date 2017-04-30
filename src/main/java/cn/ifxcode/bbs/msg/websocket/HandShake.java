
package cn.ifxcode.bbs.msg.websocket;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.HandshakeInterceptor;

import cn.ifxcode.bbs.service.UserService;
import cn.ifxcode.bbs.utils.SpringUtils;


/**
 * Socket建立连接（握手）和断开
 * 
 */
public class HandShake implements HandshakeInterceptor {

	public boolean beforeHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler, Map<String, Object> attributes) throws Exception {
		if (request instanceof ServletServerHttpRequest) {
			
			RequestAttributes ra = RequestContextHolder.getRequestAttributes();
			ServletRequestAttributes sra = (ServletRequestAttributes)ra;
			HttpServletRequest servletRequest = sra.getRequest();
			
			UserService userService = SpringUtils.getBean(UserService.class);
			
			if (userService != null) {
				Long uid = userService.getUserIdFromCookie((HttpServletRequest) servletRequest);
				if (uid != null) {
					attributes.put("uid", uid);
				} else {
					return false;
				}
			} else {
				return false;
			}
		}
		return true;
	}

	public void afterHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler, Exception exception) {
	}

}

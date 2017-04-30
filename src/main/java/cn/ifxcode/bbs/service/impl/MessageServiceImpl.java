package cn.ifxcode.bbs.service.impl;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.socket.TextMessage;

import com.google.gson.GsonBuilder;

import cn.ifxcode.bbs.msg.entity.Message;
import cn.ifxcode.bbs.msg.websocket.BbsWebSocketHandler;
import cn.ifxcode.bbs.service.MessageService;
import cn.ifxcode.bbs.service.UserService;

@Service
public class MessageServiceImpl implements MessageService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Resource
	private BbsWebSocketHandler webSocketHandler;

	@Resource
	private UserService userService;
	
	@Override
	public void sendMsg(HttpServletRequest request, Message message) {
		Long uid = userService.getUserIdFromCookie(request);
		try {
			webSocketHandler.sendMessageToUser(uid, new TextMessage(new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create().toJson(message)));
		} catch (IOException e) {
			logger.error("send msg error, uid: {}, msg: {}", uid, message.toString(), e);
		}
	}

	@Override
	public void sendMsgToAll(Message message) {
		// TODO Auto-generated method stub
		
	}
	
}

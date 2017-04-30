package cn.ifxcode.bbs.service;

import javax.servlet.http.HttpServletRequest;

import cn.ifxcode.bbs.msg.entity.Message;

public interface MessageService {

	public void sendMsg(HttpServletRequest request, Message message);
	
	public void sendMsgToAll(Message message);
	
}

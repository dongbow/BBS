package cn.ifxcode.bbs.msg.entity;

import java.io.Serializable;
import java.util.Date;

import org.springframework.data.mongodb.core.mapping.Document;

/**
 * 消息类
 */
@Document
public class Message implements Serializable {

	private static final long serialVersionUID = -1984847587598329566L;
	
	//发送者
	public Long from;
	//发送者名称
	public String fromName;
	//接收者
	public Long to;
	//发送的文本
	public String text;
	//发送日期
	public Date date;

	public Long getFrom() {
		return from;
	}

	public void setFrom(Long from) {
		this.from = from;
	}

	public Long getTo() {
		return to;
	}

	public void setTo(Long to) {
		this.to = to;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getFromName() {
		return fromName;
	}

	public void setFromName(String fromName) {
		this.fromName = fromName;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

}

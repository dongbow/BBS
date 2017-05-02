package cn.ifxcode.bbs.msg.entity;

import java.io.Serializable;
import java.util.Calendar;
import java.util.Date;

import org.springframework.data.mongodb.core.mapping.Document;

import com.google.gson.GsonBuilder;

import cn.ifxcode.bbs.utils.IdWorker;

/**
 * 消息类
 */
@Document
public class Message implements Serializable {

	private static final long serialVersionUID = -1984847587598329566L;
	
	private Long id;
	//发送者
	private Long from;
	//发送者名称
	private String fromName;
	//接收者
	private Long to;
	//发送的文本
	private String text;
	//消息类型
	private int msgType;
	//js处理类型
	private int jsType;
	//状态 (1：已读， 0：未读)
	private int status;
	//发送日期
	private Date date;

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

	public int getJsType() {
		return jsType;
	}

	public void setJsType(int jsType) {
		this.jsType = jsType;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}
	
	public Message() {}
	
	public Message (builder builder) {
		this.id = builder.id;
		this.from = builder.from;
		this.fromName = builder.fromName;
		this.to = builder.to;
		this.text = builder.text;
		this.setMsgType(builder.msgType);
		this.jsType = builder.jsType;
		this.status = builder.status;
		this.date = builder.date;
	}
	
	public String toJSONString() {
		return new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create().toJson(this);
	}
	
	public int getMsgType() {
		return msgType;
	}

	public void setMsgType(int msgType) {
		this.msgType = msgType;
	}
	
	@Override
	public String toString() {
		return "Message [id=" + id + ", from=" + from + ", fromName="
				+ fromName + ", to=" + to + ", text=" + text + ", msgType="
				+ msgType + ", jsType=" + jsType + ", status=" + status
				+ ", date=" + date + "]";
	}



	public static class builder {
		private long id;
		//发送者
		private Long from = 99999L;
		//发送者名称
		private String fromName = "system";
		//接收者
		private Long to;
		//发送的文本
		private String text;
		//消息类型
		private int msgType;
		//js处理类型
		private int jsType;
		//状态 (1：已读， 0：未读)
		private int status = 0;
		
		private Date date;
		
		public builder() {
			try {
				this.id = IdWorker.getFlowIdWorkerInstance().nextId();
				this.date = Calendar.getInstance().getTime();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		public builder from(long from) {
			this.from = from;
			return this;
		}
		
		public builder fromName(String fromName) {
			this.fromName = fromName;
			return this;
		}
		
		public builder to(long to) {
			this.to = to;
			return this;
		}
		
		public builder text(String text) {
			this.text = text;
			return this;
		}
		
		
		public builder msgType(int msgType) {
			this.msgType = msgType;
			return this;
		}
		
		public builder jsType(int jsType) {
			this.jsType = jsType;
			return this;
		}
		
		public builder status(int status) {
			this.status = status;
			return this;
		}
		
		public Message build() {
			return new Message(this);
		}

		public Date getDate() {
			return date;
		}

		public void setDate(Date date) {
			this.date = date;
		}

		public long getId() {
			return id;
		}

		public void setId(long id) {
			this.id = id;
		}
	}

}

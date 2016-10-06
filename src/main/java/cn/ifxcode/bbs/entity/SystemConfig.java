package cn.ifxcode.bbs.entity;

import java.io.Serializable;

public class SystemConfig implements Serializable {

	private static final long serialVersionUID = -725687150506716745L;

	private int id;
	private int isOpenBbs;
	private int isAllowRegister;
	private int isOpenTopicAudit;
	private int isOpenReplyAudit;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getIsOpenBbs() {
		return isOpenBbs;
	}

	public void setIsOpenBbs(int isOpenBbs) {
		this.isOpenBbs = isOpenBbs;
	}

	public int getIsAllowRegister() {
		return isAllowRegister;
	}

	public void setIsAllowRegister(int isAllowRegister) {
		this.isAllowRegister = isAllowRegister;
	}

	public int getIsOpenTopicAudit() {
		return isOpenTopicAudit;
	}

	public void setIsOpenTopicAudit(int isOpenTopicAudit) {
		this.isOpenTopicAudit = isOpenTopicAudit;
	}

	public int getIsOpenReplyAudit() {
		return isOpenReplyAudit;
	}

	public void setIsOpenReplyAudit(int isOpenReplyAudit) {
		this.isOpenReplyAudit = isOpenReplyAudit;
	}

}

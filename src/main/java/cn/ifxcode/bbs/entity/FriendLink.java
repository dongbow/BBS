package cn.ifxcode.bbs.entity;

import java.io.Serializable;
import java.util.Date;

import cn.ifxcode.bbs.utils.DateUtils;

public class FriendLink implements Serializable {

	private static final long serialVersionUID = 1L;

	private int linkId;
	private String linkName;
	private String link;
	private int linkSign;
	private int linkStatus;
	private String linkContacts;
	private String linkCreateTime;
	private Date linkEndTime;

	public int getLinkId() {
		return linkId;
	}

	public void setLinkId(int linkId) {
		this.linkId = linkId;
	}

	public String getLinkName() {
		return linkName;
	}

	public void setLinkName(String linkName) {
		this.linkName = linkName;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public int getLinkStatus() {
		return linkStatus;
	}

	public void setLinkStatus(int linkStatus) {
		this.linkStatus = linkStatus;
	}

	public String getLinkContacts() {
		return linkContacts;
	}

	public void setLinkContacts(String linkContacts) {
		this.linkContacts = linkContacts;
	}

	public String getLinkCreateTime() {
		return DateUtils.dt14LongFormat(DateUtils.dt14FromStr(linkCreateTime));
	}

	public void setLinkCreateTime(String linkCreateTime) {
		this.linkCreateTime = linkCreateTime;
	}

	public Date getLinkEndTime() {
		return linkEndTime;
	}

	public void setLinkEndTime(Date linkEndTime) {
		this.linkEndTime = linkEndTime;
	}

	public int getLinkSign() {
		return linkSign;
	}

	public void setLinkSign(int linkSign) {
		this.linkSign = linkSign;
	}

}

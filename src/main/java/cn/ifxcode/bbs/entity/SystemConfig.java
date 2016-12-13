package cn.ifxcode.bbs.entity;

import java.io.Serializable;

public class SystemConfig implements Serializable {

	private static final long serialVersionUID = -725687150506716745L;

	private int id;
	private String attrName;
	private String attrValue;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getAttrName() {
		return attrName;
	}

	public void setAttrName(String attrName) {
		this.attrName = attrName;
	}

	public String getAttrValue() {
		return attrValue;
	}

	public void setAttrValue(String attrValue) {
		this.attrValue = attrValue;
	}

}

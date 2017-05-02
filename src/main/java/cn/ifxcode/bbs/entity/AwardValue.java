package cn.ifxcode.bbs.entity;

import java.io.Serializable;
import java.util.Date;

public class AwardValue implements Serializable {

	private static final long serialVersionUID = -4648976695234503546L;

	private int id;
	private String valueType;
	private int goldValue;
	private int expValue;
	private Date createTime;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getValueType() {
		return valueType;
	}

	public void setValueType(String valueType) {
		this.valueType = valueType;
	}

	public int getGoldValue() {
		return goldValue;
	}

	public void setGoldValue(int goldValue) {
		this.goldValue = goldValue;
	}

	public int getExpValue() {
		return expValue;
	}

	public void setExpValue(int expValue) {
		this.expValue = expValue;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	@Override
	public String toString() {
		return "AwardValue [id=" + id + ", valueType=" + valueType
				+ ", goldValue=" + goldValue + ", expValue=" + expValue
				+ ", createTime=" + createTime + "]";
	}

}

package cn.ifxcode.bbs.enumtype;

public enum EGHistory {

	SIGN("签到", 0), LOGIN("登录", 1), REG("注册", 2);
	
	private String desc;
	private int from;
	
	EGHistory(String desc, int from) {
		this.desc = desc;
		this.from = from;
	}
	
	public String getDesc() {
		return this.desc;
	}
	
	public int getFrom() {
		return this.from;
	}
	
}

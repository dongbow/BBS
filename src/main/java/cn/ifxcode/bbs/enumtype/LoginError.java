package cn.ifxcode.bbs.enumtype;

public enum LoginError {

	PASSWORD_ERROR("密码错误", 0), OTHER_ERROR("其他错误", 1);
	
	private String desc;
	private int code;
	
	LoginError(String desc, int code) {
		this.desc = desc;
		this.code = code;
	}
	
	public int getCode() {
		return code;
	}
	
	public String getValue() {
		return desc;
	}
	
}

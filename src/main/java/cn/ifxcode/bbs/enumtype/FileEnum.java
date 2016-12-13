package cn.ifxcode.bbs.enumtype;

public enum FileEnum {


	IMAGE(0), FILE(1);
	
	private int code;
	
	FileEnum(int code) {
		this.code = code;
	}
	
	public int getCode() {
		return code;
	}
	
}

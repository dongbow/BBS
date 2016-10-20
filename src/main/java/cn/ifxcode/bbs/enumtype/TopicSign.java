package cn.ifxcode.bbs.enumtype;

public enum TopicSign {


	VIEW(0), REPLY(1), FAVORITE(1);
	
	private int code;
	
	TopicSign(int code) {
		this.code = code;
	}
	
	public int getCode() {
		return code;
	}
	
}

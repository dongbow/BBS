package cn.ifxcode.bbs.enumtype;

public enum BoardSign {


	TOPIC(0), REPLY(1), FAVORITE(2), CLICK(3);
	
	private int code;
	
	BoardSign(int code) {
		this.code = code;
	}
	
	public int getCode() {
		return code;
	}
	
}

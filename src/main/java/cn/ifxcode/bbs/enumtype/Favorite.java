package cn.ifxcode.bbs.enumtype;

public enum Favorite {

	TOPIC(0), BOARD(1);
	
	private int code;
	
	Favorite(int code) {
		this.code = code;
	}
	
	public int getCode() {
		return code;
	}
	
}

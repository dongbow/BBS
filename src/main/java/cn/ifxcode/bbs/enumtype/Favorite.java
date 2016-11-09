package cn.ifxcode.bbs.enumtype;

public enum Favorite {

	TOPIC(1), BOARD(2);
	
	private int code;
	
	Favorite(int code) {
		this.code = code;
	}
	
	public int getCode() {
		return code;
	}
	
}

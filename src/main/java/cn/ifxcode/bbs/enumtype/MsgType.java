package cn.ifxcode.bbs.enumtype;

public enum MsgType {

	SYSTEM(1),
	COMMENT(2),
	FRRIEND(3);
	
	private int code;
	
	MsgType(int code) {
		this.code = code;
	}
	
	public int getCode() {
		return code;
	}
	
	public boolean isValid(MsgType msgType) {
		for (MsgType mType : MsgType.values()) {
			if (msgType.getCode() == mType.getCode()) {
				return true;
			}
		}
		return false;
	}
	
}

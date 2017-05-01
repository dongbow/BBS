package cn.ifxcode.bbs.enumtype;

public enum MsgType {

	DIALOG(1),
	NUMBER(2);
	
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

package cn.ifxcode.bbs.enumtype;

public enum MsgType {

	//msg类型
	COMMON(4),
	NOTICE(5),
	TOPIC(6),
	LETTER(7),
	
	//js类型
	DIALOG(1),
	NUMBER(2),
	MESSAGE(3);
	
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

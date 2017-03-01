package cn.ifxcode.bbs.enumtype;

public enum Audit {

	PASS(1), REFAUSE(2);
	
	private int sign;
	
	Audit(int sign) {
		this.sign = sign;
	}
	
	public int getValue() {
		return sign;
	}
	
}

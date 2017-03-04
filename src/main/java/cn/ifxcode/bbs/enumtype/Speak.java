package cn.ifxcode.bbs.enumtype;

public enum Speak {

	OPEN(0), CLOSE(1);
	
	private int speak;
	
	Speak(int speak) {
		this.speak = speak;
	}
	
	public int getValue() {
		return speak;
	}
	
}

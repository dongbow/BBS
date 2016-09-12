package cn.ifxcode.bbs.exception;

public class BbsException extends RuntimeException{

	private static final long serialVersionUID = -7148785876333552179L;

	public BbsException(String message, Throwable cause) {
		super(message, cause);
	}

	public BbsException(String message) {
		super(message);
	}
	
}

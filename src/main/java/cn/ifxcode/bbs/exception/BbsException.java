package cn.ifxcode.bbs.exception;

public class BbsException extends RuntimeException{

	public BbsException(String message, Throwable cause) {
		super(message, cause);
	}

	public BbsException(String message) {
		super(message);
	}
	
}

package cn.ifxcode.bbs.bean;

public class Result {

	private int rc;
	private String msg;
	private String href;
	
	public Result() {}

	public Result(int rc, String msg) {
		this.rc = rc;
		this.msg = msg;
	}

	public Result(int rc, String msg, String href) {
		this.rc = rc;
		this.msg = msg;
		this.href = href;
	}
	
	public int getRc() {
		return rc;
	}
	public void setRc(int rc) {
		this.rc = rc;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public String getHref() {
		return href;
	}
	public void setHref(String href) {
		this.href = href;
	}
	
}

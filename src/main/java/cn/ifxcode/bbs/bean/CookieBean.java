package cn.ifxcode.bbs.bean;

public class CookieBean {

	private long user_id;
	private Integer is_admin;
	private String role_ids;
	private String nick_name;

	public CookieBean(long user_id, Integer is_admin, String role_ids, String nick_name) {
		this.user_id = user_id;
		this.is_admin = is_admin;
		this.role_ids = role_ids;
		this.nick_name = nick_name;
	}

	public long getUser_id() {
		return user_id;
	}

	public void setUser_id(long user_id) {
		this.user_id = user_id;
	}

	public String getNick_name() {
		return nick_name;
	}

	public void setNick_name(String nick_name) {
		this.nick_name = nick_name;
	}

	public Integer getIs_admin() {
		return is_admin;
	}

	public void setIs_admin(Integer is_admin) {
		this.is_admin = is_admin;
	}

	public String getRole_ids() {
		return role_ids;
	}

	public void setRole_ids(String role_ids) {
		this.role_ids = role_ids;
	}

	public String toString() {
		return user_id + ";" + is_admin + ";" + role_ids + ";" + nick_name;
	}
	
}

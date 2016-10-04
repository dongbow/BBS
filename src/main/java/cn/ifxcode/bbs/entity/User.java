package cn.ifxcode.bbs.entity;

import java.io.Serializable;
import java.util.List;

public class User implements Serializable{

	private static final long serialVersionUID = -4945319013726974900L;
	
	private UserAccess userAccess;
	private UserInfo userInfo;
	private UserPrivacy userPrivacy;
	private List<Role> roles;
	
	public UserAccess getUserAccess() {
		return userAccess;
	}

	public void setUserAccess(UserAccess userAccess) {
		this.userAccess = userAccess;
	}

	public List<Role> getRoles() {
		return roles;
	}

	public void setRoles(List<Role> roles) {
		this.roles = roles;
	}

	public UserInfo getUserInfo() {
		return userInfo;
	}

	public void setUserInfo(UserInfo userInfo) {
		this.userInfo = userInfo;
	}

	public UserPrivacy getUserPrivacy() {
		return userPrivacy;
	}

	public void setUserPrivacy(UserPrivacy userPrivacy) {
		this.userPrivacy = userPrivacy;
	}
	
}

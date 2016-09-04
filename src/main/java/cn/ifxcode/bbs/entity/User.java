package cn.ifxcode.bbs.entity;

import java.util.List;

public class User {

	private UserAccess userAccess;
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
	
}

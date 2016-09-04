package cn.ifxcode.bbs.entity;

public class Role {

	private Integer roleId;
	private String roleName;
	private String roleColor;
	private String roleDesc;
	private Integer roleStatus;
	private String roleCreateTime;

	public Integer getRoleId() {
		return roleId;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public String getRoleColor() {
		return roleColor;
	}

	public void setRoleColor(String roleColor) {
		this.roleColor = roleColor;
	}

	public String getRoleDesc() {
		return roleDesc;
	}

	public void setRoleDesc(String roleDesc) {
		this.roleDesc = roleDesc;
	}

	public Integer getRoleStatus() {
		return roleStatus;
	}

	public void setRoleStatus(Integer roleStatus) {
		this.roleStatus = roleStatus;
	}

	public String getRoleCreateTime() {
		return roleCreateTime;
	}

	public void setRoleCreateTime(String roleCreateTime) {
		this.roleCreateTime = roleCreateTime;
	}
}

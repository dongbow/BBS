package cn.ifxcode.bbs.enumtype;

public enum RoleSign {

	BMC("bmc"), ADMIN("admin");
	
	private String roleSign;
	
	RoleSign(String roleSign) {
		this.roleSign = roleSign;
	}
	
	public String getSign() {
		return roleSign;
	}
	
}

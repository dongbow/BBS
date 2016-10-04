package cn.ifxcode.bbs.entity;

import java.io.Serializable;

public class LoginLog implements Serializable{

	private static final long serialVersionUID = 264616929629036300L;
	
	private Integer loginId;
	private String loginName;
	private String loginLink;
	private Integer isSuccess;
	private Integer errorType;
	private String errorText;
	private String loginCreateTime;
	private String loginIp;

	public LoginLog() {}

	public LoginLog(String loginName, String loginLink, Integer isSuccess,
			String loginCreateTime, String loginIp) {
		this.loginName = loginName;
		this.loginLink = loginLink;
		this.isSuccess = isSuccess;
		this.loginCreateTime = loginCreateTime;
		this.loginIp = loginIp;
	}

	public LoginLog(String loginName, String loginLink, Integer isSuccess,
			Integer errorType, String loginCreateTime, String loginIp) {
		this.loginName = loginName;
		this.loginLink = loginLink;
		this.isSuccess = isSuccess;
		this.errorType = errorType;
		this.loginCreateTime = loginCreateTime;
		this.loginIp = loginIp;
	}

	public Integer getLoginId() {
		return loginId;
	}

	public void setLoginId(Integer loginId) {
		this.loginId = loginId;
	}

	public String getLoginName() {
		return loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	public String getLoginLink() {
		return loginLink;
	}

	public void setLoginLink(String loginLink) {
		this.loginLink = loginLink;
	}

	public Integer getIsSuccess() {
		return isSuccess;
	}

	public void setIsSuccess(Integer isSuccess) {
		this.isSuccess = isSuccess;
	}

	public Integer getErrorType() {
		return errorType;
	}

	public void setErrorType(Integer errorType) {
		this.errorType = errorType;
	}

	public String getLoginCreateTime() {
		return loginCreateTime;
	}

	public void setLoginCreateTime(String loginCreateTime) {
		this.loginCreateTime = loginCreateTime;
	}

	public String getLoginIp() {
		return loginIp;
	}

	public void setLoginIp(String loginIp) {
		this.loginIp = loginIp;
	}

	@Override
	public String toString() {
		return "LoginLog [loginId=" + loginId + ", loginName=" + loginName
				+ ", loginLink=" + loginLink + ", isSuccess=" + isSuccess
				+ ", errorText=" + errorText + ", loginCreateTime="
				+ loginCreateTime + ", loginIp=" + loginIp + "]";
	}

	public String getErrorText() {
		return errorText;
	}

	public void setErrorText(String errorText) {
		this.errorText = errorText;
	}
}

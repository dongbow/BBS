package cn.ifxcode.bbs.entity;

import java.io.Serializable;

public class UserAccess implements Serializable{

	private static final long serialVersionUID = 8714551535735544294L;
	
	private Long userId;
	private String userName;
	private String userNickname;
	private String userPassword;
	private String userEmail;
	private String userRegIp;
	private Integer userIsOnline;
	private Integer userIsLocked;
	private Integer userIsSpeak;
	private String userLastestLoginTime;
	private String userLastestLoginIp;
	private String userCreateTime;
	private Integer userIsAdmin;
	private Integer userIsBoderManager;
	private Integer userIsDelete;

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserNickname() {
		return userNickname;
	}

	public void setUserNickname(String userNickname) {
		this.userNickname = userNickname;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserRegIp() {
		return userRegIp;
	}

	public void setUserRegIp(String userRegIp) {
		this.userRegIp = userRegIp;
	}

	public Integer getUserIsOnline() {
		return userIsOnline;
	}

	public void setUserIsOnline(Integer userIsOnline) {
		this.userIsOnline = userIsOnline;
	}

	public Integer getUserIsLocked() {
		return userIsLocked;
	}

	public void setUserIsLocked(Integer userIsLocked) {
		this.userIsLocked = userIsLocked;
	}

	public Integer getUserIsSpeak() {
		return userIsSpeak;
	}

	public void setUserIsSpeak(Integer userIsSpeak) {
		this.userIsSpeak = userIsSpeak;
	}

	public String getUserLastestLoginTime() {
		return userLastestLoginTime;
	}

	public void setUserLastestLoginTime(String userLastestLoginTime) {
		this.userLastestLoginTime = userLastestLoginTime;
	}

	public String getUserLastestLoginIp() {
		return userLastestLoginIp;
	}

	public void setUserLastestLoginIp(String userLastestLoginIp) {
		this.userLastestLoginIp = userLastestLoginIp;
	}

	public String getUserCreateTime() {
		return userCreateTime;
	}

	public void setUserCreateTime(String userCreateTime) {
		this.userCreateTime = userCreateTime;
	}

	public Integer getUserIsAdmin() {
		return userIsAdmin;
	}

	public void setUserIsAdmin(Integer userIsAdmin) {
		this.userIsAdmin = userIsAdmin;
	}

	public Integer getUserIsBoderManager() {
		return userIsBoderManager;
	}

	public void setUserIsBoderManager(Integer userIsBoderManager) {
		this.userIsBoderManager = userIsBoderManager;
	}

	public Integer getUserIsDelete() {
		return userIsDelete;
	}

	public void setUserIsDelete(Integer userIsDelete) {
		this.userIsDelete = userIsDelete;
	}
}

package cn.ifxcode.bbs.utils;

public class RedisKeyUtils {

	public static String getUserInfo(long userId) {
		return "bbs:user:userId:" + Long.toString(userId);
	}
	
	public static String getRemember(long userId) {
		return "bbs:status:remember:" + Long.toString(userId);
	}
	
	public static String getBlackIps() {
		return "bbs:system:blackip";
	}
	
	public static String getResourcesByRoleId(Integer roleId) {
		return "bbs:resources:roleId:" + roleId;
	}
	
	public static String getRoles() {
		return "bbs:roles";
	}
	
	public static String getAreas() {
		return "bbs:areas";
	}

	public static String getNavigations() {
		return "bbs:global:navigation";
	}

	public static String getQuickNavigations() {
		return "bbs:global:quickNavigation";
	}

	public static String getBoardsByNavId(Integer navId) {
		return "bbs:global:boards:navid:" + navId;
	}

	public static String getClassifyByBoardId(Integer id) {
		return "bbs:global:classify:boardid:" + id;
	}
	
}

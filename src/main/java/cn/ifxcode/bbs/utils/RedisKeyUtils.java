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

	public static String getSystemConfig() {
		return "bbs:system:config";
	}
	
	public static String getTopicData(long topicId) {
		return "bbs:data:topic:topicid:" + topicId;
	}

	public static String getBoardInfoByBoardId(int boardId) {
		return "bbs:data:board:boardid:" + boardId;
	}
	
	public static String getSystemForget() {
		return "bbs:system:forget";
	}

	public static String getFriendLinks() {
		return "bbs:global:friendlinks";
	}

	public static String getClick(String[] sign) {
		String base = "bbs:global:click";
		for (String s : sign) {
			base += (":" + s);
		}
		return base;
	}

	public static String getCount(String key) {
		return "bbs:global:count:" + key;
	}

	public static String getAwards() {
		return "bbs:global:award";
	}
	
}

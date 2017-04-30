package cn.ifxcode.bbs.constant;

public class BbsConstant {

	public static final int SUPER_ADMIN = 1;
	
	public static final String UID = "uid";
	public static final String TID = "tid";
	public static final String DOMAIN = "";
	public static final String ROOT = "/bbs";
	public static final String TIP = "/tip";
	public static final String CLOSE = "/close";
	public static final String SYSTEM = "system";
	public static final String AUTH_HOME = "/system/admin/index";
	public static final String REMEMBER = "BBS_REMEMBER";
	public static final Integer REMEMBER_MAXAGE = 60 * 60 * 24 * 7;
	public static final Integer REMEMBER_TRUE = 1;
	
	public static final String PASSWORD = "5%lSx0s]YEm[gy%m2-=wT930!VUc2YA=";
	
	public static final Integer IS_ADMIN = 1;
	public static final Integer IS_BOARDMANAGER = 3;
	
	public static final String ADMIN_LOGIN = "/system/admin/account/login";
	public static final String SIMPLE_LOGIN = "/account/login";
	public static final String LOGOUT = "/account/logout";
	
	public static final String RC = "rc";
	public static final int OK = 1;
	public static final int ERROR = 0;
	public static final String DEFAULT_IMAGE = "http://ofrjra54d.bkt.clouddn.com/04d3d70e8529492eb63bae21f4a705dc1478274399206.jpg";
	public static final String UTF8 = "utf-8";
	
	public static final String BOARD = "/board";
	
	public static final int FRIEND_STATUS_DEFAULT = 1;//已发送
	public static final int FRIEND_STATUS_PASS = 2;//已通过
	public static final int FRIEND_STATUS_REFAUSE = 3;//已拒绝
	public static final int FRIEND_STATUS_DELETE = 4;//已删除

	public static final String SESSION_NAME = "bbs_user";
	
}

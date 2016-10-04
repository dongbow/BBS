package cn.ifxcode.bbs.constant;

import java.util.HashMap;
import java.util.Map;

import org.junit.Test;

public class BbsErrorCode {

	public static final Integer FORM_NULL = 4;
	
	public static final Integer USERNAME_NOT_EXISTS = 1001;
	public static final Integer PASSWORD_ERROR = 1002;
	public static final Integer VALIDATE_CODE_ERROR = 1003;
	public static final Integer EMAIL_ERROR_CODE = 1004;
	public static final Integer INPUT_ERROR_FIVE = 1005;
	
	public static final Integer USERNAME_EXISTS = 2001;
	public static final Integer NICKNAME_EXISTS = 2002;
	public static final Integer EMAIL_EXISTS = 2003;
	
	public static final Integer USER_ID_NOT_EXISTS = 3001;
	public static final Integer NICKNAME_NOT_EXISTS = 3002;
	public static final Integer EMAIL_NOT_EXISTS = 3003;
	
	public static final Integer NOT_LOGIN = 9001;
	public static final Integer REPEAT_SIGN = 9002;
	
	private static Map<Integer, String> map = new HashMap<Integer, String>();
	
	static {
		map.put(FORM_NULL, "表单内容不能为空");

		map.put(USERNAME_NOT_EXISTS, "用户名不存在");
		map.put(PASSWORD_ERROR, "密码错误");
		map.put(VALIDATE_CODE_ERROR, "验证码错误");
		map.put(EMAIL_ERROR_CODE, "邮箱错误");
		map.put(INPUT_ERROR_FIVE, "输入错误次数过多");
		
		map.put(USERNAME_EXISTS, "用户名已存在");
		map.put(NICKNAME_EXISTS, "昵称已存在");
		map.put(EMAIL_EXISTS, "邮箱已存在");
		
		map.put(USER_ID_NOT_EXISTS, "用户不存在");
		map.put(NICKNAME_NOT_EXISTS, "用户不存在");
		map.put(EMAIL_NOT_EXISTS, "邮箱不存在");
		
		map.put(NOT_LOGIN, "您还没有登录");
		map.put(REPEAT_SIGN, "您今天已经签到过了，请明天再继续");
	}
	
	public static String getDescribe(Integer errorCode) {
		return map.get(errorCode);
	}
	
	@Test
	public void testGetDescribe() {
		System.out.println(getDescribe(USERNAME_NOT_EXISTS));
	}
	
}

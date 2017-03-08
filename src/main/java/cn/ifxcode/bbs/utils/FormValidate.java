package cn.ifxcode.bbs.utils;

import java.util.Arrays;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.lang.StringUtils;

public class FormValidate {

	public static boolean email(String... emails) {
		Pattern p =  Pattern.compile("\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*");
		for (String email : emails) {
	        Matcher m = p.matcher(email);  
	        if(!m.matches()) {
	        	return false;
	        }  
		}
		return true;
	}
	
	public static boolean stringUtils(String... str) {
		for (String s : str) {
			if(StringUtils.isBlank(s)) {
				return false;
			}
		}
		return true;
	}
	
	public static boolean number(String param, int... values) {
		if(values.length > 1) 
			Arrays.sort(values);
		return number(param) && Arrays.binarySearch(values, Integer.parseInt(param)) > -1;
	}
	
	public static boolean number(String param) {
		return Pattern.matches("\\d+", param);
	}

	//TODO
	public static boolean nickname(String nickName) {
		return true;
	}

}

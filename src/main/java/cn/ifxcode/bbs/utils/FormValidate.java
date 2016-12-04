package cn.ifxcode.bbs.utils;

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
			if(StringUtils.isEmpty(s)) {
				return false;
			}
		}
		return true;
	}
}

package cn.ifxcode.bbs.utils;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

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
	
}

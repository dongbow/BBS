package cn.ifxcode.bbs.utils;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.junit.Test;

public class NumberUtils {

	public static boolean isNumber(String number) {
		if(Pattern.matches("\\d+", number)) {
			return true;
		}
		return false;
	}
	
	public static boolean isString(String number) {
		if(Pattern.matches("\\D+", number)) {
			return true;
		}
		return false;
	}
	
	public static long getAllNumber(String number) {
		if(isNumber(number)) {
			return number.length() > 18 ? Long.parseLong(number.substring(0, 18)) : Long.parseLong(number);
		} 
		if(isString(number)) {
			return 0;
		}
		String s = "";
		Matcher m = Pattern.compile("\\d+").matcher(number);
		while(m.find()) {
			s += m.group();
		}
		return number.length() > 18 ? Long.parseLong(s.substring(0, 18)) : Long.parseLong(s);
	}
	
	@Test
	public void test() {
		System.out.println(getAllNumber("L1"));
	}
	
}

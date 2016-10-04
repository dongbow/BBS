package cn.ifxcode.bbs.service;

import org.junit.Test;

import cn.ifxcode.bbs.bean.CookieBean;
import cn.ifxcode.bbs.utils.ReflectUtils;

public class ReflectTest {

	@Test
	public void test() {
		String s = "12;1;1,2;dongbo";
		CookieBean bean = ReflectUtils.returnEntity(CookieBean.class, s.split(";"));
		System.out.println(bean.getNick_name());
	}
	
	
}

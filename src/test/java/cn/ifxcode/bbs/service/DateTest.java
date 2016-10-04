package cn.ifxcode.bbs.service;

import java.util.Date;
import java.util.UUID;

import org.junit.Test;

import cn.ifxcode.bbs.utils.DateUtils;

public class DateTest {

	@Test
	public void test() {
		System.out.println(DateUtils.getSevenDaysAfterDate(new Date()));
		System.out.println(DateUtils.dt14LongFormat(DateUtils.getSevenDaysAfterDate(new Date())));
		System.out.println((UUID.randomUUID().toString() + new Date().getTime()).replace("-", ""));
	}
	
	
	@Test
	public void createName() {
		String uuid = UUID.randomUUID().toString().replace("-", "");
		uuid += new Date().getTime();
		System.out.println(uuid);
	}
}

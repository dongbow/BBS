package cn.ifxcode.bbs.service;

import org.junit.Test;

import com.alibaba.fastjson.JSONObject;

public class JsonTest {

	@Test
	public void test() {
		String ip = "\"ips\":\"127.0.0.1\"";
		JSONObject object = JSONObject.parseObject(ip);
		System.out.println(object);
	}
	
}

package cn.ifxcode.bbs.service;

import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.google.common.collect.Maps;

import cn.ifxcode.bbs.bean.Page;
import cn.ifxcode.bbs.dao.LoginLogDao;
import cn.ifxcode.bbs.entity.LoginLog;
import cn.ifxcode.bbs.utils.PropertiesUtils;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
    "classpath:spring/spring-dao.xml",
    "classpath:spring/spring-service.xml"})
public class MybatisRedisTest {

	@Autowired
	private LoginLogDao loginLogDao;
	
//	@Test
//	public void test() {
//		List<LoginLog> list = loginLogDao.getAllLoginLog();
//		for (LoginLog loginLog : list) {
//			System.out.println(loginLog.toString());
//		}
//		System.out.println("________________________________________________");
//		List<LoginLog> logs = loginLogDao.getAllLoginLog();
//		for (LoginLog loginLog : logs) {
//			System.out.println(loginLog.toString());
//		}
//	}
	
	@Test
	public void testProp() {
		System.out.println(PropertiesUtils.getValue("redis.host"));
	}
	
	@Test
	public void test() {
		Page page = Page.newBuilder(2, 10, "test/p1");
		Map<String, Object> map = Maps.newHashMap();
		map.put("page", page);
		map.put("status", 0);
		List<LoginLog> list = loginLogDao.getAllLoginLog(map);
		for (LoginLog loginLog : list) {
			System.out.println(loginLog.toString());
		}
		System.out.println(page.toString());
	}
	
}

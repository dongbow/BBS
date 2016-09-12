package cn.ifxcode.bbs.service;

import ltang.redis.service.RedisObjectMapService;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
    "classpath:spring/spring-dao.xml",
    "classpath:spring/spring-service.xml"})
public class ServiceTest {

	@Autowired
	private UserService userService;
	
	@Autowired
	private RedisObjectMapService mapService;
	
	@Test
	public void testService() {
		System.out.println(mapService);
	}
	
	@Test
	public void testValueCheck() {
		System.out.println(userService.valueCheck("email", "dongbo"));
	}
	
}

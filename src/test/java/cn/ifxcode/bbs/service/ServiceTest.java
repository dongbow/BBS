package cn.ifxcode.bbs.service;

import ltang.redis.service.RedisObjectMapService;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;

import cn.ifxcode.bbs.entity.BoardInfo;
import cn.ifxcode.bbs.entity.TopicData;
import cn.ifxcode.bbs.utils.RedisKeyUtils;

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
		TopicData topicData = new TopicData();
		topicData.setLastestReplyTime("2016-10-22 17:06:35");
		topicData.setLastestReplyUser("tonboy");
		topicData.setTopicFavoriteCount(0);
		topicData.setTopicId(1236);
		topicData.setTopicReplyCount(2);
		topicData.setTopicViewCount(199);
		mapService.save(RedisKeyUtils.getTopicData(1236), 
				JSONObject.parse(JSON.toJSONString(topicData)), JSONObject.class);
		System.out.println(mapService);
	}
	
	@Test
	public void testValueCheck() {
		System.out.println(userService.valueCheck("email", "dongbo"));
	}
	
	@Test
	public void test() {
		BoardInfo boardInfo = new BoardInfo();
		boardInfo.setBoardClickCount(100);
		boardInfo.setBoardFavoriteCount(0);
		boardInfo.setBoardId(206);
		boardInfo.setBoardReplyCount(2);
		boardInfo.setBoardTopicCount(1);
		mapService.save(RedisKeyUtils.getBoardInfoByBoardId(206), 
				JSONObject.parse(JSON.toJSONString(boardInfo)), JSONObject.class);
	}
	
	@Test
	public void testJson() {
		JSONObject object = mapService.get(RedisKeyUtils.getSystemForget(), JSONObject.class);
		System.out.println(object == null);
	}
}

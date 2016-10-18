package cn.ifxcode.bbs.utils;

import java.util.List;

import org.apache.commons.lang.StringUtils;

import com.alibaba.fastjson.JSONObject;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

public class SystemConfigUtils {

	private static JedisPool jedisPool = null;
	private static Jedis jedis = null;
	private static JSONObject object = null;
	
	static {
		jedisPool = new JedisPool(PropertiesUtils.getValue("redis.host"), 
				Integer.parseInt(PropertiesUtils.getValue("redis.port")));
		jedis = jedisPool.getResource();
		if(StringUtils.isNotBlank(PropertiesUtils.getValue("redis.pass"))) {
			jedis.auth(PropertiesUtils.getValue("redis.pass"));
		}
		List<String> list = jedis.hmget(RedisKeyUtils.getSystemConfig(), "config");
		if(list != null && list.size() > 0) {
			object = JSONObject.parseObject(list.get(0));
		}
		jedis.disconnect();
		jedisPool.destroy();
	}
	
	public static boolean getIsAllowRegister() {
		if(Integer.parseInt(object.getString("isAllowRegister")) == 0) {
			return true;
		}
		return false;
	}
	
	public static boolean getIsOpenTopicAudit() {
		if(Integer.parseInt(object.getString("isOpenTopicAudit")) == 0) {
			return true;
		}
		return false;
	}
	
	public static boolean getIsOpenReplyAudit() {
		if(Integer.parseInt(object.getString("isOpenReplyAudit")) == 0) {
			return true;
		}
		return false;
	}
}

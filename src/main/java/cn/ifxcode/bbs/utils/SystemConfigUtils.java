package cn.ifxcode.bbs.utils;

import java.util.Map;

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
		Map<String, String> map = jedis.hgetAll(RedisKeyUtils.getSystemConfig());
		if(map != null && map.size() > 0) {
			object = new JSONObject(true);
			for (Map.Entry<String, String> entry : map.entrySet()) {
				object.put(entry.getKey(), entry.getValue());
			}
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

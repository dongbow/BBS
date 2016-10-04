package cn.ifxcode.bbs.dao.cache;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.UnsupportedEncodingException;
import java.util.Set;
import java.util.concurrent.locks.ReadWriteLock;
import java.util.concurrent.locks.ReentrantReadWriteLock;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.ibatis.cache.Cache;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.ifxcode.bbs.utils.PropertiesUtils;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;
import redis.clients.jedis.exceptions.JedisConnectionException;

public class RedisCache implements Cache {
	
	private static Logger logger = LoggerFactory.getLogger(RedisCache.class);
	
	private final ReadWriteLock readWriteLock = new ReentrantReadWriteLock();
	
	private final String COMMON_CACHE_KEY = "bbs:";
    private static final String UTF_8 = "utf-8";
   
    private String getKey(Object key) {
        StringBuilder accum = new StringBuilder();
        accum.append(COMMON_CACHE_KEY);
        accum.append(this.id).append(":");
        accum.append(DigestUtils.md5Hex(String.valueOf(key)));
        return accum.toString();
    }
   
    private String getKeys() {
        return COMMON_CACHE_KEY + this.id + ":*";
    }

	private String id;

	public RedisCache(final String id) {
		if (id == null) {
			throw new IllegalArgumentException("必须传入ID");
		}
		logger.debug("RedisCache:id=" + id);
		this.id = id;
	}

	@Override
	public String getId() {
		return this.id;
	}

	@Override
	public int getSize() {
		Jedis jedis = null;
		JedisPool jedisPool = null;
		int result = 0;
		boolean borrowOrOprSuccess = true;
		try {
			jedis = CachePool.getInstance().getJedis();
			jedisPool = CachePool.getInstance().getJedisPool();
			Set<byte[]> keys = jedis.keys(getKeys().getBytes(UTF_8));
            if (null != keys && !keys.isEmpty()) {
                result = keys.size();
            }
            logger.debug(this.id+"---->>>>总缓存数:" + result);
		} catch (JedisConnectionException e) {
			borrowOrOprSuccess = false;
			if (jedis != null)
				jedisPool.returnBrokenResource(jedis);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} finally {
			if (borrowOrOprSuccess)
				jedisPool.returnResource(jedis);
		}
		return result;

	}

	@Override
	public void putObject(Object key, Object value) {
		if (logger.isDebugEnabled())
			logger.debug("putObject:" + key.hashCode() + "=" + value);
		if (logger.isInfoEnabled())
			logger.info("put to redis sql :" + key.toString());
		Jedis jedis = null;
		JedisPool jedisPool = null;
		boolean borrowOrOprSuccess = true;
		try {
			jedis = CachePool.getInstance().getJedis();
			jedisPool = CachePool.getInstance().getJedisPool();
			 byte[] keys = getKey(key).getBytes(UTF_8);
			jedis.set(keys, SerializeUtil.serialize(value));
		} catch (JedisConnectionException e) {
			borrowOrOprSuccess = false;
			if (jedis != null)
				jedisPool.returnBrokenResource(jedis);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} finally {
			if (borrowOrOprSuccess)
				jedisPool.returnResource(jedis);
		}

	}

	@Override
	public Object getObject(Object key) {
		Jedis jedis = null;
		JedisPool jedisPool = null;
		Object value = null;
		boolean borrowOrOprSuccess = true;
		try {
			jedis = CachePool.getInstance().getJedis();
			jedisPool = CachePool.getInstance().getJedisPool();
			value = SerializeUtil.unserialize(jedis.get(getKey(key).getBytes(UTF_8)));
		} catch (JedisConnectionException e) {
			borrowOrOprSuccess = false;
			if (jedis != null)
				jedisPool.returnBrokenResource(jedis);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} finally {
			if (borrowOrOprSuccess)
				jedisPool.returnResource(jedis);
		}
		if (logger.isDebugEnabled())
			logger.debug("getObject:" + key.hashCode() + "=" + value);
		return value;
	}

	@Override
	public Object removeObject(Object key) {
		Jedis jedis = null;
		JedisPool jedisPool = null;
		Object value = null;
		boolean borrowOrOprSuccess = true;
		try {
			jedis = CachePool.getInstance().getJedis();
			jedisPool = CachePool.getInstance().getJedisPool();
			value = jedis.del(getKey(key).getBytes(UTF_8));
		} catch (JedisConnectionException e) {
			borrowOrOprSuccess = false;
			if (jedis != null)
				jedisPool.returnBrokenResource(jedis);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} finally {
			if (borrowOrOprSuccess)
				jedisPool.returnResource(jedis);
		}
		if (logger.isDebugEnabled())
			logger.debug("getObject:" + key.hashCode() + "=" + value);
		return value;
	}

	@Override
	public void clear() {
		Jedis jedis = null;
		JedisPool jedisPool = null;
		boolean borrowOrOprSuccess = true;
		try {
			jedis = CachePool.getInstance().getJedis();
			jedisPool = CachePool.getInstance().getJedisPool();
			Set<byte[]> keys = jedis.keys(getKeys().getBytes(UTF_8));
            logger.debug("出现CUD操作，清空对应Mapper缓存======>"+keys.size());
            for (byte[] key : keys) {
                jedis.del(key);
            }
		} catch (JedisConnectionException e) {
			borrowOrOprSuccess = false;
			if (jedis != null)
				jedisPool.returnBrokenResource(jedis);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} finally {
			if (borrowOrOprSuccess)
				jedisPool.returnResource(jedis);
		}
	}

	@Override
	public ReadWriteLock getReadWriteLock() {
		return readWriteLock;
	}

	public static class CachePool {
		JedisPool pool;
		private static final CachePool cachePool = new CachePool();

		public static CachePool getInstance() {
			return cachePool;
		}

		private CachePool() {
			JedisPoolConfig config = new JedisPoolConfig();
			config.setMaxIdle(Integer.parseInt(PropertiesUtils.getValue("redis.maxIdle")));
			config.setMaxWait(Long.parseLong(PropertiesUtils.getValue("redis.maxWait")));
			pool = new JedisPool(config, PropertiesUtils.getValue("redis.host"));
		}

		public Jedis getJedis() {
			Jedis jedis = null;
			boolean borrowOrOprSuccess = true;
			try {
				jedis = pool.getResource();
			} catch (JedisConnectionException e) {
				borrowOrOprSuccess = false;
				if (jedis != null)
					pool.returnBrokenResource(jedis);
			} finally {
				if (borrowOrOprSuccess)
					pool.returnResource(jedis);
			}
			jedis = pool.getResource();
			return jedis;
		}

		public JedisPool getJedisPool() {
			return this.pool;
		}

	}

	public static class SerializeUtil {
		public static byte[] serialize(Object object) {
			ObjectOutputStream oos = null;
			ByteArrayOutputStream baos = null;
			try {
				// 序列化
				baos = new ByteArrayOutputStream();
				oos = new ObjectOutputStream(baos);
				oos.writeObject(object);
				byte[] bytes = baos.toByteArray();
				return bytes;
			} catch (Exception e) {
				e.printStackTrace();
			}
			return null;
		}

		public static Object unserialize(byte[] bytes) {
			if (bytes == null)
				return null;
			ByteArrayInputStream bais = null;
			try {
				// 反序列化
				bais = new ByteArrayInputStream(bytes);
				ObjectInputStream ois = new ObjectInputStream(bais);
				return ois.readObject();
			} catch (Exception e) {
				e.printStackTrace();
			}
			return null;
		}
	}
}
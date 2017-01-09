package cn.ifxcode.bbs.service.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import ltang.redis.service.RedisObjectMapService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.alibaba.fastjson.JSONObject;
import com.google.common.collect.Maps;

import cn.ifxcode.bbs.bean.Page;
import cn.ifxcode.bbs.constant.BbsConstant;
import cn.ifxcode.bbs.dao.SystemBlackIpDao;
import cn.ifxcode.bbs.entity.SystemBlackIp;
import cn.ifxcode.bbs.logger.SysLog;
import cn.ifxcode.bbs.service.SystemBlackIpService;
import cn.ifxcode.bbs.utils.DateUtils;
import cn.ifxcode.bbs.utils.RedisKeyUtils;

@Service
public class SystemBlackIpServiceImpl implements SystemBlackIpService {

	private Logger logger = LoggerFactory.getLogger(this.getClass()); 
	
	@Resource
	private SystemBlackIpDao systemBlackIpDao;
	
	@Resource
	private RedisObjectMapService redisObjectMapService;
	
	public List<String> blackIps() {
		return systemBlackIpDao.findAllIpAddress();
	}

	@Override
	public List<SystemBlackIp> getBlackIps(Page page) {
		return systemBlackIpDao.getList();
	}

	@Override
	@SysLog(module = "系统配置", methods = "黑名单-添加")
	public int addBlackIp(String ip) {
		int result = 0;
		try {
			SystemBlackIp blackIp = new SystemBlackIp();
			blackIp.setBlackIp(ip);
			blackIp.setBlackCreateTime(DateUtils.dt14LongFormat(new Date()));
			if(systemBlackIpDao.add(blackIp) == BbsConstant.OK) {
				refresh();
				result = BbsConstant.OK;
			}
		} catch (Exception e) {
			logger.error("add black ip fail", e);
		}
		return result;
	}

	@Override
	@Transactional
	@SysLog(module = "系统配置", methods = "黑名单-删除")
	public int deleteBlackIp(String ids) {
		int result = 0;
		String blackIds[] = ids.split(",");
		try {
			Map<String, Object> map = Maps.newHashMap();
			map.put("blackIds", blackIds);
			if(systemBlackIpDao.delete(map) == blackIds.length) {
				refresh();
				result = BbsConstant.OK;
			}
		} catch (Exception e) {
			logger.error("delete black ip fail", e);
		}
		return result;
	}
	
	public void refresh() {
		List<String> ips = systemBlackIpDao.findAllIpAddress();
		StringBuilder builder = new StringBuilder();
		builder.append("{\"ips\":\"");
		for (String ip : ips) {
			builder.append(ip + ";");
		}
		builder.append("\"}");
		redisObjectMapService.save(RedisKeyUtils.getBlackIps(), JSONObject.parseObject(builder.toString()), JSONObject.class);
	}

}

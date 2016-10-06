package cn.ifxcode.bbs.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import ltang.redis.service.RedisObjectMapService;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;

import cn.ifxcode.bbs.entity.SystemConfig;
import cn.ifxcode.bbs.service.GeneralService;
import cn.ifxcode.bbs.utils.GetRemoteIpUtil;
import cn.ifxcode.bbs.utils.RedisKeyUtils;

@Service
public class GeneralServiceImpl implements GeneralService {

	@Resource
	private RedisObjectMapService redisObjectMapService;
	
	public boolean checkIp(HttpServletRequest request) {
		String ip = GetRemoteIpUtil.getRemoteIp(request);
		List<String> ips = this.getBlackIpsFromCache();
		if(ips != null && ips.size() > 0) {
			for (String string : ips) {
				Pattern pattern = Pattern.compile(string);
				if(pattern.matcher(ip).find()) {
					return true;
				}
			}
		}
		return false;
	}
	
	private List<String> getBlackIpsFromCache() {
		List<String> list = new ArrayList<String>();
		JSONObject ips = redisObjectMapService.get(RedisKeyUtils.getBlackIps(), JSONObject.class);
		if(ips.containsKey("ips")) {
			String s[] = ips.getString("ips").split(";");
			for (int i = 0; i < s.length; i++) {
				if(StringUtils.isNotBlank(s[i])) {
					list.add(s[i]);
				}
			}
		}
		return list.size() > 0 ? list : null;
	}

	@Override
	public boolean checkLogin(HttpServletRequest request) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean checkBbsIsClose() {
		JSONObject object = redisObjectMapService.get(RedisKeyUtils.getSystemConfig(), JSONObject.class);
		if(object != null) {
			SystemConfig config = JSONObject.toJavaObject(JSONObject.parseObject(object.getString("config")), SystemConfig.class);
			if(config.getIsOpenBbs() == 1) {
				return true;
			}
		}
		return false;
	}

}

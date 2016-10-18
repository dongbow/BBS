package cn.ifxcode.bbs.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import ltang.redis.service.RedisObjectMapService;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.alibaba.fastjson.JSONObject;

import cn.ifxcode.bbs.bean.CookieBean;
import cn.ifxcode.bbs.constant.BbsConstant;
import cn.ifxcode.bbs.dao.GeneralDao;
import cn.ifxcode.bbs.dao.UserValueDao;
import cn.ifxcode.bbs.entity.ExperienceHistory;
import cn.ifxcode.bbs.entity.GoldHistory;
import cn.ifxcode.bbs.entity.SystemConfig;
import cn.ifxcode.bbs.entity.UserValue;
import cn.ifxcode.bbs.enumtype.EGHistory;
import cn.ifxcode.bbs.service.GeneralService;
import cn.ifxcode.bbs.service.UserService;
import cn.ifxcode.bbs.utils.GetRemoteIpUtil;
import cn.ifxcode.bbs.utils.RedisKeyUtils;
import cn.ifxcode.bbs.utils.UserValueUtils;

@Service
public class GeneralServiceImpl implements GeneralService {

	@Resource
	private UserService userService;
	
	@Resource
	private UserValueDao userValueDao;
	
	@Resource
	private GeneralDao generalDao;
	
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

	@Override
	@Transactional
	public int UserAward(EGHistory eg, long uid, HttpServletRequest request) {
		GoldHistory goldHistory = null;
		ExperienceHistory experienceHistory = null;
		UserValue userValue = UserValueUtils.topic(userService.getUserValue(uid));
		if(eg.getFrom() == 3) {
			userValue.setUserTopicCount(userValue.getUserTopicCount() + 1);
		}
		if(eg.getFrom() == 4) {
			userValue.setUserReplyCount(userValue.getUserReplyCount() + 1);
		}
		CookieBean cookieBean = userService.getCookieBeanFromCookie(request);
		if(userValue.isGoldChange()) {
			goldHistory = new GoldHistory(userValue.getUserId(), cookieBean.getNick_name(), userValue.getThisGold(), eg.getFrom(), 
					eg.getDesc(), userValue.getUserLastestPastTime());
		}
		if(userValue.isExpChange()) {
			experienceHistory = new ExperienceHistory(userValue.getUserId(), cookieBean.getNick_name(), userValue.getThisExp(), 
					eg.getDesc(), userValue.getUserLastestPastTime());
		}
		userValueDao.updateUserValue(userValue);
		generalDao.insertExperienceHistory(experienceHistory);
		generalDao.insertGoldHistory(goldHistory);
		return BbsConstant.OK;
	}

}

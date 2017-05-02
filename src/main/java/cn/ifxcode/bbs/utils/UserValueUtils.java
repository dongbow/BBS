package cn.ifxcode.bbs.utils;

import java.util.Date;

import org.apache.commons.lang.StringUtils;

import cn.ifxcode.bbs.entity.AwardValue;
import cn.ifxcode.bbs.entity.UserValue;
import cn.ifxcode.bbs.service.GeneralService;

public class UserValueUtils {

	private static GeneralService generalService;
	
	public static GeneralService getGeneralService() {
		if (generalService == null) {
			return SpringUtils.getBean(GeneralService.class);
		}
		return generalService;
	}
	
	public static UserValue sign(UserValue userValue) {
		AwardValue av = getGeneralService().getAwardValue("签到");
		if(StringUtils.isNotBlank(userValue.getUserLastestPastTime())
				&& DateUtils.getDateDifferenceBegin(userValue.getUserLastestPastTime(), DateUtils.dt14LongFormat(new Date())) == 0) {
			return null;
		}
		Exp(userValue, av.getExpValue());
		gold(userValue, av.getGoldValue());
		userValue.setUserPastCount(userValue.getUserPastCount() + 1);
		if(!StringUtils.isNotBlank(userValue.getUserLastestPastTime())
				|| DateUtils.getDateDifferenceBegin(userValue.getUserLastestPastTime(), DateUtils.dt14LongFormat(new Date())) > 24 * 60) {
			userValue.setUserPastSerialCount(1);
		} else {
			userValue.setUserPastSerialCount(userValue.getUserPastSerialCount() + 1);
		}
		userValue.setUserLastestPastTime(DateUtils.dt14LongFormat(new Date()));
		return userValue;
	}

	public static UserValue login(UserValue userValue) {
		AwardValue av = getGeneralService().getAwardValue("每日登录");
		Exp(userValue, av.getExpValue());
		gold(userValue, av.getGoldValue());
		return userValue;
	}
	
	public static UserValue topic(UserValue userValue) {
		AwardValue av = getGeneralService().getAwardValue("发帖");
		Exp(userValue, av.getExpValue());
		gold(userValue, av.getGoldValue());
		return userValue;
	}
	
	public static UserValue reply(UserValue userValue) {
		AwardValue av = getGeneralService().getAwardValue("回帖");
		Exp(userValue, av.getExpValue());
		gold(userValue, av.getGoldValue());
		return userValue;
	}
	
	public static UserValue download(UserValue userValue) {
		AwardValue av = getGeneralService().getAwardValue("首次下载(同一附件)");
		if(userValue.getUserGold() < Math.abs(av.getGoldValue())) {
			return null;
		}
		gold2(userValue, av.getGoldValue());
		return userValue;
	}
	
	private static void Exp(UserValue userValue, int value) {
		AwardValue av = getGeneralService().getAwardValue("每日限制(除注册)");
		if((userValue.getTodayExp() == 0 && StringUtils.isEmpty(userValue.getTodayExpTime()))
				|| (userValue.getTodayExp() < av.getExpValue() && DateUtils.getDateDifferenceBegin(userValue.getTodayExpTime(), DateUtils.dt14LongFormat(new Date())) >= 0)) {
			userValue.setUserExperience(userValue.getUserExperience() + value);
			userValue.setTodayExp(userValue.getTodayExp() + value);
			userValue.setTodayExpTime(DateUtils.dt14FromDate(new Date()));
			userValue.setExpChange(true);
			userValue.setThisExp(value);
		}
	}
	
	private static void gold(UserValue userValue, int value) {
		AwardValue av = getGeneralService().getAwardValue("每日限制(除注册)");
		if((userValue.getTodayGold() == av.getGoldValue() && StringUtils.isEmpty(userValue.getTodayGoldTime()))
				|| (userValue.getTodayGold() < av.getGoldValue() && DateUtils.getDateDifferenceBegin(userValue.getTodayGoldTime(), DateUtils.dt14LongFormat(new Date())) >= 0)) {
			userValue.setUserGold(userValue.getUserGold() + value);
			if(userValue.getTodayGold() == av.getGoldValue()) {
				userValue.setTodayGold(value);
			} else {
				userValue.setTodayGold(userValue.getTodayGold() + value);
			}
			userValue.setTodayGoldTime(DateUtils.dt14LongFormat(new Date()));
			userValue.setGoldChange(true);
			userValue.setThisGold(value);
		}
	}
	
	private static void gold2(UserValue userValue, int value) {
		AwardValue av = getGeneralService().getAwardValue("每日限制(除注册)");
		userValue.setUserGold(userValue.getUserGold() + value);
		if(userValue.getTodayGold() == av.getGoldValue()) {
			userValue.setTodayGold(value);
		} else {
			userValue.setTodayGold(userValue.getTodayGold() + Math.abs(value));
		}
		userValue.setTodayGoldTime(DateUtils.dt14LongFormat(new Date()));
		userValue.setGoldChange(true);
		userValue.setThisGold(value);
	}

}

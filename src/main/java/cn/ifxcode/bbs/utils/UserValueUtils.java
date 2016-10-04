package cn.ifxcode.bbs.utils;

import java.util.Date;

import org.apache.commons.lang.StringUtils;

import cn.ifxcode.bbs.entity.UserValue;

public class UserValueUtils {

	public static UserValue sign(UserValue userValue) {
		if(StringUtils.isNotBlank(userValue.getUserLastestPastTime())
				&& DateUtils.getDateDifferenceBegin(userValue.getUserLastestPastTime(), DateUtils.dt14LongFormat(new Date())) == 0) {
			return null;
		}
		if((userValue.getTodayExp() == 0 && !StringUtils.isNotBlank(userValue.getTodayExpTime()))
				|| (userValue.getTodayExp() < 50 && DateUtils.getDateDifferenceBegin(userValue.getTodayExpTime(), DateUtils.dt14LongFormat(new Date())) > 0)) {
			userValue.setUserExperience(userValue.getUserExperience() + 1);
			userValue.setTodayExp(userValue.getTodayExp() + 1);
			userValue.setTodayExpTime(DateUtils.dt14FromDate(new Date()));
		}
		if((userValue.getTodayGold() == 0 && !StringUtils.isNotBlank(userValue.getTodayGoldTime()))
				|| (userValue.getTodayGold() < 50 && DateUtils.getDateDifferenceBegin(userValue.getTodayGoldTime(), DateUtils.dt14LongFormat(new Date())) > 0)) {
			userValue.setUserGold(userValue.getUserGold() + 1);
			userValue.setTodayGold(userValue.getTodayGold() + 1);
			userValue.setTodayGoldTime(DateUtils.dt14LongFormat(new Date()));
		}
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
	
}

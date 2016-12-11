package cn.ifxcode.bbs.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.common.collect.Maps;

import cn.ifxcode.bbs.bean.Page;
import cn.ifxcode.bbs.constant.BbsConstant;
import cn.ifxcode.bbs.dao.GeneralDao;
import cn.ifxcode.bbs.dao.UserValueDao;
import cn.ifxcode.bbs.entity.ExperienceHistory;
import cn.ifxcode.bbs.entity.GoldHistory;
import cn.ifxcode.bbs.entity.UserValue;
import cn.ifxcode.bbs.service.GoldExperienceService;
import cn.ifxcode.bbs.utils.DateUtils;

@Service
public class GoldExperienceServiceImpl implements GoldExperienceService{

	@Resource
	private GeneralDao generalDao;
	
	@Resource
	private UserValueDao userValueDao;

	@Transactional
	public int insertGE(GoldHistory goldHistory, ExperienceHistory experienceHistory) {
		if(goldHistory != null) {
			generalDao.insertGoldHistory(goldHistory);
		}
		if(experienceHistory != null) {
			generalDao.insertExperienceHistory(experienceHistory);
		}
		return BbsConstant.ERROR;
	}

	@Override
	public List<GoldHistory> getAllUserGolds(Page page, long uid) {
		Map<String, Object> map = Maps.newHashMap();
		if(page != null) {
			map.put("page", page);
		}
		if(uid != 0) {
			map.put("uid", uid);
		}
		List<GoldHistory> histories = generalDao.getAllGoldHistory(map);
		for (GoldHistory gh : histories) {
			UserValue value = userValueDao.getUserValue(gh.getUserId());
			gh.setGoldValue((int) value.getUserGold());
		}
		return histories;
	}

	@Override
	public List<GoldHistory> getUserGoldsByUid(Page page, String startTime, String endTime, long uid) {
		Map<String, Object> map = Maps.newHashMap();
		map.put("page", page);
		map.put("uid", uid);
		if(StringUtils.isNotBlank(startTime)) {
			map.put("starttime", startTime);
		}
		if(StringUtils.isNotBlank(endTime)) {
			map.put("endtime", endTime);
		}
		List<GoldHistory> histories = generalDao.getUserGoldsByUid(map);
		for (GoldHistory gh : histories) {
			gh.setCreateTime(DateUtils.dt14LongFormat(DateUtils.dt14FromStr(gh.getCreateTime())));
		}
		return histories;
	}

	@Override
	public List<ExperienceHistory> getAllUserExps(Page page, long uid) {
		Map<String, Object> map = Maps.newHashMap();
		if(page != null) {
			map.put("page", page);
		}
		if(uid != 0) {
			map.put("uid", uid);
		}
		List<ExperienceHistory> histories = generalDao.getAllExps(map);
		for (ExperienceHistory exp : histories) {
			UserValue value = userValueDao.getUserValue(exp.getUserId());
			exp.setExpValue((int) value.getUserExperience());
		}
		return histories;
	}

	@Override
	public List<ExperienceHistory> getUserExpsByUid(Page page, String starttime, String endtime, long uid) {
		Map<String, Object> map = Maps.newHashMap();
		map.put("page", page);
		map.put("uid", uid);
		if(StringUtils.isNotBlank(starttime)) {
			map.put("starttime", starttime);
		}
		if(StringUtils.isNotBlank(endtime)) {
			map.put("endtime", endtime);
		}
		List<ExperienceHistory> histories = generalDao.getUserExpsByUid(map);
		for (ExperienceHistory exp : histories) {
			exp.setCreateTime(DateUtils.dt14LongFormat(DateUtils.dt14FromStr(exp.getCreateTime())));
		}
		return histories;
	}


}

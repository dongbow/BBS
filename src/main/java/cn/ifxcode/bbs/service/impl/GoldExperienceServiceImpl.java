package cn.ifxcode.bbs.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.ifxcode.bbs.constant.BbsConstant;
import cn.ifxcode.bbs.dao.GeneralDao;
import cn.ifxcode.bbs.entity.ExperienceHistory;
import cn.ifxcode.bbs.entity.GoldHistory;
import cn.ifxcode.bbs.service.GoldExperienceService;

@Service
public class GoldExperienceServiceImpl implements GoldExperienceService{

	@Resource
	private GeneralDao generalDao;

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

}

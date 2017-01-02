package cn.ifxcode.bbs.service.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.google.common.collect.Maps;

import cn.ifxcode.bbs.bean.Page;
import cn.ifxcode.bbs.constant.BbsConstant;
import cn.ifxcode.bbs.dao.RecommendDao;
import cn.ifxcode.bbs.entity.Recommend;
import cn.ifxcode.bbs.logger.SysLog;
import cn.ifxcode.bbs.service.RecommendService;
import cn.ifxcode.bbs.utils.DateUtils;

@Service
public class RecommendServiceImpl implements RecommendService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Resource
	private RecommendDao recommendDao;
	
	@Override
	public List<Recommend> getAllRecommends(Page page) {
		return this.getAllRecommends(page, null, null, -1, 0);
	}

	@Override
	public List<Recommend> getAllRecommends(Page page, String startTime,
			String endTime, int status, int location) {
		Map<String, Object> map = Maps.newHashMap();
		map.put("page", page);
		if(StringUtils.isNotBlank(startTime)) {
			map.put("starttime", startTime);
		}
		if(StringUtils.isNotBlank(endTime)) {
			map.put("endtime", endTime);
		}
		if(status != -1) {
			map.put("status", status);
		}
		if(location != 0) {
			map.put("location", location);
		}
		List<Recommend> recommends = recommendDao.getAllRecommends(map);
		for (Recommend rc : recommends) {
			rc.setCreateTime(DateUtils.dt14LongFormat(DateUtils.dt14FromStr(rc.getCreateTime())));
		}
		return recommends;
	}

	@Override
	public List<Recommend> getAllRecommends() {
		return recommendDao.getAllRecommendsForMenu();
	}

	@Override
	@SysLog(module = "首页管理", methods = "首页推荐-添加")
	public int addRecommend(String name, String link, int location, int sort, int status) {
		try {
			Recommend recommend = new Recommend();
			recommend.setRcName(name);
			recommend.setRcHref(link);
			recommend.setLocation(location);
			recommend.setRcSort(sort);
			recommend.setRcStatus(status);
			recommend.setCreateTime(DateUtils.dt14LongFormat(new Date()));
			if(recommendDao.insert(recommend) == BbsConstant.OK) {
				return BbsConstant.OK;
			}
		} catch (Exception e) {
			logger.error("add home recommend fail", e);
		}
		return BbsConstant.ERROR;
	}

	@Override
	public Recommend getRecommend(int id) {
		return recommendDao.get(id);
	}

	@Override
	@SysLog(module = "首页管理", methods = "首页推荐-编辑")
	public int updateRecommend(int id, String name, String link, int location, int sort, int status) {
		try {
			Recommend recommend = new Recommend();
			recommend.setRcId(id);
			recommend.setRcName(name);
			recommend.setRcHref(link);
			recommend.setLocation(location);
			recommend.setRcSort(sort);
			recommend.setRcStatus(status);
			if(recommendDao.update(recommend) == BbsConstant.OK) {
				return BbsConstant.OK;
			}
		} catch (Exception e) {
			logger.error("update home recommend fail", e);
		}
		return BbsConstant.ERROR;
	}

}

package cn.ifxcode.bbs.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import com.google.common.collect.Maps;

import cn.ifxcode.bbs.bean.Page;
import cn.ifxcode.bbs.dao.RecommendDao;
import cn.ifxcode.bbs.entity.Recommend;
import cn.ifxcode.bbs.service.RecommendService;
import cn.ifxcode.bbs.utils.DateUtils;

@Service
public class RecommendServiceImpl implements RecommendService {

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

}

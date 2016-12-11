package cn.ifxcode.bbs.service;

import java.util.List;

import cn.ifxcode.bbs.bean.Page;
import cn.ifxcode.bbs.entity.Recommend;

public interface RecommendService {

	public List<Recommend> getAllRecommends(Page page);
	
	public List<Recommend> getAllRecommends(Page page, String startTime, String endTime, int status, int location);

	public List<Recommend> getAllRecommends();

}

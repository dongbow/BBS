package cn.ifxcode.bbs.dao;

import java.util.List;
import java.util.Map;

import cn.ifxcode.bbs.entity.Recommend;

public interface RecommendDao {

	public List<Recommend> getAllRecommends(Map<String, Object> map);

	public List<Recommend> getAllRecommendsForMenu();

}

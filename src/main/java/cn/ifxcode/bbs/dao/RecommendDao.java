package cn.ifxcode.bbs.dao;

import java.util.List;
import java.util.Map;

import cn.ifxcode.bbs.entity.Recommend;

public interface RecommendDao {

	public List<Recommend> getAllRecommends(Map<String, Object> map);

	public List<Recommend> getAllRecommendsForMenu();

	public int insert(Recommend recommend);

	public Recommend get(int id);

	public int update(Recommend recommend);

	public int delete(Map<String, Object> map);

}

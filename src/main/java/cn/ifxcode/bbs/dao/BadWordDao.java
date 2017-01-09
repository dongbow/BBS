package cn.ifxcode.bbs.dao;

import java.util.List;
import java.util.Map;

import cn.ifxcode.bbs.entity.BadWord;

public interface BadWordDao {

	public List<BadWord> getBadWords(Map<String, Object> map);

	public int add(BadWord badWord);

	public int delete(Map<String, Object> map);

}

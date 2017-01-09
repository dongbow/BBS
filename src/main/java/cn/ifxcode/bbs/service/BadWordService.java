package cn.ifxcode.bbs.service;

import java.util.List;

import cn.ifxcode.bbs.bean.Page;
import cn.ifxcode.bbs.entity.BadWord;

public interface BadWordService {

	public int add(String word);
	
	public int delete(String ids);
	
	public List<BadWord> getBadWords(Page page);
	
	public List<BadWord> getBadWords(Page page, String word);
	
}

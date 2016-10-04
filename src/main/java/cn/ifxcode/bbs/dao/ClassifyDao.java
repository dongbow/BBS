package cn.ifxcode.bbs.dao;

import java.util.List;

import cn.ifxcode.bbs.entity.Classify;

public interface ClassifyDao {

	public List<Classify> getClassifyByBoardId(Integer boardId);

}

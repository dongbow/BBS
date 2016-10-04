package cn.ifxcode.bbs.service;

import java.util.List;

import cn.ifxcode.bbs.entity.Classify;

public interface ClassifyService {

	public List<Classify> getClassifyByBoardId(int boardId);

}

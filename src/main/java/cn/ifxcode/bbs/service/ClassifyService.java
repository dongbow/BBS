package cn.ifxcode.bbs.service;

import java.util.List;

import cn.ifxcode.bbs.bean.Page;
import cn.ifxcode.bbs.entity.Classify;

public interface ClassifyService {

	public List<Classify> getClassifyByBoardId(int boardId);

	public Classify getClassifyByCid(Integer boardId, Integer classId);

	public int saveOrUpdateCount(int bid, int cid);

	public List<Classify> getAllClassify(Page page);
	
	public List<Classify> getAllClassify(Page page, String startTime, String endTime, String name, int bid, int status, int auth);

}

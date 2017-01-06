package cn.ifxcode.bbs.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import cn.ifxcode.bbs.entity.Classify;

public interface ClassifyDao {

	public List<Classify> getClassifyByBoardId(Integer boardId);

	public List<Classify> getAllClassify(Map<String, Object> map);

	public int syncTopicCount(@Param("cid")Integer cid, @Param("count")long count);

}

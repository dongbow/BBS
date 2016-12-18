package cn.ifxcode.bbs.dao;

import java.util.List;
import java.util.Map;

import cn.ifxcode.bbs.entity.ScheduleJob;

public interface ScheduleJobDao {
	
	public int delete(long jobId);

	public int insert(ScheduleJob job);

	public ScheduleJob selectByJobId(Long jobId);

	public int updateByJobId(ScheduleJob job);

	public List<ScheduleJob> getAll(Map<String, Object> map);
}
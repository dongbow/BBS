package cn.ifxcode.bbs.service;

import java.util.List;

import cn.ifxcode.bbs.bean.Page;
import cn.ifxcode.bbs.entity.ScheduleJob;

public interface QuartzService {

	public List<ScheduleJob> getAllJobFromDB(Page page);
	
	public List<ScheduleJob> getAllJobFromDB(Page page, String jobName, int status);
	
	public int addJobToDB(ScheduleJob job);
	
	public int updateJob(ScheduleJob job);
	
	public ScheduleJob getJobById(long jobId);
	
	public int changeStatus(long jobId, String cmd);
	
	public int updateCron(long jobId, String cron);
	
	public void addJob(ScheduleJob job);
	
	public List<ScheduleJob> getAllJob();
	
	public List<ScheduleJob> getRunningJob();
	
	public int pauseJob(ScheduleJob scheduleJob);
	
	public int resumeJob(ScheduleJob scheduleJob);
	
	public int deleteJob(ScheduleJob scheduleJob);
	
	public int runAJobNow(ScheduleJob scheduleJob);
	
	public void updateJobCron(ScheduleJob scheduleJob);
	
}

package cn.ifxcode.bbs.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.quartz.CronExpression;
import org.quartz.CronScheduleBuilder;
import org.quartz.CronTrigger;
import org.quartz.Job;
import org.quartz.JobBuilder;
import org.quartz.JobDetail;
import org.quartz.JobExecutionContext;
import org.quartz.JobKey;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.Trigger;
import org.quartz.TriggerBuilder;
import org.quartz.TriggerKey;
import org.quartz.impl.matchers.GroupMatcher;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.google.common.collect.Maps;

import cn.ifxcode.bbs.bean.Page;
import cn.ifxcode.bbs.constant.BbsConstant;
import cn.ifxcode.bbs.dao.ScheduleJobDao;
import cn.ifxcode.bbs.entity.ScheduleJob;
import cn.ifxcode.bbs.job.QuartzJobFactory;
import cn.ifxcode.bbs.job.QuartzJobFactoryDisallowConcurrentExecution;
import cn.ifxcode.bbs.logger.SysLog;
import cn.ifxcode.bbs.service.QuartzService;

@Service
public class QuartzServiceImpl implements QuartzService {

	public Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Resource
	private Scheduler scheduler;

	@Resource
	private ScheduleJobDao scheduleJobDao;
	
	/**
	 * 从数据库中取 区别于getAllJob
	 */
	public List<ScheduleJob> getAllJobFromDB(Page page) {
		return getAllJobFromDB(page, null, -1);
	}
	
	public List<ScheduleJob> getAllJobFromDB(Page page, String jobName, int status) {
		Map<String, Object> map = Maps.newHashMap();
		if(page != null) {
			map.put("page", page);
		}
		if(StringUtils.isNotBlank(jobName)) {
			map.put("name", "%" + jobName + "%");
		}
		if(status != -1) {
			map.put("status", status);
		}
		return scheduleJobDao.getAll(map);
	}

	/**
	 * 添加到数据库中 区别于addJob
	 */
	@SysLog(module = "任务调度", methods = "任务列表-添加")
	public int addJobToDB(ScheduleJob job) {
		try {
			job.setCreateTime(new Date());
			int row = scheduleJobDao.insert(job);
			if(row == BbsConstant.OK) {
				return BbsConstant.OK;
			}
		} catch (Exception e) {
			logger.error("add job to db error", e);
		}
		return BbsConstant.ERROR;
	}

	/**
	 * 从数据库中查询job
	 */
	public ScheduleJob getJobById(long jobId) {
		return scheduleJobDao.selectByJobId(jobId);
	}
	
	@SysLog(module = "任务调度", methods = "任务列表-更新")
	public int updateJob(ScheduleJob job) {
		try {
			int row = scheduleJobDao.updateByJobId(job);
			if(row == BbsConstant.OK) {
				return BbsConstant.OK;
			}
		} catch (Exception e) {
			logger.error("update job to db fail", e);
		}
		return BbsConstant.ERROR;
	}

	/**
	 * 更改任务状态
	 */
	public int changeStatus(long jobId, String cmd) {
		ScheduleJob job = getJobById(jobId);
		if (job == null) {
			return BbsConstant.ERROR;
		}
		if ("stop".equals(cmd)) {
			deleteJob(job);
			job.setJobStatus(ScheduleJob.STATUS_NOT_RUNNING);
		} else if ("start".equals(cmd)) {
			job.setJobStatus(ScheduleJob.STATUS_RUNNING);
			addJob(job);
		}
		updateJob(job);
		return BbsConstant.ERROR;
	}

	/**
	 * 更改任务 cron表达式
	 */
	public int updateCron(long jobId, String cron) {
		if(StringUtils.isNotBlank(cron) && CronExpression.isValidExpression(cron)) {
			ScheduleJob job = getJobById(jobId);
			if (job == null) {
				return BbsConstant.ERROR;
			}
			job.setCronExpression(cron);
			if (ScheduleJob.STATUS_RUNNING.equals(job.getJobStatus())) {
				updateJobCron(job);
			}
			scheduleJobDao.updateByJobId(job);
		}
		return BbsConstant.ERROR;
	}

	/**
	 * 添加任务至执行任务列表
	 */
	public void addJob(ScheduleJob job) {
		try {
			if (job == null || !ScheduleJob.STATUS_RUNNING.equals(job.getJobStatus())) {
				return;
			}

			TriggerKey triggerKey = TriggerKey.triggerKey(job.getJobName(), job.getJobGroup());
			CronTrigger trigger = (CronTrigger) scheduler.getTrigger(triggerKey);
			if (null == trigger) {
				Class<? extends Job> clazz = (Class<? extends Job>) (ScheduleJob.CONCURRENT_IS.equals(job.getIsConcurrent()) ? QuartzJobFactory.class : QuartzJobFactoryDisallowConcurrentExecution.class);
				JobDetail jobDetail = JobBuilder.newJob(clazz).withIdentity(job.getJobName(), job.getJobGroup()).build();
				jobDetail.getJobDataMap().put("scheduleJob", job);
				CronScheduleBuilder scheduleBuilder = CronScheduleBuilder.cronSchedule(job.getCronExpression());
				trigger = TriggerBuilder.newTrigger().withIdentity(job.getJobName(), job.getJobGroup()).withSchedule(scheduleBuilder).build();
				scheduler.scheduleJob(jobDetail, trigger);
			} else {
				CronScheduleBuilder scheduleBuilder = CronScheduleBuilder.cronSchedule(job.getCronExpression());
				trigger = trigger.getTriggerBuilder().withIdentity(triggerKey).withSchedule(scheduleBuilder).build();
				scheduler.rescheduleJob(triggerKey, trigger);
			}
		} catch (SchedulerException e) {
			logger.error("add job to run list fail", e);
		}
	}

	/**
	 * 获取所有计划中的任务列表
	 */
	public List<ScheduleJob> getAllJob() {
		List<ScheduleJob> jobList = new ArrayList<ScheduleJob>();
		try {
			GroupMatcher<JobKey> matcher = GroupMatcher.anyJobGroup();
			Set<JobKey> jobKeys = scheduler.getJobKeys(matcher);
			for (JobKey jobKey : jobKeys) {
				List<? extends Trigger> triggers = scheduler.getTriggersOfJob(jobKey);
				for (Trigger trigger : triggers) {
					ScheduleJob job = new ScheduleJob();
					job.setJobName(jobKey.getName());
					job.setJobGroup(jobKey.getGroup());
					job.setDescription("触发器:" + trigger.getKey());
					Trigger.TriggerState triggerState = scheduler.getTriggerState(trigger.getKey());
					job.setJobStatus(triggerState.name());
					if (trigger instanceof CronTrigger) {
						CronTrigger cronTrigger = (CronTrigger) trigger;
						String cronExpression = cronTrigger.getCronExpression();
						job.setCronExpression(cronExpression);
					}
					jobList.add(job);
				}
			}
		} catch (SchedulerException e) {
			logger.error("get all job on run list fail", e);
		}
		return jobList;
	}

	/**
	 * 所有正在运行的job
	 */
	public List<ScheduleJob> getRunningJob() {
		List<ScheduleJob> jobList = null;
		try {
			List<JobExecutionContext> executingJobs = scheduler.getCurrentlyExecutingJobs();
			jobList = new ArrayList<ScheduleJob>(executingJobs.size());
			for (JobExecutionContext executingJob : executingJobs) {
				ScheduleJob job = new ScheduleJob();
				JobDetail jobDetail = executingJob.getJobDetail();
				JobKey jobKey = jobDetail.getKey();
				Trigger trigger = executingJob.getTrigger();
				job.setJobName(jobKey.getName());
				job.setJobGroup(jobKey.getGroup());
				job.setDescription("触发器:" + trigger.getKey());
				Trigger.TriggerState triggerState = scheduler.getTriggerState(trigger.getKey());
				job.setJobStatus(triggerState.name());
				if (trigger instanceof CronTrigger) {
					CronTrigger cronTrigger = (CronTrigger) trigger;
					String cronExpression = cronTrigger.getCronExpression();
					job.setCronExpression(cronExpression);
				}
				jobList.add(job);
			}
		} catch (SchedulerException e) {
			logger.error("get all running job fail", e);
		}
		return jobList;
	}

	/**
	 * 暂停一个job
	 */
	public int pauseJob(ScheduleJob scheduleJob) {
		try {
			JobKey jobKey = JobKey.jobKey(scheduleJob.getJobName(), scheduleJob.getJobGroup());
			scheduler.pauseJob(jobKey);
			return BbsConstant.OK;
		} catch (SchedulerException e) {
			logger.error("pause job fail", e);
		}
		return BbsConstant.ERROR;
	}

	/**
	 * 恢复一个job
	 */
	public int resumeJob(ScheduleJob scheduleJob) {
		try {
			JobKey jobKey = JobKey.jobKey(scheduleJob.getJobName(), scheduleJob.getJobGroup());
			scheduler.resumeJob(jobKey);
			return BbsConstant.OK;
		} catch (SchedulerException e) {
			logger.error("resume job fail", e);
		}
		return BbsConstant.ERROR;
	}

	/**
	 * 删除一个job
	 */
	public int deleteJob(ScheduleJob scheduleJob) {
		try {
			JobKey jobKey = JobKey.jobKey(scheduleJob.getJobName(), scheduleJob.getJobGroup());
			scheduler.deleteJob(jobKey);
			return BbsConstant.OK;
		} catch (SchedulerException e) {
			logger.error("delete job on exec list fail", e);
		}
		return BbsConstant.ERROR;
	}

	/**
	 * 立即执行job
	 */
	public int runAJobNow(ScheduleJob scheduleJob) {
		try {
			JobKey jobKey = JobKey.jobKey(scheduleJob.getJobName(), scheduleJob.getJobGroup());
			scheduler.triggerJob(jobKey);
			return BbsConstant.OK;
		} catch (SchedulerException e) {
			logger.error("run a job now fail", e);
		}
		return BbsConstant.ERROR;
	}

	/**
	 * 更新执行中的任务的时间表达式
	 */
	public void updateJobCron(ScheduleJob scheduleJob) {
		try {
			TriggerKey triggerKey = TriggerKey.triggerKey(scheduleJob.getJobName(), scheduleJob.getJobGroup());
			CronTrigger trigger = (CronTrigger) scheduler.getTrigger(triggerKey);
			CronScheduleBuilder scheduleBuilder = CronScheduleBuilder.cronSchedule(scheduleJob.getCronExpression());
			trigger = trigger.getTriggerBuilder().withIdentity(triggerKey).withSchedule(scheduleBuilder).build();
			scheduler.rescheduleJob(triggerKey, trigger);
		} catch (SchedulerException e) {
			logger.error("update job cron fail", e);
		}
	}


}

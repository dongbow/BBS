package cn.ifxcode.bbs.logger;

import javax.annotation.Resource;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.LocalVariableTableParameterNameDiscoverer;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

import cn.ifxcode.bbs.dao.ScheduleJobDao;
import cn.ifxcode.bbs.service.UserService;

@Order(2)
@Aspect
@Component
public class SysQuartzAop {

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	private LocalVariableTableParameterNameDiscoverer parameterNameDiscoverer = new LocalVariableTableParameterNameDiscoverer();
	
	@Resource
	private ScheduleJobDao jobDao;
	
	@Resource
	private UserService userService;
	
	@Pointcut("@annotation(cn.ifxcode.bbs.logger.SysQuartz)")
	public void LogAspect() {
	}
	
	
	
}

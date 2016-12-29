package cn.ifxcode.bbs.logger;

import java.lang.reflect.Array;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.LocalVariableTableParameterNameDiscoverer;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import cn.ifxcode.bbs.dao.BmcLogDao;
import cn.ifxcode.bbs.entity.BmcLog;
import cn.ifxcode.bbs.exception.BbsException;
import cn.ifxcode.bbs.service.UserService;
import cn.ifxcode.bbs.utils.GetRemoteIpUtil;

@Order(2)
@Aspect
@Component
public class BmcLogAop {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	private LocalVariableTableParameterNameDiscoverer parameterNameDiscoverer = new LocalVariableTableParameterNameDiscoverer();
	
	@Resource
	private BmcLogDao bmcLogDao;
	
	@Resource
	private UserService userService;
	
	@Pointcut("@annotation(cn.ifxcode.bbs.logger.BmcLogAnno)")
	public void LogAspect() {
	}

	@AfterThrowing(pointcut = "LogAspect()", throwing = "e")
	public void doAfterThrowing(JoinPoint point, Throwable e) throws Exception {
		RequestAttributes ra = RequestContextHolder.getRequestAttributes();
		ServletRequestAttributes sra = (ServletRequestAttributes)ra;
		HttpServletRequest request = sra.getRequest();
		BmcLog bmcLog = new BmcLog();
		Map<String, Object> map = this.getMethodDescription(point);
		bmcLog.setModules("<font color=\"red\">" + map.get("module").toString() + "</font>");
		bmcLog.setStatus(0);
		bmcLog.setStatusDesc("<font color=\"red\">执行方法异常:-->" + e + "</font>");
		bmcLog.setArgs(map.get("args").toString());
		bmcLog.setUserId(userService.getUserIdFromCookie(request));
		bmcLog.setUserNickname(userService.getNicknameFromCookie(request));
		bmcLog.setIp(GetRemoteIpUtil.getRemoteIp(request));
		bmcLog.setCreateTime(new Date());
		bmcLogDao.insert(bmcLog);
	}

	@Around("LogAspect()")
	public Object doAround(ProceedingJoinPoint point) {
		RequestAttributes ra = RequestContextHolder.getRequestAttributes();
		ServletRequestAttributes sra = (ServletRequestAttributes)ra;
		HttpServletRequest request = sra.getRequest();
		Object result = null;
		try {
			result = point.proceed();
			BmcLog bmcLog = new BmcLog();
			Map<String, Object> map = this.getMethodDescription(point);
			bmcLog.setModules(map.get("module").toString());
			bmcLog.setStatus(1);
			bmcLog.setStatusDesc(map.get("description").toString());
			bmcLog.setArgs(map.get("args").toString());
			bmcLog.setUserId(userService.getUserIdFromCookie(request));
			bmcLog.setUserNickname(userService.getNicknameFromCookie(request));
			bmcLog.setIp(GetRemoteIpUtil.getRemoteIp(request));
			bmcLog.setCreateTime(new Date());
			bmcLogDao.insert(bmcLog);
		} catch (Throwable e) {
			logger.error("异常信息:{}", e.getMessage());
			throw new BbsException("日志记录异常", e);
		}
		return result;
	}

	@SuppressWarnings("rawtypes")
	public Map<String, Object> getMethodDescription(JoinPoint joinPoint) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String targetName = joinPoint.getTarget().getClass().getName();
		String methodName = joinPoint.getSignature().getName();
		Object[] arguments = joinPoint.getArgs();
		Class<?> targetClass = Class.forName(targetName);
		Method[] methods = targetClass.getMethods();
		for (Method method : methods) {
			if (method.getName().equals(methodName)) {
				Class[] clazzs = method.getParameterTypes();
				if (clazzs.length == arguments.length) {
					map.put("module", method.getAnnotation(BmcLogAnno.class).modules());
					map.put("args", this.getArgs(method, arguments));
					map.put("description", "执行成功!");
					break;
				}
			}
		}
		return map;
	}
	
	private String getArgs(Method method, Object[] arguments) {
		StringBuilder builder = new StringBuilder("<table class=\"table table-bordered\"><tbody>");
		String params[] = parameterNameDiscoverer.getParameterNames(method);
		for (int i = 0; i < params.length; i++) {
			if(!StringUtils.equals("request", params[i])) {
				if(arguments[i].getClass().isArray()) {
					arguments[i] = Arrays.toString(makeArrayObject(arguments[i]).toArray());
				}
				builder.append("<tr><td>" + params[i]).append("</td><td>").append(arguments[i] + "</td></tr>");
			}
        }
        return builder.append("</tbody></table>").toString();
    }
	
    private List<Object> makeArrayObject(Object array) {  
        List<Object> tem = new ArrayList<Object>();  
        for (int i = 0; i < Array.getLength(array); i++) {  
            tem.add(Array.get(array, i));  
        }  
        return tem;  
    }  

}

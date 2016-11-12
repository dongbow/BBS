package cn.ifxcode.bbs.service.impl;

import java.util.Date;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import cn.ifxcode.bbs.bean.CookieBean;
import cn.ifxcode.bbs.constant.BbsConstant;
import cn.ifxcode.bbs.dao.ReportDao;
import cn.ifxcode.bbs.entity.Report;
import cn.ifxcode.bbs.service.ReportService;
import cn.ifxcode.bbs.service.UserService;
import cn.ifxcode.bbs.utils.DateUtils;
import cn.ifxcode.bbs.utils.GetRemoteIpUtil;
import cn.ifxcode.bbs.utils.NumberUtils;

@Service
public class ReportServiceImpl implements ReportService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Resource
	private UserService userService;
	
	@Resource
	private ReportDao reportDao;

	@Override
	public int addReport(String uid, String tid, String rid, String floor,
			String rs, String other, String url, HttpServletRequest request) {
		long beUid = NumberUtils.getAllNumber(uid);
		long beTid = NumberUtils.getAllNumber(tid);
		long beRid = NumberUtils.getAllNumber(rid);
		long beFloor = NumberUtils.getAllNumber(floor);
		if(beUid == 0 || beTid == 0) {
			return BbsConstant.ERROR;
		}
		CookieBean bean = userService.getCookieBeanFromCookie(request);
		Lock lock = new ReentrantLock();
		if(lock.tryLock()) {
			try {
				lock.lock();
				Report report = new Report();
				report.setBeFloor((int) beFloor);
				report.setBeRid(beRid);
				report.setBeTid(beTid);
				report.setBeUid(beUid);
				report.setBeUrl(url);
				report.setCusReason(other);
				report.setNickname(bean.getNick_name());
				report.setReason(rs);
				report.setReportIp(GetRemoteIpUtil.getRemoteIp(request));
				report.setReportStatus(1);
				report.setReportTime(DateUtils.dt14LongFormat(new Date()));
				report.setUid(bean.getUser_id());
				if(reportDao.insert(report) == BbsConstant.OK) {
					return BbsConstant.OK;
				} else {
					return BbsConstant.ERROR;
				}
			} catch (Exception e) {
				logger.error("add report fail", e);
				return BbsConstant.ERROR;
			} finally {
				lock.unlock();
			}
		}
		return BbsConstant.ERROR;
	}

}

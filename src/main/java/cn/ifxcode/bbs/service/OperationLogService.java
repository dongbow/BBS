package cn.ifxcode.bbs.service;

import java.util.List;

import cn.ifxcode.bbs.bean.Page;
import cn.ifxcode.bbs.entity.SystemLog;

public interface OperationLogService {

	public List<SystemLog> getAllOperationLog(Page page, String startTime, String endTime,
			String module, String name, int status);

}

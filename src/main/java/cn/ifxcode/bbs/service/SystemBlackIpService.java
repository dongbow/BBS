package cn.ifxcode.bbs.service;

import java.util.List;

import cn.ifxcode.bbs.bean.Page;
import cn.ifxcode.bbs.entity.SystemBlackIp;

public interface SystemBlackIpService {

	public List<String> blackIps();

	public List<SystemBlackIp> getBlackIps(Page page);

	public int addBlackIp(String ip);

	public int deleteBlackIp(String ids);
	
}

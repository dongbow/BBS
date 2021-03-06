package cn.ifxcode.bbs.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import cn.ifxcode.bbs.entity.Resources;

public interface ResourcesService {

	public List<Resources> getResourcesByIds(List<Integer> roleIds);

	public int addResources(String name, String link, String sign, int pid,
			String icon, int type, int sort, int status, int way, int[] roles, HttpServletRequest request);

	public List<String> getAllModules();
	
	public void addResourcesToRedis(Resources resources, int[] roles);

	public List<Resources> getMasterRes(HttpServletRequest request);

	public List<Resources> getResourcesByRoleIdNotTree(int roleId);
	
}

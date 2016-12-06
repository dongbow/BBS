package cn.ifxcode.bbs.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import cn.ifxcode.bbs.entity.Role;

public interface RoleService {

	public List<Integer> getRoleIds(HttpServletRequest request);

	public int insertRoleResources(int roleId, List<Integer> resIds);

	public List<Role> getAllRoles();

	public boolean checkIsSuperAdmin(HttpServletRequest request);

	public int addRole(String name, String desc, String color, int type, int status);
	
	public void refreshRoleToRedis(Role role);

}

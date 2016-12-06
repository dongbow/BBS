package cn.ifxcode.bbs.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.ifxcode.bbs.entity.Role;

public interface RoleDao {

	public List<Integer> getRoleIds();

	public List<Role> getAllRoles();

	public void insertUserRole(@Param("userId")Long userId, @Param("roleId")Integer roleId);

	public int insertRoleResources(@Param("roleId")int roleId, @Param("resIds")List<Integer> resIds);

	public int addRole(Role role);
	
}

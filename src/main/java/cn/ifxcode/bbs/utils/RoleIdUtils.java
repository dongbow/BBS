package cn.ifxcode.bbs.utils;

import java.util.ArrayList;
import java.util.List;

import cn.ifxcode.bbs.entity.Role;

public class RoleIdUtils {

	public static String formatRoleIds(List<Role> roles) {
		List<Integer> ids = new ArrayList<Integer>();
		for (Role role : roles) {
			ids.add(role.getRoleId());
		}
		return formatIds(ids.toString());
	}
	
	public static String formatIds(String ids) {
		return ids.substring(1, ids.length() - 1).replace(" ", "");
	}
	
	public static List<Integer> getRoleIds(String ids) {
		List<Integer> roleIds = new ArrayList<Integer>();
		for (int i = 0; i < ids.split(",").length; i++) {
			roleIds.add(Integer.parseInt(ids.split(",")[i]));
		}
		return roleIds;
	}
	
}

package cn.ifxcode.bbs.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import ltang.redis.service.RedisObjectMapService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

import cn.ifxcode.bbs.bean.CookieBean;
import cn.ifxcode.bbs.constant.BbsConstant;
import cn.ifxcode.bbs.dao.RoleDao;
import cn.ifxcode.bbs.entity.Role;
import cn.ifxcode.bbs.logger.SysLog;
import cn.ifxcode.bbs.service.RoleService;
import cn.ifxcode.bbs.service.UserService;
import cn.ifxcode.bbs.utils.DateUtils;
import cn.ifxcode.bbs.utils.FormValidate;
import cn.ifxcode.bbs.utils.JsonUtils;
import cn.ifxcode.bbs.utils.RedisKeyUtils;
import cn.ifxcode.bbs.utils.RoleIdUtils;

@Service
public class RoleServiceImpl implements RoleService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Resource
	private UserService userService;
	
	@Resource
	private RedisObjectMapService redisObjectMapService;
	
	@Resource
	private RoleDao roleDao;
	
	@Override
	public List<Integer> getRoleIds(HttpServletRequest request) {
		CookieBean bean = userService.getCookieBeanFromCookie(request);
		return RoleIdUtils.getRoleIds(bean.getRole_ids());
	}

	@Override
	@Transactional
	@SysLog(module = "系统管理", methods = "角色管理-授权")
	public int insertRoleResources(int roleId, List<Integer> resIds) {
		return roleDao.insertRoleResources(roleId, resIds);
	}

	@Override
	public List<Role> getAllRoles() {
		JSONObject object = redisObjectMapService.get(RedisKeyUtils.getRoles(), JSONObject.class);
		return JsonUtils.decodeRoleByJson(JSONArray.parseArray(object.getString("roles")));
	}

	@Override
	public boolean checkIsSuperAdmin(HttpServletRequest request) {
		List<Integer> roleIds = getRoleIds(request);
		for (Integer id : roleIds) {
			if(id.equals(BbsConstant.SUPER_ADMIN)) {
				return true;
			}
		}
		return false;
	}

	@Override
	@SysLog(module = "系统管理", methods="角色管理-添加")
	public int addRole(String name, String desc, String color, int type, int status) {
		if (FormValidate.stringUtils(name, color)) {
			Role role = new Role();
			role.setRoleName(name);
			role.setRoleDesc(desc);
			role.setRoleColor(color);
			role.setIsAccess(type);
			role.setRoleStatus(status);
			role.setRoleCreateTime(DateUtils.dt14LongFormat(new Date()));
			try {
				if(BbsConstant.OK == roleDao.addRole(role)) {
					refreshRoleToRedis(role);
					return BbsConstant.OK;
				}
			} catch (Exception e) {
				logger.error("add role fail", e);
				return BbsConstant.ERROR;
			}
		}
		return BbsConstant.ERROR;
	}

	public void refreshRoleToRedis(Role role) {
		boolean is = false;
		List<Role> roles = getAllRoles();
		for (Role r : roles) {
			if(role.getRoleId().equals(r.getRoleId())) {
				r = role;
				is = true;
			}
		}
		if(!is) {
			roles.add(role);
		}
		JSONObject object = new JSONObject(true);
		object.put("roles", JSONArray.parseArray(JSON.toJSONString(roles)).toJSONString());
		redisObjectMapService.save(RedisKeyUtils.getRoles(), object, JSONObject.class);
	}

}

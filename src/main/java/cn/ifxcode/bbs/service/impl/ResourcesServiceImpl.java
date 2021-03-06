package cn.ifxcode.bbs.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;

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
import com.google.common.collect.Maps;

import cn.ifxcode.bbs.bean.CookieBean;
import cn.ifxcode.bbs.constant.BbsConstant;
import cn.ifxcode.bbs.dao.ResourcesDao;
import cn.ifxcode.bbs.entity.Resources;
import cn.ifxcode.bbs.logger.SysLog;
import cn.ifxcode.bbs.service.ResourcesService;
import cn.ifxcode.bbs.service.RoleService;
import cn.ifxcode.bbs.service.UserService;
import cn.ifxcode.bbs.utils.DateUtils;
import cn.ifxcode.bbs.utils.FormValidate;
import cn.ifxcode.bbs.utils.JsonUtils;
import cn.ifxcode.bbs.utils.RedisKeyUtils;
import cn.ifxcode.bbs.utils.RoleIdUtils;

@Service
public class ResourcesServiceImpl implements ResourcesService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Resource
	private ResourcesDao resourcesDao;
	
	@Resource
	private UserService userService;
	
	@Resource
	private RoleService roleService;
	
	@Resource
	private RedisObjectMapService redisObjectMapService;
	
	public List<Resources> getResourcesByIds(List<Integer> roleIds) {
		Map<String, Object[]> map = Maps.newHashMap();
		map.put("array", roleIds.toArray());
		return resourcesDao.getResByRoleIds(map);
	}

	@Override
	@SysLog(module = "系统管理", methods = "资源管理-添加")
	@Transactional
	public int addResources(String name, String link, String sign, int pid,
			String icon, int type, int sort, int status, int way, int roles[], HttpServletRequest request) {
		synchronized (this) {
			if(FormValidate.stringUtils(name, link, sign, icon) && roles.length > 0) {
				Resources resources = new Resources();
				resources.setResName(name);
				resources.setResLink(link);
				resources.setResSign(sign);
				resources.setResParentId(pid);
				resources.setResSort(sort);
				resources.setResIcon(icon);
				resources.setResStatus(status);
				resources.setResType(type);
				resources.setTurnWay(way);
				resources.setResCreateTime(DateUtils.dt14LongFormat(new Date()));
				try {
					int row = resourcesDao.insertResources(resources);
					if(row == BbsConstant.OK) {
						List<Integer> resIds = new ArrayList<Integer>();
						resIds.add(resources.getResId());
						roleService.insertRoleResources(BbsConstant.SUPER_ADMIN, resIds);
						for (int id : roles) {
							if(id != BbsConstant.SUPER_ADMIN) {
								roleService.insertRoleResources(id, resIds);
							}
						}
						addResourcesToRedis(resources, roles);
						return BbsConstant.OK;
					}
				} catch (Exception e) {
					logger.error("insert resources error", e);
					return BbsConstant.ERROR;
				}
			} 
			return BbsConstant.ERROR;
		}
	}

	@Override
	public List<String> getAllModules() {
		return resourcesDao.getAllModules();
	}

	@Override
	public void addResourcesToRedis(Resources resources, int[] roles) {
		for (int id : roles) {
			JSONObject object = redisObjectMapService.get(RedisKeyUtils.getResourcesByRoleId(id), JSONObject.class);
			List<Resources> list = JsonUtils.decodeJson(JSONArray.parseArray(object.getString("resources")), Resources.class);
			list.add(resources);
			JSONObject jsonObject = new JSONObject(true);
			jsonObject.put("resources", JSONArray.parseArray(JSON.toJSONString(list)).toJSONString());
			redisObjectMapService.save(RedisKeyUtils.getResourcesByRoleId(id), jsonObject, JSONObject.class);
		}
	}

	@Override
	public List<Resources> getMasterRes(HttpServletRequest request) {
		CookieBean bean = userService.getCookieBeanFromCookie(request);
		List<Integer> ids = RoleIdUtils.getRoleIds(bean.getRole_ids());
		List<Resources> lists = new ArrayList<Resources>();
		for (Integer id : ids) {
			JSONObject object = redisObjectMapService.get(RedisKeyUtils.getResourcesByRoleId(id), JSONObject.class);
			JSONArray result = JSONArray.parseArray(object.getString("resources"));
			List<Resources> res = JsonUtils.decodeJson(result, Resources.class);
			lists.addAll(res);
		}
		Set<Resources> set = new TreeSet<Resources>(lists);
		List<Resources> resources = new ArrayList<Resources>(set);
		return resources;
		
	}

	@Override
	public List<Resources> getResourcesByRoleIdNotTree(int roleId) {
		JSONObject object = redisObjectMapService.get(RedisKeyUtils.getResourcesByRoleId(roleId), JSONObject.class);
		JSONArray result = JSONArray.parseArray(object.getString("resources"));
		List<Resources> res = JsonUtils.decodeJson(result, Resources.class);
		return res;
	}

}

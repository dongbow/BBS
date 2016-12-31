package cn.ifxcode.bbs.utils;

import java.util.ArrayList;
import java.util.List;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

import cn.ifxcode.bbs.entity.Role;
import cn.ifxcode.bbs.entity.User;

public class JsonUtils {

	public static User decodeJson(JSONObject object) {
		JSONObject jsonUser = JSONObject.parseObject(object.getString("user"));
		User user = JSONObject.toJavaObject(jsonUser, User.class);
		return user;
	}
	
	public static <T> List<T> decodeJson(JSONArray array, Class<T> clz) {
		List<T> list = new ArrayList<T>();
		for (Object object : array) {
			JSONObject json = JSONObject.parseObject(JSON.toJSONString(object));
			list.add(JSONObject.toJavaObject(json, clz));
		}
		return list;
	}
	
	public static List<Role> decodeRoleByJson(JSONArray array) {
		List<Role> list = new ArrayList<Role>();
		for (Object object : array) {
			JSONObject json = JSONObject.parseObject(JSON.toJSONString(object));
			Role role = JSONObject.toJavaObject(json, Role.class);
			role.setRoleCreateTime(DateUtils.dt14LongFormat(DateUtils.dt14FromStr(role.getRoleCreateTime())));
			list.add(role);
		}
		return list;
	}
	
}

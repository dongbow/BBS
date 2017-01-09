package cn.ifxcode.bbs.service.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.google.common.collect.Maps;

import ltang.redis.service.RedisObjectMapService;
import cn.ifxcode.bbs.bean.Page;
import cn.ifxcode.bbs.constant.BbsConstant;
import cn.ifxcode.bbs.dao.FriendLinkDao;
import cn.ifxcode.bbs.entity.FriendLink;
import cn.ifxcode.bbs.logger.SysLog;
import cn.ifxcode.bbs.service.FriendLinkService;
import cn.ifxcode.bbs.utils.DateUtils;
import cn.ifxcode.bbs.utils.JsonUtils;
import cn.ifxcode.bbs.utils.RedisKeyUtils;

@Service
public class FriendLinkServiceImpl implements FriendLinkService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Resource
	private FriendLinkDao friendLinkDao;
	
	@Resource
	private RedisObjectMapService mapService;
	
	@Override
	public List<FriendLink> getAllFriendLinks() {
		JSONObject object = mapService.get(RedisKeyUtils.getFriendLinks(), JSONObject.class);
		JSONArray array = JSONArray.parseArray(object.getString("friendlinks"));
		return JsonUtils.decodeJson(array, FriendLink.class);
	}

	@Override
	public int addLink(String linkname, String link, String contact) {
		if(linkname.length() < 30 && link.length() < 255 && contact.length() < 50) {
			FriendLink friendLink = new FriendLink();
			friendLink.setLink(link);
			friendLink.setLinkContacts(contact);
			friendLink.setLinkCreateTime(DateUtils.dt14LongFormat(new Date()));
			friendLink.setLinkName(linkname);
			friendLink.setLinkSign(2);
			friendLink.setLinkStatus(0);
			if(friendLinkDao.insert(friendLink) == BbsConstant.OK) {
				return BbsConstant.OK;
			}
		}
		return BbsConstant.ERROR;
	}

	@Override
	public List<FriendLink> getFriendList(Page page) {
		return getFriendList(page, null, null, null, 0, -1);
	}

	@Override
	public List<FriendLink> getFriendList(Page page, String startTime,
			String endTime, String name, int sign, int status) {
		Map<String, Object> map = Maps.newHashMap();
		map.put("page", page);
		if(StringUtils.isNotBlank(startTime)) {
			map.put("starttime", startTime);
		}
		if(StringUtils.isNotBlank(endTime)) {
			map.put("endtime", endTime);
		}
		if(StringUtils.isNotBlank(name)) {
			map.put("name", "%" + name + "%");
		}
		if(sign != 0) {
			map.put("sign", sign);
		}
		if(status != -1) {
			map.put("status", status);
		}
		return friendLinkDao.getFriendList(map);
	}

	@Override
	public FriendLink getFriendLink(int id) {
		return friendLinkDao.get(id);
	}

	@Override
	@Transactional
	@SysLog(module = "系统配置", methods = "友情链接-删除")
	public int deleteLink(String ids) {
		int result = 0;
		String linkIds[] = ids.split(",");
		try {
			Map<String, Object> map = Maps.newHashMap();
			map.put("linkIds", linkIds);
			if(linkIds.length == friendLinkDao.delete(map)) {
				refresh();
				result = BbsConstant.OK;
			}
		} catch (Exception e) {
			logger.error("delete friendlink fail", e);
		}
		return result;
	}

	@Override
	@SysLog(module = "系统配置", methods = "友情链接-编辑")
	public int updateLink(int id, String name, String link, String contact,
			String endtime, int sign, int status) {
		int result = 0;
		try {
			FriendLink friendLink = new FriendLink();
			friendLink.setLinkId(id);
			friendLink.setLink(link);
			friendLink.setLinkContacts(contact);
			friendLink.setLinkEndTime(DateUtils.dt10FromStr(endtime));
			friendLink.setLinkName(name);
			friendLink.setLinkSign(sign);
			friendLink.setLinkStatus(status);
			if(BbsConstant.OK == friendLinkDao.update(friendLink)) {
				refresh();
				result = BbsConstant.OK;
			}
		} catch (Exception e) {
			logger.error("update friendlink fail", e);
		}
		return result;
	}

	@Override
	@SysLog(module = "系统配置", methods = "友情链接-添加")
	public int addLink(String name, String link, String contact, String endtime, int sign, int status) {
		int result = 0;
		try {
			FriendLink friendLink = new FriendLink();
			friendLink.setLink(link);
			friendLink.setLinkContacts(contact);
			friendLink.setLinkEndTime(DateUtils.dt10FromStr(endtime));
			friendLink.setLinkName(name);
			friendLink.setLinkSign(sign);
			friendLink.setLinkStatus(status);
			friendLink.setLinkCreateTime(DateUtils.dt14LongFormat(new Date()));
			if(BbsConstant.OK == friendLinkDao.insert(friendLink)) {
				refresh();
				result = BbsConstant.OK;
			}
		} catch (Exception e) {
			logger.error("add friendlink fail", e);
		}
		return result;
	}
	
	public void refresh() {
		List<FriendLink> links = friendLinkDao.getAllFriendLinks();
		JSONArray array = JSONArray.parseArray(JSON.toJSONString(links));
		JSONObject object = new JSONObject(true);
		object.put("friendlinks", array.toJSONString());
		mapService.save(RedisKeyUtils.getFriendLinks(), object, JSONObject.class);
	}

}

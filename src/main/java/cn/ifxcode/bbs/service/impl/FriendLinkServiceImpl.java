package cn.ifxcode.bbs.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

import ltang.redis.service.RedisObjectMapService;
import cn.ifxcode.bbs.constant.BbsConstant;
import cn.ifxcode.bbs.dao.FriendLinkDao;
import cn.ifxcode.bbs.entity.FriendLink;
import cn.ifxcode.bbs.service.FriendLinkService;
import cn.ifxcode.bbs.utils.DateUtils;
import cn.ifxcode.bbs.utils.JsonUtils;
import cn.ifxcode.bbs.utils.RedisKeyUtils;

@Service
public class FriendLinkServiceImpl implements FriendLinkService {

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

}

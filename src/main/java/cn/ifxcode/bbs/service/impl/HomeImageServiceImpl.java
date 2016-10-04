package cn.ifxcode.bbs.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.google.common.collect.Maps;

import cn.ifxcode.bbs.bean.Page;
import cn.ifxcode.bbs.dao.HomeImageDao;
import cn.ifxcode.bbs.entity.HomeImage;
import cn.ifxcode.bbs.service.HomeImageService;
import cn.ifxcode.bbs.utils.DateUtils;

@Service
public class HomeImageServiceImpl implements HomeImageService{

	@Resource
	private HomeImageDao homeImageDao;
	
	@Override
	public List<HomeImage> getHomeImages() {
		return homeImageDao.getHomeImages();
	}

	@Override
	public List<HomeImage> searchImages(Page page) {
		Map<String, Object> map = Maps.newHashMap();
		map.put("page", page);
		return this.formatHomeImages(homeImageDao.searchImages(map));
	}
	
	private List<HomeImage> formatHomeImages(List<HomeImage> list) {
		List<HomeImage> images = new ArrayList<HomeImage>();
		for (HomeImage homeImage : list) {
			homeImage.setHomeCreateTime(DateUtils.dt14LongFormat(
					DateUtils.dt14FromStr(homeImage.getHomeCreateTime())));
			images.add(homeImage);
		}
		return images;
	}

}

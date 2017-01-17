package cn.ifxcode.bbs.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.common.collect.Maps;

import cn.ifxcode.bbs.bean.Page;
import cn.ifxcode.bbs.constant.BbsConstant;
import cn.ifxcode.bbs.dao.HomeImageDao;
import cn.ifxcode.bbs.entity.HomeImage;
import cn.ifxcode.bbs.logger.SysLog;
import cn.ifxcode.bbs.service.HomeImageService;
import cn.ifxcode.bbs.utils.DateUtils;

@Service
public class HomeImageServiceImpl implements HomeImageService{

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
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
		return formatHomeImages(homeImageDao.searchImages(map));
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

	@Override
	@SysLog(module = "首页管理", methods = "轮播图链-添加")
	public int addImage(String title, String link, String url, int way, int sort, int status) {
		try {
			HomeImage homeImage = new HomeImage();
			homeImage.setHomeTitle(title);
			homeImage.setHomeLink(link);
			homeImage.setHomeImgLink(url);
			homeImage.setTurnWay(way);
			homeImage.setHomeSort(sort);
			homeImage.setHomeStatus(status);
			homeImage.setHomeCreateTime(DateUtils.dt14LongFormat(new Date()));
			if(homeImageDao.insert(homeImage) == BbsConstant.OK) {
				return BbsConstant.OK;
			}
		} catch (Exception e) {
			logger.error("add home image fail", e);
		}
		return BbsConstant.ERROR;
	}

	@Override
	public HomeImage getHomeImage(int id) {
		return homeImageDao.get(id);
	}

	@Override
	@SysLog(module = "首页管理", methods = "轮播图链-编辑")
	public int updateImage(int id, String title, String link, String url, int way, int sort, int status) {
		try {
			HomeImage homeImage = new HomeImage();
			homeImage.setId(id);
			homeImage.setHomeTitle(title);
			homeImage.setHomeLink(link);
			homeImage.setHomeImgLink(url);
			homeImage.setTurnWay(way);
			homeImage.setHomeSort(sort);
			homeImage.setHomeStatus(status);
			homeImage.setHomeCreateTime(DateUtils.dt14LongFormat(new Date()));
			if(homeImageDao.update(homeImage) == BbsConstant.OK) {
				return BbsConstant.OK;
			}
		} catch (Exception e) {
			logger.error("update home image fail", e);
		}
		return BbsConstant.ERROR;
	}

	@Override
	@Transactional
	@SysLog(module = "首页管理", methods = "轮播图链-删除")
	public int deleteImage(String ids) {
		String imgIds[] = ids.split(",");
		int result = 0;
		try {
			Map<String, Object> map = Maps.newHashMap();
			map.put("imgIds", imgIds);
			if(imgIds.length == homeImageDao.delete(map)) {
				result = BbsConstant.OK;
			}
		} catch (Exception e) {
			logger.error("delete home image fail", e);
		}
		return result;
	}

}

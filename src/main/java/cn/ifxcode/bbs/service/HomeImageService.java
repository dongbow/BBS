package cn.ifxcode.bbs.service;

import java.util.List;

import cn.ifxcode.bbs.bean.Page;
import cn.ifxcode.bbs.entity.HomeImage;

public interface HomeImageService {

	public List<HomeImage> getHomeImages();

	public List<HomeImage> searchImages(Page page);
	
}

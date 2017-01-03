package cn.ifxcode.bbs.service;

import java.util.List;

import cn.ifxcode.bbs.bean.Page;
import cn.ifxcode.bbs.entity.HomeImage;

public interface HomeImageService {

	public List<HomeImage> getHomeImages();

	public List<HomeImage> searchImages(Page page);

	public int addImage(String title, String link, String url, int sort, int status);

	public HomeImage getHomeImage(int id);

	public int updateImage(int id, String title, String link, String url, int sort, int status);

	public int deleteImage(String ids);
	
}

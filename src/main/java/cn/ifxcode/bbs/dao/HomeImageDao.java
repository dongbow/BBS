package cn.ifxcode.bbs.dao;

import java.util.List;
import java.util.Map;

import cn.ifxcode.bbs.entity.HomeImage;

public interface HomeImageDao {

	public List<HomeImage> getHomeImages();

	public List<HomeImage> searchImages(Map<String, Object> map);

	public int insert(HomeImage homeImage);

	public HomeImage get(int id);

	public int update(HomeImage homeImage);

	public int delete(Map<String, Object> map);

}

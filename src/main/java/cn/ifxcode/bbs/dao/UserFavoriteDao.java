package cn.ifxcode.bbs.dao;

import java.util.List;
import java.util.Map;

import cn.ifxcode.bbs.entity.UserFavorite;

public interface UserFavoriteDao {

	public int insert(UserFavorite userFavorite);

	public int vaildFavorite(Map<String, Object> map);

	public int cancelFavorite(Map<String, Object> map);

	public List<UserFavorite> getAllFavorites(Map<String, Object> map);
	
}

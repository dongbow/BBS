package cn.ifxcode.bbs.dao;

import java.util.Date;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import cn.ifxcode.bbs.entity.BbsFile;

public interface FileDao {

	public int insert(BbsFile bbsFile);

	public Map<String, Object> getFileLinkByUuid(Map<String, Object> map);

	public int vaildOnce(Map<String, Object> map);

	public int insertHistory(@Param("uuid")String uuid, @Param("uid")long uid, @Param("nickname")String nickname, @Param("date")Date date, @Param("ip")String ip);

	public int AddDownCount(String uuid);

}

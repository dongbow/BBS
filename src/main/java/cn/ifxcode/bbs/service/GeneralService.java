package cn.ifxcode.bbs.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.alibaba.fastjson.JSONObject;

import cn.ifxcode.bbs.entity.AwardValue;
import cn.ifxcode.bbs.entity.Board;
import cn.ifxcode.bbs.entity.SwfArea;
import cn.ifxcode.bbs.enumtype.EGHistory;
import cn.ifxcode.bbs.msg.entity.Message;

public interface GeneralService {

	public boolean checkIp(HttpServletRequest request);

	public boolean checkBbsIsClose();
	
	public int UserAward(EGHistory eg, long uid, HttpServletRequest request);
	
	public Board getBoardByBoardId(int boardId);

	public boolean isLogin(HttpServletRequest request);

	public boolean isBoardAccess(HttpServletRequest request);

	public boolean adminCheck(HttpServletRequest request);

	public List<SwfArea> getAllProvinces();

	public List<SwfArea> getCitys(String userProvince);

	public int click(String... sign);

	public boolean authCheck(HttpServletRequest request);

	public boolean bmcCheck(HttpServletRequest request);

	public boolean isLocalBMC(HttpServletRequest request);
	
	public boolean isLocalBMCByBoardId(int bid, HttpServletRequest request);

	public boolean checkUpdate(HttpServletRequest request, long userId);

	public boolean authResources(HttpServletRequest request);
	
	public void saveCount(String key);

	public JSONObject getChartData(int day, String start, String end);
	
	public List<AwardValue> getAllFromDB();
	
	public AwardValue getAwardValue(String type);
	
	public List<AwardValue> getAllFromRedis();
	
	public void refreashAwardValue();
	
	public int updateAwardValue(List<AwardValue> values);

	public void delayMsg(HttpServletRequest request, Message message);
}

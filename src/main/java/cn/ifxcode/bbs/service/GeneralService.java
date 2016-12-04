package cn.ifxcode.bbs.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import cn.ifxcode.bbs.entity.Board;
import cn.ifxcode.bbs.entity.SwfArea;
import cn.ifxcode.bbs.enumtype.EGHistory;

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

	public boolean checkUpdate(HttpServletRequest request, long userId);

	public boolean authResources(HttpServletRequest request);
}

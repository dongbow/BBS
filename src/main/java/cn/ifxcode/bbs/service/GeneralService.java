package cn.ifxcode.bbs.service;

import javax.servlet.http.HttpServletRequest;

import cn.ifxcode.bbs.entity.Board;
import cn.ifxcode.bbs.enumtype.EGHistory;

public interface GeneralService {

	public boolean checkIp(HttpServletRequest request);

	public boolean checkBbsIsClose();
	
	public int UserAward(EGHistory eg, long uid, HttpServletRequest request);
	
	public Board getBoardByBoardId(int boardId);

	public boolean isLogin(HttpServletRequest request);

	public boolean isBoardAccess(HttpServletRequest request);

	public boolean adminCheck(HttpServletRequest request);
}

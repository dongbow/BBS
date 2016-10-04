package cn.ifxcode.bbs.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import cn.ifxcode.bbs.bean.CookieBean;
import cn.ifxcode.bbs.bean.Page;
import cn.ifxcode.bbs.entity.PastHistory;
import cn.ifxcode.bbs.entity.User;
import cn.ifxcode.bbs.entity.UserValue;

public interface UserService {

	public User authLogin(String name, String password);

	public Integer valueCheck(String type, String value);

	public int updateUserLastestTimeAndIp(Long userId, String userLastestLoginIp,
			String userLastestLoginTime);

	public long getUserIdFromCookie(HttpServletRequest request);

	public CookieBean getCookieBeanFromCookie(HttpServletRequest request);

	public List<User> getAllUser(Page page, long userId, String username,
			String nickname, int sex, int role, int status, String startTime,
			String endTime);

	public Integer insertUser(String userName, String password, String email, int isAdmin, int boardManager, String roleIds, HttpServletRequest request);

	public User loginCheck(String userName, String md5String);

	public UserValue getUserValue(Long userId);

	public User getUserById(long userId);

	public User getUserByUserNickname(String nickname);

	public CookieBean checkIsLogin(HttpServletRequest request);

	public Integer addSign(UserValue userValue, PastHistory pastHistory);
	
}

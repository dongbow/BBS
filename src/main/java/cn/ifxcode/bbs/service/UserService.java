package cn.ifxcode.bbs.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import cn.ifxcode.bbs.bean.CookieBean;
import cn.ifxcode.bbs.bean.Page;
import cn.ifxcode.bbs.entity.PastHistory;
import cn.ifxcode.bbs.entity.User;
import cn.ifxcode.bbs.entity.UserFavorite;
import cn.ifxcode.bbs.entity.UserForget;
import cn.ifxcode.bbs.entity.UserFriends;
import cn.ifxcode.bbs.entity.UserPrivacy;
import cn.ifxcode.bbs.entity.UserValue;

public interface UserService {

	public User authLogin(String name, String password);

	public Integer valueCheck(String type, String value);

	public int updateUserLastestTimeAndIp(Long userId, String userLastestLoginIp, String userLastestLoginTime);

	public long getUserIdFromCookie(HttpServletRequest request);

	public CookieBean getCookieBeanFromCookie(HttpServletRequest request);

	public List<User> getAllUser(Page page, long userId, String username, String nickname, int sex, int role, int status, String startTime, String endTime, int isAdmin);

	public Integer insertUser(String userName, String password, String email, int isAdmin, int boardManager, String roleIds, HttpServletRequest request);

	public User loginCheck(String userName, String md5String);

	public UserValue getUserValue(Long userId);

	public User getUserById(long userId);

	public User getUserByUserNickname(String nickname);

	public CookieBean checkIsLogin(HttpServletRequest request);

	public Integer addSign(UserValue userValue, PastHistory pastHistory);

	public boolean isTodayFirstLogin(String userLastestLoginTime);

	public int updateUserValue(UserValue userValue);

	public User getUserByIdFromRedis(String uid);

	public Integer mate(String name, String email);

	public int insertUserForget(UserForget uf);

	public UserForget getForgetByName(String name);

	public int resetPassword(long uid, String name, String password);

	public int addFavorite(long needId1, long needId2, String sign, String name, HttpServletRequest request);

	public int cancelFavorite(String ids);

	public int addFriend(long recUserId, String recName, HttpServletRequest request);

	public int dealFriendStatus(String status, String... friendId);

	public List<UserFriends> getAllFriendsRequest(long user_id, Page page);

	public List<UserFriends> getFriendsList(long user_id, Page page);

	public List<UserFavorite> getAllFavorites(long user_id, Page page, int type);

	public List<Integer> getAllBoardManageId(long user_id);

	public int updateUserPrivacy(int ispublic, int isaddfriend,
			int ispublicfriend, int ispublictopic, int ispublicreply, HttpServletRequest request);

	public void updateUserToRedis(HttpServletRequest request, String nmail, UserPrivacy privacy);

	public int vaildEmail(String omail, HttpServletRequest request);

	public int updateUserEmail(String nmail, HttpServletRequest request);

	public int vaildPassword(HttpServletRequest request, String opwd);

	public int updatePassword(String npwd, HttpServletRequest request);

	public String getNicknameFromCookie(HttpServletRequest request);

	public List<PastHistory> getAllUserSigns(Page page, long userId);

	public List<PastHistory> getUserSignsByUid(Page page, String startTime, String endTime, long uid);
	
}

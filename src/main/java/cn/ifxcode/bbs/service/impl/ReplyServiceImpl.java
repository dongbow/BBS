package cn.ifxcode.bbs.service.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.util.HtmlUtils;

import com.google.common.collect.Maps;

import cn.ifxcode.bbs.bean.CookieBean;
import cn.ifxcode.bbs.bean.Page;
import cn.ifxcode.bbs.constant.BbsConstant;
import cn.ifxcode.bbs.dao.ReplyDao;
import cn.ifxcode.bbs.entity.Reply;
import cn.ifxcode.bbs.enumtype.BoardSign;
import cn.ifxcode.bbs.enumtype.EGHistory;
import cn.ifxcode.bbs.enumtype.TopicSign;
import cn.ifxcode.bbs.logger.BmcLogAnno;
import cn.ifxcode.bbs.logger.SysLog;
import cn.ifxcode.bbs.service.BoardService;
import cn.ifxcode.bbs.service.GeneralService;
import cn.ifxcode.bbs.service.ReplyService;
import cn.ifxcode.bbs.service.TopicService;
import cn.ifxcode.bbs.service.UserService;
import cn.ifxcode.bbs.utils.DateUtils;
import cn.ifxcode.bbs.utils.GetRemoteIpUtil;
import cn.ifxcode.bbs.utils.SystemConfigUtils;

@Service
public class ReplyServiceImpl implements ReplyService{

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Resource
	private ReplyDao replyDao;
	
	@Resource
	private TopicService topicService;
	
	@Resource
	private BoardService boardService;
	
	@Resource
	private UserService userService;
	
	@Resource
	private GeneralService generalService;
	
	@Override
	@Transactional
	public long insertReply(HttpServletRequest request, long boardId,
			long topicId, long uid, String rcontext, long pid) {
		Lock lock = new ReentrantLock();
		if(lock.tryLock()) {
			try {
				Reply reply = new Reply();
				reply.setBoardId((int) boardId);
				reply.setReplyContent(HtmlUtils.htmlEscape(rcontext));
				reply.setReplyCreateTime(DateUtils.dt14LongFormat(new Date()));
				reply.setReplyIp(GetRemoteIpUtil.getRemoteIp(request));
				reply.setReplyParentId(pid);
				if(SystemConfigUtils.getIsOpenReplyAudit()) {
					reply.setReplyIsCheck(0);
				} else {
					reply.setReplyIsCheck(1);
				}
				reply.setReplyStatus(0);
				reply.setTopicId(topicId);
				reply.setUserId(uid);
				if(replyDao.insertReply(reply) == BbsConstant.OK
						&& generalService.UserAward(EGHistory.REPLY, uid, request) == BbsConstant.OK) {
					CookieBean cookieBean = userService.getCookieBeanFromCookie(request);
					topicService.saveOrUpdateTopicData(topicId, TopicSign.REPLY, null, cookieBean.getNick_name(), reply.getReplyCreateTime(), uid, null, null);
					boardService.saveOrUpdateBoardInfo((int) boardId, BoardSign.REPLY, 0);
					return reply.getReplyId();
				}
			} catch (Exception e) {
				logger.error("插入回复失败{topic:" + topicId + "}", e);
				return 0;
			} finally {
				lock.unlock();
			}
		}
		logger.error("回复超时，回复失败");
		return 0;
	}

	@Override
	public List<Reply> getReplyListByTopicId(Page page, long topicId, long uid, int sort) {
		Map<String, Object> map = Maps.newHashMap();
		map.put("page", page);
		map.put("topicId", topicId);
		if(uid != 0) {
			map.put("userId", uid);
		}
		map.put("sort", sort == 0 ? "ASC" : "DESC");
		List<Reply> replies = replyDao.getReplyListByTopicId(map);
		formatReply(replies);
		return replies;
	}
	
	private void formatReply(List<Reply> replies) {
		for (Reply reply : replies) {
			reply = formatReplyContent(reply);
			if(reply.getReplyParentId() != 0) {
				reply.setReply(getParentReply(reply.getReplyParentId()));
			}
		}
	}
	
	private Reply getParentReply(long pid) {
		return formatReplyContent(replyDao.getReplyByPid(pid));
	}
	
	private Reply formatReplyContent(Reply reply) {
		reply.setReplyCreateTime(DateUtils.dt14LongFormat(DateUtils.dt14FromStr(reply.getReplyCreateTime())));
		reply.setUser(userService.getUserById(reply.getUserId()));
		reply.setUserValue(userService.getUserValue(reply.getUserId()));
		if(reply.getReplyStatus() == 1 || reply.getReplyIsCheck() != 1 
				|| reply.getUser().getUserAccess().getUserIsDelete() == 1
				|| reply.getUser().getUserAccess().getUserIsLocked() == 1) {
			reply.setReplyContent("<p style=\"padding: 10px; border: 1px solid #ddd; background: #eee;\">评论已隐藏</p>");
		} else {
			reply.setReplyContent(HtmlUtils.htmlUnescape(reply.getReplyContent()));
		}
		return reply;
	}

	@Override
	public int getCount(long tid) {
		return replyDao.getCount(tid);
	}

	@Override
	public List<Reply> getReplyListByUserId(Page page, long uid) {
		Map<String, Object> map = Maps.newHashMap();
		map.put("page", page);
		map.put("uid", uid);
		List<Reply> replies = replyDao.getReplyListByUserId(map);
		for (Reply reply : replies) {
			String content = HtmlUtils.htmlUnescape(reply.getReplyContent());
			content = content.replace("<br />", "");
			if (content.indexOf("<img") != -1) {
				content = "评论包含图片，点击查看详情[image]...";
			} else if(content.indexOf("<pre") != -1) {
				content = "评论包含代码，点击查看详情[code]...";
			} else if(content.indexOf("<table") != -1) { 
				content = "评论包含表格，点击查看详情[table]...";
			} else {
				if(content.length() > 40) {
					content = content.substring(0, 40) + "...";
				}
			}
			reply.setReplyContent(content);
			reply.setTopic(topicService.getTopicForReplyByTopicId(reply.getTopicId()));
		}
		return replies;
	}

	@Override
	public List<Reply> getReplyList(Page page, int status, int audit) {
		return getReplyList(page, status, audit, null, null, 0, 0, 0);
	}
	
	@Override
	public List<Reply> getReplyList(Page page, int bid, long tid) {
		return getReplyList(page, 0, 0, null, null, 0, tid, bid);
	}

	@Override
	public List<Reply> getReplyList(Page page, int status, int audit,
			String startTime, String endTime, long uid, long tid, long bid) {
		Map<String, Object> map = Maps.newHashMap();
		map.put("page", page);
		map.put("status", status);
		map.put("audit", audit);
		if(StringUtils.isNotBlank(startTime)) {
			map.put("starttime", startTime);
		}
		if(StringUtils.isNotBlank(endTime)) {
			map.put("endtime", endTime);
		}
		if(uid != 0) {
			map.put("uid", uid);
		}
		if(tid != 0) {
			map.put("tid", tid);
		}
		if(bid != 0) {
			map.put("bid", bid);
		}
		List<Reply> replies = null;
		
		if(status == 1 && audit == 2) {
			replies = replyDao.getReplyListForTrash(map);
		} else {
			replies = replyDao.getReplyList(map);
		}
		for (Reply reply : replies) {
			reply.setReplyCreateTime(DateUtils.dt14LongFormat(DateUtils.dt14FromStr(reply.getReplyCreateTime())));
			reply.setUser(userService.getUserById(reply.getUserId()));
			dealAdminPage(reply);
			if(audit == 1) {
				if(reply.getReplyParentId() != 0) {
					if(reply.getReplyParentId() != 0) {
						Reply parent = replyDao.getReplyByPid(reply.getReplyParentId());
						dealAdminPage(parent);
						reply.setReply(parent);
					}
				}
			}
		}
		return replies;
	}
	
	private void dealAdminPage(Reply reply) {
		String tip = "";
		if(reply.getReplyStatus() == 1) {
			tip = "<font color=\"red\">该评论内容已删除</font><br/>";
		} 
		if(reply.getReplyIsCheck() == 2 ) {
			tip = "<font color=\"red\">该评论未通过审核</font><br/>";
		}
		if(reply.getUser() != null && (reply.getUser().getUserAccess().getUserIsDelete() == 1 || reply.getUser().getUserAccess().getUserIsLocked() == 1)) {
			tip = "<font color=\"red\">该评论用户被锁定或者被删除</font><br/>";
		}
		reply.setReplyContent(tip + HtmlUtils.htmlUnescape(reply.getReplyContent()));
	}

	@Override
	public Reply getReplyByReplyId(long replyId) {
		return replyDao.getReplyByReplyId(replyId);
	}

	@Override
	@Transactional
	@SysLog(module = "评论管理", methods = "评论列表-删除")
	public int deleteReply(String ids, String reason, String role) {
		int result = 0;
		String rids[] = ids.split(",");
		try {
			Map<String, Object> map = Maps.newHashMap();
			map.put("rids", rids);
			map.put("reason", reason + "<br/>---<font color=\"red\">" + role + "</font>");
			if(rids.length == replyDao.delete(map)) {
				result = BbsConstant.OK;
			}
		} catch (Exception e) {
			logger.error("reply delete error", e);
		}
		return result;
	}

	@Override
	@SysLog(module = "评论管理", methods = "评论-编辑")
	public int updateReply(long id, String content) {
		int result = 0;
		try {
			content = HtmlUtils.htmlEscape(content);
			if(replyDao.updateReply(id, content) == BbsConstant.OK) {
				result = BbsConstant.OK;
			}
		} catch (Exception e) {
			logger.error("update reply error", e);
		}
		return result;
	}

	public int restoreBMC(String ids, String sign) {
		return 0;
	}
	
	@Override
	@SysLog(module = "评论管理", methods = "回收站-恢复")
	public int restore(String ids, String sign) {
		synchronized (this) {
			int result = 0;
			String replyIds[] = ids.split(",");
			try {
				Map<String, Object> map = Maps.newHashMap();
				map.put("replyIds", replyIds);
				if(replyDao.restore(map) == replyIds.length) {
					result = BbsConstant.OK;
				}
			} catch (Exception e) {
				logger.error("restore reply fail", e);
			}
			return result;
		}
	}

}

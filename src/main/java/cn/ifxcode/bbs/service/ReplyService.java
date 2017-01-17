package cn.ifxcode.bbs.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import cn.ifxcode.bbs.bean.Page;
import cn.ifxcode.bbs.entity.Reply;

public interface ReplyService {

	public long insertReply(HttpServletRequest request, long boardId, long topicId,
			long uid, String rcontext, long pid);

	public List<Reply> getReplyListByTopicId(Page page, long topicId, long uid, int sort);

	public int getCount(long topicId);

	public List<Reply> getReplyListByUserId(Page page, long uid);

	public List<Reply> getReplyList(Page page, int status, int audit);
	
	public List<Reply> getReplyList(Page page, int bid, long tid);
	
	public List<Reply> getReplyList(Page page, int status, int audit, String startTime, String endTime, long uid, long tid, long bid);

	public Reply getReplyByReplyId(long replyId);

	public int deleteReply(String ids, String reason, String role);

	public int updateReply(long id, String content);

	public int restore(String ids, String sign);

}

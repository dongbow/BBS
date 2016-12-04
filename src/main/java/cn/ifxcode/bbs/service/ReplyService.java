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

}

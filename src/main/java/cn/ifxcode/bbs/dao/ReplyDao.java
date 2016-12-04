package cn.ifxcode.bbs.dao;

import java.util.List;
import java.util.Map;

import cn.ifxcode.bbs.entity.Reply;

public interface ReplyDao {

	public int insertReply(Reply reply);

	public List<Reply> getReplyListByTopicId(Map<String, Object> map);

	public Reply getReplyByPid(long replyParentId);

	public int getCount(long tid);

}

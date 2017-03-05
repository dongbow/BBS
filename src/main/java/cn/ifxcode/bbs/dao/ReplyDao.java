package cn.ifxcode.bbs.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import cn.ifxcode.bbs.entity.Reply;

public interface ReplyDao {

	public int insertReply(Reply reply);

	public List<Reply> getReplyListByTopicId(Map<String, Object> map);

	public Reply getReplyByPid(long replyParentId);

	public int getCount(long tid);

	public List<Reply> getReplyListByUserId(Map<String, Object> map);

	public List<Reply> getReplyList(Map<String, Object> map);

	public List<Reply> getReplyListForTrash(Map<String, Object> map);

	public Reply getReplyByReplyId(long replyId);

	public int delete(Map<String, Object> map);

	public int updateReply(@Param("id")long id, @Param("content")String content, 
			@Param("userName")String userName, @Param("date")Date date);

	public int restore(Map<String, Object> map);

	public int execAudit(Map<String, Object> map);

}

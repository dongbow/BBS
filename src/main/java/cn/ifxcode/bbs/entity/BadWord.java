package cn.ifxcode.bbs.entity;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cn.ifxcode.bbs.constant.BbsConstant;
import cn.ifxcode.bbs.dao.db.DbPro;

public class BadWord extends DbPro<BadWord> implements Serializable {

	private static final long serialVersionUID = 1030741601987443628L;
	
	public static final String[] TITLE = {"敏感词"};
	
	public static final String[] PROPERTIES = {"badWord"};
	
	public static final Map<String, String> ZHTOEN = new HashMap<String, String>() {
		
		private static final long serialVersionUID = -5592507354511933120L;

		{
			put("敏感词", "badWord");
		}
	};

	private int id;
	private String badWord;
	private Date createTime;

	public BadWord() {
	}
	
	public BadWord(String badWord) {
		this.badWord = badWord;
		this.createTime = Calendar.getInstance().getTime();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getBadWord() {
		return badWord;
	}

	public void setBadWord(String badWord) {
		this.badWord = badWord;
	}

	@Override
	public int batchSave(List<BadWord> list, Object... objects) {
		init("insert into bad_word (bad_word, create_time) values (?, ?)");
		int length = list.size();
		int index = (int) (length > 1000 ? Math.ceil(length / 1000) : 1);
		try {
			conn.setAutoCommit(false);
			for (int i = 0; i < index; i++) {
				for (int j = index * 1000; j < length; j++) {
					pstmt.setString(1, list.get(j).getBadWord());
					pstmt.setString(2, String.valueOf(objects[1]));
					pstmt.addBatch();
				}
				pstmt.executeBatch();
				conn.commit();
			}
		} catch (SQLException e) {
			try {
				conn.rollback();
				return 0;
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		}
		return BbsConstant.OK;
	}

}

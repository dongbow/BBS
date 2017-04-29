package cn.ifxcode.bbs.bean;

import java.util.List;
import java.util.Map;

import com.google.common.base.Function;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;

import cn.ifxcode.bbs.constant.BbsConstant;
import cn.ifxcode.bbs.entity.Board;
import cn.ifxcode.bbs.entity.Topic;
import cn.ifxcode.bbs.entity.TopicData;
import cn.ifxcode.bbs.entity.User;
import cn.ifxcode.bbs.entity.UserAccess;

public class SearchDto {

	public static final int DEFAULT_PAGE_SIZE = 20;
	
	private SearchPage page;
	private List<Topic> topics = Lists.newArrayList();
	
	public static SearchDto Builder(int pageNo, int pageSize) {
		SearchDto s = new SearchDto();
		s.setPage(SearchPage.builder(pageNo, pageSize));
		return s;
	}

	public SearchDto build(List<Board> boards, List<Map<String, Object>> users, List<TopicData> datas) {
		for (Topic topic : this.topics) {
			for (Board board : boards) {
				if (topic.getBoardId().equals(board.getBoardId())) {
					topic.setBoard(board);
				}
			}
			for (Map<String, Object> map : users) {
				if (topic.getUserId() == Long.parseLong(map.get("user_id").toString())) {
					User user = new User();
					UserAccess access = new UserAccess();
					access.setUserNickname(map.get("user_nickname").toString());
					user.setUserAccess(access);
					topic.setUser(user);
				}
			}
			for (TopicData topicData : datas) {
				if (topic.getTopicId() == topicData.getTopicId()) {
					topic.setTopicData(topicData);
				}
			}
		}
		return this;
	}
	
	public static List<Long> getIds(SearchDto dto, final String field) {
		return Lists.transform(dto.topics, new Function<Topic, Long>() {
			@Override
			public Long apply(Topic topic) {
				if (field.equals(BbsConstant.UID)) {
					return topic.getUserId();
				}
				return topic.getTopicId();
			}
		});
	}
	
	public static List<Map<String, Long>> getTopicIdAndBoardId(SearchDto dto) {
		return Lists.transform(dto.topics, new Function<Topic, Map<String, Long>>() {
			@Override
			public Map<String, Long> apply(Topic topic) {
				Map<String, Long> map = Maps.newHashMap();
				map.put("tid", topic.getTopicId());
				map.put("bid", Long.valueOf(topic.getBoardId()));
				return map;
			}
		});
	}
	
	public SearchDto searchUrl(String url) {
		this.page.setSearchUrl(url);
		return this;
	}
	
	public SearchDto totalRecord(int totalRecord) {
		this.page.setTotalRecord(totalRecord);
		return this;
	}
	
	public List<Topic> getTopics() {
		return topics;
	}

	public void setTopics(List<Topic> topics) {
		this.topics = topics;
	}

	public SearchPage getPage() {
		return page;
	}

	public void setPage(SearchPage page) {
		this.page = page;
	}

	public synchronized static SearchDto spiltPage(SearchDto searchDto) {
		List<Topic> topics = searchDto.getTopics();
		int length = topics.size();
		int page = searchDto.getPage().getPageNo();
		int size = searchDto.getPage().getPageSize();
		if (size < length) {
			int totalPage = (int) Math.ceil((double) length / size);
			if (totalPage > page) {
				List<Topic> list = topics.subList((page - 1) * size, size * page);
				searchDto.setTopics(list);
			}
			if (totalPage == page) {
				List<Topic> list = topics.subList((page - 1) * size, length);
				searchDto.setTopics(list);
			}
		}
		return searchDto;
	}

}
package cn.ifxcode.bbs.lucene;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field.Store;
import org.apache.lucene.document.IntField;
import org.apache.lucene.document.LongField;
import org.apache.lucene.document.StringField;
import org.apache.lucene.document.TextField;

import cn.ifxcode.bbs.entity.Topic;
import cn.ifxcode.bbs.utils.DateUtils;

public class DocumentUtils {

	public static Document topicToDocument(Topic topic) {
		Document document = new Document();
		document.add(new LongField("tid", topic.getTopicId(), Store.YES));
		document.add(new IntField("gid", topic.getNavId(), Store.YES));
		document.add(new IntField("bid", topic.getBoardId(), Store.YES));
		document.add(new LongField("uid", topic.getUserId(), Store.YES));
		document.add(new StringField("title", topic.getTopicTitle(), Store.YES));
		document.add(new TextField("content", topic.getTopicContent(), Store.YES));
		document.add(new StringField("createtime", topic.getTopicCreateTime(), Store.YES));
		document.add(new IntField("cream", topic.getTopicInfo().getTopicIsCream(), Store.YES));
		document.add(new IntField("top", isTop(topic) ? 1 : 0, Store.YES));
		return document;
	}
	
	public static List<Document> topicToDocument(List<Topic> topics) {
		List<Document> documents = new ArrayList<Document>();
		for (Topic topic : topics) {
			Document document = topicToDocument(topic);
			documents.add(document);
		}
		return documents;
	}
	
	public static void documentToTopic() {
		
	}
	
	private static boolean isTop(Topic topic) {
		int localTop = topic.getTopicInfo().getTopicIsLocalTop();
		String localTime = topic.getTopicInfo().getTopicIsLocalTopEndTime();
		int globalTop = topic.getTopicInfo().getTopicIsGlobalTop();
		String globalTime = topic.getTopicInfo().getTopicIsGlobalTopEndTime();
		if(localTop == 1 || globalTop == 1) {
			if(localTop == 1) {
				if(StringUtils.isEmpty(localTime)) {
					return true;
				} else {
					return DateUtils.getDateDifferenceBegin(localTime, DateUtils.dt10FromDate(new Date())) > 0;
				}
			}
			if(globalTop == 1) {
				if(StringUtils.isEmpty(globalTime)) {
					return true;
				} else {
					return DateUtils.getDateDifferenceBegin(globalTime, DateUtils.dt10FromDate(new Date())) > 0;
				}
			}
		}
		return false;
	}
	
}

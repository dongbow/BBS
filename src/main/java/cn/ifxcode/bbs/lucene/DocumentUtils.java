package cn.ifxcode.bbs.lucene;

import java.util.List;

import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field.Store;
import org.apache.lucene.document.IntField;
import org.apache.lucene.document.LongField;
import org.apache.lucene.document.StringField;
import org.apache.lucene.document.TextField;
import org.springframework.web.util.HtmlUtils;

import com.google.common.base.Function;
import com.google.common.collect.Lists;

import cn.ifxcode.bbs.entity.Topic;

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
		//document.add(new IntField("cream", topic.getTopicInfo().getTopicIsCream(), Store.YES));
		//document.add(new IntField("top", isTop(topic) ? 1 : 0, Store.YES));
		return document;
	}
	
	public static List<Document> topicToDocument(List<Topic> topics) {
		return Lists.transform(topics, new Function<Topic, Document>() {
			@Override
			public Document apply(Topic topic) {
				return topicToDocument(topic);
			}
		});
	}
	
	public static Topic documentToTopic(Document doc) {
		Topic topic = new Topic();
		topic.setTopicId(Long.parseLong(doc.get("tid")));
		topic.setBoardId(Integer.parseInt(doc.get("bid")));
		topic.setNavId(Integer.parseInt(doc.get("gid")));
		topic.setUserId(Long.parseLong(doc.get("uid")));
		topic.setTopicTitle(doc.get("title"));
		topic.setTopicContent(HtmlUtils.htmlUnescape(doc.get("newcontent")));//.replaceAll("<(?!/font).*?>",  ""));
		topic.setTopicCreateTime(doc.get("createtime"));
		return topic;
	}
	
	public static List<Topic> documentToTopic(List<Document> documents) {
		return Lists.transform(documents, new Function<Document, Topic>() {
			@Override
			public Topic apply(Document doc) {
				return documentToTopic(doc);
			}
		});
	}
	
//	private static boolean isTop(Topic topic) {
//		int localTop = topic.getTopicInfo().getTopicIsLocalTop();
//		String localTime = topic.getTopicInfo().getTopicIsLocalTopEndTime();
//		int globalTop = topic.getTopicInfo().getTopicIsGlobalTop();
//		String globalTime = topic.getTopicInfo().getTopicIsGlobalTopEndTime();
//		if(localTop == 1 || globalTop == 1) {
//			if(localTop == 1) {
//				if(StringUtils.isEmpty(localTime)) {
//					return true;
//				} else {
//					return DateUtils.getDateDifferenceBegin(localTime, DateUtils.dt10FromDate(new Date())) > 0;
//				}
//			}
//			if(globalTop == 1) {
//				if(StringUtils.isEmpty(globalTime)) {
//					return true;
//				} else {
//					return DateUtils.getDateDifferenceBegin(globalTime, DateUtils.dt10FromDate(new Date())) > 0;
//				}
//			}
//		}
//		return false;
//	}
	
	
	public static void main(String[] args) {
		String a = "<p><a>123</a><font style=\"color:red;\">456</font></p>";
		System.out.println(a.replaceAll("<(?!font).*?>", ""));
	}
}

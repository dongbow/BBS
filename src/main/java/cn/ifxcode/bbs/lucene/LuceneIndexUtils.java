package cn.ifxcode.bbs.lucene;

import java.util.List;

import org.apache.lucene.document.Document;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.IndexWriterConfig;
import org.apache.lucene.util.Version;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.ifxcode.bbs.entity.Topic;

public class LuceneIndexUtils {

	private static Logger logger = LoggerFactory.getLogger(LuceneIndexUtils.class);
	
	//private static int FRAGMENT_SIZE = 255;
	
	public static boolean initIndex(List<Topic> topics) {
		List<Document> documents = DocumentUtils.topicToDocument(topics);
		try {
			IndexWriterConfig config = new IndexWriterConfig(Version.LUCENE_47, LuceneConfig.getAnalyzer());
			IndexWriter writer = new IndexWriter(LuceneConfig.getDirectory(), config);
			writer.addDocuments(documents);
			writer.close();
			return true;
		} catch (Exception e) {
			logger.error("lucene index init fail", e);
		}
		return false;
	}
	
	public static boolean addIndex(Topic topic) {
		Document document = DocumentUtils.topicToDocument(topic);
		try {
			IndexWriterConfig config = new IndexWriterConfig(Version.LUCENE_47, LuceneConfig.getAnalyzer());
			IndexWriter writer = new IndexWriter(LuceneConfig.getDirectory(), config);
			writer.addDocument(document);
			writer.close();
			return true;
		} catch (Exception e) {
			logger.error("lucene index add fail", e);
		}
		return false;
	}
	
	
	
}

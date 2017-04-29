package cn.ifxcode.bbs.lucene;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.StringField;
import org.apache.lucene.document.Field.Store;
import org.apache.lucene.index.DirectoryReader;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.IndexWriterConfig;
import org.apache.lucene.queryparser.classic.MultiFieldQueryParser;
import org.apache.lucene.queryparser.classic.QueryParser;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.search.TopDocs;
import org.apache.lucene.search.highlight.Formatter;
import org.apache.lucene.search.highlight.Highlighter;
import org.apache.lucene.search.highlight.QueryScorer;
import org.apache.lucene.search.highlight.SimpleFragmenter;
import org.apache.lucene.search.highlight.SimpleHTMLFormatter;
import org.apache.lucene.util.Version;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.ifxcode.bbs.bean.SearchDto;
import cn.ifxcode.bbs.entity.Topic;

public class LuceneIndexUtils {

	private static Logger logger = LoggerFactory.getLogger(LuceneIndexUtils.class);
	
	private final static int FRAGMENT_SIZE = 100;
	
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
	
	public static SearchDto search(String keyWord, int page, int pageSize) {
		SearchDto searchDto = SearchDto.Builder(page, pageSize);
		try{
			DirectoryReader reader = DirectoryReader.open(LuceneConfig.getDirectory());
			IndexSearcher indexSearcher = new IndexSearcher(reader);

			Query query = null;
			if(StringUtils.isNotBlank(keyWord)){
				QueryParser queryParser = new MultiFieldQueryParser(Version.LUCENE_47, 
						new String[]{"title","content"}, LuceneConfig.getAnalyzer());
				query = queryParser.parse(keyWord);
			}
			
			//ScoreDoc scoreDoc = null;
			
			TopDocs topDocs = indexSearcher.search(query, Integer.MAX_VALUE);
			searchDto.totalRecord(topDocs.totalHits);
			//表示返回的结果集
			ScoreDoc [] scoreDocs = topDocs.scoreDocs;

			//html页面高亮显示的格式化
			Formatter formatter = new SimpleHTMLFormatter("<font color='red'>","</font>");
			//执行查询条件，因为高亮的值就是查询条件
			QueryScorer scorer = new QueryScorer(query);
			Highlighter highlighter = new Highlighter(formatter, scorer);
			//设置文字摘要大小
			highlighter.setTextFragmenter(new SimpleFragmenter(FRAGMENT_SIZE));
			
			if(scoreDocs != null && scoreDocs.length > 0){
				for (ScoreDoc scoreDoc : scoreDocs) {
					System.out.println("相关度得分："+scoreDoc.score);//默认得分高的数据在前面
					//获取查询结果的文档的惟一编号，使用编号，获取对应的数据
					Document document = indexSearcher.doc(scoreDoc.doc);
					
					//获取文字的高亮，一次只能获取一个字段高亮的结果，如果获取不到，返回null值
					//索引库字段title 取完整值
					//索引库字段content
					String content = highlighter.getBestFragment(LuceneConfig.getAnalyzer(), "content", document.get("content"));
					if(StringUtils.isBlank(content)){
						content = document.get("content");
						if(StringUtils.isNotBlank(content)){
							int length = content.length() > FRAGMENT_SIZE ? FRAGMENT_SIZE : content.length();
							content = content.substring(0, length);
						}
					}
					document.add(new StringField("newcontent", content, Store.YES));
					Topic topic = DocumentUtils.documentToTopic(document);
					searchDto.getTopics().add(topic);
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		//TODO  暂时以list分页
		if (searchDto.getTopics().size() > 0) {
			searchDto = SearchDto.spiltPage(searchDto);
		}
		return searchDto;
	}
	
}

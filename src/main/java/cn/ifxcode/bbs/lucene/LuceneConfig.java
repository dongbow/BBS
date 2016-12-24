package cn.ifxcode.bbs.lucene;

import java.io.File;

import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;
import org.wltea.analyzer.lucene.IKAnalyzer;

import cn.ifxcode.bbs.utils.PropertiesUtils;

public class LuceneConfig {

	// 索引库的目录位置
	private static Directory directory;
	// 分词器
	private static Analyzer analyzer;

	static {
		try {
			luceneDirectory();
			/** 索引库目录为F:\lucene\bbs_index */
			directory = FSDirectory.open(new File(PropertiesUtils.getValue("lucene.path")));
			/** 词库分词 */
			analyzer = new IKAnalyzer();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static Directory getDirectory() {
		return directory;
	}

	public static Analyzer getAnalyzer() {
		return analyzer;
	}
	
	public static void luceneDirectory() {
		String path = PropertiesUtils.getValue("lucene.path");
		File file = new File(path);
		if(!file.exists() && file.isDirectory()) {
			file.mkdirs();
		}
	}

}

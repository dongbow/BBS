package cn.ifxcode.bbs.utils;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.Date;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.ifxcode.bbs.constant.BbsConstant;

public class BackUpUtils {
	
	private static Logger logger = LoggerFactory.getLogger(BackUpUtils.class);
	
	/** MySQL安装目录的Bin目录的绝对路径 */
	private static String MYSQL_BIN_PATH;
	/** 访问MySQL数据库的ip */
	private static String HOST;
	/** 访问MySQL数据库的端口 */
	private static String PORT;
	/** 访问MySQL数据库的用户名 */
	private static String USERNAME;
	/** 访问MySQL数据库的密码 */
	private static String PASSWORD;
	/**  要备份的路径  */
	private static String BACKUP_DIR;
	/**  要备份的数据库名 */
	private static String DB_NAME;
	
	static {
		MYSQL_BIN_PATH = PropertiesUtils.getValue("backup.mysqlBinPath");
		HOST = PropertiesUtils.getValue("backup.host");
		PORT = PropertiesUtils.getValue("backup.port");
		USERNAME = PropertiesUtils.getValue("backup.username");
		PASSWORD = PropertiesUtils.getValue("backup.password");
		BACKUP_DIR = PropertiesUtils.getValue("backup.backupDir");
		DB_NAME = PropertiesUtils.getValue("backup.dbName");
	}
	
	/**
	 * 备份数据库
	 * 
	 * @param output 输出流
	 */
	public static boolean backup(OutputStream output) {
		StringBuilder command = new StringBuilder();
		command.append(MYSQL_BIN_PATH).append("mysqldump -h ").append(HOST).append(" -P ")
				.append(PORT).append(" -u").append(USERNAME).append(" -p")
				.append(PASSWORD).append(" --default-character-set=utf8 ").append(DB_NAME);
		PrintWriter p = null;
		BufferedReader reader = null;
		try {
			p = new PrintWriter(new OutputStreamWriter(output, BbsConstant.UTF8));
			Process process = Runtime.getRuntime().exec(command.toString());
			InputStreamReader inputStreamReader = new InputStreamReader(process.getInputStream(), BbsConstant.UTF8);
			reader = new BufferedReader(inputStreamReader);
			String line = null;
			while ((line = reader.readLine()) != null) {
				p.println(line);
			}
			p.flush();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (reader != null) {
					reader.close();
				}
				if (p != null) {
					p.close();
				}
				logger.info("备份完成");
				return true;
			} catch (IOException e) {
				e.printStackTrace();
				logger.error("备份出错",e);
			}
		}
		return false;
	}
	
	/**
	 * 备份数据库，如果指定路径的文件不存在会自动生成
	 */
	public static String backupDB() {
		return backupDB("");
	}
	
	@SuppressWarnings("resource")
	public static String backupDB(String backName) {
		try {
			createDirs();
			
			String fileName = "";
			if(StringUtils.isNotBlank(backName)) {
				fileName = ChineseToEnglish.getPingYin(backName) + "." + Long.toString(System.currentTimeMillis());
			} else {
				fileName = Long.toString(System.currentTimeMillis());
			}
			String backUrl = BACKUP_DIR + DateUtils.dt8FormDate(new Date()) + "\\" + fileName + ".sql";
			OutputStream out = new FileOutputStream(backUrl);
			if(backup(out)){
				return backUrl;
			}
				
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 恢复数据库
	 * 
	 * @param input  输入流
	 * 
	 */
	public static boolean restore(InputStream input) {
		StringBuilder command = new StringBuilder();
		command.append(MYSQL_BIN_PATH).append("mysql -h ").append(HOST).append(" -P ")
				.append(PORT).append(" -u").append(USERNAME).append(" -p")
				.append(PASSWORD).append(" ").append(DB_NAME);
		try {
			Process process = Runtime.getRuntime().exec(command.toString());
			OutputStream out = process.getOutputStream();
			String line = null;
			String outStr = null;
			StringBuffer sb = new StringBuffer("");
			BufferedReader br = new BufferedReader(new InputStreamReader(input, BbsConstant.UTF8));
			while ((line = br.readLine()) != null) {
				sb.append(line + "/r/n");
			}
			outStr = sb.toString();
			OutputStreamWriter writer = new OutputStreamWriter(out, BbsConstant.UTF8);
			writer.write(outStr);
			writer.flush();
			out.close();
			br.close();
			writer.close();
			return true;
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	/**
	 * 恢复数据库
	 * 
	 * @param dest 备份文件的路径
	 * @return 
	 */
	public static boolean restore(String dest) {
		try {
			InputStream input = new FileInputStream(dest);
			return restore(input);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	private static void createDirs() {
		File file = new File(BACKUP_DIR + DateUtils.dt8FormDate(new Date()));
		if (!file.exists() && !file.isDirectory()) {       
	        file.mkdirs();   
		}
	}
	
	public static void main(String[] args) {
		System.out.println(backupDB());
		System.out.println(backupDB("懂博"));
		//System.out.println(restore("F:\\backup\\bbs\\20161216\\dongbo.sql"));
	}
}
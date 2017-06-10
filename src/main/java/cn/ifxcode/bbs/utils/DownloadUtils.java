package cn.ifxcode.bbs.utils;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.HttpClients;

public class DownloadUtils {

	public static void download(Map<String, Object> map, HttpServletResponse response) {
		HttpClient client = HttpClients.createDefault();
		HttpGet get = new HttpGet(map.get("file_link").toString());
		InputStream in = null;
		OutputStream out = null;
		try {
			HttpResponse res = client.execute(get);
			HttpEntity entity = res.getEntity();
			in = entity.getContent();
			out = response.getOutputStream();
			String filename = map.get("file_name").toString();
			response.setHeader("Content-Disposition", "attachment;filename=" + filename);
			int b;
			while((b = in.read()) != -1) {
				out.write(b);
			}
			out.flush();
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (in != null) {
				try {
					in.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			if(out != null) {
				try {
					out.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}
	
	public static void downloadLocal(String filePath, String fileName, HttpServletResponse response) throws IOException {
		InputStream in = new FileInputStream(new File(filePath));
		OutputStream out = response.getOutputStream();
		response.setHeader("Content-Disposition", "attachment;filename=" + fileName);
		int b;
		while((b = in.read()) != -1) {
			out.write(b);
		}
		out.flush();
		in.close();
		out.close();
	}
	
}

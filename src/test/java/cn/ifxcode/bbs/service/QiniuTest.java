package cn.ifxcode.bbs.service;

import java.io.File;
import java.util.Date;
import java.util.UUID;

import org.junit.Before;
import org.junit.Test;

import com.qiniu.common.QiniuException;
import com.qiniu.http.Response;
import com.qiniu.storage.UploadManager;
import com.qiniu.util.Auth;

public class QiniuTest {

	private String domain;
	private String ak;
	private String sk;
	private String bucket;
	
	@Before
	public void init() {
		domain = "http://ofrjra54d.bkt.clouddn.com";
		ak = "A0GomgtLkaLSOBE2iwLLDrbrJ3NMszICspVBG3rT";
		sk = "aBXdNl_YrtEDqX4mEnBT-1hrhkXi2gwOtYKKBv30";
		bucket = "ifxcode";
	}
	
	@Test
	public void test() {
		Auth auth = Auth.create(ak, sk);
		UploadManager uploadManager = new UploadManager();
		File file = new File("F:\\Tsbbs\\webapps\\Tsbbs\\tsbbs\\images\\20150813\\logo.png");
		//String fileName = this.createName("jpg");
		String fileName = "logo.png";
		try {
			Response res = uploadManager.put(file, fileName, auth.uploadToken(bucket));
			if(res.isOK()) {
				System.out.println(domain + "/" +  fileName);
			}
		} catch (QiniuException e) {
			Response r = e.response;
			// 请求失败时打印的异常的信息
			System.out.println(r.toString());
			try {
				// 响应的文本信息
				System.out.println(r.bodyString());
			} catch (QiniuException e1) {
				// ignore
			}
		}
	}
	
	private String createName(String fileType) {
		StringBuilder builder = new StringBuilder();
		builder.append(UUID.randomUUID().toString().replace("-", ""));
		builder.append(new Date().getTime());
		return builder.append(".").append(fileType).toString();
	}
}

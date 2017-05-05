package cn.ifxcode.bbs.utils;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import cn.ifxcode.bbs.constant.BbsConstant;

public class EmailUtils {

	public static String returnAddress(String email) {
		String mail = email.split("@")[1];
		if (mail.equals("163.com")) {
			return "mail.163.com";
		} else if (mail.equals("vip.163.com")) {
			return "vip.163.com";
		} else if (mail.equals("126.com")) {
			return "mail.126.com";
		} else if (mail.equals("qq.com") || mail.equals("vip.qq.com") || mail.equals("foxmail.com")) {
			return "mail.qq.com";
		} else if (mail.equals("gmail.com")) {
			return "mail.google.com";
		} else if (mail.equals("sohu.com")) {
			return "mail.sohu.com";
		} else if (mail.equals("tom.com")) {
			return "mail.tom.com";
		} else if (mail.equals("vip.sina.com")) {
			return "vip.sina.com";
		} else if (mail.equals("sina.com.cn") || mail.equals("sina.com")) {
			return "mail.sina.com.cn";
		} else if (mail.equals("tom.com")) {
			return "mail.tom.com";
		} else if (mail.equals("yahoo.com.cn") || mail.equals("yahoo.cn")) {
			return "mail.cn.yahoo.com";
		} else if (mail.equals("tom.com")) {
			return "mail.tom.com";
		} else if (mail.equals("yeah.net")) {
			return "www.yeah.net";
		} else if (mail.equals("21cn.com")) {
			return "mail.21cn.com";
		} else if (mail.equals("hotmail.com")) {
			return "www.hotmail.com";
		} else if (mail.equals("sogou.com")) {
			return "mail.sogou.com";
		} else if (mail.equals("188.com")) {
			return "www.188.com";
		} else if (mail.equals("139.com")) {
			return "mail.10086.cn";
		} else if (mail.equals("189.cn")) {
			return "webmail15.189.cn/webmail";
		} else if (mail.equals("wo.com.cn")) {
			return "mail.wo.com.cn/smsmail";
		} else if (mail.equals("139.com")) {
			return "mail.10086.cn";
		} else {
			return "javascript:;";
		}
	}
	
	public static String createUrl(String username, Date startTime, HttpServletRequest request) {
		StringBuilder url = new StringBuilder(getServer(request));
		url.append("account/password/reset?rd=");
		url.append(AESUtils.encrypt(username, BbsConstant.PASSWORD).toLowerCase());
		url.append("&st=").append(startTime.getTime());
		return url.toString();
	}
	
	public static String getServer(HttpServletRequest request) {
		StringBuffer url = request.getRequestURL();
		return url.delete(url.length() - request.getRequestURI().length(), url.length()).append(request.getServletContext().getContextPath()).append("/").toString();
	}
	
	public static String createContent(String username, Date startTime, String validtime, HttpServletRequest request){
    	String content="<style type='text/css'>"
					+"*{font:16px 'microsoft yahie';color:#333;}"
					+"#mailcontent{border:1px solid #ccc;width:900px; height:auto;margin:0 auto;background:#fff;padding:20px 50px 35px 50px;}"
					+"#mailcontent a{text-align:center;display:block;width:900px;height:auto;padding:20px 0;color:#000;}"
					+"#mailcontent .resetpwd{display:block;width:100px;height:20px;padding:5px;font:16px 'microsoft yahei';background:#f2f2f2;border:1px solid #bbb;"
							       +"text-align:center;margin-top:24px;border-radius:2px;color:#666;text-decoration:none;margin-left:30px;}"
					+"#mailcontent .resetpwd:hover{text-decoration:none;color:#fff;box-shadow:0 0 5px rgba(20,20,20,0.3);background:#19b4ea;}"
					+"#mailcontent .from{text-align:right;margin-top:40px;}"
				+"</style>"
				+"<div id='mailcontent'>"
					+"<a href='" + getServer(request) + "'><img alt='logo' src='" + getServer(request) + "/resources/images/biglogo.png'/></a>"
				    +"<p>亲爱的" + username + "用户：</p>"
				    +"<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;这是一封来自<a style='display:inline' href='" + getServer(request) + "'>JAVA技术论坛</a>的邮件，"
				    	+"本邮件用于找回密码，请先确定这是否是您本人操作，如果不是，请忽略此邮件，如果是您本人操作，那么请注意以下事项："
				    +"</p>"
				    +"<ol>"
				    	+"<li>本邮件有效期为" + validtime + "分钟，请在有效时间内点击下方按钮进行密码重置</li>"
				        +"<li>如果按钮无法点击，请复制下方链接粘贴至浏览器地址栏</li>"
				        +"<li>此邮件为系统自动发送，请勿回复</li>"
				    +"</ol>"
				    +"<a class='resetpwd' href='" + createUrl(username, startTime, request) + "'>点击重置密码</a>"
				    +"<p>密码重置链接：" + createUrl(username, startTime, request) + "</p>"
				    +"<p>如果有任何疑问，请联系网站管理员，邮箱地址：<a style='display:inline' href='mailto:bbshelp@163.com'>bbshelp@163.com</a></p>"
				    +"<div class='from'>"
				    	+"<span>来自BBS</span>"
				        +"<p>" + DateUtils.dt14LongFormat(startTime) + "</p>"
				    +"</div>" 
				+"</div>";
    	return content;
    }


}

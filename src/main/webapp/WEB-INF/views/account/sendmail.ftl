<#assign path="${request.contextPath}">
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<#include "../common/import.ftl">
	<title>系统提示</title>
	<link href="${path}/resources/css/forget.css" type="text/css" rel="stylesheet">
	<script type="text/javascript" src="${path}/resources/js/account/forgetcheck.js"></script>
	<style type="text/css">body{background:#f2f2f2;}</style>
</head>
<body>
	<div id="hd_0">
		<div id="wp_0">
			<div id="header_cont_0">
				<a id="logo_0" href="${path}">
					<img class="logo" src="${path}/resources/images/logo.png" alt="LOGO"/>
				</a>
				<a id="register_0" href="${path}/account/register">注册</a> 
				<p id="cow_0">|</p>
				<a id="login_0" href="${path}/account/login">登录</a>
			</div>
		</div>
	</div>
	<div id="mailresult">
		<p><span>邮件发送成功！</span><span><a href="http://${mailurl!}" target="_blank">点此进入邮箱查看</a></span></p>
		<input type="hidden" id="fname" name="name" value="${fname!}" />
		<input type="hidden" id="femail" name="email" value="${femail!}" />
	    <div class="tip">
	    	<label>提示：</label>
	    	<ol>
	        	<li>邮件发送过程中可能造成延迟，请耐心等待</li>
	            <li>邮件可能会被识别为垃圾邮件，可以在邮箱中“垃圾邮件”中查找</li>
	            <li>如果长时间未收到邮件，可以点击下方按钮重新发送</li>
	        </ol>
	        <a id="resend" class="resend" href="javascript:;">重新发送</a>
	        <span id="resendtip"></span>
	    </div>
	</div>
	<#include "../common/footer.ftl"/>
</body>
</html>
<#assign path="${request.contextPath}">
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<#include "../common/import.ftl">
	<title>找回密码</title>
	<link href="${path}/resources/css/forget.css" type="text/css" rel="stylesheet">
	<script type="text/javascript" src="${path}/resources/js/account/forgetcheck.js"></script>
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
	<div class="middle">
    	<div class="title">请输入用户名以及其对应的邮箱</div>
		<form id="mainForm" name="mailForm" method="post">
			<label id="error" class="error" style="display:none;"></label>
			<label id="sum" style="display:none"></label>
			<input id="user" type="text" placeholder="用户名" name="name">
			<input id="email" type="text" placeholder="邮箱" name="email">
			<div class="codeInput">
				<input id="valid" class="valid" type="text" placeholder="验证码/点击验证码换一张" maxlength="4" name="code">
			</div>
			<div>
				<img title="点击验证码换一张" id="codeimg" alt="验证码" src="${path}/validateCode.img"></img>
			</div>
			<div class="lineWrap">
				<button class="fullBtnBlue">提&nbsp;交</button>
			</div>
		</form>
		<p>如果有任何疑问，请发送邮件至<a href="mailto:bbshelp@163.com">bbshelp@163.com</a>，寻求帮助。</p>
	</div>
	<#include "../common/footer.ftl"/>
</body>
</html>
<#assign path="${request.contextPath}">
<!DOCTYPE html>
<html>
	<head>
		<#include "../common/import.ftl">
		<title>登录</title>
		<link href="${path}/resources/css/login.css" type="text/css" rel="stylesheet" />
		<script type="text/javascript" src="${path}/resources/js/account/login.js"></script>
	</head>
	<body>
		<div class="nav_h">
    	<div class="_headt">
        	<a href="${path}">
        		<img class="logo" src="${path}/resources/images/logo.png" alt="LOGO"/>
        		<!-- <span>Technology</span> -->
        	</a>
        </div>
    </div>
    <div id="middle">
	    <div style="margin:0 auto; width:1000px; height:500px;background-color:#19b4ea;">
	    	<div class="slogan" style="float:left;">
	    		<span class="slogan_img"></span>
	    	</div>
			<form id="myform" name="myform" action="${path}/account/dologin" method="post">
				<div class='signup_container'>
					<div class="title">
				    	<h1 class='signup_title'>用户登录</h1>
				    </div>
				    <div id="signup_forms" class="signup_forms">
				    	<label id="login_error" class="login_error">${error!}</label>
				    	<div class="u">
				    		<a class="in_icon"></a>
							<input type="text" name="userName" placeholder="请输入用户名" id="signup_name">	
				    	</div>
				    	<div class="p">
				    		<a class="in_icon_p"></a>
							<input type="password" name="password" placeholder="请输入密码" id="signup_password">
				    	</div>
					</div>
				    <div class="login-btn-set">
				    	<div id="remember" class="rem">记住登录状态<span>(公共场合不建议使用)</span></div>
				    	<input id="rem_status" type="hidden" value="0" name="remember">
				    	<button id="login_btn" class='login-btn'>登&nbsp;&nbsp;&nbsp;&nbsp;录</button>
				    </div>
				    <div class="rf">
				    	<a href="${path}/account/register">注册账号</a> | 
				    	<a href="${path}/account/forget">找回密码</a>
				    </div>
				</div>
			</form>
		</div>
	</div>
	<#include "../common/footer.ftl"/>
	</body>
</html>
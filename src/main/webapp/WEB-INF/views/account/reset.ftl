<#assign path="${request.contextPath}">
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<#include "../common/import.ftl">
	<title>密码重置</title>
	<link href="${path}/resources/css/forget.css" type="text/css" rel="stylesheet">
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
	<div style="width:1000px; height:auto; margin:0px auto;text-align:center;">
		<h2>用户密码重置</h2>
	    <form id="setform" method="post">
	    	<label>密码允许6-16位的字母、数字、符号组合</label>
	        <input type="text" name="name" class="input" value="${name!}" readonly="readonly" />
	        <input type="password" name="password" id="pwd1" class="input" maxlength="16" placeholder="请输入新密码"/>
	        <a id="pwd1tip" style="color:#f00;font-size:14px;"></a>
	        <input type="password" name="repassword" id="pwd2" class="input" maxlength="16" placeholder="请再次输入新密码"/>
	        <a id="pwd2tip" style="color:#f00;font-size:14px;"></a>
	        <button id="btn">保存密码</button>
		</form>
	</div>
	<#include "../common/footer.ftl"/>
	<script type="text/javascript">
		$(function(){
			$('#pwd1').blur(function() {
				var p1=$(this).val();
				if(p1) {
					if(p1.length<6||p1.length>16){
						$('#pwd1tip').html('密码不能小于6位或大于16位');
					} else {
						$('#pwd1tip').html('');
					}
				}
			});
			
			$('#pwd2').blur(function(){
				var p2=$(this).val();
				if(p2){
					if(p2.length<6||p2.length>16){
						$('#pwd2tip').html('密码不能小于6位或大于16位');
					} else if(p2!=$('#pwd1').val()){
						$('#pwd2tip').html('两次密码输入不一致');
					}else {
						$('#pwd2tip').html('');
					}
				}
			});
			
			$('#btn').click(function(){
				if($('#pwd1').val() && $('#pwd2').val() && $('#pwd2').val() == $('#pwd1').val()) {
					$('#setform').attr('action', '${path}/account/resetpwd');
					$('#setform').submit();
				} else {
					$('#pwd1tip').html('密码不能为空');
					$('#pwd2tip').html('密码不能为空');
					return false;	
				}
			});
		});
	</script>
</body>
</html>
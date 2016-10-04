<#assign path="${request.contextPath}">
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<#include "../common/import.ftl">
	<title>注册</title>
	<link type="text/css" href="${path}/resources/css/register.css" rel="stylesheet" />
	<script type="text/javascript" src="${path}/resources/js/account/ckregdataislegal.js"></script>
	<script type="text/javascript" src="${path}/resources/js/account/inputmail.js"></script>
</head>
<body>
	<div id="nav_top">
    	<div class="nav_top_t">
        	<a href="${path}">
        		<img class="logo" src="${path}/resources/images/logo.png" alt="LOGO"/>
        	</a>
        </div>
    </div>
    <div style="width:100%; height:600px;background-color:#19b4ea; margin:0; padding:0;">
    	<div style="width:1000px; height:600px;background-color:#19b4ea; margin:0 auto;">
        	<div id="main">
                <div>
                    <h1>用户注册</h1>
                    <div class="nav_tip">
                        <label>已经注册？现在<a href="${path}/account/login">登录</a></label>
                        <p>* 注册成功后可登录去"<a style="color:#19b4ea">个人中心>修改资料</a>"完善资料 *</p>
                    </div>
                </div>
                <form method="post" name="regform" id="regform">
	                <table class="table">
	                    <tr>
	                        <th><span class="must">*</span>用户名：</th>
	                        <td>
	                            <input name="userName" type="text" id="name" maxlength="20"/>
	                            <div id="utip" class="utip re" style="display:none;"></div>
	                        </td>
	                    </tr>
	                    <tr>
	                    <th><span class="must">*</span>密码：</th>
	                        <td>
	                            <input name="password" type="password" id="pwd_1" maxlength="16"/>
	                            <div id="p_1_tip" class="p_1_tip re" style="display:none;"></div>
	                        </td>
	                    </tr>
	                    <tr>
	                    <th><span class="must">*</span>确认密码：</th>
	                        <td>
	                            <input name="repassword" type="password" id="pwd_2" maxlength="16"/>
	                            <div id="p_2_tip" class="p_2_tip re" style="display:none;"></div>
	                        </td>
	                    </tr>
	                    <tr>
	                    <th><span class="must">*</span>邮箱：</th>
	                        <td>
	                        	<div class="mailchoose">
	                                <input id="mail" name="email" type="text"/>
	                                <div id="etip" class="etip re" style="display:none;"></div>
	                                <ul class="on_changes" style="position: absolute; left:0; top: 22px;">
	                                    <a email="">请选择邮箱类型</a>
	                                    <li email=""></li>
	                                    <li email="@163.com"></li>
	                                    <li email="@qq.com"></li>
	                                    <li email="@126.com"></li>
	                                </ul>
	                        	</div>
	                        </td>
	                    </tr>
	                    <tr>
	                    <th><span class="must">*</span>验证码：</th>
	                        <td>
	                            <div>
	                                <div class="yzinner">
	                                    <input placeholder="点击更换验证码" type="text" id="yzcode" name="validatecode" maxlength="4"/>
	                                    <div id="codew">
	                                        <img title="点击更换验证码" id="codeimg" alt="验证码" src="${path}/validateCode.img" />
	                                    </div>
	                                </div>
	                                <div id="yztip" class="yztip re" style="display:none;"></div>
	                            </div>
	                        </td>
	                    </tr>
	                </table>
					<div id="reg_btns">
	                    <button type="submit" id="goreg">注册</button>
	                    <button type="reset" id="reset">重置</button>
	                </div>
                </form>
			</div>
		</div>
    </div>
    <#include "../common/footer.ftl"/>
</body>
</html>
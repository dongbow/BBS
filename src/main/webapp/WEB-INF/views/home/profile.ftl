<#assign path="${request.contextPath}">
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<#include "../common/import.ftl"/>
	<title>个人资料</title>
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/home.css">
</head>
<body>
	<#include "../common/header.ftl"/>
	<#include "../common/rightButton.ftl"/>
	<div id="homemaincont">
		<div id="local" class="c1">
			<div class="z">
				<span>当前位置：</span><a class="line" href="${path}">论坛首页</a> <em>></em>
				<a class="line bltd" href="${path}/home/${user.userAccess.userId}/setting/profile">设置</a> <em>></em> 
				<span class="ltd">个人资料</span>
			</div>
		</div>
		<div id="ct" class="setitem">
			<div id="homeleftmenu">
				<div class="chleft">
					<h2>设置</h2>
				</div>
				<ul id="homeitems">
					<li class="hp hover"><a href="${path}/home/${user.userAccess.userId}/setting/profile">个人资料</a></li>
					<li class="hm"><a href="${path}/home/${user.userAccess.userId}/setting/credit">金币</a></li>
					<li class="hg"><a href="${path}/home/${user.userAccess.userId}/setting/usergroup">用户组</a></li>
				</ul>
			</div>
			<div id="rhomecont">
				<ul>
					<li class="csth"><a href="${path}/home/${user.userAccess.userId}/setting/profile">个人资料</a></li>
					<li class="cshead"><a href="${path}/home/${user.userAccess.userId}/setting/profile?type=headimg">头像修改</a></li>
					<li class="cspwd"><a href="${path}/home/${user.userAccess.userId}/setting/profile?type=password">密码修改</a></li>
					<li class="csmail"><a href="${path}/home/${user.userAccess.userId}/setting/profile?type=email">邮箱修改</a></li>
					<li class="cscy"><a href="${path}/home/${user.userAccess.userId}/setting/profile?type=privacy">隐私设置</a></li>
				</ul>
				<div class="rhmct">
					<#if type == "info">
						<div class="cpcont">
							<form action="${path}/home/account/update" id="upform" name="upform">
								<table>
									<tbody>
										<tr>
											<th>昵称：</th>
											<td>
												<input type="text" name="nickName" maxlength="20" id="nickname" value=""/>
												<label id="nicktip" style="color:#f00"></label>
											</td>
										</tr>
										<tr>
											<th>性别：</th>
											<td>
												<select name="sex" id="sex">
													<option value="0">男</option>
													<option value="1">女</option>
													<option value="2">保密</option>
												</select>
											</td>
										</tr>
										<tr>
											<th>生日：</th>
											<td>
												<input type="text" name="birthday" id="birthday" value="" onClick="WdatePicker()"/>
												<label id="birthtip"></label>
											</td>
										</tr>
										<tr>
											<th>所在城市：</th>
											<td>
												<select name="province" id="privence">
													<option value="-1">省份</option>
													<option value=""></option>
												</select> 
												<select name="city" id="city">
													<option value="-1">城市</option>
													<option value=""></option>
												</select> 
											</td>
										</tr>
										<tr>
											<th>QQ：</th>
											<td><input type="text" name="qq" id="qq" value=""/></td>
										</tr>
										<tr>
											<th>手机号：</th>
											<td><input type="text" name="phonenumber" id="phonenumber" value=""/></td>
										</tr>
										<tr>
											<th>兴趣爱好：</th>
											<td>
												<textarea class="likes" name="userlikes" id="userlikes"></textarea>
											</td>
										</tr>
										<tr>
											<th>签名档：</th>
											<td>
												<textarea name="signature" id="signature"></textarea>
											</td>
										</tr>
									</tbody>
								</table>
								<button id="upbtn">保存</button>
							</form>
						</div>
					<#elseif type == "headimg">
						<div class="cpcont">
							<div id="altContent">
								<OBJECT classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
									codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,40,0"
									WIDTH="650" HEIGHT="450" id="myMovieName">
									<PARAM NAME=movie VALUE="avatar.swf">
									<PARAM NAME=quality VALUE=high>
									<PARAM NAME=bgcolor VALUE=#FFFFFF>
									<EMBED src="<%=basePath%>plugins/avatar/avatar.swf" quality=high bgcolor=#FFFFFF WIDTH="650" HEIGHT="450" 
											wmode="transparent" flashVars="imgUrl=&uploadUrl=<${path}/plugins/avatar/upfile.jsp&uploadSrc=false"
										NAME="myMovieName" ALIGN="" TYPE="application/x-shockwave-flash" allowScriptAccess="always"
										PLUGINSPAGE="http://www.macromedia.com/go/getflashplayer">
									</EMBED>
								</OBJECT>
							</div>
							<div id="avatar_priview"></div>
						</div>
					<#elseif type == "password">
			    		<div class="cpcont">
							<form action="account/user_updatePwd.htm" id="upform" name="upform" method="post">
								<table>
									<tbody>
										<tr>
											<th>原密码：</th>
											<td>
												<input type="password" name="password" id="opwd"/>
												<span id="otip" style="color:#f00;"></span>
											</td>
										</tr><tr>
											<th>新密码：</th>
											<td>
												<input type="password" name="pwd" maxlength="16" id="npwd"/>
												<span id="ntip" style="color:#f00;"></span>
											</td>
										</tr><tr>
											<th>新密码：</th>
											<td>
												<input type="password" name="repassword" maxlength="16" id="rnpwd"/>
												<span id="rntip" style="color:#f00;"></span>
											</td>
										</tr>
									</tbody>
								</table>
								<input type="hidden" id="nowname" name="uid" value=""/>
								<button id="upbtn">保存</button>
							</form>
						</div>
					<#elseif type == "email">
			    		<div class="cpcont">
							<table>
								<tbody>
									<tr>
										<th>目前邮箱：</th>
										<td>
											<b id="nowemail" style="font:16px 'microsoft yahei'; margin-top:5px;display:block"></b>
										</td>
									</tr>
									<tr>
										<th>新邮箱：</th>
										<td>
											<div id="mailchoose">
												<input type="text" name="email" id="nmail"/>
												<span id="mailtip" style="color:#f00;"></span>
												<input type="hidden" id="result" value="0">
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
								</tbody>
							</table>
							<input type="hidden" id="nowname" name="uid" value=""/>
							<button id="upbtn" class="mailbutton">保存</button>
						</div>
					<#else>
						<div class="cpcont">
							<form action="" id="upform" name="upform">
								<table>
									<tbody>
										<tr>
											<th>资料公开：</th>
											<td>
												<select name="ispublic" id="ispublic">
													<option value="0">公开</option>
													<option value="1">好友可见</option>
													<option value="2">保密</option>
												</select>
											</td>
										</tr><tr>
											<th>主题公开：</th>
											<td>
												<select name="ispublictopic" id="ispublictopic">
													<option value="0">公开</option>
													<option value="1">好友可见</option>
													<option value="2">保密</option>
												</select>
											</td>
										</tr><tr>
											<th>回复公开：</th>
											<td>
												<select name="ispublicreply" id="ispublicreply">
													<option value="0">公开</option>
													<option value="1">好友可见</option>
													<option value="2">保密</option>
												</select>
											</td>
										</tr>
									</tbody>
								</table>
								<button id="upbtn">保存</button>
							</form>
						</div>
					</#if>
				</div>
			</div>
		</div>
	</div>
	<#include "../common/footer.ftl"/>
</body>
<script type="text/javascript">
	$(document).ready(function() {
		Setting.init('${type}');
	});
</script>
<script type="text/javascript" src="${path}/resources/js/home.js" ></script>
<script type="text/javascript" src="${path}/resources/js/inputmail.js"></script>
<script type="text/javascript" src="${path}/resources/static/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="${path}/resources/static/avatar/avatar.js"></script>
</html>
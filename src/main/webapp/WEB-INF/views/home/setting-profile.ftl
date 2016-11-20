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
				<a class="line bltd" href="${path}/home/setting/profile">设置</a> <em>></em> 
				<span class="ltd">个人资料</span>
			</div>
		</div>
		<div id="ct" class="setitem">
			<div id="homeleftmenu">
				<div class="chleft">
					<h2>设置</h2>
				</div>
				<ul id="homeitems">
					<li class="hp hover"><a href="${path}/home/setting/profile">个人资料</a></li>
					<li class="hm"><a href="${path}/home/setting/credit">金币</a></li>
					<li class="hg"><a href="${path}/home/setting/usergroup">用户组</a></li>
				</ul>
			</div>
			<div id="rhomecont">
				<ul>
					<li class="csth"><a href="${path}/home/setting/profile">个人资料</a></li>
					<li class="cshead"><a href="${path}/home/setting/profile?type=headimg">头像修改</a></li>
					<li class="cspwd"><a href="${path}/home/setting/profile?type=password">密码修改</a></li>
					<li class="csmail"><a href="${path}/home/setting/profile?type=email">邮箱修改</a></li>
					<li class="cscy"><a href="${path}/home/setting/profile?type=privacy">隐私设置</a></li>
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
												<input type="text" name="nickName" maxlength="20" id="nickname" value="${huser.userAccess.userNickname}"/>
												<label id="nicktip" style="color:#f00"></label>
											</td>
										</tr>
										<tr>
											<th>性别：</th>
											<td>
												<select name="sex" id="sex">
													<option value="0" <#if 0 == huser.userInfo.userSex!>selected</#if>>男</option>
													<option value="1" <#if 1 == huser.userInfo.userSex!>selected</#if>>女</option>
													<option value="2" <#if 2 == huser.userInfo.userSex!>selected</#if>>保密</option>
												</select>
											</td>
										</tr>
										<tr>
											<th>生日：</th>
											<td>
												<input type="text" name="birthday" id="birthday" value="${huser.userInfo.userBirth!}" onClick="WdatePicker()" readOnly/>
												<label id="birthtip"></label>
											</td>
										</tr>
										<tr>
											<th>所在城市：</th>
											<td>
												<select name="province" id="province">
													<option value="-1">省份</option>
													<#list provinces as p>
														<#if huser.userInfo.userProvince??>
															<option value="${p.id}" <#if p.id == huser.userInfo.userProvince!?number>selected</#if>>${p.name}</option>
														<#else>
															<option value="${p.id}">${p.name}</option>
														</#if>
													</#list>
												</select> 
												<select name="city" id="city">
													<option value="-1">城市</option>
													<#if citys??>
														<#list citys as c>
															<option value="${c.id}" <#if c.id == huser.userInfo.userCity!?number>selected</#if>>${c.name}</option>
														</#list>
													</#if>
												</select> 
											</td>
										</tr>
										<tr>
											<th>QQ：</th>
											<td><input type="text" name="qq" id="qq" value="${huser.userInfo.userQq!}"/></td>
										</tr>
										<tr>
											<th>手机号：</th>
											<td><input type="text" name="phonenumber" id="phonenumber" value="${huser.userInfo.userPhone!}"/></td>
										</tr>
										<tr>
											<th>兴趣爱好：</th>
											<td>
												<textarea class="likes" name="userlikes" id="userlikes">${huser.userInfo.userLike!}</textarea>
											</td>
										</tr>
										<tr>
											<th>签名档：</th>
											<td>
												<textarea name="signature" id="signature">${huser.userInfo.userSign!}</textarea>
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
									<EMBED src="${path}/resources/static/avatar/avatar.swf" quality=high bgcolor=#FFFFFF WIDTH="650" HEIGHT="450" 
											wmode="transparent" flashVars="imgUrl=${user.userInfo.userHeadImg}&uploadUrl=${path}/resources/static/avatar/upfile.jsp&uploadSrc=false"
										NAME="myMovieName" ALIGN="" TYPE="application/x-shockwave-flash" allowScriptAccess="always"
										PLUGINSPAGE="http://www.macromedia.com/go/getflashplayer">
									</EMBED>
								</OBJECT>
							</div>
							<div id="avatar_priview"></div>
						</div>
					<#elseif type == "password">
			    		<div class="cpcont">
							<table>
								<tbody>
									<tr>
										<th>原密码：</th>
										<td>
											<input type="password" name="password" id="opwd"/>
										</td>
									</tr>
									<tr>
										<th>新密码：</th>
										<td>
											<input type="password" name="pwd" maxlength="16" id="npwd"/>
										</td>
									</tr>
									<tr>
										<th>新密码：</th>
										<td>
											<input type="password" name="repassword" maxlength="16" id="rnpwd"/>
										</td>
									</tr>
								</tbody>
							</table>
							<button id="upbtn" class="btn-pwd">保存</button>
						</div>
					<#elseif type == "email">
			    		<div class="cpcont">
							<table>
								<tbody>
									<tr>
										<th>当前邮箱：</th>
										<td>
											<b id="nowemail" style="font:16px 'microsoft yahei'; margin-top:5px;display:block">${huser.userAccess.userEmail}</b>
										</td>
									</tr>
									<tr>
										<th>验证邮箱：</th>
										<td>
											<input type="text" name="omail" id="omail"/>
										</td>
									</tr>
									<tr>
										<th>新邮箱：</th>
										<td>
											<div id="mailchoose">
												<input type="text" name="email" id="nmail"/>
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
							<button id="upbtn" class="mailbutton">保存</button>
						</div>
					<#else>
						<div class="cpcont">
							<table>
								<tbody>
									<tr>
										<th>资料公开：</th>
										<td>
											<select name="baseinfo" id="ispublic">
												<option value="0" <#if 0 == huser.userPrivacy.baseIsPublic!?number>selected</#if>>公开</option>
												<option value="1" <#if 1 == huser.userPrivacy.baseIsPublic!?number>selected</#if>>好友可见</option>
												<option value="2" <#if 2 == huser.userPrivacy.baseIsPublic!?number>selected</#if>>保密</option>
											</select>
										</td>
									</tr>
									<tr>
										<th>添加好友：</th>
										<td>
											<select name="addfriend" id="isaddfriend">
												<option value="0" <#if 0 == huser.userPrivacy.isAddFriend!?number>selected</#if>>允许</option>
												<option value="1" <#if 1 == huser.userPrivacy.isAddFriend!?number>selected</#if>>不允许</option>
											</select>
										</td>
									</tr>
									<tr>
										<th>好友公开：</th>
										<td>
											<select name="publicfriend" id="ispublicfriend">
												<option value="0" <#if 0 == huser.userPrivacy.friendIsPublic!?number>selected</#if>>公开</option>
												<option value="1" <#if 1 == huser.userPrivacy.friendIsPublic!?number>selected</#if>>好友可见</option>
												<option value="2" <#if 2 == huser.userPrivacy.friendIsPublic!?number>selected</#if>>保密</option>
											</select>
										</td>
									</tr>
									<tr>
										<th>主题公开：</th>
										<td>
											<select name="publictopic" id="ispublictopic">
												<option value="0" <#if 0 == huser.userPrivacy.topicIsPublic!?number>selected</#if>>公开</option>
												<option value="1" <#if 1 == huser.userPrivacy.topicIsPublic!?number>selected</#if>>好友可见</option>
												<option value="2" <#if 2 == huser.userPrivacy.topicIsPublic!?number>selected</#if>>保密</option>
											</select>
										</td>
									</tr>
									<tr>
										<th>回复公开：</th>
										<td>
											<select name="publicreply" id="ispublicreply">
												<option value="0" <#if 0 == huser.userPrivacy.replyIsPublic!?number>selected</#if>>公开</option>
												<option value="1" <#if 1 == huser.userPrivacy.replyIsPublic!?number>selected</#if>>好友可见</option>
												<option value="2" <#if 2 == huser.userPrivacy.replyIsPublic!?number>selected</#if>>保密</option>
											</select>
										</td>
									</tr>
								</tbody>
							</table>
							<button id="upbtn" class="btn-privacy">保存</button>
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
<script type="text/javascript" src="${path}/resources/js/jquery/jquery.md5.js"></script>
<script type="text/javascript" src="${path}/resources/js/account/inputmail.js"></script>
<script type="text/javascript" src="${path}/resources/static/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="${path}/resources/static/avatar/avatar.js"></script>
</html>
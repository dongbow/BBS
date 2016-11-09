<#assign path="${request.contextPath}">
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<#include "../common/import.ftl"/>
	<title>${userinfo.userAccess.userNickname}的个人中心</title>
	<link href="${path}/resources/css/space.css" type="text/css" rel="stylesheet">
</head>
<body>
	<#include "../common/header.ftl"/>
	<#include "../common/rightButton.ftl"/>
	<div id="personalmaincont">
		<div id="local" class="c1">
			<div class="z">
				<span>当前位置：</span><a class="line" href="${path}">论坛首页</a> <em>></em>
				<a class="line" href="${path}/space/uid/${userinfo.userAccess.userId}">${userinfo.userAccess.userNickname}</a>
				<em>></em> <span id="spacelocal">个人资料</span>
			</div>
		</div>
		<div id="uhd">
			<div class="icn avt">
				<a href="${path}/space/uid/${userinfo.userAccess.userId}"> 
					<img src="${userinfo.userInfo.userHeadImg}" />
				</a>
			</div>
			<h2 class="mt">${userinfo.userAccess.userNickname}</h2>
		</div>
		<ul style="padding-left: 75px;" class="tb cl">
			<li class="utp"><a href="${path}/space/uid/${userinfo.userAccess.userId}/topic">主题</a></li>
			<li class="a"><a href="${path}/space/uid/${userinfo.userAccess.userId}">个人资料</a></li>
			<#if islogin == 1 && user.userAccess.userIsAdmin == 1 && user.userAccess.userId == userinfo.userAccess.userId>
				<li class="cm"><a href="${path}/system/admin/account/login">进入后台</a></li>
			</#if>
			<#if islogin == 1 && user.userAccess.userIsBoderManager == 1 && user.userAccess.userId == userinfo.userAccess.userId>
				<li class="cm"><a href="${path}">版主后台</a></li>
			</#if>
			<#if islogin == 1 && user.userAccess.userId == userinfo.userAccess.userId>
				<li class="cm"><a href="${path}/home/setting/profile">修改资料</a></li>
			</#if>
			<#if user??>
				<#if user.userAccess.userId != userinfo.userAccess.userId>
					<li class="cm"><a href="">发私信</a></li>
					<li class="cm"><a href="javascript:;" onclick="friends(${userinfo.userAccess.userId}, '${userinfo.userAccess.userNickname}')">加好友</a></li>
				</#if>
			<#else>
				<li class="cm"><a href="">发私信</a></li>
				<li class="cm"><a href="javascript:;" onclick="friends(${userinfo.userAccess.userId}, '${userinfo.userAccess.userNickname}')">加好友</a></li>
			</#if>
			
		</ul>
		<div id="ct" class="ct1 c1">
			<div class="mbn">
				<p>
					<span>${userinfo.userAccess.userNickname}（uid：${userinfo.userAccess.userId}
					<#if islogin == 1 && user.userAccess.userId == userinfo.userAccess.userId>
						<span>；登录名：${userinfo.userAccess.userName}</span>
					</#if>）
					</span>
				</p>
				<p class="mcn">
					<span>
						<span>统计信息：</span> 
						<span class="count"><a href="${path}/space/uid/${userinfo.userAccess.userId}/topic">主题：${uservalue.userTopicCount}</a></span>
						<span class="count"><a href="${path}/space/uid/${userinfo.userAccess.userId}/reply">回复：${uservalue.userReplyCount}</a></span> 
						<span class="count"><a href="${path}/space/uid/${userinfo.userAccess.userId}/friends">好友：${uservalue.userFriendCount}</a></span> 
						<span class="count">金币：${uservalue.userGold}</span> 
						<span class="count none">经验：${uservalue.userExperience}</span> 
					</span>
				</p>
			</div>
			<div class="mun">
				<#if userinfo.userPrivacy.baseIsPublic == 0 || (islogin == 1 && user.userAccess.userId == userinfo.userAccess.userId)>
					<p>
						<span>性别：<#if userinfo.userInfo.userSex! == 0>男<#else>女</#if></span>
						<span>生日：${userinfo.userInfo.userBirth!}</span>
						<span>所在城市：${userinfo.userInfo.userProvince!}/${userinfo.userInfo.userCity!}</span>
					</p>
					<p>
						<span>QQ：${userinfo.userInfo.userQq!}</span>
						<span>手机号：${userinfo.userInfo.userPhone!}</span>
						<span>兴趣爱好：${userinfo.userInfo.userLike!}</span>
					</p>
				</#if>
				<p class="over">
					<span>签名档：</span><span class="os">${userinfo.userInfo.userSign!}</span>
				</p>
			</div>
			<div class="mugn">
				<p>
					<span>用户组：
						<#list userinfo.roles as role>
							<a style="color:${role.roleColor}" href="${path}/home/setting/usergroup">${role.roleName}</a>.&nbsp;&nbsp;
						</#list>
					</span>
				</p>
				<#if userinfo.userAccess.userIsBoderManager == 1>
					<p>
						<span>管理板块：<a href="">答疑解惑</a></span>
					</p>
				</#if>
				<p>
					<span>注册时间：${userinfo.userAccess.userCreateTime}</span>
					<span>最近登录时间：${userinfo.userAccess.userLastestLoginTime!}</span>
					<#if islogin == 1 && user.userAccess.userId == userinfo.userAccess.userId>
						<br/><br/>
						<span>注册IP：${userinfo.userAccess.userRegIp!}</span>
						<span>最近登录IP：${userinfo.userAccess.userLastestLoginIp!}</span>
					</#if>
				</p>
			</div>
		</div>
	</div>
	<#include "../common/footer.ftl"/>
</body>
</html>
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
				<em>></em> <span id="spacelocal">好友</span>
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
			<li class=""><a href="${path}/space/uid/${userinfo.userAccess.userId}">个人资料</a></li>
			<#if islogin == 1 && user.userAccess.userIsAdmin == 1 && user.userAccess.userId == userinfo.userAccess.userId>
				<li class="cm"><a href="${path}/system/admin/account/login" target="_blank">进入后台</a></li>
				<li class="cm"><a href="${path}/manage/bmc/index" target="_blank">版主后台</a></li>
			</#if>
			<#if islogin == 1 && user.userAccess.userIsBoderManager == 1 && user.userAccess.userId == userinfo.userAccess.userId>
				<li class="cm"><a href="${path}/manage/bmc/index" target="_blank">版主后台</a></li>
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
			<p class="tbmu">当前共有 <span class="xw1">30</span> 个好友</p>
			<ul class="buddy c1">
				<#list [1,2,3,4,5] as a>
					<li class="bbda cl">
						<div class="avt">
							<a href="space-uid-359954.html" target="_blank">
								<img src="http://img.res.meizu.com/img/download/uc/35/99/54/00/00/359954/w50h50" onerror="this.onerror=null;this.src=&quot;http://common.res.meizu.com/resources/php/bbs/static/image/noavatar_small.gif&quot;">
							</a>
						</div>
						<h4>
							<a href="space-uid-359954.html" title="wx2893154" target="_blank">wx2893154</a>
						</h4>
						<p class="maxh">超级管理员</p>
						<div class="xg1 add_ul">
							<#if user??>
								<#if user.userAccess.userId != userinfo.userAccess.userId>
									<a href="javascript:;" id="interaction_359954" onmouseover="showMenu(this.id);" class="showmenu" initialized="true">加好友</a>
									<span class="pipe">|</span>
								</#if>
							<#else>
								<a href="javascript:;" id="interaction_359954" onmouseover="showMenu(this.id);" class="showmenu" initialized="true">加好友</a>
								<span class="pipe">|</span>
							</#if>
							<a href="javascript:;">私信</a>
						</div>
					</li>
				</#list>
			</ul>
		</div>
	</div>
	<#include "../common/footer.ftl"/>
</body>
</html>
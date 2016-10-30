<#assign path="${request.contextPath}">
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
				<em>></em> <span id="spacelocal">主题</span>
			</div>
		</div>
		<div id="uhd">
			<div class="icn avt">
				<a href="${path}/space/uid/${userinfo.userAccess.userId}"> 
					<img src="${path}${userinfo.userInfo.userHeadImg}" />
				</a>
			</div>
			<h2 class="mt">${userinfo.userAccess.userNickname}</h2>
		</div>
		<ul style="padding-left: 75px;" class="tb cl">
			<li class="utp a"><a href="${path}/space/uid/${userinfo.userAccess.userId}/topic">主题</a></li>
			<li class=""><a href="${path}/space/uid/${userinfo.userAccess.userId}">个人资料</a></li>
			<#if islogin == 1 && user.userAccess.userIsAdmin == 1 && user.userAccess.userId == userinfo.userAccess.userId>
				<li class="cm"><a href="${path}/system/admin/account/login">进入后台</a></li>
			</#if>
			<#if islogin == 1 && user.userAccess.userIsBoderManager == 1 && user.userAccess.userId == userinfo.userAccess.userId>
				<li class="cm"><a href="${path}">版主后台</a></li>
			</#if>
			<#if islogin == 1 && user.userAccess.userId == userinfo.userAccess.userId>
				<li class="cm"><a href="${path}/home/${user.userAccess.userId}/setting/profile">修改资料</a></li>
			</#if>
			<#if user??>
				<#if user.userAccess.userId != userinfo.userAccess.userId>
					<li class="cm"><a href="">发私信</a></li>
					<li class="cm"><a href="">加好友</a></li>
				</#if>
			<#else>
				<li class="cm"><a href="">发私信</a></li>
				<li class="cm"><a href="">加好友</a></li>
			</#if>
			
		</ul>
		<div id="ct" class="ct1 c1">
			<div class="tr">
				<span><a class="sw" href="${path}/space/uid/${userinfo.userAccess.userId}/topic">主题</a></span>
				<span>|</span>
				<span><a class="rp" href="${path}/space/uid/${userinfo.userAccess.userId}/reply">回复</a></span>
			</div>
			<div class="t1">
				<table cellspacing="0" cellpadding="0">
					<thead>
						<tr class="th">
							<th>主题</th>
							<td class="frm">版块/群组</td>
			                <td class="num">回复/查看</td>
			                <td class="by">最后发帖</td>
						</tr>
					</thead>
					<tbody>
						<#if topics??>
							<#list topics as topic>
								<tr>
									<th><a href="${path}/board/${topic.boardId}/topic/detail/${topic.topicId}/1" target="_blank">${topic.topicTitle}</a></th>
									<th><a class="board" href="${path}/navigation/${topic.board.navId}/board/${topic.boardId}" target="_blank">${topic.board.boardName}</a></th>
									<th class="num">
										<a class="xi2" href="${path}/board/${topic.boardId}/topic/detail/${topic.topicId}/1" target="_blank">${topic.topicData.topicReplyCount}</a>
										<em>${topic.topicData.topicViewCount}</em>
									</th>
									<th class="by">
										<cite><a href="${path}/space/nickname/${topic.topicData.lastestReplyUser!}" target="_blank">${topic.topicData.lastestReplyUser!}</a></cite>
	            						<em><a href="" target="_blank">${topic.topicData.lastestReplyTime!}</a></em>
									</th>
								</tr>
							</#list>
						<#else>
							<tr>
								<th colspan="4">无主题</th>
							</tr>
						</#if>
					</tbody>
				</table>
			</div>
			<#if page??>
				<#include "../common/page.ftl"/>
				<@buildPage page = page/>
			</#if>
		</div>
	</div>
	<#include "../common/footer.ftl"/>
</body>
	<script type="text/javascript">
		$(document).ready(function(){
			$('.infoTextAndGoPageBtnWrap').remove();
			$('.both').remove();
		});
	</script>
</html>
<#assign path="${request.contextPath}">
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<#include "../common/import.ftl"/>
	<title>${board.boardName}</title>
	<link type="text/css" rel="stylesheet" href="${path}/resources/css/forumstyle.css" />
	<script src="${path}/resources/js/forum.js" type="text/javascript"></script>
</head>
<body>
	<#include "../common/header.ftl"/>
	<#include "../common/rightButton.ftl"/>
	<div id="fm">
		<div id="local" class="c1">
			<div class="z">
				<span>当前位置：</span><a class="line" href="${path}">论坛首页</a> <em>></em>
				<a class="line bltd" href="${path}/navigation/${navigation.navId}">${navigation.navName}</a> <em>></em> 
				<span id="boardname" class="ltd">${board.boardName}</span>
			</div>
		</div>
		<div style="float: left; width: 710px; height: auto;">
			<div style="float: left; width: 710px; height: auto; background:#f2f2f2;padding: 0;">
				<div id="bname">
					<h2>${board.boardName}</h2>
					<div style="clear:right;" class="details">
					   <p>
			               <a onclick="favorite(${navigation.navId}, ${board.boardId}, '${board.boardName}', 'board');" id="a_favorite" href="javascript:;">收藏 <strong>(<span class="bcf">${boardInfo.boardFavoriteCount}</span>)</strong></a>
			               <span class="pipe">|</span>
			               <span style="margin-left: 0">主题：<a class="todayPosts">${boardInfo.boardTopicCount}</a></span>
			               <span class="pipe">|</span>
			               <span>回复：<a class="themes">${boardInfo.boardReplyCount}</a></span>
			           </p>
			           <p>
			           	   <span>版主：</span>
			           	   <#if board.boardManagerName??>
			           	   		<#list board.boardManagerName as m>
			               			<a class="notabs" href="${path}/space/nickname/${m}">${m}</a>
			           	   		</#list>
			           	   </#if>
			           </p>
					</div>
				</div>
			</div>
			<div id="classcont">
				<div id="bclassify">
					<h4>分类</h4>
					<ul class="filter">
						<li id="ttp_all" class="xw1 a">
							<a href="${path}/navigation/${navigation.navId}/board/${board.boardId}">全部</a>
						</li>
						<#if classifies??>
							<#list classifies as c>
								<li>
									<a href="${path}/navigation/${navigation.navId}/board/${board.boardId}/classify/${c.classId}">${c.className}
									<label>(${c.classTopicCount})</label></a>
								</li>
							</#list>
						</#if>
					</ul>
				</div>
			</div>
			<!-- board-detail -->
		</div>
	    <#include "../common/rightmenu.ftl"/>
	</div>
	<#include "../common/footer.ftl"/>
</body>
</html>
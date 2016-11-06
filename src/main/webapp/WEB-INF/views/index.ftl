<#assign path="${request.contextPath}">
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<#include "common/import.ftl"/>
	<title>首页</title>
	<link type="text/css" rel="stylesheet" href="${path}/resources/css/forumstyle.css" />
	<link href="${path}/resources/css/jquery.slideBox.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<#include "common/header.ftl"/>
	<#include "common/rightButton.ftl"/>
	<div id="fm">
		<div style="float: left; width: 710px; height: auto;">
			<div id="demo1" class="slideBox">
				<ul class="items">
					<#list images as img>
						<li><a href="${img.homeLink}" title="${img.homeTitle}"><img src="${img.homeImgLink}"></a></li>
					</#list>
				</ul>
			</div>
			<div id="cont">
				<#if gtopics??>
					<#list gtopics as g>
						<div id="topic_${g.topicId}" class="topiclist">
					    	<a href="${path}/space/uid/${g.user.userAccess.userId}">
					    		<img alt="头像" src="${g.user.userInfo.userHeadImg}" width="50" height="50" />
					    	</a>
					        <div class="topic">
					        	<a class="board" title="版块" href="${path}/navigation/${g.navId}/board/${g.boardId}" style="background:${g.board.boardColor}">${g.board.boardName}</a>
					            <a class="topictitle addding" title="${g.topicTitle}" href="${path}/board/${g.boardId}/topic/detail/${g.topicId}/1">${g.topicTitle}</a>
					            <span class="marks">
					                <#if g.topicInfo.topicIsCream == 1>
					            		<a class="jing" title="精华">精</a>
					            	</#if>
					                <a class="ding ading" title="全局置顶">置顶</a>
					            </span>
					            <div class="tinfo">
					            	<a href="${path}/space/uid/${g.user.userAccess.userId}" title="作者">${g.user.userAccess.userNickname}</a>
					                <a class="liu" title="浏览人数">浏</a>
					                <a>${g.topicData.topicViewCount}</a>
					                <a class="hui"  title="回复人数">回</a>
					                <a>${g.topicData.topicReplyCount}</a>
					                <a title="最后回复">${g.topicData.lastestReplyUser!}</a>
					                <a href="" title="最后回复时间">${g.topicData.lastestReplyTime!}</a>
					                <a title="帖子创建时间" class="tctime">${g.topicCreateTime}</a>
					            </div>
					        </div>
					    </div>
					</#list>
				</#if>
			    <h3>版块主题</h3>
			    <#if htopics??>
			    	<#list htopics as h>
			    		<div id="topic_${h.topicId}" class="topiclist">
					    	<a href="${path}/space/uid/${h.user.userAccess.userId}">
					    		<img alt="头像" src="${h.user.userInfo.userHeadImg}" width="50" height="50" />
					    	</a>
					        <div class="topic">
					        	<a class="board" title="版块" href="${path}/navigation/${h.navId}/board/${h.boardId}" style="background:${h.board.boardColor}">${h.board.boardName}</a>
					            <a class="topictitle" title="${h.topicTitle}" href="${path}/board/${h.boardId}/topic/detail/${h.topicId}/1">${h.topicTitle}</a>
					            <span class="marks">
					                <#if h.topicInfo.topicIsCream == 1>
					            		<a class="jing" title="精华">精</a>
					            	</#if>
					            </span>
					            <div class="tinfo">
					            	<a href="${path}/space/uid/${h.user.userAccess.userId}" title="作者">${h.user.userAccess.userNickname}</a>
					                <a class="liu" title="浏览人数">浏</a>
					                <a>${h.topicData.topicViewCount}</a>
					                <a class="hui"  title="回复人数">回</a>
					                <a>${h.topicData.topicReplyCount}</a>
					                <a title="最后回复">${h.topicData.lastestReplyUser!}</a>
					                <a href="" title="最后回复时间">${h.topicData.lastestReplyTime!}</a>
					                <a title="帖子创建时间" class="tctime">${h.topicCreateTime}</a>
					            </div>
					        </div>
					    </div>
			    	</#list>
			    </#if>
			</div>
			<p style="text-align: center; margin-top: 15px;">更多主题请前往各个板块查看</p>
		</div>
	    <#include "common/rightmenu.ftl"/>
	</div>
	<#include "common/footer.ftl"/>
</body>
<script type="text/javascript">
	$(function() {
		jQuery(function($){
			$('#demo1').slideBox();
		});
	});
</script>
<script src="${path}/resources/js/jquery/jquery.slideBox.min.js" type="text/javascript"></script>
</html>
<#assign path="${request.contextPath}">
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<#include "../common/import.ftl"/>
	<title>搜索</title>
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/search.css">
</head>
<body>
	<div style="width: 1100px; height: 40px;margin:0px auto;">
		<a class="reindex" href="${path}">返回首页</a>
	</div>
	<div id="searchpanel">
		<a href="${path}"><img id="logopic" alt="JAVA社区" src="${path}/resources/images/biglogo.png"></a> <br />
		<div id="toolway">
			<a class="author" href="${path}/search">帖子</a>
			<a class="author" href="${path}/home/friends/request?type=add">作者</a>
			<a class="great" href="${path}/search?adv=yes">高级搜索</a>
		</div>
		<div class="input_w">
			<input id="searchinput" class="sach" type="text" placeholder="请输入搜索内容" value="${kw!}"> 
			<a class="scbtn" href="${path}/search" onclick="javascript:this.href = this.href + '?kw=' + $('#searchinput').val()">搜索</a>
		</div>
		<#if adv??>
			<#include "search-adv.ftl"/>
		</#if>
		<#if searchDto?? && searchDto.getTopics()?size gt 0>
			<div class="result">
	        	<p class="resultTips"> 结果: 找到 “<span class="emfont">${kw!}</span>” 相关内容 ${page.totalRecord} 个</p>
	            <div class="rlt_table">
		            <div class="rlt_thead">
		                <div class="rlt_tr">
		                    <div class="rlt_th rlt_title">标题</div>
		                    <div class="rlt_th rlt_module">板块</div>
		                    <div class="rlt_th rlt_author">作者</div>
		                    <div class="rlt_th rlt_complex">回复/查看</div>
		                    <div class="rlt_th rlt_lastUpdate">发布时间</div>
		                </div>
		            </div>
	        		<div class="rlt_tbody">
	        			<#list searchDto.getTopics() as topic>
	        				<div class="rlt_tr">
		                		<div class="rlt_th rlt_title">
		                    		<a href="${path}/board/${topic.boardId}/topic/detail/${topic.topicId}" target="_blank" title="${topic.topicTitle}">${topic.topicTitle}</a>
		                		</div>
		                		<div class="rlt_th rlt_module"><a href="${path}/navigation/${topic.navId}/board/${topic.boardId}" title="${topic.board.boardName}">${topic.board.boardName}</a></div>
		                		<div class="rlt_th rlt_author"><a href="${path}/space/uid/${topic.userId}" title="${topic.user.userAccess.userNickname}">${topic.user.userAccess.userNickname}</a></div>
			                    <div class="rlt_th rlt_complex"><a href="javascript:void(0);" class="reply">${topic.topicData.topicReplyCount}</a>/<a href="javascript:void(0);" class="check">${topic.topicData.topicViewCount}</a></div>
			                    <div class="rlt_th rlt_lastUpdate" title="${topic.topicCreateTime}">${topic.topicCreateTime?substring(0, 16)}</div>
			                    <div class="rlt_th rlt_content"><#noescape>${topic.topicContent}</#noescape></div>
		                    </div>
						</#list>
	    			</div>
	        	</div>
        		<#include "../common/page.ftl"/>
				<@buildPage page = page/>
	        </div>
	    <#else>
	    	<p class="resultTips" style="font-size: 18px"> 没有查询到 “<span class="emfont">${kw!}</span>” 的相关结果</p>
		</#if>
	</div>
	<#include "../common/footer.ftl"/>
	<script type="text/javascript">
		$(function() {$('.goPageBox').remove();$('.both').remove();})
	</script>
</body>
</html>
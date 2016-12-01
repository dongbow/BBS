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
									<#if clz??>
										<#if clz.classId == c.classId>
											<a style="color:#19b4ea" href="${path}/navigation/${navigation.navId}/board/${board.boardId}/classify/${c.classId}">${c.className}
											<label style="color:#19b4ea">(${c.classTopicCount})</label></a>
										<#else>
											<a href="${path}/navigation/${navigation.navId}/board/${board.boardId}/classify/${c.classId}">${c.className}
											<label>(${c.classTopicCount})</label></a>
										</#if>
									<#else>
										<a href="${path}/navigation/${navigation.navId}/board/${board.boardId}/classify/${c.classId}">${c.className}
										<label>(${c.classTopicCount})</label></a>
									</#if>
								</li>
							</#list>
						</#if>
					</ul>
				</div>
			</div>
			<!-- board-detail -->
			<div id="cont">
			    <div class="screen">
					<div class="sctopic">
			        	<a id="scsh" href="javascript:;">主题<span>▼</span></a>
			            <div class="allway scsh" style="display:none;">
			            	<a class="schover" href="${path}/navigation/${navigation.navId}/board/${board.boardId}">全部主题</a>
			                <a class="scvote" href="">投票</a>
			            </div>
			        </div>
			        <div class="tsort">
			        	<a id="sosh" href="javascript:;">排序<span>▼</span></a>
			            <div class="allway sosh" style="display:none;">
			            	<a class="schover replytime" href="">回复时间</a>
			                <a class="soreply posttime" href="">发表时间</a>
			            </div>
			        </div>
			        <a class="fcream" href="">精华</a>
			        <a class="fhot" href="">热门</a>
			    </div>
				<#if gtopics??>
					<#list gtopics as g>
						<div id="topic_${g.topicId}" class="topiclist">
					    	<a href="${path}/space/uid/${g.user.userAccess.userId}">
					    		<img alt="头像" src="${g.user.userInfo.userHeadImg}" width="50" height="50" />
					    	</a>
					        <div class="topic">
					        	<a class="board" title="版块" href="${path}/navigation/${g.navId}/board/${g.boardId}" style="background:${g.board.boardColor}">${g.board.boardName}</a>
					            <a class="topictitle addding" title="${g.topicTitle}" href="${path}/board/${g.boardId}/topic/detail/${g.topicId}">${g.topicTitle}</a>
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
					                <a href="" title="最后回复时间"><#if g.topicData.lastestReplyTime??>${g.topicData.lastestReplyTime?substring(0,16)}</#if></a>
					                <a title="帖子创建时间" class="tctime">${g.topicCreateTime?substring(0,10)}</a>
					            </div>
					        </div>
					    </div>
					</#list>
				</#if>
				<#if ltopics??>
					<#list ltopics as l>
						<div id="topic_${l.topicId}" class="topiclist">
					    	<a href="${path}/space/uid/${l.user.userAccess.userId}">
					    		<img alt="头像" src="${l.user.userInfo.userHeadImg}" width="50" height="50" />
					    	</a>
					        <div class="topic">
					        	<a class="board" title="分类" href="${path}/navigation/${l.navId}/board/${l.boardId}/classify/${l.classId}" style="background:${l.classify.classColor}">${l.classify.className}</a>
					            <a class="topictitle addding" title="${l.topicTitle}" href="${path}/board/${l.boardId}/topic/detail/${l.topicId}">${l.topicTitle}</a>
					            <span class="marks">
					                <#if l.topicInfo.topicIsCream == 1>
					            		<a class="jing" title="精华">精</a>
					            	</#if>
					                <a class="ding" title="本版置顶">置顶</a>
					            </span>
					            <div class="tinfo">
					            	<a href="${path}/space/uid/${l.user.userAccess.userId}" title="作者">${l.user.userAccess.userNickname}</a>
					                <a class="liu" title="浏览人数">浏</a>
					                <a>${l.topicData.topicViewCount}</a>
					                <a class="hui"  title="回复人数">回</a>
					                <a>${l.topicData.topicReplyCount}</a>
					                <a title="最后回复">${l.topicData.lastestReplyUser!}</a>
					                <a href="" title="最后回复时间"><#if l.topicData.lastestReplyTime??>${l.topicData.lastestReplyTime?substring(0,16)}</#if></a>
					                <a title="帖子创建时间" class="tctime">${l.topicCreateTime?substring(0,10)}</a>
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
					        	<a class="board" title="分类" href="${path}/navigation/${h.navId}/board/${h.boardId}/classify/${h.classId}" style="background:${h.classify.classColor}">${h.classify.className}</a>
					            <a class="topictitle" title="${h.topicTitle}" href="${path}/board/${h.boardId}/topic/detail/${h.topicId}">${h.topicTitle}</a>
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
					                <a href="" title="最后回复时间"><#if h.topicData.lastestReplyTime??>${h.topicData.lastestReplyTime?substring(0,16)}</#if></a>
					                <a title="帖子创建时间" class="tctime">${h.topicCreateTime?substring(0,10)}</a>
					            </div>
					        </div>
					    </div>
			    	</#list>
			    </#if>
			</div>
			<#include "../common/page.ftl"/>
			<@buildPage page = page/>
		</div>
	    <#include "../common/rightmenu.ftl"/>
	</div>
	<#include "../common/footer.ftl"/>
</body>
</html>
<#assign path="${request.contextPath}">
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<#include "../common/import.ftl"/>
	<title>${topic.topicTitle}</title>
	<link href="${path}/resources/css/thread.css" type="text/css" rel="stylesheet">
	<link href="${path}/resources/css/shCoreDefault.css" type="text/css" rel="stylesheet">
	<script type="text/javascript" src="${path}/resources/js/shCore.js"></script>
	<script type="text/javascript" src="${path}/resources/js/syntaxhighlighter.js"></script>
</head>
<body>
	<#include "../common/header.ftl"/>
	<#include "../common/rightButton.ftl"/>
	<div id="local" class="c1">
		<div class="z">
			<span>当前位置：</span>
			<a class="line" href="${path}">论坛首页</a> <em>></em>
			<a class="line bltd" href="${path}/navigation/${navigation.navId}">${navigation.navName}</a><em>></em> 
			<a class="line bltd" href="${path}/navigation/${navigation.navId}/board/${pboard.boardId}">${pboard.boardName}</a><em>></em>
			<span id="spacelocal"><a class="line bltd" href="${path}/board/${pboard.boardId}/topic/detail/${topic.topicId}">${topic.topicTitle}</a></span>
			<#if topic.topicInfo.topicIsReply == 0>
				<div id="replymenu">
					<a id="quickbtn" href="javascript:;" onclick="window.scrollTo('0',document.body.scrollHeight-600)">回复</a>
				</div>
			</#if>
		</div>
	</div>
	<div id="topicpage">
		<#if page.pageNo == 1>
		    <div id="topiccont">
		        <div class="tleft">
		            <a href="${path}/space/uid/${ui.userAccess.userId}" title="${ui.userAccess.userNickname}" target="_blank" class="authorname" 
		            	style="color:
		            	<#assign n=0/>
		            	<#list ui.roles as role>
		            		<#if n gt 0><#break></#if>
		            		${role.roleColor}
		            		<#assign n=n+1/>
		            	</#list>">${ui.userAccess.userNickname}</a>
		            <a href="${path}/space/uid/${ui.userAccess.userId}" target="_blank">
		            	<img alt="头像" width="100" height="100" src="${ui.userInfo.userHeadImg}"/>
		            </a>
		            <#assign m=0/>
		            <#list ui.roles as role>
		            	<#if m gt 0><#break></#if>
		            	<a href="${path}/home/setting/usergroup"  target="_blank" class="ugp"><span style="color:${role.roleColor}">${role.roleName}</span></a>
		            	<#assign m=m+1/>
		            </#list>
		            <div class="ulevel" style="display:block;">
		                <span><span class="dlev"></span></span>
		                <span class="levelnum">12</span>
		            </div>
		            <ul class="archives">
		                <li>
		                    <a href="${path}/space/uid/${ui.userAccess.userId}/topic" target="_blank">${uv.userTopicCount}</a>
		                    <p>主题</p>
		                </li>
		                <li>
		                    <a href="${path}/space/uid/${ui.userAccess.userId}/reply" target="_blank">${uv.userReplyCount}</a>
		                    <p>回复</p>
		                </li>
		                <li class="noborder">
		                    <a>${uv.userGold}</a>
		                    <p>金币</p>
		                </li>
		            </ul>
		            <#if user??>
		            	<#if user.userAccess.userIsAdmin == 1 || user.userAccess.userIsBoderManager == 1>
		                	<a href="javascript:;" class="nt" onclick="nt(${ui.userAccess.userId})">禁言</a>
		                </#if>
		            	<#if user.userAccess.userId != ui.userAccess.userId>
		            		<a href="javascript:;" class="adf" onclick="friends(${ui.userAccess.userId}, '${ui.userAccess.userNickname}')">加好友</a>
	            			<a href="javascript:;" class="spm">发私信</a>
		            	</#if>
		            <#else>
		            	<a href="javascript:;" class="adf" onclick="friends(${ui.userAccess.userId}, '${ui.userAccess.userNickname}')">加好友</a>
	            		<a href="javascript:;" class="spm">发私信</a>
		            </#if>
	        	</div>
	        	<div class="tright">
		            <div class="ttitle">
		                <h2>
		                    <a href="${path}/navigation/${navigation.navId}/board/${pboard.boardId}/classify/${clas.classId}" title="${clas.className}" style="color:#19b4ea">[${clas.className}]</a> 
		                    <a>${topic.topicTitle}</a>
		                </h2>
		                <div class="tmenu">
		                    <a class="liu" title="浏览人数">浏</a>
		                    <a>${topic.topicData.topicViewCount}</a>
		                    <a class="hui" title="回复人数">回</a>
		                    <a>${topic.topicData.topicReplyCount}</a>
		                    <a title="创建时间">${topic.topicCreateTime}</a>
		                    <#if sort == 0>
		                    	<a href="${path}/board/${pboard.boardId}/topic/detail/${topic.topicId}?sort=1&page=1" title="倒序浏览">倒序浏览</a>
		                    <#else>
		                    	<a href="${path}/board/${pboard.boardId}/topic/detail/${topic.topicId}?sort=0&page=1" title="正序浏览">正序浏览</a>
		                    </#if>
		                    <a href="${path}/board/${pboard.boardId}/topic/detail/${topic.topicId}?uid=${ui.userAccess.userId}&page=1" title="只看作者">只看作者</a>
		                    <input type="text" id="floor"/>
		                    <a id="gofloor" href="javascript:;" title="跳转楼层" class="gofloor" onclick="gofloor(${page.totalPage}, ${page.totalRecord}, ${page.pageSize}, $('#floor').val());">Go</a>
		                    <span>楼主</span>
		                </div>
		            </div>
		            <div class="tcontent">
		                <#noescape>${topic.topicContent}</#noescape>
		                <#if topic.topicData.topicUpdateTime??>
		                	<div class="edit-info">
		                		由<a href="${path}/space/uid/${topic.topicData.topicUpdateUserId}" target="_blank">${topic.topicData.topicUpdateUser}</a>
		                		编辑于${topic.topicData.topicUpdateTime?substring(0, 16)}
		                	</div>
		                </#if>
		            </div>
	            	<div class="tbmenu">
	            		<#include "topicManage.ftl"/>
		            	<#if user??>
		            		<#if user.userAccess.userIsAdmin == 1 || (user.userAccess.userIsBoderManager == 1 && localbmc == 1) || user.userAccess.userId == ui.userAccess.userId>
		                		<a href="${path}/board/${pboard.boardId}/topic/detail/${topic.topicId}/update" id="">编辑</a>
		                	</#if>
		                </#if>
		                <#if topic.topicInfo.topicIsReply == 0>
		                	<a href="javascript:;" id="" onclick="window.scrollTo('0',document.body.scrollHeight-600)">回复</a>
		                </#if>
		                <a href="javascript:;" onclick="favorite(${pboard.boardId}, ${topic.topicId}, '${topic.topicTitle}', 'topic');">收藏</a>
		                <a href="javascript:;" id="" onclick="report(${ui.userAccess.userId}, ${topic.topicId}, 0, 0);">举报</a>
		            </div>
		        </div>
		    </div>
		</#if>
	    <#if replies??>
	    	<#if sort == 0>
	    		<#assign floor = page.pageSize * (page.pageNo - 1) + 1/>
	    	<#else>
	    		<#assign floor = page.totalRecord - page.pageSize * (page.pageNo - 1)/>
	    	</#if>
	    	<#list replies as reply>
	    		<div id="reply_${reply.replyId}" class="replylist">
			        <div class="tleft">
			            <a href="${path}/space/uid/${reply.user.userAccess.userId}" title="${reply.user.userAccess.userNickname}" target="_blank" class="authorname" 
			            	style="color:
			            	<#assign n=0/>
	            			<#list reply.user.roles as role>
	            				<#if n gt 0><#break></#if>
	            					${role.roleColor}
	            					<#assign n=n+1/>
	            			</#list>">
	            			${reply.user.userAccess.userNickname}
	            		</a>
			            <a href="${path}/space/uid/${reply.user.userAccess.userId}" target="_blank">
			            	<img alt="头像" width="100" height="100" src="${reply.user.userInfo.userHeadImg}"/>
			            </a>
			            <#assign m=0/>
			            <#list reply.user.roles as role>
			            	<#if m gt 0><#break></#if>
			            	<a href="${path}/home/setting/usergroup"  target="_blank" class="ugp"><span style="color:${role.roleColor}">${role.roleName}</span></a>
			            	<#assign m=m+1/>
			            </#list>
			            <div class="ulevel" style="display:block;">
			                <span><span class="dlev"></span></span>
			                <span class="levelnum">12</span>
			            </div>
			            <ul class="archives">
			                <li>
			                    <a href="${path}/space/uid/${reply.user.userAccess.userId}/topic" target="_blank">${reply.userValue.userTopicCount}</a>
			                    <p>主题</p>
			                </li>
			                <li>
			                    <a href="${path}/space/uid/${reply.user.userAccess.userId}/reply" target="_blank">${reply.userValue.userReplyCount}</a>
			                    <p>回复</p>
			                </li>
			                <li class="noborder">
			                    <a>${reply.userValue.userGold}</a>
			                    <p>金币</p>
			                </li>
			            </ul>
			            <#if user??>
			            	<#if user.userAccess.userIsAdmin == 1 || user.userAccess.userIsBoderManager == 1>
			                	<a href="javascript:;" class="nt" onclick="nt(${reply.user.userAccess.userId})">禁言</a>
			                </#if>
			            	<#if user.userAccess.userId != reply.user.userAccess.userId>
			            		<a href="javascript:;" class="adf" onclick="friends(${reply.user.userAccess.userId}, '${reply.user.userAccess.userNickname}')">加好友</a>
		            			<a href="javascript:;" class="spm">发私信</a>
			            	</#if>
			            <#else>
			            	<a href="javascript:;" class="adf" onclick="friends(${reply.user.userAccess.userId}, '${reply.user.userAccess.userNickname}')">加好友</a>
		            		<a href="javascript:;" class="spm">发私信</a>
			            </#if>
			        </div>
			        <div class="tright">
			            <div class="ttitle">
			                <div class="tmenu">
			                    <a class="createreplytime" title="创建时间">${reply.replyCreateTime}</a>
			                    <a href="${path}/board/${pboard.boardId}/topic/detail/${topic.topicId}?uid=${reply.user.userAccess.userId}&page=1" title="只看作者">只看作者</a>
			                    <span id="floor_${floor}">
			                    	<#if floor == 1>
			                    		沙发
			                    	<#elseif floor == 2>
			                    		板凳
			                    	<#elseif floor == 3>
			                    		地板
			                    	<#else>
			                    		${floor} 楼
			                    	</#if>
			                    </span>
			                </div>
			            </div>
			            <div class="tcontent">
			            	<#if reply.reply??>
			            		<blockquote>
			            			<a href="">
			            				${reply.reply.user.userAccess.userNickname}于${reply.reply.replyCreateTime} 
			            				发表回复:
			            			</a><br>
			            			<p><#noescape>${reply.reply.replyContent}</#noescape></p>
			            		</blockquote>
			            	</#if>
			               <#noescape>${reply.replyContent}</#noescape>
			            </div>
			            <div class="tbmenu">
			            	<#if user??>
			            		<#if user.userAccess.userIsAdmin == 1 || (user.userAccess.userIsBoderManager == 1 && localbmc == 1)|| user.userAccess.userId == reply.user.userAccess.userId>
			                		<a href="${path}/board/${reply.boardId}/topic/${reply.topicId}/reply/${reply.replyId}/update" id="">编辑</a>
			                	</#if>
            					<#if user.userAccess.userIsAdmin == 1 || (user.userAccess.userIsBoderManager == 1 && localbmc == 1)>
				            		<a href="" id="">删除</a>
			            		</#if>
			            	</#if>
			            	<#if reply.replyStatus == 0 && reply.replyIsCheck == 1 && reply.user.userAccess.userIsDelete == 0 && reply.user.userAccess.userIsLocked == 0>
			                	<a class="sonreply" href="javascript:;" onclick="sReply(${reply.replyId}, ${reply.topicId});" id="reply_${reply.replyId}">回复</a>
			                	<a href="javascript:;" id="" onclick="report(${reply.user.userAccess.userId}, ${topic.topicId}, ${reply.replyId}, ${floor});">举报</a>
			                </#if>
			            </div>
			        </div>
			    </div>
			    <#if sort == 0>
			    	<#assign floor = floor + 1/>
			    <#else>
			    	<#assign floor = floor - 1/>
			    </#if>
	    	</#list>
	    </#if>
	    <div id="sonreplyeditor"></div>
	    <!-- tip -->
	</div>
	<#include "../common/page.ftl"/>
	<@buildPage page = page/>
	<div class="bbs-report" style="display:none;z-index: 999;"></div>
	<#if topic.topicInfo.topicIsReply == 0>
	    <div id="replyecont">
	    	<#if user??>
		    	<div class="info">
		    		<img alt="头像" width="120" height="120" src="${user.userInfo.userHeadImg}"/><br/>
		    		<#assign q=0/>
		    		<#list user.roles as role>
		            	<#if q gt 0><#break></#if>
		            	<a class="name" style="color:${role.roleColor}">${user.userAccess.userNickname}</a>
		            	<a style="color:${role.roleColor}">${role.roleName}</a>
		            	<#assign q=q+1/>
		            </#list>
		    	</div>
	    	</#if>
	    	<form id="replyform" action="${path}/board/${pboard.boardId}/topic/${topic.topicId}/new/reply/do" method="post">
	    		<script type="text/javascript">
		    		$(function () {
					    CKEDITOR.replace('replyeditor', { toolbar: 'reply', height: '240px', width: '760px', resize_enabled: false, removePlugins: 'elementspath'});
					});
	    		</script>
	    		<textarea id="replyeditor" name="rcontext" rows="12" cols="93"></textarea>
	    		<#if user??>
	    			<input type="hidden" name="uid" id="uid" value="${user.userAccess.userId}">
					<input type="hidden" name="tid" id="tid" value="${topic.topicId}">
					<input type="hidden" name="bid" id="bid" value="${pboard.boardId}">
					<input type="hidden" name="gid" id="gid" value="${navigation.navId}">
					<input type="hidden" name="cid" id="cid" value="${clas.classId}">
					<button id="replybutton">回复</button>
				<#else>
					<script type="text/javascript">
						$(document).ready(function(){
							$('#topdiv').css('top',$('#replyeditor').offset().top + 'px');
							$('#nowlogin').attr('href','${path}/account/login?backurl=' + encodeURIComponent(window.location.href));
						});
					</script>
					<div id="topdiv">
						<div class="contenttip">
							<p>你还没有登录，不可以发表回复</p>
							<a id="nowlogin" href="${path}/account/login">登录</a>  |
							<a href="${path}/account/register">注册</a>
						</div>
					</div>
				</#if>
	    	</form>
	    </div>
	</#if>
	<#include "../common/footer.ftl"/>
</body>
<script type="text/javascript" src="${path}/resources/static/ckeditor4/ckeditor.js"></script>
<script type="text/javascript" src="${path}/resources/js/thread.js"></script>
</html>
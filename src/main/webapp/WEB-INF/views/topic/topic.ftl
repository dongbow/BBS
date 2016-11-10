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
			<span id="spacelocal">${topic.topicTitle}</span>
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
		                    <a href="" title="${clas.className}" style="color:#19b4ea">[${clas.className}]</a> 
		                    <a>${topic.topicTitle}</a>
		                </h2>
		                <div class="tmenu">
		                    <a class="liu" title="浏览人数">浏</a>
		                    <a>${topic.topicData.topicViewCount}</a>
		                    <a class="hui" title="回复人数">回</a>
		                    <a>${topic.topicData.topicReplyCount}</a>
		                    <a title="创建时间">${topic.topicCreateTime}</a>
		                    <a href="" title="倒序浏览">倒序浏览</a>
		                    <a href="" title="只看作者">只看作者</a>
		                    <input type="text" id="floor"/>
		                    <a id="gofloor" href="" title="跳转楼层" class="gofloor">Go</a>
		                    <span>楼主</span>
		                </div>
		            </div>
		            <div class="tcontent">
		                <#noescape>${topic.topicContent}</#noescape>
		            </div>
	            	<div class="tbmenu">
	            		<#if user??>
	            			<#if user.userAccess.userIsAdmin == 1 || user.userAccess.userIsBoderManager == 1>
	            				<script type="text/javascript">
		            				$(function(){
		            					$('.system_option').css({
		            						'top' : $('#a_system').offset().top - 320 + 'px',
		            						'left': $('#a_system').offset().left - 63 + 'px'
		            					});
		            					
		            					$('#a_system').mouseover(function(){
		            						$('.system_option').show();
		            					});
		            					
		            					$('#a_system').mouseout(function(){
		            						$('.system_option').hide();
		            					});
		            					
		            					$('.system_option').mouseover(function(){
		            						$('.system_option').show();
		            					});
		            					
		            					$('.system_option').mouseout(function(){
		            						$('.system_option').hide();
		            					});
		            				});
		            			</script>
	            				<div class="system_option">
			            			<ul>
			            				<li><a href="">本版置顶</a></li>
			            				<#if user.userAccess.userIsAdmin == 1>
				            				<li><a href="">全局置顶</a></li>
				            				<li><a href="">推送首页</a></li>
				            			</#if>
			            				<li><a href="">关闭回复</a></li>
			            				<li><a href="">打开回复</a></li>
			            				<li><a href="">加精</a></li>
			            				<li><a href="">移动</a></li>
			            				<li><a href="">删除</a></li>
			            			</ul>
		            			</div>
		            			<a href="javascript:;" id="a_system">管理选项</a>
	            			</#if>
	            		</#if>
		            	<#if user??>
		            		<#if user.userAccess.userIsAdmin == 1 || user.userAccess.userIsBoderManager == 1 || user.userAccess.userId == ui.userAccess.userId>
		                		<a href="" id="">编辑</a>
		                	</#if>
		                </#if>
		                <#if topic.topicInfo.topicIsReply == 0>
		                	<a href="javascript:;" id="" onclick="window.scrollTo('0',document.body.scrollHeight-600)">回复</a>
		                </#if>
		                <a href="javascript:;" onclick="favorite(${pboard.boardId}, ${topic.topicId}, '${topic.topicTitle}', 'topic');">收藏</a>
		                <#if topic.topicInfo.topicIsReply == 0>
		                	<a href="javascript:;" id="">举报</a>
		                </#if>
		            </div>
		        </div>
		    </div>
		</#if>
	    <#if replies??>
	    	<#assign floor = page.pageSize * (page.pageNo - 1) + 1/>
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
			                    <a href="" title="倒序浏览">倒序浏览</a>
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
			            		<#if user.userAccess.userIsAdmin == 1 || user.userAccess.userIsBoderManager == 1 || user.userAccess.userId == ui.userAccess.userId>
			                		<a href="" id="">编辑</a>
			                	</#if>
            					<#if user.userAccess.userIsAdmin == 1 || user.userAccess.userIsBoderManager == 1>
				            		<a href="" id="">删除</a>
			            		</#if>
			            	</#if>
			            	<#if reply.replyStatus == 0 && reply.replyIsCheck == 1 && reply.user.userAccess.userIsDelete == 0 && reply.user.userAccess.userIsLocked == 0>
			                	<a class="sonreply" href="javascript:;" onclick="sReply(${reply.replyId}, ${reply.topicId});" id="reply_${reply.replyId}">回复</a>
			                	<a href="javascript:;" id="">举报</a>
			                </#if>
			            </div>
			        </div>
			    </div>
			    <#assign floor = floor + 1/>
	    	</#list>
	    </#if>
	    <div id="sonreplyeditor"></div>
	    <!-- tip -->
	</div>
	<#include "../common/page.ftl"/>
	<@buildPage page = page/>
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
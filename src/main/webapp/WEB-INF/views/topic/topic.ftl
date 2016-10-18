<#assign path="${request.contextPath}">
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<#include "../common/import.ftl"/>
	<title>${topic.topicTitle}</title>
	<link href="${path}/resources/css/thread.css" type="text/css" rel="stylesheet">
	<link href="${path}/resources/css/shCoreDefault.css" type="text/css" rel="stylesheet">
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
			<div id="replymenu">
				<a id="quickbtn" href="javascript:;" onclick="window.scrollTo('0',document.body.scrollHeight-600)">回复</a>
			</div>
		</div>
	</div>
	<div id="topicpage">
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
	            	<img alt="头像" width="100" height="100" src="${path}${ui.userInfo.userHeadImg}"/>
	            </a>
	            <#assign m=0/>
	            <#list ui.roles as role>
	            	<#if m gt 0><#break></#if>
	            	<a href="home.htm?md=space&type=profile&ac=usergroup"  target="_blank" class="ugp"><span style="color:${role.roleColor}">${role.roleName}</span></a>
	            	<#assign m=m+1/>
	            </#list>
	            <div class="ulevel" style="display:block;">
	                <span><span class="dlev"></span></span>
	                <span class="levelnum">12</span>
	            </div>
	            <ul class="archives">
	                <li>
	                    <a href="space.htm?md=space&type=topic&uid=${ui.userAccess.userId}&view=me" target="_blank">${uv.userTopicCount}</a>
	                    <p>主题</p>
	                </li>
	                <li>
	                    <a href="space.htm?md=space&type=reply&uid=${ui.userAccess.userId}&view=me" target="_blank">${uv.userReplyCount}</a>
	                    <p>回复</p>
	                </li>
	                <li class="noborder">
	                    <a>${uv.userGold}</a>
	                    <p>金币</p>
	                </li>
	            </ul>
            	<a href="javascript:;" class="adf">加好友</a>
            	<a href="javascript:;" class="spm">发私信</a>
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
	                <a href="javascript:;" id="" onclick="window.scrollTo('0',document.body.scrollHeight-600)">回复</a>
	                <a href="javascript:;" id="">收藏</a>
	                <a href="javascript:;" id="">举报</a>
	            </div>
	        </div>
	    </div>
	    <#-- 
	    <c:forEach items="${replyList}" var="Reply">
		    <div id="replylist_${Reply.rid}">
		        <div class="tleft">
		            <a href="space-uid-${Reply.user.user_id}.html" title="${Reply.user.nickName}" target="_blank" class="authorname" style="color:red">${Reply.user.nickName}</a>
		            <a href="space-uid-${Reply.user.user_id}.html" target="_blank"><img alt="头像" width="100" height="100" src="<%=basePath%>${Reply.user.userheaderimg}"/></a>
		            <a href="home.htm?md=space&type=profile&ac=usergroup" target="_blank" class="ugp"><span style="color:red">管理员</span></a>
		            <div class="ulevel" style="display:block;">
		                <span><span class="dlev"></span></span>
		                <span class="levelnum">12</span>
		            </div>
		            <ul class="archives">
		                <li>
		                    <a href="space.htm?md=space&type=topic&uid=${Reply.user.user_id}&view=me" target="_blank">${Reply.user.topiccount}</a>
		                    <p>主题</p>
		                </li>
		                <li>
		                    <a href="space.htm?md=space&type=reply&uid=${Reply.user.user_id}&view=me" target="_blank">${Reply.user.replycount}</a>
		                    <p>回复</p>
		                </li>
		                <li class="noborder">
		                    <a>${Reply.user.goldcount}</a>
		                    <p>金币</p>
		                </li>
		            </ul>
		            <a href="javascript:;" class="adf">加好友</a>
		            <a href="javascript:;" class="spm">发私信</a>
		        </div>
		        <div class="tright">
		            <div class="ttitle">
		                <div class="tmenu">
		                    <a class="createreplytime" title="创建时间"><fmt:formatDate value="${Reply.rcreatetime}" pattern="yyyy-MM-dd HH:mm:ss"/></a>
		                    <a href="" title="倒序浏览">倒序浏览</a>
		                    <span>沙发</span>
		                </div>
		            </div>
		            <div class="tcontent">
		            	<c:if test="${Reply.fatherReply.rid!=null}">
		            		<blockquote>
		            			<a href="">${Reply.fatherReply.user.nickName} 
		            				于<fmt:formatDate value="${Reply.fatherReply.rcreatetime}" pattern="yyyy-MM-dd HH:mm:ss"/> 
		            				发表回复:</a><br>
		            			<p>${Reply.fatherReply.rcontext}</p>
		            		</blockquote>
		            	</c:if>
		               ${Reply.rcontext }
		            </div>
		            <div class="tbmenu">
		            	<c:if test="${user.user_group<4}">
		            		<a href="" id="">删除</a>
		            		<a href="" id="">编辑</a>
		            	</c:if>
		                <a class="sonreply" href="javascript:;" id="r_${Reply.rid}_t_${Reply.topic.tid}">回复</a>
		                <a href="javascript:;" id="">举报</a>
		            </div>
		        </div>
		    </div>
	    </c:forEach>
	    -->
	    <!-- tip -->
		<#if user??>
			<script type="text/javascript">
				$(function(){
					$('.sonreply').click(function(){
						sonreply(this);
					});
				});
			</script>
		</#if>
		<div id="sonreplyeditor">
			<div class="popreplycont"></div>
		</div>
	</div>
	<#include "../common/page.ftl"/>
	<#-- <@buildPage page = page/> -->
    <div id="replyecont">
    	<#if user??>
	    	<div class="info">
	    		<img alt="头像" width="120" height="120" src="${path}${user.userInfo.userHeadImg}"/><br/>
	    		<a class="name">${user.userAccess.userNickname}</a>
	    		<#assign q=0/>
	    		<#list user.roles as role>
	            	<#if q gt 0><#break></#if>
	            	<a style="color:${role.roleColor}">${role.roleName}</a>
	            	<#assign q=q+1/>
	            </#list>
	    	</div>
    	</#if>
    	<form id="replyform" action="reply_post.htm" method="post">
    		<script type="text/javascript">
	    		$(function () {
				    CKEDITOR.replace('replyeditor', { toolbar: 'reply', height: '240px', width: '760px', resize_enabled: false, removePlugins: 'elementspath'});
				});
    		</script>
    		<textarea id="replyeditor" name="rcontext" rows="12" cols="93"></textarea>
    		<#if user??>
    			<input type="hidden" name="uid" value="${user.userAccess.userId}">
    			<input type="hidden" name="tid" value="${topic.topicId}">
    			<input type="hidden" name="bid" value="${pboard.boardId}">
    			<input type="hidden" name="gid" value="${navigation.navId}">
    			<input type="hidden" name="cid" value="${clas.classId}">
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
	<#include "../common/footer.ftl"/>
	<script type="text/javascript" src="${path}/resources/js/shCore.js"></script>
	<script type="text/javascript" src="${path}/resources/js/syntaxhighlighter.js"></script>
	<script type="text/javascript" src="${path}/resources/static/ckeditor4/ckeditor.js"></script>
	<script type="text/javascript" src="${path}/resources/js/thread.js"></script>
</body>
</html>
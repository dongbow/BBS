<#assign path="${request.contextPath}">
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<#include "../common/import.ftl"/>
	<title>发帖</title>
	<link type="text/css" rel="stylesheet" href="${path}/resources/css/post.css">
	<link type="text/css" rel="stylesheet" href="${path}/resources/css/shCoreDefault.css">
	<link type="text/css" rel="stylesheet" href="${path}/resources/css/style_common.css">
</head>
<body>
	<#include "../common/header.ftl"/>
	<#if user??>
		<div id="local" class="c1">
			<div class="z">
				<span>当前位置：</span><a class="line" href="${path}">论坛首页</a> <em>></em>
				<a class="line bltd" href="${path}/navigation/${pnav.navId}">${pnav.navName}</a><em>></em> 
				<a class="line bltd" href="${path}/navigation/${pnav.navId}/board/${pboard.boardId}">${pboard.boardName}</a><em>></em>
				<span class="ltd">发帖</span>
			</div>
		</div>
		<div id="ftopic_editor">
	    	<div class="top_bar">
	    		<a class="fbar" href="${path}/post/new/topic/${pboard.boardId}" style="color:#19b4ea">发表帖子</a>
	        	<a class="vote" href="${path}/post/new/vote/${pboard.boardId}">发起投票</a>
	        </div>
	        <form action="" method="post">
		      	<div id="topic_title">
		      		<select id="s1" name="cid">
		      			<option>选择分类</option>
		      			<#list classifies as class>
			      			<option value="${class.classId}">${class.className}</option>
		      			</#list>
		            </select>
		            <input id="topic_title_text" name="ttitle" type="text" maxlength="32"/>
		            <b>还可以输入<span id="e_num">32</span>个字符</b>
		        </div>
				<textarea id="editor" name="tcontent" rows="10" cols="1"></textarea>
		        <input type="hidden" name="uid" value="${user.userAccess.userId}">
		        <input type="hidden" name="bid" value="${pboard.boardId}">
		        <input type="hidden" name="gid" value="${pnav.navId}">
		        <br/>
		        <div id="edtiortoolbar">
		        	<#if user.userAccess.userIsAdmin == 1 || user.userAccess.userIsBoderManager == 1>
		        		<style type="text/css">
		        			#btns button{margin-top:20px;}
		        		</style>
		        		<span><input type="checkbox" name="isreply" value="0">是否可以回复</span>
			        	<span><input type="checkbox" name="iselite" value="0">是否加精</span>
			        	<span><input type="checkbox" name="istop" value="0">是否置顶</span>
			        	<#if user.userAccess.userIsAdmin == 1>
			        		<span><input type="checkbox" name="isglobaltop" value="0">是否全局置顶</span>
			        		<span><input type="checkbox" name="ishome" value="0">是否推送首页</span>
			        	</#if>
		        	</#if>
		        	<a class="editorclear" href="javascript:;">清空编辑器</a>
		        	<a class="checklength" href="javascript:;">字数检查</a>
		        </div>
		        <div id="bg"></div>
		        <!-- tip -->
		        <div id="btns">
		        	<button onclick="">发表帖子</button>
		        </div>
	        </form>
	    </div>
	</#if>
    <#include "../common/footer.ftl"/>
    <script type="text/javascript" src="${path}/resources/js/shCore.js"></script>
	<script type="text/javascript" src="${path}/resources/js/syntaxhighlighter.js"></script>
	<script type="text/javascript" src="${path}/resources/js/post.js"></script>
	<script type="text/javascript" src="${path}/resources/static/ckeditor4/ckeditor.js"></script>
    <script type="text/javascript">
	    $(function () {
			CKEDITOR.replace('editor',{ 
		    	toolbar: 'full', 
		    	height: '345px', 
		    	width: '960px', 
		    	removePlugins: 'elementspath',
		   		resize_enabled: false 
		   	});
		});
    </script>
</body>
</html>
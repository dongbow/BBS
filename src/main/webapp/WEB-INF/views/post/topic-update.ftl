<#assign path="${request.contextPath}">
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<#include "../common/import.ftl"/>
	<title>编辑</title>
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
				<a class="line bltd" href="${path}/navigation/${navigation.navId}">${navigation.navName}</a><em>></em> 
				<a class="line bltd" href="${path}/navigation/${navigation.navId}/board/${pboard.boardId}">${pboard.boardName}</a><em>></em>
				<a class="line bltd" href="${path}/board/${pboard.boardId}/topic/detail/${topic.topicId}">${topic.topicTitle}</a><em>></em>
				<span class="ltd">编辑</span>
			</div>
		</div>
		<div id="ftopic_editor">
	        <form action="${path}/board/${pboard.boardId}/topic/update" method="post" id="postForm" onsubmit="return validate();">
		      	<div id="topic_title" style="margin-top: 20px;">
		      		<select id="s1" name="cid">
		      			<option value="${clas.classId}">${clas.className}</option>
		            </select>
		            <input id="topic_title_text" name="ttitle" type="text" maxlength="32" value="${topic.topicTitle}"/>
		            <b>还可以输入<span id="e_num">${32 - topic.topicTitle?length}</span>个字符</b>
		        </div>
				<textarea id="editor" name="tcontent" rows="10" cols="1">
					<#noescape>${topic.topicContent}</#noescape>
				</textarea>
		        <br/>
		        <div id="edtiortoolbar">
		        	<#if user.userAccess.userIsAdmin == 1 || (user.userAccess.userIsBoderManager == 1 && localbmc == 1)>
		        		<style type="text/css">
		        			#btns button{margin-top:20px;}
		        		</style>
		        		<span>
		        			<input type="checkbox" class="checkbox" name="isreply" <#if topic.topicInfo.topicIsReply == 1>value="1" checked<#else>value="0"</#if>>
		        			是否关闭回复
		        		</span>
			        	<span><input type="checkbox" class="checkbox" name="iselite" <#if topic.topicInfo.topicIsCream == 1>value="1" checked<#else>value="0"</#if>>是否加精</span>
			        	<span><input type="checkbox" class="checkbox" name="istop" <#if topic.topicInfo.topicIsLocalTop == 1>value="1" checked<#else>value="0"</#if>>是否置顶</span>
			        	<#if user.userAccess.userIsAdmin == 1>
			        		<span><input type="checkbox" class="checkbox" name="isglobaltop" <#if topic.topicInfo.topicIsHome == 1>value="1" checked<#else>value="0"</#if>>是否全局置顶</span>
			        		<span><input type="checkbox" class="checkbox" name="ishome" <#if topic.topicInfo.topicIsCream == 1>value="1" checked<#else>value="0"</#if>>是否推送首页</span>
			        	</#if>
		        	</#if>
		        	<input type="hidden" name="bid" value="${pboard.boardId}">
		        	<input type="hidden" name="tid" value="${topic.topicId}">
		        	<input type="hidden" name="uid" value="${topic.userId}">
		        	<a class="editorclear" href="javascript:;">清空编辑器</a>
		        	<a class="checklength" href="javascript:;">字数检查</a>
		        </div>
		        <div class="bbs-upload">
		        	<div class="file-btns">
		        		<a class="btn image-btn" href="javascript:;">上传图片</a>
		        		<input name="images" id="images" multiple="multiple" accept="image/*" type="file" style="display:none">
		        		<a class="btn file-btn" href="javascript:;">上传附件</a>
		        		<input name="files" id="files" multiple="multiple" type="file" style="display:none">
		        		<button>保存帖子</button>
		        	</div>
		        	<div class="upload-desc">
		        		<p>图片只支持jpg|jpeg|png|gif|bmp，大小5M以内</p>
		        		<p>附件支持exe|zip|rar|msi|png|jpg|jpeg|gif|bmp|doc|docx|xls|xlsx|ppt|pptx|txt|jar|md|sql|java|pdf|psd，大小50M以内</p>
		        	</div>
		        	<div class="image-cont" style=""></div>
		        	<div class="file-cont" style=""></div>
		        </div>
		        <div id="bg"></div>
		        <div id="bbs-dialog" style="display:none">
					<!-- dialog -->
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
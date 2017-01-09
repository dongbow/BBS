<#assign path="${request.contextPath}">
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<#include "../common/import.ftl"/>
	<title>回复编辑</title>
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
				<a class="line bltd" href="${path}/board/${pboard.boardId}/topic/detail/${reply.topic.topicId}">${reply.topic.topicTitle}</a><em>></em>
				<span class="ltd">回复编辑</span>
			</div>
		</div>
		<div id="ftopic_editor">
	        <form action="${path}/board/${pboard.boardId}/reply/update" method="post" id="postForm" onsubmit="return validate();" style="padding-top:20px">
				<textarea id="editor" name="tcontent" rows="10" cols="1">
					<#noescape>${reply.replyContent}</#noescape>
				</textarea>
		        <br/>
		        <div id="edtiortoolbar">
		        	<input type="hidden" name="rid" value="${reply.replyId}">
		        	<a class="editorclear" href="javascript:;">清空编辑器</a>
		        	<a class="checklength" href="javascript:;">字数检查</a>
		        </div>
		        <div class="bbs-upload">
		        	<div class="file-btns">
		        		<a class="btn file-btn" href="javascript:;">上传附件</a>
		        		<button>发表帖子</button>
		        	</div>
		        	<div class="upload-desc">
		        		<p>附件支持exe|zip|rar|msi|png|jpg|jpeg|gif|bmp|doc|docx|xls|xlsx|ppt|pptx|txt|jar|md|sql|java|pdf|psd，大小50M以内</p>
		        	</div>
		        	<div id="image-cont" style="display:none"></div>
		        	<div class="file-cont" style="display:none">
		        		<p>附件列表:
		        			<a class="file-btn-pre delete delete-all" href="javascript:;">全部删除</a>
						    <a class="file-btn-pre upload upload-all" href="javascript:;">全部上传</a>
		        		</p>
		        		<ul class="file-list">
					  	</ul>
		        	</div>
		        </div>
		        <div id="bg"></div>
		        <div id="bbs-dialog" style="display:none">
					<!-- dialog -->
				</div>
	        </form>
	        <form method="post" id="upload-form" enctype="multipart/form-data" action="${path}/upload/file" style="display:none">
    			<input name="files" id="files" multiple="multiple" type="file" style="display:none" onchange="showFiles(this)">
    		</form>
	    </div>
	</#if>
    <#include "../common/footer.ftl"/>
     <script type="text/javascript" src="${path}/resources/js/jquery/jquery.form.js"></script>
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
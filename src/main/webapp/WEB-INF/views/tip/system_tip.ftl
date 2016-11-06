<#assign path="${request.contextPath}">
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<#include "../common/import.ftl"/>
	<title>系统提示</title>
	<link type="text/css" rel="stylesheet" href="${path}/resources/css/common_tip.css"/>
</head>
<body>
	<#include "../common/header.ftl"/>
	<div id="fm">
		<div id="checktip" style="width:400px;height:150px;">
		    <div class="tipcont">
		        <div class="tiptitle">
		        	<a class="titlename">系统提示</a>
		        </div>
		     	<p class="context">
		     		<#if tip == 'nologin'>
			     		你还没有登录，请先登录<br/>
			     		<a class="dialog_login_btn" href="${path}/account/login?backurl=${back}">登录 | </a>
			     		<a href="${path}/account/register">注册</a>
		     		</#if>
		     		<#if tip == 'noauth'>
			     		抱歉，你没有权限执行此操作<br/>
			     		<a href="${path}">返回首页</a>
		     		</#if>
		     		<#if tip == 'board-noauth'>
			     		抱歉，你没有权限访问本版块<br/>
			     		<a class="goback" href="javascript:;">返回上一页</a>
		     		</#if>
		     		<#if tip == 'topic-noauth'>
			     		抱歉，你没有权限访问本帖子<br/>
			     		<a class="goback" href="javascript:;">返回上一页</a>
		     		</#if>
		     		<#if tip == 'post-noauth'>
			     		抱歉，你没有权限在此版块发帖<br/>
			     		<a class="goback" href="javascript:;">返回上一页</a>
		     		</#if>
		     		<#if tip == 'class-noauth'>
			     		抱歉，你没有权限在此分类下发帖<br/>
			     		<a class="goback" href="javascript:;">返回上一页</a>
		     		</#if>
		     		<#if tip == 'nav-notexists'>
			     		抱歉，导航不存在<br/>
			     		<a class="goback" href="javascript:;">返回上一页</a>
		     		</#if>
		     		<#if tip == 'board-notexists'>
			     		抱歉，版块不存在<br/>
			     		<a class="goback" href="javascript:;">返回上一页</a>
		     		</#if>
		     		<#if tip == 'topic-notexists'>
			     		抱歉，帖子不存在<br/>
			     		<a class="goback" href="javascript:;">返回上一页</a>
		     		</#if>
		     		<#if tip == 'class-notexists'>
			     		抱歉，分类不存在<br/>
			     		<a class="goback" href="javascript:;">返回上一页</a>
		     		</#if>
		     		<#if tip == 'space-notexists'>
			     		抱歉，空间不存在<br/>
			     		<a class="goback" href="javascript:;">返回上一页</a>
		     		</#if>
		     		<#if tip == 'post-fail'>
			     		抱歉，帖子发表失败<br/>
			     		<a class="goback" href="javascript:;">返回上一页</a>
		     		</#if>
		     		<#if tip == 'reply-fail'>
			     		抱歉，回复失败<br/>
			     		<a class="goback" href="javascript:;">返回上一页</a>
		     		</#if>
		     		<#if tip == 'reply-noauth'>
			     		抱歉，没有权限回复该贴<br/>
			     		<a class="goback" href="javascript:;">返回上一页</a>
		     		</#if>
		     		<#if tip == 'reply-notreply'>
			     		抱歉，该贴禁止回复<br/>
			     		<a class="goback" href="javascript:;">返回上一页</a>
		     		</#if>
		     		<#if tip == 'forget-error'>
			     		抱歉，链接错误<br/>
			     		<a href="${path}/account/forget">返回重试</a>
		     		</#if>
		     		<#if tip == 'forget-time'>
			     		抱歉，链接已失效<br/>
			     		<a href="${path}/account/forget">返回重试</a>
		     		</#if>
		     	</p>
		    </div>
		</div>
	</div>
	<script type="text/javascript">
		$(function(){
			$('#checktip').css({
				'top': ($(window).height() - $('#checktip').height())/2 + 'px',
				'left': ($(window).width() - $('#checktip').width())/2 + 'px'
			});
			$('.goback').click(function(){
				history.go(-1);
			});
		});
	</script>
	<#include "../common/footer.ftl"/>
</body>
</html>
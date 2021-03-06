<#assign path="${request.contextPath}">
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<#include "../common/import.ftl"/>
	<title>消息通知</title>
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/home.css">
</head>
<body>
	<#include "../common/header.ftl"/>
	<#include "../common/rightButton.ftl"/>
	<div id="homemaincont">
		<div id="local" class="c1">
			<div class="z">
				<span>当前位置：</span><a class="line" href="${path}">论坛首页</a> <em>></em>
				<a class="line bltd" href="${path}/home/message/list">消息</a> <em>></em> 
				<span class="ltd">消息通知</span>
			</div>
		</div>
		<div id="ct" class="setitem">
			<div id="homeleftmenu">
				<div class="chleft">
					<h2>消息</h2>
				</div>
				<ul id="homeitems">
					<li class="hp hover"><a href="${path}/home/message/list">消息通知</a></li>
					<li class="hm"><a href="${path}/home/message/topic">我的帖子</a></li>
					<li class="hg"><a href="${path}/home/message/letter">我的私信</a></li>
				</ul>
			</div>
			<div id="rhomecont">
				<ul>
					<li class="csth"><a href="${path}/home/message/list">系统提醒</a></li>
					<li class="cshead"><a href="${path}/home/message/list?type=notice">公共消息</a></li>
				</ul>
				<div class="rhmct">
					<#if type == "notice">
						<div class="cpcont">
							公共消息
						</div>
					<#else>
						<div class="cpcont">
							提醒
						</div>
					</#if>
				</div>
			</div>
		</div>
	</div>
	<#include "../common/footer.ftl"/>
</body>
<script type="text/javascript">
	$(document).ready(function() {
		message.init('${type}');
	});
</script>
<script type="text/javascript" src="${path}/resources/js/home.js" ></script>
</html>
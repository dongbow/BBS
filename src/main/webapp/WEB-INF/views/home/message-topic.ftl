<#assign path="${request.contextPath}">
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<#include "../common/import.ftl"/>
	<title>我的帖子</title>
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
				<span class="ltd">我的帖子</span>
			</div>
		</div>
		<div id="ct" class="setitem">
			<div id="homeleftmenu">
				<div class="chleft">
					<h2>消息</h2>
				</div>
				<ul id="homeitems">
					<li class="hp"><a href="${path}/home/message/list">消息通知</a></li>
					<li class="hm hover"><a href="${path}/home/message/topic">我的帖子</a></li>
					<li class="hg"><a href="${path}/home/message/letter">我的私信</a></li>
				</ul>
			</div>
			<div id="rhomecont">
				<div class="rhmct">
					帖子
				</div>
			</div>
		</div>
	</div>
	<#include "../common/footer.ftl"/>
</body>
<script type="text/javascript" src="${path}/resources/js/home.js" ></script>
</html>
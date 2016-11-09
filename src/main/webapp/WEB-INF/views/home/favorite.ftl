<#assign path="${request.contextPath}">
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<#include "../common/import.ftl"/>
	<title>收藏</title>
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/home.css">
</head>
<body>
	<#include "../common/header.ftl"/>
	<#include "../common/rightButton.ftl"/>
	<div id="homemaincont">
		<div id="local" class="c1">
			<div class="z">
				<span>当前位置：</span><a class="line" href="${path}">论坛首页</a> <em>></em>
				<a class="line bltd" href="${path}/home/favorite/topic">收藏</a> <em>></em> 
				<span class="ltd">帖子收藏</span>
			</div>
		</div>
		<div id="ct" class="setitem">
			<div id="homeleftmenu">
				<div class="chleft">
					<h2>收藏</h2>
				</div>
				<ul id="homeitems">
					<li class="hp <#if type == 'topic'>hover</#if>"><a href="${path}/home/favorite/topic">帖子收藏</a></li>
					<li class="hm <#if type == 'board'>hover</#if>"><a href="${path}/home/favorite/board">版块收藏</a></li>
				</ul>
			</div>
			<div id="rhomecont">
				<div class="rhmct">
					list
				</div>
			</div>
		</div>
	</div>
	<#include "../common/footer.ftl"/>
</body>
<script type="text/javascript" src="${path}/resources/js/home.js" ></script>
</html>
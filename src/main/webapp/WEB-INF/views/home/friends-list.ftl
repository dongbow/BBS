<#assign path="${request.contextPath}">
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<#include "../common/import.ftl"/>
	<title>好友列表</title>
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/home.css">
</head>
<body>
	<#include "../common/header.ftl"/>
	<#include "../common/rightButton.ftl"/>
	<div id="homemaincont">
		<div id="local" class="c1">
			<div class="z">
				<span>当前位置：</span><a class="line" href="${path}">论坛首页</a> <em>></em>
				<a class="line bltd" href="${path}/home/friends/list">好友</a> <em>></em> 
				<span class="ltd">好友列表</span>
			</div>
		</div>
		<div id="ct" class="setitem">
			<div id="homeleftmenu">
				<div class="chleft">
					<h2>好友</h2>
				</div>
				<ul id="homeitems">
					<li class="hp hover"><a href="${path}/home/friends/list">好友列表</a></li>
					<li class="hm"><a href="${path}/home/friends/request">好友请求</a></li>
				</ul>
			</div>
			<div id="rhomecont">
				<div class="rhmct">
					<div class="list">
						<div class="f-search">
							<input type="text" class="myfds">
							<a href="javascript:;" class="s-btn"></a>
						</div>
						<div class="f-list">
							<div class="f-one">
								<img src=""/>
								<span></span>
							</div>
						</div>
					</div>
					<div class="message">
					
					</div>
				</div>
			</div>
		</div>
	</div>
	<#include "../common/footer.ftl"/>
</body>
<script type="text/javascript" src="${path}/resources/js/home.js" ></script>
</html>
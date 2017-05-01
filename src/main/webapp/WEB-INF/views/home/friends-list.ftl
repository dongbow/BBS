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
					<p class="tbmu">当前共有 <span class="xw1">30</span> 个好友</p>
					<ul class="buddy c1">
						<#list [1,2,3,4,5] as a>
							<li class="bbda cl">
								<div class="avt">
									<a href="space-uid-359954.html" target="_blank">
										<img src="http://img.res.meizu.com/img/download/uc/35/99/54/00/00/359954/w50h50" onerror="this.onerror=null;this.src=&quot;http://common.res.meizu.com/resources/php/bbs/static/image/noavatar_small.gif&quot;">
									</a>
								</div>
								<h4>
									<a href="space-uid-359954.html" title="wx2893154" target="_blank">wx2893154</a>
								</h4>
								<p class="maxh">超级管理员</p>
								<div class="xg1 add_ul">
									<a href="javascript:;">私信</a>
									<span class="pipe">|</span>
									<a href="javascript:;">删除好友</a>
								</div>
							</li>
						</#list>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<#include "../common/footer.ftl"/>
</body>
<script type="text/javascript" src="${path}/resources/js/home.js" ></script>
</html>
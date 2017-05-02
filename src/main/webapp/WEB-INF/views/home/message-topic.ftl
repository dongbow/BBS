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
					<div class="xld xlda">
						<div class="nts">
							<#list [1,2,3,4,5,6,7,8,9,10] as a>
								<dl class="cl " notice="2294912">
									<dd class="m avt mbn">
										<a href="space-uid-19382300.html"><img src="http://img.res.meizu.com/img/download/uc/19/38/23/00/00/19382300/w50h50" onerror="this.onerror=null;this.src=&quot;http://common.res.meizu.com/resources/php/bbs/static/image/noavatar_small.gif&quot;"></a>
									</dd>
									<dt><span class="xg1 xw0">2016-2-15 10:30</span></dt>
									<dd class="ntc_body" style="">
										<a href="space-uid-19382300.html">罗小栋</a> 回复了您的帖子 
										<a href="forum.php?mod=redirect&amp;goto=findpost&amp;ptid=670496&amp;pid=10453258" target="_blank">『资源组』WIFI万能钥匙—显密版  不用麻烦下载查看器啦！</a> &nbsp; 
										<a href="forum.php?mod=redirect&amp;goto=findpost&amp;pid=10453258&amp;ptid=670496" target="_blank" class="lit">查看</a>
									</dd>
								</dl>
							</#list>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<#include "../common/footer.ftl"/>
</body>
<script type="text/javascript">
	$(function() {
		Setting.init('init');
	});
</script>
<script type="text/javascript" src="${path}/resources/js/home.js" ></script>
</html>
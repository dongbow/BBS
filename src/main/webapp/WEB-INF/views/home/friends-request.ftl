<#assign path="${request.contextPath}">
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<#include "../common/import.ftl"/>
	<title>好友请求</title>
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
				<span class="ltd">好友请求</span>
			</div>
		</div>
		<div id="ct" class="setitem">
			<div id="homeleftmenu">
				<div class="chleft">
					<h2>好友</h2>
				</div>
				<ul id="homeitems">
					<li class="hp"><a href="${path}/home/friends/list">好友列表</a></li>
					<li class="hm hover"><a href="${path}/home/friends/request">好友请求</a></li>
				</ul>
			</div>
			<div id="rhomecont">
				<ul>
					<li class="csth"><a href="${path}/home/friends/request">好友请求</a></li>
					<li class="cshead"><a href="${path}/home/friends/request?type=add">添加好友</a></li>
				</ul>
				<div class="rhmct">
					<#if type == "request">
						<div class="cpcont">
							<ul class="buddy c1">
								<#if friends??>
									<#list friends as f>
										<li class="bbda cl">
											<div class="avt">
												<a href="${path}/space/uid/${f.sendUserId}" target="_blank">
													<img src="${f.image}" onerror="this.onerror=null;this.src=&quot;http://common.res.meizu.com/resources/php/bbs/static/image/noavatar_small.gif&quot;">
												</a>
											</div>
											<h4>
												<a href="${path}/space/uid/${f.sendUserId}" title="${f.sendUserName}" target="_blank">${f.sendUserName}</a>
											</h4>
											<p class="maxh">${f.role}</p>
											<div class="xg1 add_ul">
												<#if f.friendStatus?number == 2>
													<a href="javascript:;">已通过</a>
												<#elseif f.friendStatus?number == 3>
													<a href="javascript:;">已拒绝</a>
												<#else>
													<a href="javascript:;" onclick="requestf(${f.friendId}, 2)">通过</a>
													<span class="pipe">|</span>
													<a href="javascript:;" onclick="requestf(${f.friendId}, 3)">拒绝</a>
												</#if>
											</div>
										</li>
									</#list>
								</#if>
							</ul>
						</div>
					<#else>
						<div class="cpcont">
							add
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
		Friends.init('${type}');
	});
</script>
<script type="text/javascript" src="${path}/resources/js/home.js" ></script>
</html>
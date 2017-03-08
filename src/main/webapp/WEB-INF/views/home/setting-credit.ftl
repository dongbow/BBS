<#assign path="${request.contextPath}">
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<#include "../common/import.ftl"/>
	<title>金币</title>
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/home.css">
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/jspage.css">
</head>
<body>
	<#include "../common/header.ftl"/>
	<#include "../common/rightButton.ftl"/>
	<div id="homemaincont">
		<div id="local" class="c1">
			<div class="z">
				<span>当前位置：</span><a class="line" href="${path}">论坛首页</a> <em>></em>
				<a class="line bltd" href="${path}/home/setting/profile">设置</a> <em>></em> 
				<span class="ltd">金币</span>
			</div>
		</div>
		<div id="ct" class="setitem">
			<div id="homeleftmenu">
				<div class="chleft">
					<h2>设置</h2>
				</div>
				<ul id="homeitems">
					<li class="hp"><a href="${path}/home/setting/profile">个人资料</a></li>
					<li class="hm hover"><a href="${path}/home/setting/credit">金币</a></li>
					<li class="hg"><a href="${path}/home/setting/usergroup">用户组</a></li>
				</ul>
			</div>
			<div id="rhomecont">
				<div class="rhmct">
					<div class="topc">
						<p>我的金币：${userValue.userGold}</p>
					</div>
					<div class="bottomc">
						<h2>金币历史：</h2>
						<table id="golds-data" style="text-align:center;width:100%;line-height:30px;border-collapse:collapse;border:1px solid #ddd" cellpadding="0" cellspacing="0">
							<thead>
								<tr>
									<td style="width:30%;height:30px;border:1px solid #ddd">来源</td>
									<td style="width:20%;height:30px;border:1px solid #ddd">数量</td>
									<td style="width:50%;height:30px;border:1px solid #ddd">时间</td>
								</tr>
							</thead>
							<tbody>
								<#if golds?? && golds?size gt 0>
									<#list golds as g>
										<tr>
											<td style="width:10%;height:30px;border:1px solid #ddd">${g.goldDesc!}</td>
											<td style="width:10%;height:30px;border:1px solid #ddd">${g.goldValue}</td>
											<td style="width:10%;height:30px;border:1px solid #ddd">${g.createTime}</td>
										</tr>
									</#list>
								</#if>
							</tbody>
						</table>
					</div>
					<div class="tcdPageCode"></div>
				</div>
			</div>
		</div>
	</div>
	<#include "../common/footer.ftl"/>
</body>
<script type="text/javascript" src="${path}/resources/js/home.js" ></script>
<script type="text/javascript" src="${path}/resources/js/jquery/jquery.page.js" ></script>
<script type="text/javascript">
	$(function() {
		Setting.init('');
	});
</script>
<#if page?? && page.totalRecord gt 1>
	<script type="text/javascript">
		$(".tcdPageCode").createPage({
	        pageCount:${page.totalPage},
	        current:${page.pageNo},
	        backFn:function(p){
	            initData(p, '${page.searchUrl}');
	        }
	    });
	</script>
</#if>
</html>
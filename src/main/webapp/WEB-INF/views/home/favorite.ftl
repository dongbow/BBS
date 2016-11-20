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
					<table style="width:100%;line-height:30px;" cellpadding="0" cellspacing="0" >
						<thead style="text-align:left">
							<tr>
								<th style="width:10%;height:30px;border-bottom:1px solid #ddd">ID</th>
								<th style="width:60%;height:30px;border-bottom:1px solid #ddd">标题</th>
								<th style="width:20%;height:30px;border-bottom:1px solid #ddd">时间</th>
								<th style="width:10%;height:30px;text-align:center;border-bottom:1px solid #ddd">操作</th>
							</tr>
						</thead>
						<tbody>
							<#if favorites??>
								<#list favorites as f>
									<tr>
										<td style="width:10%;height:30px;border-bottom:1px solid #ddd"><input type="checkbox" name="favId" value="${f.favId}"></td>
										<td style="width:10%;height:30px;border-bottom:1px solid #ddd">
											<#if type == 'topic'>
												<a style="color:#19b4ea" href="${path}/board/${f.needId1}/topic/detail/${f.needId2}" target="_blank">${f.favName}</a>
											</#if>
											<#if type == 'board'>
												<a style="color:#19b4ea" href="${path}/navigation/${f.needId1}/board/${f.needId2}" target="_blank">${f.favName}</a>
											</#if>
										</td>
										<td style="width:10%;height:30px;border-bottom:1px solid #ddd">${f.createTime?substring(0, 16)}</td>
										<td style="width:10%;height:30px;text-align:center;border-bottom:1px solid #ddd"><a href="javascript:;" onclick="favCancle(${f.favId});">删除</a></td>
									</tr>
								</#list>
							</#if>
							<tr style="border-bottom:1px solid #ddd">
								<td style="width:10%;height:30px;padding:10px 0"><input type="checkbox" name="favids" id="favids"></td>
								<td colspan="3" style="padding:10px 0;"><a href="javascript:;" onclick="favCancle(-1);" style="display:block;background:#19b4ea;border:1px solid #3cf;color:#fff;font:16px 'microsoft yahei';height:24px;text-align:center;width:100px;">删除选中</a><td>
							</tr>
						</tbody>
					</table>
				</div>
				<#if page?? && page.totalPage gt 1>
					<#include "../common/page.ftl"/>
					<@buildPage page = page/>
				</#if>
			</div>
		</div>
	</div>
	<#include "../common/footer.ftl"/>
</body>
<script type="text/javascript">
	$(document).ready(function(){
		$('#homeleftmenu').css('height', $('#rhomecont').height());
		$('.infoTextAndGoPageBtnWrap').remove();
		$('#kkpages').css('width', '770px');
		$('#kkpager').css('float', 'right');
	});
</script>
<script type="text/javascript" src="${path}/resources/js/home.js" ></script>
</html>
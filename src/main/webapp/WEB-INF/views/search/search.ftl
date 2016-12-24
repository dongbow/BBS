<#assign path="${request.contextPath}">
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<#include "../common/import.ftl"/>
	<title>搜索</title>
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/search.css">
	<script type="text/javascript" language="javascript">
		function getQueryString(name) {
			var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
			var r = window.location.search.substr(1).match(reg);
			if (r != null)
				return unescape(r[2]);
			return null;
		}
	
		$(document).ready(function() {
			var val = getQueryString("srchtxt");
			document.getElementById("searchinput").value = val;
			//alert($('.quicks').offset().left);
		});
		
		$(function(){
			$('.quicks').mouseover(function(){
				$('#qsc').show();
				$('#toolway b').html('↑');
			})
			
			$('.quicks').mouseout(function(){
				$('#qsc').hide();
				$('#toolway b').html('↓');
			})
			
			$('#qsc').mouseover(function(){
				$('#qsc').show();
				$('#toolway b').html('↑');
			})
			
			$('#qsc').mouseout(function(){
				$('#qsc').hide();
				$('#toolway b').html('↓');
			})
		})
	</script>
</head>
<body>
	<div style="width: 1100px; height: 40px;margin:0px auto;">
		<a class="reindex" href="${path}">返回首页</a>
	</div>
	<div id="searchpanel">
		<a href="${path}"><img id="logopic" alt="JAVA社区" src="${path}/resources/images/biglogo.png"></a> <br />
		<div id="toolway">
			<a class="author" href="${path}/search">帖子</a>
			<a class="author" href="${path}/home/friends/request?type=add">作者</a>
			<a class="great" href="${path}/search?adv=yes">高级搜索</a>
			<a class="quicks great " style="">快速搜索<b>↓</b></a>
		</div>
		<div class="input_w">
			<input id="searchinput" class="sach" type="text" placeholder="请输入搜索内容" value=""> 
			<a class="scbtn" href="${path}/search" onclick="javascript:this.href = this.href + '?kw=' + $('#searchinput').val()">搜索</a>
		</div>
		<div id="qsc" style="display:none;">
			<ul>
				<li><a href="">1小时以内的新帖</a></li>
				<li><a href="">4小时以内的新帖</a></li>
				<li><a href="">8小时以内的新帖</a></li>
				<li><a href="">12小时以内的新帖</a></li>
				<li><a href="">1周以内的帖子</a></li>
				<li><a href="">1月以内的帖子</a></li>
				<li><a href="">6月以内的帖子</a></li>
				<li><a href="">1年以内的帖子</a></li>
			</ul>
		</div>
		<#if adv??>
			<#include "search-adv.ftl"/>
		</#if>
	</div>
	<#include "../common/footer.ftl"/>
</body>
</html>
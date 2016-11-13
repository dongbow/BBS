<#assign path="${request.contextPath}">
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<#include "common/import.ftl"/>
	<title>友链申请</title>
	<style type="text/css">
		h2{margin-bottom:20px;font:"microsoft yahei" 20px;color:#444;}
		table{width:100%};
		table td, table th{height:30px;padding:5px;}
		table tr{display:block;margin-bottom:20px}
		table th{text-align:right;width:100px}
		table td{text-align:left;margin-left:10px}
		input{height:20px;padding:5px;line-height:20px;color:#666;border:1px solid #bbb;width:400px;}
		input:hover{border:1px solid#19b4ea}
		#form > button {background: #19b4ea;border: 1px solid #19b4ea;color: #fff;
  			cursor: pointer;font-size: 16px;height: 30px;margin: 0 30px;width: 100px;}
	</style>
</head>
<body>
	<#include "common/header.ftl"/>
	<div class="mc" style="width:960px; height:auto; margin:20px auto;padding:20px 20px;background:#fff">
		<div id="bbs-dialog"></div>
		<h2>友链申请：</h2>
		<#if status?? && status == 1>
			<p style="text-align:center;color:#f00">提交成功</p>
		</#if>
	    <form id="form" method="post" action="${path}/friendlink/apply" onsubmit="return sure();">
	    	<table>
	    		<tbody>
	    			<tr>
	    				<th>链接名：</th>
	    				<td><input type="text" name="linkname" id="linkname"></td>
	    			</tr>
	    			<tr>
	    				<th>链接地址：</th>
	    				<td><input type="text" name="link" id="link"></td>
	    			</tr>
	    			<tr>
	    				<th>联系方式：</th>
	    				<td><input type="text" name="contact" id="contact"></td>
	    			</tr>
	    		</tbody>
	    	</table>
	        <button id="btn">提交</button>
		</form>
	</div>
	<#include "common/footer.ftl"/>
	<script type="text/javascript">
		$(document).ready(function(){
			var height = $(window).height() - $('#hd').height() - $('.footerWrap').height() - 85;
			$('.mc').css('height', height + 'px');
		});
		
		function sure() {
			if($('#linkname').val() && $('#link').val() && $('#contact').val()) {
				$('#form').submit();
				return true;
			} else {
				dialog('不能留空');
				return false;
			}
		}
	</script>
</body>
</html>
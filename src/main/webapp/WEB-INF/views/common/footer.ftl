<#assign path="${request.contextPath}">
<script type="text/javascript" language="javascript">
	function showtime() {
		var week = null;
		var Digital = new Date();
		var year = Digital.getFullYear();
		var month = Digital.getMonth() + 1;
		var day = Digital.getDate();
		var hours = Digital.getHours();
		var minutes = Digital.getMinutes();
		var seconds = Digital.getSeconds();
		minutes = (minutes < 10) ? "0" + minutes : minutes;
		seconds = (seconds < 10) ? "0" + seconds : seconds;

		var str=new Array("日","一","二","三","四","五","六");
		week="星期"+str[Digital.getDay()];

		var ctime = year + "/" + month + "/" + day + " " + hours + ":"
				+ minutes + ":" + seconds + " " + week;
		document.getElementById("ctime").innerHTML = ctime;
		setTimeout("showtime()", 1000);
	}
	window.onload = showtime;
</script>
<div align="center" class="footerWrap">
	<div class="footerInner">
		<div class="footer-layer1">
			<div class="footer-innerLink">
				<a title="论坛首页" href="${path}">论坛首页</a> 
				<img src="${path}/resources/images/login/space.gif"> 
				<a title="联系我们" target="_blank" href="mailto:bbs@163.com">联系我们</a>
				<img src="${path}/resources/images/login/space.gif"> 
				<a title="郑州轻工业学院" target="_blank" href="http://www.zzuli.edu.cn">轻院首页</a>
				<img src="${path}/resources/images/login/space.gif">  
				<a title="信息门户" target="_blank" href="http://my.zzuli.edu.cn">信息门户</a>
				<p>当前时区 GMT+8, 现在时间是
					<a id="ctime" href="javascript:;" style="font-family: Arial; font-size: 14px; color: #900;"></a>
				</p>
			</div>
		</div>
	</div>
</div>
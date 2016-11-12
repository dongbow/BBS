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
<div class="footerWrap">
	<div class="footerInner">
		<div class="footer-layer1">
			<div class="footer-innerLink">
				<#if links??>
					<p>站内：
						<a title="论坛首页" href="${path}">论坛首页</a> 
						<#list links as link>
							<#if link.linkSign == 1>
								<a title="${link.linkName}" target="_blank" href="${link.link}">${link.linkName}</a>
							</#if>
						</#list> 
					</p>
				</#if>
				<#if links??>
					<p>友情链接：
						<#list links as link>
							<#if link.linkSign == 2>
								<a class="friendlink" id="${link.linkId}" title="${link.linkName}" target="_blank" href="${link.link}">${link.linkName}</a>
							</#if>
						</#list> 
					</p>
				</#if>
				<p>当前时区 GMT+8, 现在时间是
					<a id="ctime" href="javascript:;" style="font-family: Arial; font-size: 14px; color: #900;"></a>
				</p>
			</div>
		</div>
	</div>
</div>
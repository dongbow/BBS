<#assign path="${request.contextPath}">
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<#include "common/import.ftl"/>
	<title>首页</title>
	<link type="text/css" rel="stylesheet" href="${path}/resources/css/forumstyle.css" />
	<link href="${path}/resources/css/jquery.slideBox.css" rel="stylesheet" type="text/css" />
	<script src="${path}/resources/js/jquery/jquery.slideBox.min.js" type="text/javascript"></script>
	<script src="${path}/resources/js/forum.js" type="text/javascript"></script>
</head>
<body>
	<#include "common/header.ftl"/>
	<#include "common/rightButton.ftl"/>
	<div id="fm">
		<div style="float: left; width: 710px; height: auto;">
			<div id="demo1" class="slideBox">
				<ul class="items">
					<#list images as img>
						<li><a href="${img.homeLink}" title="${img.homeTitle}"><img src="${path}${img.homeImgLink}"></a></li>
					</#list>
				</ul>
			</div>
			<!-- topic list -->
			<p style="text-align: center; margin-top: 15px;">更多主题请前往各个板块查看</p>
		</div>
	    <#include "common/rightmenu.ftl"/>
	</div>
	<#include "common/footer.ftl"/>
</body>
</html>
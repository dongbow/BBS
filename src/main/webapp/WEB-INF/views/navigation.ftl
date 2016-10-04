<#assign path="${request.contextPath}">
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<#include "common/import.ftl"/>
	<title>${navigation.navName}</title>
	<link type="text/css" rel="stylesheet" href="${path}/resources/css/forumstyle.css" />
	<script src="${path}/resources/js/forum.js" type="text/javascript"></script>
</head>
<body>
	<#include "common/header.ftl"/>
	<#include "common/rightButton.ftl"/>
	<div id="fm">
		<div class="bbs_boards">
			<#list boards as board>
				<a class="bbs_board" style="background:${board.boardColor}" href="${path}/navigation/${navigation.navId}/board/${board.boardId}">
				    <h4>${board.boardName}</h4>
				    <p>${board.boardDesc!}</p>
				</a>
			</#list>
		</div>
	    <#include "common/rightmenu.ftl"/>
	</div>
	<#include "common/footer.ftl"/>
</body>
</html>
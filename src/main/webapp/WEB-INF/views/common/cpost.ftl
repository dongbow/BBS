<#assign path="${request.contextPath}">
<div id="ftopic_cont">
	<div class="nav_tit">
		<a id="_title">选择发帖版块:</a> 
		<a id="closetopic" href="javascript:void(0);">×</a> 
		<a id="fbartpic" class="" href="javascript:;">发新帖</a>
	</div>
	<div>
		<div id="leftmenu">
			<ul>
				<#list cnav as nav>
					<li><a id="fu${nav.navId}" class="recover" href="javascript:;" onclick="toclick(this,${nav.navId});">${nav.navName}</a></li>
				</#list>
			</ul>
		</div>
		<div id="rightmenu">
			<#list cnav as nav>
				<ul id="zimenu${nav.navId}" class="before" style="display:none;">
					<#list nav.boards as board>
						<li><a class="zilist" href="javascript:;" onclick="toziclick(this,${board.boardId});">${board.boardName}</a></li>
					</#list>
				</ul>
			</#list>
		</div>
	</div>
</div>
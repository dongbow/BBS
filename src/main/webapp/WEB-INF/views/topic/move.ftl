<#assign path="${request.contextPath}">
<div id="ftopic_cont">
	<div class="nav_tit">
		<a id="_title">选择相应信息:</a> 
		<a id="closetopic" href="javascript:void(0);">×</a> 
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
						<#if board.isAccess == 1>
							<#if user.userAccess.userIsAdmin == 1 || user.userAccess.userIsBoderManager == 1>
								<li><a class="zilist" href="javascript:;" onclick="toziclick(this,${board.boardId});">${board.boardName}</a></li>
							</#if>
						<#else>
							<li><a class="zilist" href="javascript:;" onclick="toziclick(this,${board.boardId});">${board.boardName}</a></li>
						</#if>
					</#list>
				</ul>
			</#list>
		</div>
	</div>
</div>

<#if user??>
	<#if user.userAccess.userIsAdmin == 1 || (user.userAccess.userIsBoderManager == 1 && localbmc == 1)>
		<script type="text/javascript">
			$(function(){
				$('.system_option').css({
					'top' : $('#a_system').offset().top - $('.system_option').height() - 10 + 'px',
					'left': $('#a_system').offset().left - 63 + 'px'
				});
				
				$('#a_system').mouseover(function(){
					$('.system_option').show();
				});
				
				$('#a_system').mouseout(function(){
					$('.system_option').hide();
				});
				
				$('.system_option').mouseover(function(){
					$('.system_option').show();
				});
				
				$('.system_option').mouseout(function(){
					$('.system_option').hide();
				});
			});
		</script>
		<div class="system_option" id="${topic.topicId}">
			<ul>
				<#if user.userAccess.userIsAdmin == 1>
					<#if topic.topicInfo.topicIsGlobalTop == 1>
						<li><a href="javascript:;" class="mt qgtp" data-tid="${topic.topicId}">取消全局置顶</a></li>
					<#else>
						<li><a href="javascript:;" class="mt gtp" data-tid="${topic.topicId}">全局置顶</a></li>
					</#if>
					<#if topic.topicInfo.topicIsHome == 1>
						<li><a href="javascript:;" class="mt qhome" data-tid="${topic.topicId}">取消推送首页</a></li>
					<#else>
						<li><a href="javascript:;" class="mt home" data-tid="${topic.topicId}">推送首页</a></li>
					</#if>
    			</#if>
    			<#if topic.topicInfo.topicIsLocalTop == 1>
    				<#if user.userAccess.userIsAdmin == 1>
						<li><a href="javascript:;" class="mt qltp" data-bid="${pboard.boardId}" data-tid="${topic.topicId}" data-role="sys">取消本版置顶</a></li>
					<#else>
						<li><a href="javascript:;" class="mt qltp" data-bid="${pboard.boardId}" data-tid="${topic.topicId}" data-role="bmc">取消本版置顶</a></li>
					</#if>
				<#else>
					<#if user.userAccess.userIsAdmin == 1>
						<li><a href="javascript:;" class="mt ltp" data-bid="${pboard.boardId}" data-tid="${topic.topicId}" data-role="sys">本版置顶</a></li>
					<#else>
						<li><a href="javascript:;" class="mt ltp" data-bid="${pboard.boardId}" data-tid="${topic.topicId}" data-role="bmc">本版置顶</a></li>
					</#if>
				</#if>
				<#if topic.topicInfo.topicIsReply == 1>
					<#if user.userAccess.userIsAdmin == 1>
						<li><a href="javascript:;" class="mt openreply" data-bid="${pboard.boardId}" data-tid="${topic.topicId}" data-role="sys">打开回复</a></li>
					<#else>
						<li><a href="javascript:;" class="mt openreply" data-bid="${pboard.boardId}" data-tid="${topic.topicId}" data-role="bmc">打开回复</a></li>
					</#if>
				<#else>
					<#if user.userAccess.userIsAdmin == 1>
						<li><a href="javascript:;" class="mt closereply" data-bid="${pboard.boardId}" data-tid="${topic.topicId}" data-role="sys">关闭回复</a></li>
					<#else>
						<li><a href="javascript:;" class="mt closereply" data-bid="${pboard.boardId}" data-tid="${topic.topicId}" data-role="bmc">关闭回复</a></li>
					</#if>
				</#if>
				<#if topic.topicInfo.topicIsCream == 0>
					<#if user.userAccess.userIsAdmin == 1>
						<li><a href="javascript:;" class="mt qcream" data-bid="${pboard.boardId}" data-tid="${topic.topicId}" data-role="sys">取消加精</a></li>
					<#else>
						<li><a href="javascript:;" class="mt qcream" data-bid="${pboard.boardId}" data-tid="${topic.topicId}" data-role="bmc">取消加精</a></li>
					</#if>
				<#else>
					<#if user.userAccess.userIsAdmin == 1>
						<li><a href="javascript:;" class="mt cream" data-bid="${pboard.boardId}" data-tid="${topic.topicId}" data-role="sys">加精</a></li>
					<#else>
						<li><a href="javascript:;" class="mt cream" data-bid="${pboard.boardId}" data-tid="${topic.topicId}" data-role="bmc">加精</a></li>
					</#if>
				</#if>
				<#if user.userAccess.userIsAdmin == 1>
        			<li><a href="javascript:;"  class="mt tmove" data-bid="${pboard.boardId}" data-role="sys">移动</a></li>
        		<#else>
        			<li><a href="javascript:;" class="mt tmove" data-bid="${pboard.boardId}" data-bid="${pboard.boardId}" data-role="bmc">移动</a></li>
        		</#if>
				<#if user.userAccess.userIsAdmin == 1>
        			<li><a href="javascript:;"  class="mt tdel" onclick="tdel(${pboard.boardId}, ${topic.topicId}, 'sys');">删除</a></li>
        		<#else>
        			<li><a href="javascript:;" onclick="tdel(${pboard.boardId}, ${topic.topicId}, 'bmc');">删除</a></li>
        		</#if>
			</ul>
		</div>
		<a href="javascript:;" id="a_system">管理选项</a>
		<script type="text/javascript" src="${path}/resources/static/My97DatePicker/WdatePicker.js"></script>
		<script type="text/javascript" src="${path}/resources/js/mtopic.js"></script>
	</#if>
</#if>
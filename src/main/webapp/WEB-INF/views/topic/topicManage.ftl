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
						<li><a href="${path}" class="mt qgtp">取消全局置顶</a></li>
					<#else>
						<li><a href="${path}" class="mt gtp">全局置顶</a></li>
					</#if>
					<#if topic.topicInfo.topicIsHome == 1>
						<li><a href="" class="mt qhome">取消推送首页</a></li>
					<#else>
						<li><a href="" class="mt home">推送首页</a></li>
					</#if>
    			</#if>
    			<#if topic.topicInfo.topicIsLocalTop == 1>
					<li><a href="" class="mt qltp">取消本版置顶</a></li>
				<#else>
					<li><a href="" class="mt ltp">本版置顶</a></li>
				</#if>
				<#if topic.topicInfo.topicIsReply == 1>
					<li><a href="" class="mt openreply">打开回复</a></li>
				<#else>
					<li><a href="" class="mt closereply">关闭回复</a></li>
				</#if>
				<#if topic.topicInfo.topicIsCream == 1>
					<li><a href="" class="mt qcream">取消加精</a></li>
				<#else>
					<li><a href="" class="mt cream">加精</a></li>
				</#if>
				<li><a href="" class="mt tmove">移动</a></li>
				<li><a href="" class="mt tdel">删除</a></li>
			</ul>
		</div>
		<a href="javascript:;" id="a_system">管理选项</a>
		<script type="text/javascript" src="${path}/resources/static/My97DatePicker/WdatePicker.js"></script>
		<script type="text/javascript" src="${path}/resources/js/mtopic.js"></script>
	</#if>
</#if>
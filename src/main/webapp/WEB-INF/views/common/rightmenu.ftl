<#assign path="${request.contextPath}">
<div id="leftMenu">
	<div id="fbar_btn_all" class="fbar_btn_all">
		<a href="javascript:;" class="fbar"><label>发帖</label></a>
	</div>
	<div class="signin" id="signin">
	<#if already??>
		<#if already! == 0>
			<a id="sign_btn" href="javascript:;">
			<label id="sign_text" class="sign_text">签到</label></a> 
			<a id="sign_num" style="display: none;"></a>
		<#else>
			<script type="text/javascript">
				$(function(){
					$('#signin').css('background','#3baa62');
				});
			</script>
			<a id="sign_btn" class="already" style="width:135px" href="javascript:;">
			<label id="sign_text" class="sign_text">已签到</label></a> 
			<a id="sign_num" style="display: inline; background: #6acb8c; width:135px;">
				<p>连续签到天数</p><label id="sign_text" class="sign_text">${userValue.userPastSerialCount}天</label>
			</a>
		</#if>
	<#else>
		<a id="sign_btn" href="javascript:;">
		<label id="sign_text" class="sign_text">签到</label></a> 
		<a id="sign_num" style="display: none;"></a>
	</#if>
	</div>
	<#if quickNavigations?? && quickNavigations?size gt 0>
		<div id="quick_way">
			<p>快速导航</p>
			<div class="quick_way_href">
				<ul>
					<#list quickNavigations as q>
						<li><a style="color:${q.quickColor}" href="${path}${q.quickLink}">${q.quickName}</a></li>
					</#list>
				</ul>
			</div>
		</div>
	</#if>
	<#if rcs?? && rcs?size gt 0>
		<div id="bbs_feel">
			<p>文章推荐</p>
			<div class="bbs_feel_topic">
				<ul>
					<#assign i = 1/>
					<#list rcs as rc>
						<#if rc.location == 1>
							<li><a href="${rc.rcHref}"><span>${i}</span>${rc.rcName}</a></li>
							<#assign i = i + 1/>
						</#if>
					</#list>
				</ul>
			</div>
		</div>
	</#if>
	<div class="feeling">
		<a href=""><img alt="FEELING" src="${path}/resources/images/linshi/feel.jpg" /></a>
	</div>
	<#if rcs?? && rcs?size gt 0>
		<div id="bbs_notice">
			<p>社区动态</p>
			<div class="bbs_notice_topic">
				<ul>
					<#assign j = 1/>
					<#list rcs as rc>
						<#if rc.location == 2>
							<li><a href="${rc.rcHref}"><span>${j}</span>${rc.rcName}</a></li>
							<#assign j = j + 1/>
						</#if>
					</#list>
				</ul>
			</div>
		</div>
	</#if>
	<div id="bbs_active">
		<p>活跃会员</p>
		<div class="bbs_active_space">
			<a href=""><img alt="member" src="${path}/resources/images/linshi/headimg.jpg" /></a> 
			<a href=""><img alt="member" src="${path}/resources/images/linshi/headimg.jpg" /></a>
			<a href=""><img alt="member" src="${path}/resources/images/linshi/headimg.jpg" /></a> 
			<a href=""><img alt="member" src="${path}/resources/images/linshi/headimg.jpg" /></a>
			<a href=""><img alt="member" src="${path}/resources/images/linshi/headimg.jpg" /></a> 
			<a href=""><img alt="member" src="${path}/resources/images/linshi/headimg.jpg" /></a>
		</div>
	</div>
</div>
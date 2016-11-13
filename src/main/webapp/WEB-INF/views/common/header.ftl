<#assign path="${request.contextPath}">
<script type="text/javascript">
$(document).ready(function(){
	changeActive();
	$('#exit').attr('href','${path}/account/logout?backurl=' + encodeURIComponent(window.location.href));
	$('#header_panel').css('margin-right', $('#header_cont').offset().left + 'px');
});

function changeActive() {
	<#if navigation??>
		var navid = ${navigation.navId};
		if(navid > 0) {
			$('#header_nav ul').find('a').removeClass('active');
			$('#nav_' + navid).addClass('active');
		}
	</#if>
	<#if userinfo??>
		$('#header_nav ul').find('a').removeClass('active');
	</#if>
}
$(function(){
	$('#name_cont').mouseover(function(){
		$('#header_panel').show();
	});
	
	$('#header_panel').mouseover(function(){
		$('#header_panel').show();
	});
	
	$('#header_panel').mouseout(function(){
		$('#header_panel').hide();//.delay(2000).fadeOut(1000).hide(0);
	});
	
	$('#login').click(function(){
		$('#login').attr('href','${path}/account/login?backurl=' + encodeURIComponent(window.location.href));
	});
	
});
</script>
<div id="hd">
  <div class="wp">
  <#if user??>
	  <div id="header_cont">
	      <a id="logo" href="${path}"><img src="${path}/resources/images/logo.png"></a>
	      <div id="name_cont">
	          <a href="home.htm?md=space&type=pm" target="_blank" id="message"><span>0</span></a>
	          <a id="usercenter" title="${user.userAccess.userNickname}" target="_blank" href="${path}/space/uid/${user.userAccess.userId}">${user.userAccess.userNickname}</a>
	          <a id="userhead" href="${path}/space/uid/${user.userAccess.userId}" target="_blank">
	          	<img id="cut" title="访问我的空间" src="${user.userInfo.userHeadImg}"/>
	          </a>
	      </div>
		</div>
	    <div id="header_panel" class="header_panel" style="display:none;">
	    	<div class="list_item_trangle"></div>
	        <div class="bbs_quick_show">
	            <img alt="headerimg" src="${user.userInfo.userHeadImg}"/>
	            <#assign n=0/>
	            <#list user.roles as role>
	            	<#if n gt 0><#break></#if>
	            	<a href="${path}/home/setting/usergroup" style="color:${role.roleColor}">${role.roleName}</a>
	            	<#assign n=n+1/>
	            </#list>
	        </div>
	        <ul>
	            <li><a target="_blank" href="${path}/space/uid/${user.userAccess.userId}/topic">${userValue.userTopicCount}</a><p>主题</p></li>
	            <li class="border"><a target="_blank" href="${path}/home/setting/credit">${userValue.userGold}</a><p>金币</p></li>
	            <li class="border"><a target="_blank" href="${path}/space/uid/${user.userAccess.userId}/reply">${userValue.userReplyCount}</a><p>回复</p></li>
	        </ul>
	        <ul class="accountInfo">
		        <li><span class="label_coin">经&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;验</span><a title="${userValue.userExperience}">${userValue.userExperience}</a></li>
		        <li><span class="label_signed">总签到数</span><a title="${userValue.userPastCount}天" id="signcons">${userValue.userPastCount}</a></li>
		    </ul>
	        <div id="bbs_tip_menu">
	            <ul>
	                <li>
	                	<a target="_blank" href="${path}/home/message">消息<span>0</span></a>
	                	<a target="_blank" href="${path}/home/friends/list">好友</a>
	                </li>
	                <li>
	                	<a target="_blank" href="${path}/home/setting/profile">设置</a>
	                    <a target="_blank" href="${path}/home/favorite/topic">收藏</a>
	                </li>
	            </ul>
	        </div>
	        <div class="bbs_exit"><a id="exit">退出</a></div>
	    </div>
  <#else>
  	<div id="header_cont">
		<a id="logo" href="${path}"><img src="${path}/resources/images/logo.png"></a>
		<a id="register" href="${path}/account/register">注册</a> 
		<p id="cow">|</p>
		<a id="login" href="${path}/account/login">登录</a>
	</div>
  </#if>
    <div id="header_nav">
      <ul>
        <li style="margin-left:0"><a class="active" href="${path}">论坛首页</a></li>
      	<#if navigations??>
      		<#list navigations as nav>
      			<li><a id="nav_${nav.navId}" href="${path}/navigation/${nav.navId}">${nav.navName}</a></li>
      		</#list>
      	</#if>
      </ul>
    </div>
    <form action="${path}/search" method="get">
        <div id="header_search">
          <button id="scbar_btn" class="header_submit" value="true" name="searchsubmit" type="submit"> 
            <strong>搜索</strong> 
          </button>
          <input id="scbar_txt" class="header_search" type="text" value="" name="srchtxt" placeholder="请输入关键字搜索" />
        </div>
    </form>
  </div>
</div>
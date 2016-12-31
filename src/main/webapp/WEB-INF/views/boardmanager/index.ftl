<#assign path="${request.contextPath}">
<!DOCTYPE html>
<html>
<head>
	<#include "common.ftl">
    <title>版主后台</title>
</head>

<body class="fixed-sidebar full-height-layout gray-bg" style="overflow:hidden">
    <div id="wrapper">
        <!--左侧导航开始-->
        <nav class="navbar-default navbar-static-side" role="navigation">
            <div class="nav-close"><i class="fa fa-times-circle"></i>
            </div>
            <div class="sidebar-collapse">
                <ul class="nav" id="side-menu">
                    <li class="nav-header">
                        <div class="dropdown profile-element">
                            <span><img alt="image" class="img-circle" style="width:64px" src="${user.userInfo.userHeadImg}" /></span>
                            <span class="block m-t-xs"><strong class="font-bold">${user.userAccess.userNickname}</strong></span>
                            <span class="text-muted text-xs block">
                            	<#assign m=0/>
                            	<#list user.roles as role>
                            		<#if m gt 0><#break/></#if>
                            		${role.roleName}
                            		<#assign m=m+1/>
                            	</#list>
                            </span>
                        </div>
                        <div class="logo-element">BBS</div>
                    </li>
                    <li>
                        <a href="${path}">
                            <i class="fa fa-home"></i>
                            <span class="nav-label">论坛首页</span>
                        </a>
                    </li>
                    <#if navigations??>
                    	<#list navigations as nav>
                    		<li>
		                        <a href="#"><i class="fa fa-edit"></i> <span class="nav-label">${nav.navName}</span><span class="fa arrow"></span></a>
		                        <ul class="nav nav-second-level">
		                        	<#if nav.boards??>
		                        		<#list nav.boards as board>
		                        			<li>
				                                <a href="#">${board.boardName} <span class="fa arrow"></span></a>
				                                <ul class="nav nav-third-level">
				                                    <li><a class="J_menuItem" href="${path}/manage/bmc/audit/topic?bid=${board.boardId}">帖子待审核</a></li>
				                                    <li><a class="J_menuItem" href="${path}/manage/bmc/audit/reply?bid=${board.boardId}">评论待审核</a></li>
				                                    <li><a class="J_menuItem" href="${path}/manage/bmc/trash/topic?bid=${board.boardId}">帖子回收站</a></li>
				                                    <li><a class="J_menuItem" href="${path}/manage/bmc/trash/reply?bid=${board.boardId}">评论回收站</a></li>
				                                    <li><a class="J_menuItem" href="${path}/manage/bmc/closereply?bid=${board.boardId}">已关闭回复</a></li>
				                                </ul>
				                            </li>
		                        		</#list>
		                        	</#if>
		                        </ul>
		                    </li>
                    	</#list>
                    </#if>
                    <li>
                        <a class="J_menuItem" href="${path}/manage/bmc/user/notspeak"><i class="fa fa-magic"></i> <span class="nav-label">禁言用户</span></a>
                    </li>
					<li>
                        <a class="J_menuItem" href="${path}/manage/bmc/log"><i class="fa fa-magic"></i> <span class="nav-label">操作日志</span></a>
                    </li>
                </ul>
            </div>
        </nav>
        <!--左侧导航结束-->
        <!--右侧部分开始-->
        <div id="page-wrapper" class="gray-bg dashbard-1">
            <div class="row border-bottom">
                <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
                    <div class="navbar-header"><a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="#"><i class="fa fa-bars"></i> </a></div>
                    <ul class="nav navbar-top-links navbar-right">
                        <li class="dropdown">
                            <a class="dropdown-toggle count-info" target="_blank" href="empty_page.html">
                                <i class="fa fa-bell"></i> <span class="label label-primary">8</span>
                            </a>
                        </li>
                    </ul>
                </nav>
            </div>
            <div class="row content-tabs">
                <button class="roll-nav roll-left J_tabLeft"><i class="fa fa-backward"></i></button>
                <nav class="page-tabs J_menuTabs">
                    <div class="page-tabs-content">
                    	<a href="javascript:;" class="active J_menuTab" data-id="empty_page.html">首页</a>
                    </div>
                </nav>
                <button class="roll-nav roll-right J_tabRight"><i class="fa fa-forward"></i></button>
                <div class="btn-group roll-nav roll-right">
                    <button class="dropdown J_tabClose" data-toggle="dropdown">关闭操作<span class="caret"></span></button>
                    <ul role="menu" class="dropdown-menu dropdown-menu-right">
                        <li class="J_tabShowActive"><a>定位当前选项卡</a></li>
                        <li class="divider"></li>
                        <li class="J_tabCloseAll"><a>关闭全部选项卡</a></li>
                        <li class="J_tabCloseOther"><a>关闭其他选项卡</a></li>
                    </ul>
                </div>
                <a href="${path}/account/logout" class="roll-nav roll-right J_tabExit"><i class="fa fa fa-sign-out"></i> 退出</a>
            </div>
            <div class="row J_mainContent" id="content-main">
                <iframe class="J_iframe" name="iframe0" width="100%" height="100%" src="${path}/manage/bmc/bcm" frameborder="0" data-id="${path}/manage/bmc/bcm" seamless></iframe>
            </div>
            <div class="footer">
                <div class="pull-right">&copy; BBS</a></div>
            </div>
        </div>
        <!--右侧部分结束-->
    </div>

    <!-- 全局js -->
    <script src="${path}/resources/static/hplus/js/jquery.min.js?v=2.1.4"></script>
    <script src="${path}/resources/static/hplus/js/bootstrap.min.js?v=3.3.6"></script>
    <script src="${path}/resources/static/hplus/js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="${path}/resources/static/hplus/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    <script src="${path}/resources/static/hplus/js/plugins/layer/layer.min.js"></script>

    <!-- 自定义js -->
    <script src="${path}/resources/static/hplus/js/hplus.js?v=4.1.0"></script>
    <script type="text/javascript" src="${path}/resources/static/hplus/js/contabs.js"></script>

    <!-- 第三方插件 -->
    <script src="${path}/resources/static/hplus/js/plugins/pace/pace.min.js"></script>

</body>

</html>

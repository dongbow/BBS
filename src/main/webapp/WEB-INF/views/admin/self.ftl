<#include "common/page.ftl">
<!DOCTYPE html>
<html lang="en">
<head>
	<#include "common/import.ftl">
  	<title>个人信息</title>
</head>

<body class="sticky-header">

<section>
    
    <#include "common/menu.ftl">
    
    <!-- main content start-->
    <div class="main-content" >

        <#include "common/header.ftl">

        <!--body wrapper start-->
        <div class="wrapper">
        	<div class="row">
                <div class="col-md-4">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="panel">
                                <div class="panel-body">
                                    <div class="profile-pic text-center">
                                        <img alt="头像" src="${uInfo.userInfo.userHeadImg}">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="panel">
                                <div class="panel-body">
                                    <ul class="p-info">
                                        <li>
                                            <div class="title">性别</div>
                                            <div class="desk">
                                            	<#if uInfo.userInfo.userSex! == 0>男<#elseif uInfo.userInfo.userSex! == 1>女<#else>保密</#if>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="title">生日</div>
                                            <div class="desk">${uInfo.userInfo.userBirth!}</div>
                                        </li>
                                        <li>
                                            <div class="title">邮箱</div>
                                            <div class="desk">${uInfo.userAccess.userEmail}</div>
                                        </li>
                                        <li>
                                            <div class="title">用户组</div>
                                            <div class="desk">
                                            	<#list uInfo.roles as role>
                                            		${role.roleName}. 
                                            	</#list>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-8">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="panel">
                                <form>
                                    <textarea class="form-control input-lg p-text-area" rows="2" placeholder="待办事项记录"></textarea>
                                </form>
                                <footer class="panel-footer">
                                    <button class="btn btn-post pull-right">记录</button>
                                    <ul class="nav nav-pills p-option">
                                        <li>
                                            <a href="#"><i class="fa fa-camera"></i></a>
                                        </li>
                                    </ul>
                                </footer>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="panel">
                                <header class="panel-heading">
                                    	我的待办历史
                                    <span class="tools pull-right">
                                        <a class="fa fa-chevron-down" href="javascript:;"></a>
                                        <a class="fa fa-times" href="javascript:;"></a>
                                     </span>
                                </header>
                                <div class="panel-body">
                                    <ul class="activity-list">
                                        <li>
                                            <div class="avatar">
                                                <img src="${uInfo.userInfo.userHeadImg}" alt="头像"/>
                                            </div>
                                            <div class="activity-desk">
                                                <h5>
                                                	<a href="#">${uInfo.userAccess.userNickname}</a>
                                                	<span>发表时间</span>
                                                </h5>
                                                <div class="album">
                                                   	 记录内容，Ajax
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--body wrapper end-->

        <!--footer section start-->
        <footer style="bottom:0">
            2016 &copy; BBS, Model by ThemeBucket
        </footer>
        <!--footer section end-->


    </div>
    <!-- main content end-->
</section>
	<#include "common/footer.ftl">
	<script type="text/javascript" src="${path}/resources/js/admin/sysmanage/user.js"></script>
</body>
</html>
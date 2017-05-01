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
			        <div class="panel">
			            <div class="panel-body">
			                <div class="calendar-block ">
			                    <div class="cal1">
			                    </div>
			                </div>
			            </div>
			        </div>
			    </div>
                <div class="col-md-8">
                    <div class="row">
                        <div class="col-md-8">
                            <div class="panel">
                                <div class="panel-body">
                                    <div class="profile-pic text-center">
                                        <img alt="头像" src="${uInfo.userInfo.userHeadImg}">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-8">
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
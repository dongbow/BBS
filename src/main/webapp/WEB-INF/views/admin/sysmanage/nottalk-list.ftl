<#include "../common/page.ftl">
<!DOCTYPE html>
<html lang="en">
<head>
	<#include "../common/import.ftl">
  	<title>禁言用户</title>
</head>

<body class="sticky-header">

<section>
    
    <#include "../common/menu.ftl">
    
    <!-- main content start-->
    <div class="main-content" >

        <#include "../common/header.ftl">

        <!--body wrapper start-->
        <div class="wrapper">
        	<div class="panel panel-default">
        		<form action="" method="get" id="user">
	                <div class="panel-body">
	                    <div class="col-md-2 form-group">
			            	<input id="user-id" name="userId" type="text" value="${userId!}" class="form-control" placeholder="用户ID">
			            </div>
			            <div class="col-md-2 form-group">
			            	<input id="user-nickname" name="nickname" type="text" value="${nickname!}" class="form-control" placeholder="用户昵称">
			            </div>
	                	<div class="col-md-4 form-group">
	            			<a class="btn btn-success btn-sm search" type="button" href="${path}/system/admin/sysmanage/user/search"><i class="fa fa-search"></i> 查找 </a>
			            	<a class="btn btn-danger btn-sm" type="button"><i class="fa fa-microphone"></i> 批量解禁 </a>
			            	<button class="btn btn-primary btn-sm" type="button"><i class="fa fa-share-square-o"></i> 导出 </button>
	            		</div>
                	</div>
                </form>
            </div>
            <section class="panel">
	            <div class="panel-body">
	                <section id="no-more-tables">
	                    <table class="table table-bordered table-striped table-condensed cf">
	                        <thead class="cf">
	                        <tr>
	                        	<th><input type="checkbox"></th>
	                            <th>ID</th>
	                            <th class="numeric">昵称</th>
	                            <th class="numeric">角色</th>
	                            <th class="numeric">注册IP</th>
	                            <th class="numeric">注册时间</th>
	                            <th class="numeric">操作</th>
	                        </tr>
	                        </thead>
	                        <tbody>
	                        <#if users??>
	                        	<#list users as user>
	                        		<tr>
			                        	<th><input type="checkbox"></th>
			                            <td data-title="ID">${user.userAccess.userId}</td>
			                            <td class="numeric" data-title="昵称">
			                            	<a href="${path}/space/uid/${user.userAccess.userId}" target="_blank" style="color:#428bca">${user.userAccess.userNickname}</a>
			                            </td>
			                            <td class="numeric" data-title="角色">
			                            	<#list user.roles as role>
			                            		${role.roleName}
			                            	</#list>
			                            </td>
			                            <td class="numeric" data-title="注册IP">${user.userAccess.userRegIp}</td>
			                            <td class="numeric" data-title="注册时间">${user.userAccess.userCreateTime}</td>
			                            <th class="numeric" data-title="操作">
			                            	<button class="btn btn-default btn-xs" type="button"><i class="fa fa-microphone"></i> 解禁 </button>
			                            </th>
			                        </tr>
	                        	</#list>
	                        </#if>
	                        </tbody>
	                    </table>
	                </section>
	                <@buildPage page=page/>
	            </div>
	        </section>
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
	<#include "../common/footer.ftl">
	<script type="text/javascript" src="${path}/resources/js/admin/sysmanage/user.js"></script>
</body>
</html>
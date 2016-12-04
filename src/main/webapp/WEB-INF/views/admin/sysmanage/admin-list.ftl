<#include "../common/page.ftl">
<!DOCTYPE html>
<html lang="en">
<head>
	<#include "../common/import.ftl">
  	<title>管理员管理</title>
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
			            	<input id="user-name" name="username" type="text" value="${username!}" class="form-control" placeholder="用户名">
			            </div>
			            <div class="col-md-2 form-group">
			            	<input id="user-nickname" name="nickname" type="text" value="${nickname!}" class="form-control" placeholder="用户昵称">
			            </div>
			            <div class="col-md-2 form-group">
		                    <select id="user-sex" name="sex" class="selectpicker show-tick form-control">
		                      	<option value="-1">选择性别</option>
						        <option value="0" <#if sex??><#if sex?number == 0>selected</#if></#if>>男</option>
						        <option value="1" <#if sex??><#if sex?number == 1>selected</#if></#if>>女</option>
						        <option value="2" <#if sex??><#if sex?number == 2>selected</#if></#if>>保密</option>
					        </select>
			            </div>
			            <div class="col-md-2 form-group">
		                    <select id="user-role" name="role" class="selectpicker show-tick form-control">
		                      	<option value="-1">选择角色</option>
						        <option value="1" <#if role??><#if role?number == 1>selected</#if></#if>>超级管理员</option>
						        <option value="2" <#if role??><#if role?number == 2>selected</#if></#if>>管理员</option>
					        </select>
			            </div>
			            <div class="col-md-2 form-group">
		                    <select id="user-lock" name="status" class="selectpicker show-tick form-control">
		                      	<option value="-1">选择状态</option>
						        <option value="0" <#if status??><#if status?number == 0>selected</#if></#if>>正常</option>
						        <option value="1" <#if status??><#if status?number == 1>selected</#if></#if>>锁定</option>
					        </select>
			            </div>
                		<div class="col-md-3 form-group">
	                		<div class="input-group input-large custom-date-range" data-date-format="yyyy-mm-dd">
	                            <input class="form-control dpd1" id="from" name="from" value="${from!}" type="text" placeholder="开始时间">
	                            <span class="input-group-addon">-</span>
	                            <input class="form-control dpd2" id="to" name="to" value="${to!}" type="text"  placeholder="结束时间">
	                        </div>
	                	</div>
	                	<div class="col-md-4 form-group">
	            			<a class="btn btn-success btn-sm user-search" type="button" href="${path}/system/admin/sysmanage/admin/search"><i class="fa fa-search"></i> 查找 </a>
	            			<a class="btn btn-info btn-sm" type="button"><i class="fa fa-plus"></i> 添加 </a>
			            	<a class="btn btn-danger btn-sm" type="button"><i class="fa fa-trash-o"></i> 删除 </a>
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
	                            <th>用户名</th>
	                            <th class="numeric">昵称</th>
	                            <th class="numeric">角色</th>
	                            <th class="numeric">邮箱</th>
	                            <th class="numeric">性别</th>
	                            <th class="numeric">城市</th>
	                            <th class="numeric">锁定状态</th>
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
			                            <td data-title="用户名">${user.userAccess.userName}</td>
			                            <td class="numeric" data-title="昵称">${user.userAccess.userNickname}</td>
			                            <td class="numeric" data-title="角色">
			                            	<#list user.roles as role>
			                            		${role.roleName}.
			                            	</#list>
			                            </td>
			                            <td class="numeric" data-title="邮箱">${user.userAccess.userEmail}</td>
			                            <td class="numeric" data-title="性别">
			                            	<#if user.userInfo.userSex == 0>男<#elseif user.userInfo.userSex == 1>女<#else>保密</#if>
			                            </td>
			                            <td class="numeric" data-title="城市">${user.userInfo.userProvince!}/${user.userInfo.userCity!}</td>
			                            <td class="numeric" data-title="锁定状态">
			                            	<#if user.userAccess.userIsLocked == 0>正常<#else>锁定</#if>
			                            </td>
			                            <td class="numeric" data-title="注册IP">${user.userAccess.userRegIp}</td>
			                            <td class="numeric" data-title="注册时间">${user.userAccess.userCreateTime}</td>
			                            <th class="numeric" data-title="操作">
			                            	<button class="btn btn-default btn-xs" type="button"><i class="fa fa-edit"></i> 编辑 </button>
			                            	<#if user.userAccess.userIsLocked == 0>
			                            		<button class="btn btn-default btn-xs" type="button"><i class="fa fa-lock"></i> 锁定 </button>
			                            	<#else>
			                            		<button class="btn btn-default btn-xs" type="button"><i class="fa fa-unlock-alt"></i> 解锁 </button>
			                            	</#if>
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
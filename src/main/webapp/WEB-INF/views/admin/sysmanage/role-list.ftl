<#assign path="${request.contextPath}">
<!DOCTYPE html>
<html lang="en">
<head>
	<link rel="stylesheet" href="${path}/resources/static/ztree/css/demo.css" type="text/css">
	<link rel="stylesheet" href="${path}/resources/static/ztree/css/metroStyle/metroStyle.css" type="text/css">
	<#include "../common/import.ftl">
  	<title>角色管理</title>
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
        		<form action="" method="post">
	                <div class="panel-body">
            			<a class="btn btn-info btn-sm role-add" type="button" data-toggle="modal" href="${path}/system/admin/sysmanage/role/add"><i class="fa fa-plus"></i> 添加 </a>
		            	<a class="btn btn-danger btn-sm" type="button"><i class="fa fa-trash-o"></i> 删除 </a>
                	</div>
                </form>
            </div>
            <section class="panel">
	            <div class="panel-body">
	                <section id="no-more-tables">
	                    <table class="table table-bordered table-striped table-condensed cf">
	                        <thead class="cf">
	                        <tr>
	                        	<th><input type="checkbox" id="data-ids"></th>
	                            <th>ID</th>
	                            <th>角色名</th>
	                            <th class="numeric">角色颜色</th>
	                            <th class="numeric">角色描述</th>
	                            <th class="numeric">角色状态</th>
	                            <th class="numeric">角色类型</th>
	                            <th class="numeric">创建时间</th>
	                            <th class="numeric">操作</th>
	                        </tr>
	                        </thead>
	                        <tbody>
		                        <#if roles??>
		                        	<#list roles as r>
		                        		<tr>
				                        	<th>
				                        		<#if r.roleId == 1>
					                    			<#if su == 1>
					                    				<input type="checkbox" data-id="${r.roleId}">
					                    			</#if>
					                    		<#else>
					                    			<input type="checkbox" data-id="${r.roleId}">
					                    		</#if>
						                    </th>
				                            <td data-title="ID">${r.roleId}</td>
				                            <td data-title="角色名">${r.roleName}</td>
				                            <td class="numeric" data-title="角色颜色">${r.roleColor}</td>
				                            <td class="numeric" data-title="角色描述">${r.roleDesc}</td>
				                            <td class="numeric" data-title="角色状态">
				                            	<#if r.roleStatus == 0>正常<#else>已删除</#if>
				                            </td>
				                            <td class="numeric" data-title="角色类型">
				                            	<#if r.isAccess == 0>前台角色<#else>后台角色</#if>
				                            </td>
				                            <td class="numeric" data-title="创建时间">${r.roleCreateTime}</td>
				                            <th class="numeric" data-title="操作">
				                            	<#if r.isAccess == 1>
				                            		<#if r.roleId == 1>
						                    			<#if su == 1>
						                    				<a class="btn btn-default btn-xs role-auth" type="button" data-role="${r.roleId}" href="${path}/system/admin/sysmanage/role/authorize">
						                    					<i class="fa fa-key"></i> 授权 
						                    				</a>
						                    				<a class="btn btn-default btn-xs" type="button"><i class="fa fa-edit"></i> 编辑 </a>
						                    			</#if>
						                    		<#else>
						                    			<a class="btn btn-default btn-xs role-auth" type="button" data-role="${r.roleId}" href="${path}/system/admin/sysmanage/role/authorize">
						                    				<i class="fa fa-key"></i> 授权 
						                    			</a>
						                    			<a class="btn btn-default btn-xs" type="button"><i class="fa fa-edit"></i> 编辑 </a>
						                    		</#if>
						                    	<#else>
						                    		<a class="btn btn-default btn-xs" type="button"><i class="fa fa-edit"></i> 编辑 </a>
				                            	</#if>
				                            </th>
				                        </tr>
		                        	</#list>
		                        </#if>
	                        </tbody>
	                    </table>
	                </section>
	            </div>
	        </section>
        </div>
        <!--body wrapper end-->
        
        <!-- Modal -->
        <div class="modal fade" id="role-modal" tabindex="-1" role="dialog" aria-labelledby="role-modal" aria-hidden="true"  data-backdrop="static"></div>
        <!-- modal -->

        <!--footer section start-->
        <footer style="bottom:0">
            2016 &copy; BBS, Model by ThemeBucket
        </footer>
        <!--footer section end-->

    </div>
    <!-- main content end-->
</section>
	<#include "../common/footer.ftl">
	<script type="text/javascript" src="${path}/resources/static/ztree/js/jquery.ztree.core.min.js"></script>
	<script type="text/javascript" src="${path}/resources/static/ztree/js/jquery.ztree.excheck.min.js"></script>
	<script type="text/javascript" src="${path}/resources/static/ztree/js/jquery.ztree.exedit.min.js"></script>
	<script type="text/javascript" src="${path}/resources/js/admin/sysmanage/role.js"></script>
	<script type="text/javascript" src="${path}/resources/static/admin/js/bootstrap-colorpicker/js/bootstrap-colorpicker.js"></script>
</body>
</html>
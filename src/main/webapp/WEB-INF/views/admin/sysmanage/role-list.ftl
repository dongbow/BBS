
<!DOCTYPE html>
<html lang="en">
<head>
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
            			<a class="btn btn-info btn-sm" type="button" data-toggle="modal" href="#add"><i class="fa fa-plus"></i> 添加 </a>
		            	<a class="btn btn-danger btn-sm" type="button"><i class="fa fa-trash-o"></i> 删除 </a>
		            	<div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="add" class="modal fade" style="display: none;">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button aria-hidden="true" data-dismiss="modal" class="close" type="button">×</button>
                                        <h4 class="modal-title">Modal Tittle</h4>
                                    </div>
                                    <div class="modal-body">

                                        Body goes here...

                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                        <button type="button" class="btn btn-success">Save changes</button>
                                    </div>
                                </div>
                            </div>
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
	                            <th>角色名</th>
	                            <th class="numeric">角色颜色</th>
	                            <th class="numeric">角色描述</th>
	                            <th class="numeric">角色状态</th>
	                            <th class="numeric">创建时间</th>
	                            <th class="numeric">操作</th>
	                        </tr>
	                        </thead>
	                        <tbody>
		                        <#if roles??>
		                        	<#list roles as r>
		                        		<tr>
				                        	<th><input type="checkbox"></th>
				                            <td data-title="ID">${r.roleId}</td>
				                            <td data-title="角色名">${r.roleName}</td>
				                            <td class="numeric" data-title="角色颜色">${r.roleColor}</td>
				                            <td class="numeric" data-title="角色描述">${r.roleDesc}</td>
				                            <td class="numeric" data-title="角色状态">
				                            	<#if r.roleStatus == 0>正常<#else>已删除</#if>
				                            </td>
				                            <td class="numeric" data-title="创建时间">${r.roleCreateTime}</td>
				                            <th class="numeric" data-title="操作">
				                            	<button class="btn btn-default btn-xs" type="button"><i class="fa fa-key"></i> 授权 </button>
				                            	<button class="btn btn-default btn-xs" type="button"><i class="fa fa-edit"></i> 编辑 </button>
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

        <!--footer section start-->
        <footer style="bottom:0">
            2016 &copy; BBS, Model by ThemeBucket
        </footer>
        <!--footer section end-->


    </div>
    <!-- main content end-->
</section>
	<#include "../common/footer.ftl">
</body>
</html>
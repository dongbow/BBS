<#include "../common/page.ftl">
<!DOCTYPE html>
<html lang="en">
<head>
	<#include "../common/import.ftl">
  	<title>快速导航</title>
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
	                            <th>名字</th>
	                            <th class="numeric">链接</th>
	                            <th class="numeric">颜色</th>
	                            <th class="numeric">排序</th>
	                            <th class="numeric">状态</th>
	                            <th class="numeric">创建时间</th>
	                            <th class="numeric">操作</th>
	                        </tr>
	                        </thead>
	                        <tbody>
		                        <#if quickNavigations??>
		                        	<#list quickNavigations as quick>
		                        		<tr>
				                        	<th><input type="checkbox" data-id="${quick.id}"></th>
				                            <td data-title="ID">${quick.id}</td>
				                            <td data-title="名字">${quick.quickName}</td>
				                            <td class="numeric" data-title="链接">${quick.quickLink}</td>
				                            <td class="numeric" data-title="颜色">${quick.quickColor}</td>
				                            <td class="numeric" data-title="排序">${quick.quickSort}</td>
				                            <td class="numeric" data-title="状态">
				                            	<#if quick.quickStatus == 0>正常<#else>已删除</#if>
				                            </td>
				                            <td class="numeric" data-title="创建时间">${quick.quickCreateTime}</td>
				                            <th class="numeric" data-title="操作">
				                            	<a class="btn btn-default btn-xs" type="button"><i class="fa fa-edit"></i> 修改 </a>
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
</body>
</html>
<#include "../common/page.ftl">
<!DOCTYPE html>
<html lang="en">
<head>
	<#include "../common/import.ftl">
  	<title>黑名单</title>
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
        		<form action="" method="get">
	                <div class="panel-body">     
	                	<div class="col-md-4 form-group">
	            			<a class="btn btn-info btn-sm" id="data-add" type="button" href="${path}/system/admin/config/black/add"><i class="fa fa-plus"></i> 添加 </a>
	            			<a class="btn btn-danger btn-sm data-delete" type="button" href="${path}/system/admin/config/black/delete"><i class="fa fa-trash-o"></i> 删除 </a>
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
	                        	<th><input type="checkbox" id="data-ids"></th>
	                            <th>ID</th>
	                            <th class="numeric">IP</th>
	                            <th class="numeric">创建时间</th>
	                        </tr>
	                        </thead>
	                        <tbody>
	                        	<#if blacks??>
	                        		<#list blacks as black>
	                        			<tr>
	                        				<th><input type="checkbox" data-id="${black.id}" class="data-check-id"></th>
				                            <td data-title="ID">${black.id}</td>
				                            <td class="numeric" data-title="IP">${black.blackIp}</td>
				                            <td class="numeric" data-title="创建时间">${black.blackCreateTime}</td>
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
	<script type="text/javascript" src="${path}/resources/js/admin/config/black.js"></script>
	<#include "../common/footer.ftl">
</body>
</html>
<#include "../common/page.ftl">
<!DOCTYPE html>
<html lang="en">
<head>
	<#include "../common/import.ftl">
  	<title>经验历史</title>
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
        		<form action="" method="get" id="dataForm">
	                <div class="panel-body">
			            <div class="col-md-2 form-group">
			            	<input id="uid" name="uid" value="${uid!}" type="text" class="form-control" placeholder="用户ID">
			            </div>
                		
	                	<div class="col-md-4 form-group">
	            			<a class="btn btn-success btn-sm" id="data-search" href="${path}/system/admin/log/experience/search" type="button"><i class="fa fa-search"></i> 查找 </a>
			            	<a class="btn btn-primary btn-sm" target="_blank" href="" type="button"><i class="fa fa-share-square-o"></i>导出</a>
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
	                            <th class="numeric">用户ID</th>
	                            <th class="numeric">用户昵称</th>
	                            <th class="numeric">用户经验</th>
	                            <th class="numeric">操作</th>
	                        </tr>
	                        </thead>
	                        <tbody>
	                        	<#if exps??>
	                        		<#list exps as exp>
	                        			<tr>
				                            <td class="numeric" data-title="用户ID">${exp.userId}</td>
				                            <td class="numeric" data-title="用户昵称">
				                            	<a href="${path}/space/uid/${exp.userId}" target="_blank" style="color:#428bca">${exp.nickname}</a>
				                            </td>
				                            <td class="numeric" data-title="用户金币">${exp.expValue}</td>
				                            <td class="numeric" data-title="操作">
				                            	<a class="btn btn-link btn-xs gold-detail" type="button" data-id="${exp.userId}" href="${path}/system/admin/log/experience/detail">查看详情</a>
				                            </td>
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
	<script type="text/javascript" src="${path}/resources/js/admin/logmanage/experience.js"></script>
</body>
</html>
<#include "../common/page.ftl">
<!DOCTYPE html>
<html lang="en">
<head>
	<#include "../common/import.ftl">
  	<title>金币历史</title>
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
			            <div class="col-md-2 form-group">
			            	<input id="uid" type="text" class="form-control" placeholder="用户ID">
			            </div>
                		
	                	<div class="col-md-4 form-group">
	            			<a class="btn btn-success btn-sm" type="button"><i class="fa fa-search"></i> 查找 </a>
			            	<div class="btn-group">
								<button type="button" class="btn btn-primary btn-sm dropdown-toggle" data-toggle="dropdown">
								 <i class="fa fa-share-square-o"></i> 导出 <span class="caret"></span>
								</button>
								<ul class="dropdown-menu" role="menu">
									<li><a href="#">导出当前页</a></li>
									<li><a href="#">导出所有</a></li>
								</ul>
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
	                            <th class="numeric">用户ID</th>
	                            <th class="numeric">用户昵称</th>
	                            <th class="numeric">用户金币</th>
	                            <th class="numeric">操作</th>
	                        </tr>
	                        </thead>
	                        <tbody>
	                        	<#if golds??>
	                        		<#list golds as gold>
	                        			<tr>
				                            <td class="numeric" data-title="用户ID">${gold.userId}</td>
				                            <td class="numeric" data-title="用户昵称">
				                            	<a href="${path}/space/uid/${gold.userId}" target="_blank" style="color:#428bca">${gold.nickname}</a>
				                            </td>
				                            <td class="numeric" data-title="用户金币">${gold.goldValue}</td>
				                            <td class="numeric" data-title="操作">
				                            	<a class="btn btn-link btn-xs gold-detail" type="button" data-id="${gold.userId}" href="${path}/system/admin/log/gold/detail">查看详情</a>
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
	<script type="text/javascript" src="${path}/resources/js/admin/logmanage/gold.js"></script>
</body>
</html>
<#include "../common/page.ftl">
<!DOCTYPE html>
<html lang="en">
<head>
	<#include "../common/import.ftl">
  	<title>签到历史</title>
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
			            	<input id="uid" name="uid" type="text" value="${uid!}" class="form-control" placeholder="用户ID">
			            </div>
                		
	                	<div class="col-md-4 form-group">
	            			<a class="btn btn-success btn-sm" id="data-search" type="button" href="${path}/system/admin/log/sign/search"><i class="fa fa-search"></i> 查找 </a>
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
	                            <th class="numeric">连续签到数</th>
	                            <th class="numeric">总签到数</th>
	                            <th class="numeric">上次签到时间</th>
	                            <th class="numeric">上次签到IP</th>
	                            <th class="numeric">操作</th>
	                        </tr>
	                        </thead>
	                        <tbody>
	                        	<#if signs??>
	                        		<#list signs as sign>
	                        			<tr>
				                            <td class="numeric" data-title="用户ID">${sign.userId}</td>
				                            <td class="numeric" data-title="用户昵称">
				                            	<a href="${path}/space/uid/${sign.userId}" target="_blank" style="color:#428bca">${sign.nickname}</a>
				                            </td>
				                            <td class="numeric" data-title="连续签到数">${sign.serialSign}</td>
				                            <td class="numeric" data-title="总签到数">${sign.totalSign}</td>
				                            <td class="numeric" data-title="上次签到时间">${sign.pastTime}</td>
				                            <td class="numeric" data-title="上次签到IP">${sign.ip}</td>
				                            <td class="numeric" data-title="操作">
				                            	<a class="btn btn-link btn-xs sign-detail" type="button" data-id="${sign.userId}" href="${path}/system/admin/log/sign/detail">查看详情</a>
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
	<script type="text/javascript" src="${path}/resources/js/admin/logmanage/sign.js"></script>
</body>
</html>
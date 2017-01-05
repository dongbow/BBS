<#include "../common/page.ftl">
<!DOCTYPE html>
<html lang="en">
<head>
	<#include "../common/import.ftl">
  	<title>经验详情</title>
</head>

<body class="sticky-header">

<section>
    
    <#include "../common/menu.ftl">
    
    <!-- main content start-->
    <div class="main-content" >

        <#include "../common/header.ftl">

		<div class="page-heading">
            <ul class="breadcrumb">
                <li>
                    <a href="${path}/system/admin/log/sign">经验历史</a>
                </li>
                <li class="active">查看详情</li>
            </ul>
        </div>
        
        <!--body wrapper start-->
        <div class="wrapper">
        	<div class="panel panel-default">
        		<form action="" method="get" id="dataForm">
        			<input type="hidden" name="uid" value="${uid!}">
	                <div class="panel-body">
			            <div class="col-md-4 form-group">
	                		<div class="input-group input-large custom-date-range" data-date-format="yyyy-mm-dd">
	                            <input id="starttime" class="form-control dpd1" name="from" value="${from!}" type="text" placeholder="开始时间">
	                            <span class="input-group-addon">-</span>
	                            <input id="endtime" class="form-control dpd2" name="to" value="${to!}" type="text"  placeholder="结束时间">
	                        </div>
	                	</div>
                		
	                	<div class="col-md-4 form-group">
	            			<a class="btn btn-success btn-sm" id="data-search" href="${path}/system/admin/log/experience/detail/search" type="button"><i class="fa fa-search"></i> 查找 </a>
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
	                            <th class="numeric">ID</th>
	                            <th class="numeric">昵称</th>
	                            <th class="numeric">经验</th>
	                            <th class="numeric">来源</th>
	                            <th class="numeric">时间</th>
	                        </tr>
	                        </thead>
	                        <tbody>
	                        	<#if exps??>
	                        		<#assign eid = page.pageSize * (page.pageNo - 1) + 1/>
	                        		<#list exps as exp>
	                        			<tr>
				                            <td class="numeric" data-title="ID">${eid}</td>
				                            <td class="numeric" data-title="昵称">
				                            	<a href="${path}/space/uid/${exp.userId}" target="_blank" style="color:#428bca">${exp.nickname}</a>
				                            </td>
				                            <td class="numeric" data-title="经验">${exp.expValue}</td>
				                            <td class="numeric" data-title="来源">${exp.expDesc!}</td>
				                            <td class="numeric" data-title="时间">${exp.createTime}</td>
				                        </tr>
				                        <#assign eid = eid + 1/>
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
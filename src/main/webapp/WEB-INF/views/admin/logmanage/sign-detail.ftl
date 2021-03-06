<#include "../common/page.ftl">
<!DOCTYPE html>
<html lang="en">
<head>
	<#include "../common/import.ftl">
  	<title>签到详情</title>
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
                    <a href="${path}/system/admin/log/sign">签到历史</a>
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
	            			<a class="btn btn-success btn-sm" id="data-search" type="button" href="${path}/system/admin/log/sign/detail/search"><i class="fa fa-search"></i> 查找 </a>
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
	                            <th class="numeric">ID</th>
	                            <th class="numeric">用户昵称</th>
	                            <th class="numeric">签到时间</th>
	                            <th class="numeric">签到IP</th>
	                        </tr>
	                        </thead>
	                        <tbody>
	                        	<#if signs??>
	                        		<#assign sid = page.pageSize * (page.pageNo - 1) + 1/>
	                        		<#list signs as sign>
	                        			<tr>
				                            <td class="numeric" data-title="ID">${sid}</td>
				                            <td class="numeric" data-title="用户昵称">
				                            	<a href="${path}/space/uid/${sign.userId}" target="_blank" style="color:#428bca">${sign.nickname}</a>
				                            </td>
				                            <td class="numeric" data-title="签到时间">${sign.pastTime}</td>
				                            <td class="numeric" data-title="签到IP">${sign.ip}</td>
				                        </tr>
				                        <#assign sid = sid + 1/>
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
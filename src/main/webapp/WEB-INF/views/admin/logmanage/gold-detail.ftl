<#include "../common/page.ftl">
<!DOCTYPE html>
<html lang="en">
<head>
	<#include "../common/import.ftl">
  	<title>金币详情</title>
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
                    <a href="${path}/system/admin/log/sign">金币历史</a>
                </li>
                <li class="active">查看详情</li>
            </ul>
        </div>
        
        <!--body wrapper start-->
        <div class="wrapper">
        	<div class="panel panel-default">
        		<form action="" method="post">
	                <div class="panel-body">
			            <div class="col-md-4 form-group">
	                		<div class="input-group input-large custom-date-range" data-date-format="yyyy-mm-dd">
	                            <input id="starttime" class="form-control dpd1" name="from" type="text" placeholder="开始时间">
	                            <span class="input-group-addon">-</span>
	                            <input id="endtime" class="form-control dpd2" name="to" type="text"  placeholder="结束时间">
	                        </div>
	                	</div>
                		
	                	<div class="col-md-4 form-group">
	            			<a class="btn btn-success btn-sm" type="button"><i class="fa fa-search"></i> 查找 </a>
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
	                            <th class="numeric">ID</th>
	                            <th class="numeric">昵称</th>
	                            <th class="numeric">金币</th>
	                            <th class="numeric">来源</th>
	                            <th class="numeric">时间</th>
	                        </tr>
	                        </thead>
	                        <tbody>
	                        	<#if golds??>
	                        		<#assign gid = page.pageSize * (page.pageNo - 1) + 1/>
	                        		<#list golds as gold>
	                        			<tr>
				                            <td class="numeric" data-title="ID">${gid}</td>
				                            <td class="numeric" data-title="昵称">
				                            	<a href="${path}/space/uid/${gold.userId}" target="_blank" style="color:#428bca">${gold.nickname}</a>
				                            </td>
				                            <td class="numeric" data-title="金币">${gold.goldValue}</td>
				                            <td class="numeric" data-title="来源">${gold.goldDesc!}</td>
				                            <td class="numeric" data-title="时间">${gold.createTime}</td>
				                        </tr>
				                        <#assign gid = gid + 1/>
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
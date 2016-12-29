<#include "../common/page.ftl">
<!DOCTYPE html>
<html lang="en">
<head>
	<#include "../common/import.ftl">
  	<title>登录日志</title>
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
	                    <div class="col-md-4 form-group">
	                		<div class="input-group input-large custom-date-range" data-date-format="yyyy-mm-dd">
	                            <input id="starttime" class="form-control dpd1" name="from" type="text" placeholder="开始时间">
	                            <span class="input-group-addon">-</span>
	                            <input id="endtime" class="form-control dpd2" name="to" type="text"  placeholder="结束时间">
	                        </div>
	                	</div>
			            <div class="col-md-2 form-group">
			            	<input id="loginname" type="text" class="form-control" placeholder="登录名">
			            </div>
			            <div class="col-md-2 form-group">
		                    <select id="status" class="selectpicker show-tick form-control">
		                      	<option value="-1">登录状态</option>
						        <option value="0">成功</option>
						        <option value="1">失败</option>
					        </select>
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
	                            <th>ID</th>
	                            <th>登录用户</th>
	                            <th class="numeric">登录地址</th>
	                            <th class="numeric">登录状态</th>
	                            <th class="numeric">错误类型</th>
	                            <th class="numeric">登录时间</th>
	                            <th class="numeric">登录IP</th>
	                        </tr>
	                        </thead>
	                        <tbody>
	                        	<#if logs??>
	                        		<#list logs as log>
	                        			<tr>
				                            <td data-title="ID">${log.loginId}</td>
				                            <td data-title="登录用户">${log.loginName}</td>
				                            <td class="numeric" data-title="登录地址">${log.loginLink}</td>
				                            <td class="numeric" data-title="登录状态">
				                            	<#if log.isSuccess == 1>成功<#else>失败</#if>
				                            </td>
				                            <td class="numeric" data-title="错误类型">
				                            	<#if log.isSuccess == 0>${log.errorText}</#if>
				                            </td>
				                            <td class="numeric" data-title="登录时间">${log.loginCreateTime}</td>
				                            <td class="numeric" data-title="登录IP">${log.loginIp}</td>
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
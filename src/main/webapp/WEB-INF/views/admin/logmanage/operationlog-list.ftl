<#include "../common/page.ftl">
<!DOCTYPE html>
<html lang="en">
<head>
	<#include "../common/import.ftl">
  	<title>操作日志</title>
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
	                    <div class="col-md-4 form-group">
	                		<div class="input-group input-large custom-date-range" data-date-format="yyyy-mm-dd">
	                            <input id="starttime" class="form-control dpd1" name="from" value="${from!}" type="text" placeholder="开始时间">
	                            <span class="input-group-addon">-</span>
	                            <input id="endtime" class="form-control dpd2" name="to" value="${to!}" type="text"  placeholder="结束时间">
	                        </div>
	                	</div>
	                	<div class="col-md-2 form-group">
			            	<select id="module" name="module" class="selectpicker show-tick form-control">
		                      	<option value="-1">模块</option>
		                      	<#if module??>
		                      		 <#list modules as m>
						        		<option <#if module==m>selected</#if> value="${m}">${m}</option>
							        </#list>
							    <#else>
							    	<#list modules as m>
						        		<option value="${m}">${m}</option>
						        	</#list>
		                      	</#if>
					        </select>
			            </div>
			            <div class="col-md-2 form-group">
			            	<input id="name" name="name" type="text" value="${name!}" class="form-control" placeholder="操作人">
			            </div>
			            <div class="col-md-2 form-group">
		                    <select id="status" name="status" class="selectpicker show-tick form-control">
		                      	<option value="-1">执行状态</option>
						        <option <#if status??><#if status?number=1>selected</#if></#if> value="1">成功</option>
						        <option <#if status??><#if status?number=0>selected</#if></#if> value="0">失败</option>
					        </select>
			            </div>
                		
	                	<div class="col-md-4 form-group">
	            			<a class="btn btn-success btn-sm" id="data-search" type="button" href="${path}/system/admin/log/operation/search"><i class="fa fa-search"></i> 查找 </a>
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
	                            <th>ID</th>
	                            <th class="numeric">模块</th>
	                            <th class="numeric">方法</th>
	                            <th class="numeric">执行状态</th>
	                            <th class="numeric">执行人</th>
	                            <th class="numeric">执行IP</th>
	                            <th class="numeric">执行时间</th>
	                            <th class="numeric">操作</th>
	                        </tr>
	                        </thead>
	                        <tbody>
	                        	<#if logs??>
	                        		<#list logs as log>
	                        			<tr>
				                            <td data-title="ID">${log.id}</td>
				                            <td class="numeric" data-title="模块"><#noescape>${log.module}</#noescape></td>
				                            <td class="numeric" data-title="方法"><#noescape>${log.method}</#noescape></td>
				                            <td class="numeric" data-title="执行状态">
				                            	<#if log.status == 1>成功<#else><font color="red">失败</font></#if></td>
				                            <td class="numeric" data-title="执行人">
				                            	<a href="${path}/space/uid/${log.userId}" target="_blank" style="color:#428bca">${log.userNickname}</a>
				                            </td>
				                            <td class="numeric" data-title="执行IP">${log.ip}</td>
				                            <td class="numeric" data-title="执行时间">${log.createTime?string("yyyy-MM-dd HH:mm:ss")}</td>
				                            <td class="numeric" data-title="操作">
				                            	<a class="btn btn-link btn-xs sys-args" type="button" data-id="${log.id}">查看参数</a>
				                            	<input type="hidden" id="args_${log.id}" value="${log.args}">
				                            	<#if log.status == 0>
				                            		<a class="btn btn-link btn-xs sys-desc" type="button" data-id="${log.id}">查看失败原因</a>
				                            		<input type="hidden" id="desc_${log.id}" value="${log.statusDesc}">
				                            	</#if>
				                            </td>
				                        </tr>
	                        		</#list>
	                        	</#if>
	                        </tbody>
	                    </table>
	                </section>
	                <@buildPage page=page/>
	                <!-- Modal -->
			        <div class="modal fade" id="sys-modal" tabindex="-1" role="dialog" aria-labelledby="sys-modal" aria-hidden="true">
			        	<div class="modal-dialog">
						    <div class="modal-content">
						        <div class="modal-header">
						            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						            <h4 class="modal-title"></h4>
						        </div>
						        <div class="modal-body" style="text-align:center; overflow:hidden">
						        	<p class="sys-content"></p>
						        </div>
						    </div>
						</div>
			        </div>
			        <!-- modal -->
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
	<script type="text/javascript" src="${path}/resources/js/admin/logmanage/operationlog.js"></script>
	<#include "../common/footer.ftl">
</body>
</html>
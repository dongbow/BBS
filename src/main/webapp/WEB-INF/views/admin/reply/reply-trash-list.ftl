<#include "../common/page.ftl">
<!DOCTYPE html>
<html lang="en">
<head>
	<#include "../common/import.ftl">
	<link href="${path}/resources/css/shCoreDefault.css" type="text/css" rel="stylesheet">
	<script type="text/javascript" src="${path}/resources/js/shCore.js"></script>
	<script type="text/javascript" src="${path}/resources/js/syntaxhighlighter.js"></script>
  	<title>评论列表</title>
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
			            	<input id="uid" type="text" class="form-control" placeholder="评论人ID">
			            </div>
			            <div class="col-md-2 form-group">
			            	<input id="tid" type="text" class="form-control" placeholder="帖子ID">
			            </div>
			            <div class="col-md-2 form-group">
		                    <select id="navid" class="selectpicker show-tick form-control" data-live-search="true">
		                      	<option value="0">所属版块</option>
						        <#list boards as board>
						        	<option value="${board.boardId}">${board.boardName}</option>
						        </#list>
					        </select>
			            </div>
	                	<div class="col-md-4 form-group">
	            			<a class="btn btn-success btn-sm" type="button"><i class="fa fa-search"></i> 查找 </a>
	            			<a class="btn btn-info btn-sm" type="button"><i class="fa fa-trash-o"></i> 批量恢复 </a>
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
	                        	<th><input type="checkbox"></th>
	                            <th class="numeric">ID</th>
	                            <th class="numeric">帖子ID</th>
	                            <th class="numeric">评论人</th>
	                            <th class="numeric">状态</th>
	                            <th class="numeric">评论时间</th>
	                            <th class="numeric">评论IP</th>
	                            <th class="numeric">查看更多</th>
	                            <th class="numeric">操作</th>
	                        </tr>
	                        </thead>
	                        <tbody>
	                        	<#if replys??>
	                        		<#list replys as reply>
	                        			<tr>
	                        				<td><input type="checkbox"></td>
				                            <td class="numeric" data-title="ID">${reply.replyId}</td>
				                            <td class="numeric" data-title="帖子ID">${reply.topicId}</td>
				                            <td class="numeric" data-title="评论人">
				                            	<a href="${path}/space/uid/${reply.userId}" target="_blank" style="color:#428bca">${reply.user.userAccess.userNickname}</a>
				                            </td>
				                            <th class="numeric" data-title="状态">
				                            	<#if reply.replyStatus == 1><font color="red">已删除</font><#else>未删除</#if>|
				                            	<#if reply.replyIsCheck == 2><font color="red">未通过审核</font><#else>通过审核</#if>
				                            </th>
				                            <td class="numeric" data-title="评论时间">${reply.replyCreateTime}</td>
				                            <td class="numeric" data-title="评论IP">${reply.replyIp}</td>
				                            <td class="numeric" data-title="查看更多">
				                            	<a class="btn btn-link btn-xs reply-content" type="button" data-value="${reply.replyContent}">预览评论</a>
				                            </td>
				                            <td class="numeric" data-title="操作">
				                            	<a class="btn btn-default btn-xs" type="button"><i class="fa fa-edit"></i> 恢复 </a>
				                            	<a class="btn btn-default btn-xs" type="button"><i class="fa fa-edit"></i> 编辑 </a>
				                            </td>
				                        </tr>
	                        		</#list>
	                        	</#if>
	                        </tbody>
	                    </table>
	                </section>
	                <@buildPage page=page/>
	                <!-- Modal -->
			        <div class="modal fade" id="reply-content-modal" tabindex="-1" role="dialog" aria-labelledby="reply-content-modal" aria-hidden="true">
			        	<div class="modal-dialog modal-lg">
						    <div class="modal-content">
						        <div class="modal-header">
						            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						            <h4 class="modal-title"></h4>
						        </div>
						        <div class="modal-body" style="text-align:center; overflow:hidden">
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
	<#include "../common/footer.ftl">
	<script type="text/javascript" src="${path}/resources/js/admin/reply/reply.js"></script>
</body>
</html>
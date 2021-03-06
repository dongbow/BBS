<#include "../common/page.ftl">
<!DOCTYPE html>
<html lang="en">
<head>
	<#include "../common/import.ftl">
	<link href="${path}/resources/css/shCoreDefault.css" type="text/css" rel="stylesheet">
	<script type="text/javascript" src="${path}/resources/js/shCore.js"></script>
	<script type="text/javascript" src="${path}/resources/js/syntaxhighlighter.js"></script>
  	<title>帖子列表</title>
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
		                    <input id="tid" class="form-control" name="tid" type="text" placeholder="帖子ID">
			            </div>
                		<div class="col-md-2 form-group">
		                    <select id="t-nav" name="navid" class="selectpicker show-tick form-control">
		                      	<option value="0">所属导航</option>
						        <#list navs as nav>
						        	<option value="${nav.navId}">${nav.navName}</option>
						        </#list>
					        </select>
			            </div>
			            <div class="col-md-2 form-group">
		                    <select id="t-board" name="bid" class="selectpicker show-tick form-control">
		                      	<option value="0">所属版块</option>
		                      	<#list boards as board>
		                      		<option value="${board.boardId}">${board.boardName}</option>
		                      	</#list>
					        </select>
			            </div>
			            
	                	<div class="col-md-4 form-group">
	            			<a class="btn btn-success btn-sm" type="button"><i class="fa fa-search"></i> 查找 </a>
	            			<a class="btn btn-info btn-sm" type="button"><i class="fa fa-comment-o"></i> 批量开启 </a>
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
	                            <th class="numeric">帖子标题</th>
	                            <th class="numeric">发表人</th>
	                            <th class="numeric">发表时间</th>
	                            <th class="numeric">发表IP</th>
	                            <th class="numeric">预览</th>
	                            <th class="numeric">操作</th>
	                        </tr>
	                        </thead>
	                        <tbody>
	                        	<#if topics??>
	                        		<#list topics as topic>
	                        			<tr>
	                        				<th><input type="checkbox" data-id="${topic.topicId}"></th>
				                            <td data-title="ID">${topic.topicId}</td>
				                            <td class="numeric" data-title="帖子标题">
				                            	<a href="${path}/board/${topic.boardId}/topic/detail/${topic.topicId}" target="_blank" style="color:#428bca">${topic.topicTitle}</a>
				                            </td>
				                            <td class="numeric" data-title="发表人">
				                            	<a href="${path}/space/uid/${topic.userId}" target="_blank" style="color:#428bca">${topic.user.userAccess.userNickname}</a>
				                            </td>
				                            <td class="numeric" data-title="发表时间">${topic.topicCreateTime}</td>
				                            <td class="numeric" data-title="发表IP">${topic.topicCreateIp}</td>
				                            <td class="numeric" data-title="预览">
				                            	<a class="btn btn-link btn-xs topic-data" type="button" data-value="${topic.topicContent}"> 预览 </a>
				                            </td>
				                            <td class="numeric" data-title="操作">
				                            	<a class="btn btn-default btn-xs" type="button"><i class="fa fa-comment-o"></i> 开启 </a>
				                            </td>
				                        </tr>
	                        		</#list>
	                        	</#if>
	                        </tbody>
	                    </table>
	                </section>
	                <@buildPage page=page/>
	                <!-- Modal -->
			        <div class="modal fade" id="topic-content-modal" tabindex="-1" role="dialog" aria-labelledby="topic-content-modal" aria-hidden="true">
			        	<div class="modal-dialog modal-lg">
						    <div class="modal-content">
						        <div class="modal-header">
						            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						            <h4 class="modal-title">帖子查看</h4>
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
	<script type="text/javascript" src="${path}/resources/js/admin/homemanage/topic.js"></script>
</body>
</html>
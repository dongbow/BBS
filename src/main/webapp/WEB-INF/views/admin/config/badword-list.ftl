<#include "../common/page.ftl">
<!DOCTYPE html>
<html lang="en">
<head>
	<#include "../common/import.ftl">
  	<title>敏感词</title>
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
		                    <input id="word" class="form-control" name="word" value="${word!}" type="text" placeholder="关键词">
			            </div>
			             
	                	<div class="col-md-4 form-group">
	            			<a class="btn btn-success btn-sm" id="data-search" type="button" href="${path}/system/admin/config/badword/search"><i class="fa fa-search"></i> 查找 </a>
	            			<a class="btn btn-info btn-sm" id="data-add" type="button" href="${path}/system/admin/config/badword/add"><i class="fa fa-plus"></i> 添加 </a>
	            			<a class="btn btn-primary btn-sm data-import" type="button" href="${path}/system/admin/config/badword/import"><i class="fa fa-sign-in"></i> 导入 </a>
	            			<a class="btn btn-danger btn-sm data-delete" type="button" href="${path}/system/admin/config/badword/delete"><i class="fa fa-trash-o"></i> 删除 </a>
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
	                            <th class="numeric">敏感词</th>
	                            <th class="numeric">创建时间</th>
	                        </tr>
	                        </thead>
	                        <tbody>
	                        	<#if words??>
	                        		<#list words as word>
	                        			<tr>
	                        				<th><input type="checkbox" data-id="${word.id}" class="data-check-id"></th>
				                            <td data-title="ID">${word.id}</td>
				                            <td class="numeric" data-title="敏感词">${word.badWord}</td>
				                            <td class="numeric" data-title="创建时间">${word.createTime?string('yyyy-MM-dd HH:mm:ss')}</td>
				                        </tr>
	                        		</#list>
	                        	</#if>
	                        </tbody>
	                    </table>
	                </section>
	                <@buildPage page=page/>
	                <!-- Modal -->
	                <div class="modal fade" id="data-modal" tabindex="-1" role="dialog" aria-labelledby="data-modal" aria-hidden="true" data-backdrop="static"></div>
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
	<script type="text/javascript" src="${path}/resources/js/admin/config/badword.js"></script>
	<#include "../common/footer.ftl">
</body>
</html>
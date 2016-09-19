<!DOCTYPE html>
<html lang="en">
<head>
	<#include "../common/import.ftl">
	<!--dynamic table-->
	<link href="${path}/resources/static/admin/js/advanced-datatable/css/demo_page.css" rel="stylesheet" />
	<link href="${path}/resources/static/admin/js/advanced-datatable/css/demo_table.css" rel="stylesheet" />
	<link href="${path}/resources/static/admin/js/data-tables/DT_bootstrap.css" rel="stylesheet" />
  	<title>用户列表</title>
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
                <div class="panel-body">
                    <div class="col-lg-2">
		                             用户ID：<input id="" type="text" class="form-control">
		            </div>
		            <div class="col-lg-2">
		                             用户名：<input id="" type="text" class="form-control">
		            </div>
		            <div class="col-lg-2">
		                             用户昵称：<input id="" type="text" class="form-control">
		            </div>
		            <div class="col-lg-1">
		                             性别：
	                    <select id="" class="selectpicker show-tick form-control">
	                      	<option value="-1">选择性别</option>
					        <option value="0">男</option>
					        <option value="1">女</option>
				        </select>
		            </div>
		            <div class="col-lg-1">
		                             用户组：
	                    <select id="" class="selectpicker show-tick form-control">
	                      	<option value="-1">选择用户组</option>
					        <option value="0">超级管理员</option>
					        <option value="1">管理员</option>
					        <option value="2">版主</option>
					        <option value="3">会员</option>
				        </select>
		            </div>
		            <div class="col-lg-1">
		                             状态：
	                    <select id="" class="selectpicker show-tick form-control">
	                      	<option value="-1">选择状态</option>
					        <option value="0">正常</option>
					        <option value="1">删除</option>
				        </select>
		            </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <section class="panel">
                        <div class="panel-body">
							<div class="adv-table">
								<table class="display table table-bordered table-striped" id="dynamic-table">
									<thead>
										<tr>
											<th>Rendering engine</th>
											<th>Browser</th>
											<th>Platform(s)</th>
											<th class="hidden-phone">Engine version</th>
											<th class="hidden-phone">CSS grade</th>
										</tr>
									</thead>
									<tbody>
										<tr class="gradeX">
											<td>Trident</td>
											<td>Internet Explorer 4.0</td>
											<td>Win 95+</td>
											<td class="center hidden-phone">4</td>
											<td class="center hidden-phone">X</td>
										</tr>
										<tr class="gradeX">
											<td>Trident</td>
											<td>Internet Explorer 4.0</td>
											<td>Win 95+</td>
											<td class="center hidden-phone">4</td>
											<td class="center hidden-phone">X</td>
										</tr>
										<tr class="gradeX">
											<td>Trident</td>
											<td>Internet Explorer 4.0</td>
											<td>Win 95+</td>
											<td class="center hidden-phone">4</td>
											<td class="center hidden-phone">X</td>
										</tr>
										<tr class="gradeX">
											<td>Trident</td>
											<td>Internet Explorer 4.0</td>
											<td>Win 95+</td>
											<td class="center hidden-phone">4</td>
											<td class="center hidden-phone">X</td>
										</tr>
										<tr class="gradeX">
											<td>Trident</td>
											<td>Internet Explorer 4.0</td>
											<td>Win 95+</td>
											<td class="center hidden-phone">4</td>
											<td class="center hidden-phone">X</td>
										</tr>
										<tr class="gradeX">
											<td>Trident</td>
											<td>Internet Explorer 4.0</td>
											<td>Win 95+</td>
											<td class="center hidden-phone">4</td>
											<td class="center hidden-phone">X</td>
										</tr>
										<tr class="gradeX">
											<td>Trident</td>
											<td>Internet Explorer 4.0</td>
											<td>Win 95+</td>
											<td class="center hidden-phone">4</td>
											<td class="center hidden-phone">X</td>
										</tr>
										<tr class="gradeX">
											<td>Trident</td>
											<td>Internet Explorer 4.0</td>
											<td>Win 95+</td>
											<td class="center hidden-phone">4</td>
											<td class="center hidden-phone">X</td>
										</tr>
										<tr class="gradeX">
											<td>Trident</td>
											<td>Internet Explorer 4.0</td>
											<td>Win 95+</td>
											<td class="center hidden-phone">4</td>
											<td class="center hidden-phone">X</td>
										</tr>
										<tr class="gradeX">
											<td>Trident</td>
											<td>Internet Explorer 4.0</td>
											<td>Win 95+</td>
											<td class="center hidden-phone">4</td>
											<td class="center hidden-phone">X</td>
										</tr>
										<tr class="gradeX">
											<td>Trident</td>
											<td>Internet Explorer 4.0</td>
											<td>Win 95+</td>
											<td class="center hidden-phone">4</td>
											<td class="center hidden-phone">X</td>
										</tr>
										<tr class="gradeX">
											<td>Trident</td>
											<td>Internet Explorer 4.0</td>
											<td>Win 95+</td>
											<td class="center hidden-phone">4</td>
											<td class="center hidden-phone">X</td>
										</tr>
										<tr class="gradeX">
											<td>Trident</td>
											<td>Internet Explorer 4.0</td>
											<td>Win 95+</td>
											<td class="center hidden-phone">4</td>
											<td class="center hidden-phone">X</td>
										</tr>
										<tr class="gradeX">
											<td>Trident</td>
											<td>Internet Explorer 4.0</td>
											<td>Win 95+</td>
											<td class="center hidden-phone">4</td>
											<td class="center hidden-phone">X</td>
										</tr>
										<tr class="gradeX">
											<td>Trident</td>
											<td>Internet Explorer 4.0</td>
											<td>Win 95+</td>
											<td class="center hidden-phone">4</td>
											<td class="center hidden-phone">X</td>
										</tr>
										<tr class="gradeX">
											<td>Trident</td>
											<td>Internet Explorer 4.0</td>
											<td>Win 95+</td>
											<td class="center hidden-phone">4</td>
											<td class="center hidden-phone">X</td>
										</tr>
										<tr class="gradeX">
											<td>Trident</td>
											<td>Internet Explorer 4.0</td>
											<td>Win 95+</td>
											<td class="center hidden-phone">4</td>
											<td class="center hidden-phone">X</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
        			</section>
                </div>
            </div>
        </div>
        <!--body wrapper end-->

        <!--footer section start-->
        <footer>
            2016 &copy; BBS, Model by ThemeBucket
        </footer>
        <!--footer section end-->


    </div>
    <!-- main content end-->
</section>
	<#include "../common/footer.ftl">
</body>
</html>

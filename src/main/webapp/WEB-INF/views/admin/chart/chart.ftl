<#include "../common/page.ftl">
<!DOCTYPE html>
<html lang="en">
<head>
	<#include "../common/import.ftl">
  	<title>统计图表</title>
</head>

<body class="sticky-header">

<section>
    
    <#include "../common/menu.ftl">
    
    <!-- main content start-->
    <div class="main-content" >

        <#include "../common/header.ftl">

        <!--body wrapper start-->
        <div class="wrapper">
            <div class="row">
                <div class="col-sm-12">
                    <section class="panel">
                        <header class="panel-heading">
                          	  用户相关统计
                        <span class="tools pull-right">
                            <a href="javascript:;" class="fa fa-chevron-down"></a>
                         </span>
                        </header>
                        <div class="panel-body">

                            <div class="chart">
                                <div id="chart1" style="width: 100%;height:400px;"></div>
                            </div>

                        </div>
                    </section>
                </div>
            </div>
            
            <div class="row">
                <div class="col-sm-12">
                    <section class="panel">
                        <header class="panel-heading">
                           	主题回复相关统计
                        <span class="tools pull-right">
                            <a href="javascript:;" class="fa fa-chevron-down"></a>
                         </span>
                        </header>
                        <div class="panel-body">

                            <div class="chart">
                                <div id="chart2" style="width: 100%;height:400px;"></div>
                            </div>

                        </div>
                    </section>
                </div>
            </div>
            
            <div class="row">
                <div class="col-sm-12">
                    <section class="panel">
                        <header class="panel-heading">
                           	版块点击统计
                        <span class="tools pull-right">
                            <a href="javascript:;" class="fa fa-chevron-down"></a>
                         </span>
                        </header>
                        <div class="panel-body">

                            <div class="chart">
                                <div id="chart3" style="width: 100%;height:400px;"></div>
                            </div>

                        </div>
                    </section>
                </div>
            </div>
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
	<script type="text/javascript" src="${path}/resources/static/echarts/echarts.min.js"></script>
	<script type="text/javascript" src="${path}/resources/js/admin/chart.js"></script>
	<#include "../common/footer.ftl">
</body>
</html>
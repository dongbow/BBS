
$(document).ready(function() {
	chartData(7, '', '');
});

function chartData(day, start, end) {
	$.post(ROOT + '/system/admin/chart/data', {
		"day": day,
		'start': start,
		'end': end
	}, function(result) {
		drawChart(result);
	});
}

var myChart;
var myChart2;
var myChart3;

function drawChart(result) {
	myChart = echarts.init(document.getElementById('chart1'));

	// 指定图表的配置项和数据
	var option = {
		    tooltip : {
		        trigger: 'axis',
		        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
		            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
		        }
		    },
		    legend: {
		        data:['每日签到','每日新用户']
		    },
		    grid: {
		        left: '3%',
		        right: '4%',
		        bottom: '3%',
		        containLabel: true
		    },
		    xAxis : [
		        {
		            type : 'category',
		            data : result.date
		        }
		    ],
		    yAxis : [
		        {
		            type : 'value'
		        }
		    ],
		    series : [
		        {
		            name:'每日签到',
		            type:'bar',
		            data:result.sign
		        },
		        {
		            name:'每日新用户',
		            type:'bar',
		            data:result.user
		        }
		    ]
		};
	// 使用刚指定的配置项和数据显示图表。
	myChart.setOption(option);
	
	myChart2 = echarts.init(document.getElementById('chart2'));
	var option2 = {
		    tooltip: {
		        trigger: 'axis'
		    },
		    legend: {
		        data:['每日主题','每日回复']
		    },
		    grid: {
		        left: '3%',
		        right: '4%',
		        bottom: '3%',
		        containLabel: true
		    },
		    toolbox: {
		        feature: {
		            saveAsImage: {}
		        }
		    },
		    xAxis: {
		        type: 'category',
		        boundaryGap: false,
		        data: result.date
		    },
		    yAxis: {
		        type: 'value'
		    },
		    series: [
		        {
		            name:'每日主题',
		            type:'line',
		            stack: '总量',
		            data:result.topic
		        },
		        {
		            name:'每日回复',
		            type:'line',
		            stack: '总量',
		            data:result.reply
		        }
		    ]
		};
	myChart2.setOption(option2);
	
	myChart3 = echarts.init(document.getElementById('chart3'));
	var option3 = {
	    title : {
	        text: '版块点击量',
	        subtext: '热门版块',
	        x:'center'
	    },
	    tooltip : {
	        trigger: 'item',
	        formatter: "{a} <br/>{b} : {c} ({d}%)"
	    },
	    legend: {
	        orient: 'vertical',
	        left: 'left',
	        data: result.boardname
	    },
	    series : [
	        {
	            name: '访问来源',
	            type: 'pie',
	            radius : '55%',
	            center: ['50%', '60%'],
	            data:result.clicks,
	            itemStyle: {
	                emphasis: {
	                    shadowBlur: 10,
	                    shadowOffsetX: 0,
	                    shadowColor: 'rgba(0, 0, 0, 0.5)'
	                }
	            }
	        }
	    ]
	};
	myChart3.setOption(option3);

}

window.onresize = function() {
	myChart.resize();
	myChart2.resize();
	myChart3.resize();
}


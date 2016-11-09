<#assign path="${request.contextPath}">
<style type="text/css">
#checktip{
	padding:10px;
	background: rgba(228,231,233,0.2);
	position: fixed;
	border-radius:10px;
	top:100px;
	left:100px;
	z-index: 1000;
}

#checktip .tipcont{
	width:100%;
	height:100%;
	background: #fff;
}

#checktip .tiptitle{
	width:auto;
	height:20px;
	padding:5px 10px;	
}

#checktip .tiptitle a{
	display:block;
	color:#19b4ea;
	font: 16px "microsoft yahei";
	float: left;
}

#checktip .tiptitle a.tipclose{
	color:#fff;
	float: right;
	font-size: 12px;
	padding: 1px 5px;
	background: #999;
	border-radius: 3px;
}

#checktip .tiptitle a.tipclose:hover{
	background: #f44;
}

#checktip p{
	margin-top:20px;
	text-align:center;
	color:#333;
	padding:5px;
	font: 16px "microsoft yahei";
}
</style>
<div id="checktip" style="width:400px;height:150px;">
    <div class="tipcont">
        <div class="tiptitle">
        	<a class="titlename">系统提示</a>
        	<a title="关闭" class="tipclose" href="javascript:;">X</a>
        </div>
     	<p class="context">
     		${errorMsg}
     	</p>
    </div>
</div>
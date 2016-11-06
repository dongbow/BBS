<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/import.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="ThemeBucket">
    <link rel="shortcut icon" href="${path}/resources/images/favicon.ico" type="image/png">

    <title>Login</title>

    <link href="${path}/resources/static/admin/css/style.css" rel="stylesheet">
    <link href="${path}/resources/static/admin/css/style-responsive.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="${path}/resources/static/admin/js/html5shiv.js"></script>
    <script src="${path}/resources/static/admin/js/respond.min.js"></script>
    <![endif]-->
</head>

<body class="login-body">

<div class="container">

    <form class="form-signin">
        <div class="form-signin-heading text-center">
            <h1 class="sign-title">Sign In</h1>
            <a href="${path}">
            	<img src="${path}/resources/static/admin/images/login-logo.png" alt="LOGO"/>
            </a>
        </div>
        <div class="login-wrap">
        	<div class="alert alert-block alert-danger fade in" style="display:none;">
            </div>
            <input type="text" id="name" class="form-control" placeholder="用户名" >
            <input type="password" id="password" class="form-control" placeholder="密码" >

            <a id="dologin" class="btn btn-lg btn-login btn-block" >
                <i class="fa fa-check"></i>
            </a>

            <label class="checkbox">
                <input id="remember" class="" type="checkbox" value="0"> 记住登录状态
                <span class="pull-right">
                    <a data-toggle="modal" href="${path}/account/forget"> 忘记密码?</a>
                </span>
            </label>

        </div>

    </form>

</div>

<script src="${path}/resources/static/admin/js/jquery-1.10.2.min.js"></script>
<script src="${path}/resources/static/admin/js/bootstrap.min.js"></script>
<script src="${path}/resources/static/admin/js/modernizr.min.js"></script>
<script src="${path}/resources/static/admin/js/jquery.validate.min.js"></script>
<script src="${path}/resources/static/jquery/jquery.md5.js"></script>
<script src="${path}/resources/js/admin/account/login.js"></script>
</body>
</html>
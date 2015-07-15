<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!doctype html>
<html>
	<head>
		<base href="<%=basePath%>">
		<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
		<title>无线城市-后台-运营商登录页</title>
		<meta name="keywords" content="">
		<meta name="description" content="">
		<link type="text/css" href="css/reset.css" rel="stylesheet">
		<style type="text/css">
			.loginpage{background:#282828;}
			.loginpanel { position: absolute; top: 50%; left: 50%; height: 300px; }
			.loginpanelinner { position: relative; top: -170px; left: -50%; }
			.loginpanelinner .logo {color:#fff; font-weight:700;font-size:28px; text-align: center; padding: 20px 0;font-family:Viner Hand ITC,hakuyoxingshu7000,Kunstler Script; }
			.inputwrapper input { border: 0; padding: 10px; background: #fff; width: 250px; }
			.inputwrapper .submit {margin-top:10px;display: block; padding: 10px 0; background: #28b779; width: 100%;color: #fff;}
			.inputwrapper .submit:hover{background:#1e90ff;}
			.login-alert {visibility:hidden;}
			.login-alert .alert { color:#fff;font-size: 11px; text-align: center; padding: 5px 0; border: 0; }
			.inputwrapper label {display: inline-block; margin-top: 10px; color: rgba(255,255,255,0.8); font-size: 11px; vertical-align: middle; }
			.inputwrapper label input { width: auto; margin: -3px 5px 0 0; vertical-align: middle; }
			.inputwrapper .remember { padding: 0; background: none; }		
		</style>
		<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
	</head>
<body class="loginpage">
	<div class="loginpanel">
	    <div class="loginpanelinner">
	        <div class="logo">Wireless City</div>
	        <form id="login" action="index.html" method="post">
	            <div class="inputwrapper login-alert">
	                <div class="alert alert-error">Invalid username or password</div>
	            </div>
	            <div class="inputwrapper">
	                <input type="text" name="username" id="username" autocomplete="off" placeholder="请输入用户名" />
	            </div>
	            <div class="inputwrapper">
	                <input type="password" name="password" id="password" autocomplete="on" placeholder="请输入密码" />
	            </div>
	            <div class="inputwrapper">
	                <a id="login" class="submit" href="CatalogueAction_toCatalogueManagerPage">登录</a>
	            </div>
	            <div class="inputwrapper">
	                <label><input type="checkbox" class="remember" name="signin" /> 记住密码</label>
	            </div>
	            
	        </form>
	    </div>
	</div>
	<script type="text/javascript">
		$(function(){
			
		});
	</script>
</body>
</html>
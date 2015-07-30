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
		<title>无线城市-登陆页</title>
		<meta name="keywords" content="关键词,关键词">
		<meta name="description" content="">
		<link href="css/reset.css" rel="stylesheet">
		<link href="css/front_default_style.css" rel="stylesheet">
		<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
		<script type="text/javascript" src="js/util.js"></script>
	</head>
<body>
	<div class="login_wrapper">
		<div class="w_center">
			<div class="w_login">
				<div class="login_header">
					<div class="header_pic iconfont">&#xe604;</div>
					<div class="header_text">Welcome to Wireless City</div>
				</div>
				<div class="l_message" id="message"></div>
				<div class="l_select" id="userType">
					<label><input type="radio" value="0" name="usertype" checked/>消费者</label>
					<label><input type="radio" value="1" name="usertype">服务商</label>
				</div>
				<form id="l_form">
					<div class="login_body">
						<div class="input" style="border-bottom:0px;">
							<span class="span1 iconfont">&#xe608;</span><input autofocus autocomplete="off" id="username" type="text" placeholder="用户名"/>
						</div>
						<div class="input" style="border-top:0px;">
							<span class="span2 iconfont">&#xe609;</span><input autocomplete="off" id="password"  style="border-top:1px solid #999;" type="password" placeholder="密码"/>
						</div>
						<label>
							<span class="select iconfont" data-sel="0" id="sel"></span>
							<span class="login_free">下次自动登录</span>
							<span class="forget">没有账号？<a href="front/register.jsp">立即注册</a></span>
						</label>
						<div class="loginbox" id="submit">登 录</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script src="js/default_fn.js"></script>
	<script type="text/javascript">
		$(function(){
			loginSelf();
			loginValidate();
		});
	</script>
</body>
</html>
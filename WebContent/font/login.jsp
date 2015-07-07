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
		<!--css,js-->
		<link type="text/css" href="css/reset.css" rel="stylesheet">
		<style type="text/css">
			::selection{background-color:#61cbd7;}
			*{margin:0px;padding:0px;}
			input{border:0;}
			img{display:block;}
			.login_wrapper .w_center{width:100%;position:relative;}
			.login_wrapper .w_center .w_login{border:1px solid #555;width:400px;position:absolute;top:120px;right:100px;background:#fdfdfd;box-shadow:-0px 05px 4em #000;}
			.login_wrapper .w_center .w_login .login_header{width:400px;height:85px;}
			.login_wrapper .w_center .w_login .login_header .header_pic{background:url(images/login.png) no-repeat;width:25px;height:25px;margin:30px 22px;float:left;}
			.login_wrapper .w_center .w_login .login_header .header_text{font-family:Viner Hand ITC;float:left;height:85px;line-height:85px;font-size:22px;font-weight:bold;}
			.login_wrapper .w_center .w_login .l_select{font-size:14px;margin-left:22px;height:20px;line-height:20px;}
			.login_wrapper .w_center .w_login .l_select label{width:67px;display:block;float:left;}
			.login_wrapper .w_center .w_login .l_message{display:none;idth:360px;height:40px;position:absolute;top:20px;left:20px;color:red;background:#faffbd;border-radius:5px;line-height:40px;text-align:center;font-size:12px;}
			.login_wrapper .w_center .w_login .login_body{width:360px;margin:22px;}
			.login_wrapper .w_center .w_login .login_body .input{height:63px;border:1px solid #666;}
			.login_wrapper .w_center .w_login .login_body input{background:#fdfdfd;width:312px;height:62px;float:left;line-height:62px;}
			.login_wrapper .w_center .w_login .login_body .input span{display:block;width:18px;height:18px;float:left;margin:22px 3px;background:url(images/sprite_1.png) no-repeat;}
			.login_wrapper .w_center .w_login .login_body .input .span1{background-position:0 -460px;}
			.login_wrapper .w_center .w_login .login_body .input .span2{background-position:-35px -460px;}
			.login_wrapper .w_center .w_login .login_body label{font-size:12px;width:360px;height:48px;display:block;line-height:48px;}
			.login_wrapper .w_center .w_login .login_body label .select{width:14px;height:14px;margin:16px 5px 0px 0px;display:block;border:1px solid #666;float:left;background:url(images/icon.gif) no-repeat -113px 0px;float:left;cursor:pointer;}
			.login_wrapper .w_center .w_login .login_body label .login_free{float:left;}
			.login_wrapper .w_center .w_login .login_body label .forget{float:right;}
			.login_wrapper .w_center .w_login .login_body label .forget a {color:#007aa6;}
			.login_wrapper .w_center .w_login .login_body label .forget a:hover{text-decoration:underline;}
			.login_wrapper .w_center .w_login .login_body .login{cursor:pointer;height:52px;width:340px;margin-left:11px;background:url(images/sprite_1.png) no-repeat 0 0;}
			.login_wrapper .w_center .w_login .login_body .login:hover{background-position:0 -52px;}
		</style>
		<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
		<script type="text/javascript" src="js/yjutil.js"></script>
	</head>
<body>
	<div class="login_wrapper">
		<div class="w_center">
			<!-- <img width="100%" height="322" alt="" src="images/login_bottom.jpg"/>
			<img width="100%" height="322" alt="" src="images/login_top.jpg"/> -->
			<img id="bg" width="100%" height="" alt="" src="images/Kid_bg.jpg"/>
			<div class="w_login">
				<div class="login_header">
					<div class="header_pic"></div>
					<div class="header_text">Welcome to Wireless City</div>
				</div>
				<div class="l_message"></div>
				<div class="l_select">
					<label><input type="radio" value="消费者" name="usertype" checked/>消费者</label>
					<label><input type="radio" value="服务商" name="usertype">服务商</label>
				</div>
				<form id="l_form">
					<div class="login_body">
						<div class="input" style="border-bottom:0px;">
							<span class="span1"></span><input autocomplete="on" id="l_username" name="username" type="text" placeholder="用户名"/>
						</div>
						<div class="input" style="border-top:0px;">
							<span class="span2"></span><input autocomplete="off" id="l_password" name="password" style="border-top:1px solid #666;" type="password" placeholder="密码"/>
						</div>
						<label>
							<span class="select" data-sel="0" id="sel"></span>
							<span class="login_free">七天免登录</span>
							<span class="forget">没有账号？<a href="register.jsp">立即注册</a></span>
						</label>
						<div class="login" id="l_sure"></div>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
		$(function(){
			$("#l_username").focus();
			$("#sel").on("click",function(){
				var sel=$(this).data("sel");
				if(sel==0){
					$(this).css("backgroundPosition","-113px -19px");$(this).data("sel","1");
				}else{
					$(this).data("sel","0");$(this).css("backgroundPosition","-113px 0px");
				}
			});
			setBgHeight();
		});
		function setBgHeight(){
			var height=getHeight();
			$("#bg").height(height);
		}
	</script>
</body>
</html>
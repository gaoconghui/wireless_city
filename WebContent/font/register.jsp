<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!doctype html>
<html>
	<head>
		<base href="<%=basePath%>">
		<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
		<title>无线城市-注册页</title>
		<meta name="keywords" content="关键词,关键词">
		<meta name="description" content="">
		<link href="css/reset.css" rel="stylesheet">
		<link href="css/front_default_style.css" rel="stylesheet">
		<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
		<script type="text/javascript" src="js/placeholder.js"></script>
		<script type="text/javascript" src="js/util.js"></script>
	</head>
<body>
	<!-- header begin-->
	<s:include value="header.jsp"></s:include>
	<!-- header end-->
	<div class="layout-1-hd">
		<div class="main-head">
			<h1 class="title">注册无线城市帐号</h1>
		</div>
		<div class="reg">
			<div class="l_left">
				<div class="l_choices">
					<div class="c_ask">施主你是？</div>
					<div class="c_response">
						<div class="c_sel" id="c_sel">
							<label><input type="radio" name="s_icon" checked="checked" value="0"/>消费者</label>
							<label><input type="radio" name="s_icon" value="1"/>服务商</label>
						</div>
						
						<div class="c_table" id="c_table">
							<div class="t_buyer" id="t_buyer">
								<form id="userform">
									<input type="text" id="user_name" autofocus name="name" placeholder="账号"/>
									<div class="infomation">
										<span class="icon iconfont"></span>
										<span class="info" data-content="2~20个字符"></span>
									</div>
									<input type="password"  name="loginPwd" placeholder="密码"/>
									<div class="infomation">
										<span class="icon iconfont"></span>
										<span class="info" data-content="6~16个字符"></span>
									</div>
									<input type="password"  name="confirmPwd" placeholder="确认密码"/>
									<div class="infomation">
										<span class="icon iconfont"></span>
										<span class="info" data-content="确认密码"></span>
									</div>
									<input type="text"  name="phoneNumber" placeholder="手机"/>
									<div class="infomation">
										<span class="icon iconfont"></span>
										<span class="info" data-content="11位大陆手机号码,暂不支持海外手机"></span>
									</div>
									<input type="text"  name="realName" placeholder="真实姓名"/>
									<div class="infomation">
										<span class="icon iconfont"></span>
										<span class="info" data-content="真实姓名一旦确认不可修改"></span>
									</div>
									<input type="text"  name="email" placeholder="邮箱"/>
									<div class="infomation">
										<span class="icon iconfont"></span>
										<span class="info" data-content="如：12345@sina.com"></span>
									</div>
								</form>
								<p>点击注册按钮，即同意<a href="javascript:void(0)">注册协议</a></p>
							</div>
							<div class="t_salor" id="t_salor">
								<form id="providerform">
									<input type="text" id="provider_name" name="loginName" placeholder="账号"/>
									<div class="infomation">
										<span class="icon iconfont"></span>
										<span class="info" data-content="2~20个字符"></span>
									</div>
									<input type="password"  name="loginPwd" placeholder="密码"/>
									<div class="infomation">
										<span class="icon iconfont"></span>
										<span class="info" data-content="6~16个字符"></span>
									</div>
									<input type="password"  name="confirmPwd" placeholder="确认密码"/>
									<div class="infomation">
										<span class="icon iconfont"></span>
										<span class="info" data-content="确认密码"></span>
									</div>
									<input type="text"  name="name" placeholder="企业名称"/>
									<div class="infomation">
										<span class="icon iconfont"></span>
										<span class="info" data-content="如：XXX企业"></span>
									</div>
									<input type="text"  name="scale" placeholder="规模"/>
									<div class="infomation">
										<span class="icon iconfont"></span>
										<span class="info" data-content="如：1~100人"></span>
									</div>
									<input type="text"  name="industry" placeholder="行业"/>
									<div class="infomation">
										<span class="icon iconfont"></span>
										<span class="info" data-content="如：零售业"></span>
									</div>
									<input type="text"  name="address" placeholder="具体地址"/>
									<div class="infomation">
										<span class="icon iconfont"></span>
										<span class="info" data-content="如：XX省XX市XX区XX楼XX室;请具体到门户号"></span>
									</div>
									<%-- <input type="text"  name="salor_mailcode" placeholder="网址"/>
									<div class="infomation">
										<span class="icon iconfont"></span>
										<span class="info" data-content="如：http://www.wirelesscity.com;以http(s)://开头"></span>
									</div> --%>
									<input type="text"  name="postcode" placeholder="邮编"/>
									<div class="infomation">
										<span class="icon iconfont"></span>
										<span class="info" data-content="如：400071"></span>
									</div>
									<input type="text"  name="telephone" placeholder="固话"/>
									<div class="infomation">
										<span class="icon iconfont"></span>
										<span class="info" data-content="如：0591-85931970"></span>
									</div>
									<input type="text"  name="cellphone" placeholder="手机"/>
									<div class="infomation">
										<span class="icon iconfont"></span>
										<span class="info" data-content="11位大陆手机号码,暂不支持海外手机"></span>
									</div>
									<input type="text"  name="email" placeholder="邮箱"/>
									<div class="infomation">
										<span class="icon iconfont"></span>
										<span class="info" data-content="如：1234@163.com"></span>
									</div>
									<input type="text"  name="fax" placeholder="传真"/>
									<div class="infomation">
										<span class="icon iconfont"></span>
										<span class="info" data-content="如：0591-85931970"></span>
									</div>
									<input type="text"  name="qq" placeholder="客服QQ"/>
									<div class="infomation">
										<span class="icon iconfont"></span>
										<span class="info" data-content="如：11111111"></span>
									</div>
									<div class="desc">
										<div class="desc_main">简介:</div>
										<textarea name=""></textarea>
									</div>
									<div class="logo">
										<div class="logo_uplode">上传logo</div>
										<div class="logo_pic" title="logo展示区">
											<img src="images/list_demo.jpg" width="100" height="100" alt="企业logo"/>
										</div>
									</div>
									<div class="infomation" style="margin-top:10px;display:block;">
										<span class="icon iconfont"></span>
										<span class="info">上传文件格式为：png/gif/jpg;建议小于100kb;</span>
									</div>
									
								</form>
								<p>点击注册按钮，即同意<a href="javascript:void(0)">注册协议</a></p>
							</div>
						</div>
						<div class="c_register" id="submit">立即注册</div>
					</div>
				</div>
			</div>
			<div class="l_right">
				<p>已有账号？<a href="font/login.jsp">立即登录</a></p>
				<p>使用合作网站账号登录</p>
				<span class="weibo iconfont">&#xe60e;</span>
				<span class="QQ iconfont">&#xe60d;</span>
				<div class="clear"></div>
				<a class="r_question" href="javascript:void(0)">无法注册？点这里试试</a>
			</div>
			<div class="clear"></div>
		</div>
	</div>
	<!-- bottom begin -->
	<s:include value="bottom.jsp"></s:include>
	<!-- bottom end -->
	<!-- login_box begin -->
	<s:include value="login_box.jsp"></s:include>
	<!-- end login_box -->
	<script type="text/javascript" src="js/default_fn.js"></script>
	<script type="text/javascript">
		$(function(){
			loginBoxShow();
			loginValidator();
			init();
			registerValidate();
			changeUsertype();
		});
		
	</script>
</body>
</html>
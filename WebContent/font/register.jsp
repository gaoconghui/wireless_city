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
		<!--css,js-->
		<link type="text/css" href="css/reset.css" rel="stylesheet">
		<style type="text/css">
			/*header beign*/
			::selection {color: #fff;background: #f99750;}
			body{background:#fafafa;cursor:default;color:#444;}
			.title_fixed{width:100%;height:26px;background:#fafafa;}
			.title_fixed .s_right{float:right;width:400px;font-size:12px;line-height:26px;}
			.title_fixed .s_right .r_login,.r_register{width:50px;height:43px;float:right;cursor:pointer;}
			.title_fixed .s_right .r_login,.r_register a{color:#444;}
			.header{width:100%;background:#fff;height:100px;}
			.header .h_fir{width:1200px;height:80px;margin:0px auto;}
			.header .h_fir .f_logo{width:188px;height:50px;margin:10px 100px 0px 25px; background:url(images/logo.png) no-repeat;float:left;}
			.header .h_fir .f_search{width:600px;height:60px;float:left;}
			.header .h_fir .f_search .s_hot{width:500px;height:20px;line-height:20px;color:#666;}
			.header .h_fir .f_search .s_hot a{margin-left:10px;color:#666;}
			.header .h_fir .f_search .s_hot a:hover{color:#b61d1d;}
			.header .h_fir .f_search .s_input{width:500px;height:42px;margin-top:8px;}
			.header .h_fir .f_search .s_input input:first-child{width:400px;height:40px;border:2px solid #b61d1d;border-right:0;line-height:40px;color:#666;padding-left:10px;display:block;float:left;}
			.header .h_fir .f_search .s_input .i_btn{width:80px;height:44px;background:#b61d1d;color:#fff;line-height:40px;text-align:center;font-size:16px; border:0;float:left;cursor:pointer;}
			.header .h_fir .f_search .s_input .i_btn:hover{background:#c81623;}
			.header .h_fir .f_contact{float:left;width:250px;height:70px;line-height:70px; }
			.header .h_fir .f_contact .c_fir{width:250px;height:70px; color:#b61d1d;font-size:18px;font-weight:400;}
			.header .h_fir .f_contact .c_fir .f_icon{width:20px;height:20px;background:url(images/wireless_icon.png) no-repeat -24px -1px; display:block;margin:25px 5px 0px 5px;float:left;}
			.header .h_fir .f_contact .c_fir .f_text{float:left;}
		/*header end*/
			
			.layout-1-hd{width:900px;margin:40px auto;background:#fff;border:1px solid #dedede;}
			.layout-1-hd .main-head .title{font-size:30px;width:900px;height:100px;text-align:center;font-weight:normal;line-height:100px;border-bottom:1px solid #dedede;}

			.layout-1-hd .reg{width:900px;}
			.layout-1-hd .reg .l_left{width:648px;float:left;}
			.layout-1-hd .reg .l_left .l_choices{width:300px;margin-left:174px;margin-top:20px;}
			.layout-1-hd .reg .l_left .l_choices .c_ask{height:30px;line-height:30px; }
			.layout-1-hd .reg .l_left .l_choices .c_response{width:300px;}
			.layout-1-hd .reg .l_left .l_choices .c_response .c_sel label{margin-right:80px;}
			.layout-1-hd .reg .l_left .l_choices .c_response .c_sel label input{vertical-align:middle;margin-right:10px;}
			.layout-1-hd .reg .l_left .l_choices .c_response .c_table{position:relative;width:300px;}
			.layout-1-hd .reg .l_left .l_choices .c_response .c_table .t_buyer,.t_salor{width:300px; position:absolute;top:0;left:0;}
			.layout-1-hd .reg .l_left .l_choices .c_response .c_table .t_salor{display:none;}
			.layout-1-hd .reg .l_left .l_choices .c_response .c_table .t_salor .wrapper{width:295px;font-size:14px;color:#999;}
			.layout-1-hd .reg .l_left .l_choices .c_response .c_table .t_salor .wrapper .container{margin-top:20px;height:30px;}
			.layout-1-hd .reg .l_left .l_choices .c_response .c_table .t_salor .wrapper .container select option{color:#999;}
			.layout-1-hd .reg .l_left .l_choices .c_response .c_table .t_salor .wrapper .container span{width:43px;height:32px;line-height:30px;float:left;display:block;text-align:center;}
			.layout-1-hd .reg .l_left .l_choices .c_response .c_table .t_salor .wrapper .container select{width:250px;height:30px;float:left;}


			
			.layout-1-hd .reg .l_left .l_choices .c_response .c_table  input{width:295px;height:30px;line-height:30px;padding-left:5px;margin-top:20px;color:#666;border:1px solid #ccc;border-radius:3px;-webkit-border-radius:3px;display:block;}

			.layout-1-hd .reg .l_left .l_choices .c_response .c_table .desc textarea{resize:none;display:block;border-radius:3px;-webkit-border-radius:3px;padding-left:5px;overflow-y:hidden;line-height:30px;color:#666;font-size:14px;width:295px;height:100px;border:1px solid #ccc;}

			.layout-1-hd .reg .l_left .l_choices .c_response .c_table .desc .desc_main{ line-height:30px;font-size:14px;color:#999;padding-left:5px;}
			.layout-1-hd .reg .l_left .l_choices .c_response .c_table .logo_uplode{cursor:pointer;border-radius:3px;-webkit-border-radius:3px;width:80px;height:30px;background:#0181ec;;color:#fff;line-height:30px;text-align:center;margin-top:10px;}
			.layout-1-hd .reg .l_left .l_choices .c_response .c_table .logo_pic{margin-top:10px;}
			
			.layout-1-hd .reg .l_left .l_choices .c_response .c_table  p{height:30px;line-height:30px;margin-top:20px;}
			.layout-1-hd .reg .l_left .l_choices .c_response .c_table  p a{color:#0181ec;}
			.layout-1-hd .reg .l_left .l_choices .c_response .c_register{width:300px;height:30px;background:#b61d1d;color:#fff;line-height:30px;text-align:center;border:1px solid #b61d1d;border-radius:3px;-webkit-border-radius:3px;cursor:pointer;margin-bottom:30px;}

			.layout-1-hd .reg .l_right{width:251px;height:350px;float:left;border-left:1px dotted #ccc;margin-top:17px; }
			.layout-1-hd .reg .l_right p{width:200px;height:30px;line-height:30px; font-weight:700;padding:10px 0 0 25px;}
			.layout-1-hd .reg .l_right p a{color:#0181ec;cursor:pointer;}
			.layout-1-hd .reg .l_right span{background:url(images/wireless_icon.png) no-repeat;width:45px;height:45px; float:left;margin-left:25px;display:block;margin-top:10px;}
			.layout-1-hd .reg .l_right .weibo{background-position:1px -31px;}
			.layout-1-hd .reg .l_right .weibo:hover{background-position:-51px -31px;}
			.layout-1-hd .reg .l_right .QQ{background-position:-102px -31px;}
			.layout-1-hd .reg .l_right .QQ:hover{background-position:-157px -31px;}
			.layout-1-hd .reg .l_right .r_question{width:150px;height:20px;line-height:20px;color:#0181ec;display:block;margin:190px 0 0 100px;}


		</style>
		<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
		<script type="text/javascript" src="js/placeholder.js"></script>
		<script type="text/javascript" src="js/yjutil.js"></script>
	</head>
<body>
	<!-- header begin-->
	<div class="title_fixed">
		<div class="s_right" id="s_right">
			<div class="r_login">登录</div>
			<div class="r_register"><a href="wireless_register.html">注册</a></div>
		</div>
	</div>
	<div class="header">
		<div class="h_fir">
			<div class="f_logo"></div>
			<div class="f_search">
				<div class="s_input">
					<input type="text" placeholder="找服务资源" />
					<div class="i_btn">搜索</div>
				</div>
				<div id="clear"></div>
				<div class="s_hot">
					<span>热词：</span>
					<a href="javascript:void(0)">热词</a>
					<a href="javascript:void(0)">热词</a>
					<a href="javascript:void(0)">热词</a>
					<a href="javascript:void(0)">热词</a>
					<a href="javascript:void(0)">热词</a>
					<a href="javascript:void(0)">热词</a>
					<a href="javascript:void(0)">热词</a>
				</div>
			</div>
			<div class="f_contact">
				<div class="c_fir">
					<span class="f_icon"></span>
					<span class="f_text">问题咨询：027-01293604</span>
				</div>
			</div>
		</div>
	</div>
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
							<label><input type="radio" name="s_icon" checked="checked" value="buyer"/>消费者</label>
							<label><input type="radio" name="s_icon" value="salor"/>服务商</label>
						</div>
						
						<div class="c_table" id="c_table">
							<div class="t_buyer" id="t_buyer">
								<input type="text" id="buyer_name" name="username" placeholder="账号"/>
								<input type="password" id="buyer_password" name="password" placeholder="密码"/>
								<input type="password" id="buyer_password" name="password2" placeholder="确认密码"/>
								<input type="text"  name="buyer_cellphone" placeholder="手机"/>
								<input type="text"  name="buyer_realname" placeholder="真实姓名"/>
								<input type="text"  name="buyer_email" placeholder="邮箱"/>
								<p>点击注册按钮，即同意<a href="javascript:void(0)">注册协议</a></p>
							</div>
							<div class="t_salor" id="t_salor">
								<input type="text" id="salor_name" name="username" placeholder="账号"/>
								<input type="password" id="salor_password" name="password" placeholder="密码"/>
								<input type="password" id="buyer_password" name="password2" placeholder="确认密码"/>
								<input type="text"  name="salor_companyname" placeholder="企业名称"/>
								<input type="text"  name="salor_companyscale" placeholder="规模"/>
								<div class="wrapper">
									<div class="container">
										<span>行业:</span>
										<select id="tm_province">
											<option value="">-请选择-</option>
										</select>
									</div>
									<div class="container">
										<span>省份:</span>
										<select id="tm_province">
											<option value="">-请选择-</option>
										</select>
									</div>
									<div class="container">
										<span>城市:</span>
										<select id="tm_city">
											<option value="">-请选择-</option>
										</select>
									</div>
									<div class="container">
										<span>地区:</span>
										<select id="tm_area">
											<option value="">-请选择-</option>
											<option value="">-请选择-</option>
											<option value="">-请选择-</option>
											<option value="">-请选择-</option>
										</select>
									</div>
								</div>

								<input type="text"  name="salor_mailcode" placeholder="具体地址"/>
								<input type="text"  name="salor_mailcode" placeholder="网址"/>
								<input type="text"  name="salor_mailcode" placeholder="邮编"/>
								<input type="text"  name="salor_fixedphone" placeholder="固话"/>
								<input type="text"  name="salor_cellphone" placeholder="手机"/>
								<input type="text"  name="salor_email" placeholder="邮箱"/>
								<input type="text"  name="salor_email" placeholder="传真"/>
								<input type="text"  name="salor_realname" placeholder="联系人"/>
								<input type="text"  name="salor_realname" placeholder="客服QQ"/>
								
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
								
								<p>点击注册按钮，即同意<a href="javascript:void(0)">注册协议</a></p>
							</div>
						</div>
						<div class="c_register">立即注册</div>
					</div>
				</div>
			</div>
			<div class="l_right">
				<p>已有账号？<a>立即登录</a></p>
				<p>使用合作网站账号登录</p>
				<span class="weibo"></span>
				<span class="QQ"></span>
				<div id="clear"></div>
				<a class="r_question" href="javascript:void(0)">无法注册？点这里试试</a>
			</div>
			<div id="clear"></div>
		</div>
	</div>
	<!-- bottom begin -->
	<s:include value="bottom.jsp"></s:include>
	<!-- bottom end -->
	
	<script type="text/javascript">
		$(function(){
			init();
			initialize();
		});
		function initialize(){
			var height=$("#t_buyer").height();
			$("#c_table").height(height);
			$("input[placeholder]").placeholder();
			$("#buyer_name").focus();
			$("#c_sel").find("input").click(function(){
				var value=$("#c_sel").find("input:checked").val();
				if(value=="buyer"){
					var height=$("#t_buyer").height();
					$("#c_table").height(height);
					$("#t_buyer").show();
					$("#t_salor").hide();
				}else{
					var height=$("#t_salor").height();
					$("#c_table").height(height);
					$("#t_buyer").hide();
					$("#t_salor").show();
				}
			});
			$("#s_right").on("click",".r_login",function(){
				$("#yy,#login_page").show();
				$("#username").focus();
			});
			$("#login_close").on("click",function(){
				$("#login_page,#yy").hide();
			});
		}
	</script>
</body>
</html>
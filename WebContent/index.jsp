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
		<title>无线城市-主页（含登录页面）</title>
		<meta name="keywords" content="关键词,关键词">
		<meta name="description" content="">
		<!--css,js-->
		<link type="text/css" href="css/reset.css" rel="stylesheet">
		<style type="text/css">
		/*header beign*/
			::selection {color: #fff;background: #f99750;}
			body{background:#fafafa;cursor:default;}
			.title_fixed{width:100%;height:34px;line-height:34px;background:#fafafa;}
			.title_fixed .f_s{width:1200px;margin:0 auto;}
			.title_fixed .s_right{float:right;width:400px;font-size:12px;color:#444;}
			.title_fixed .s_right .r_login,.r_register{width:40px;height:34px;float:right;cursor:pointer;}
			.title_fixed .s_right .r_login,.r_register a{color:#444;}
			.header{width:100%;background:#fff;}
			.header .h_fir{width:1200px;height:80px;margin:0px auto;}
			.header .h_fir .f_logo{color:#188eee; font-weight:700;font-size:36px; text-align: center;font-family:Viner Hand ITC,hakuyoxingshu7000,Kunstler Script;width:141px;height:50px;margin:-31px 100px 0px 25px;float:left;}
			.header .h_fir .f_logo span{color:#ff8c00}
			.header .h_fir .f_search{width:508px;float:right;}
			.header .h_fir .f_search .s_input{width:500px;height:42px;margin-top:18px;}
			.header .h_fir .f_search .s_input input:first-child{width:400px;border:2px solid #188eee;height:40px;border-right:0;line-height:40px;color:#666;padding-left:10px;display:block;float:left;}
			.header .h_fir .f_search .s_input .i_btn{width:80px;height:44px;background:#188eee;color:#fff;line-height:44px;text-align:center;font-size:16px; border:0;float:left;cursor:pointer;}
			.header .h_fir .f_search .s_input .i_btn:hover{background:#1369c0;}
			.header .h_sec{width:100%;color:#333;font-size:16px;line-height:46px;border-bottom:2px solid #1369c0;}
			.header .h_sec .s_wrapper{width:1200px;height:46px;margin:0 auto;}
			.header .h_sec .s_wrapper .s_left{float:left;width:800px;}
			.header .h_sec .s_wrapper .s_left ul li{padding:0px 15px;height:46px;float:left;text-align:center;cursor:pointer;}
			.header .h_sec .s_wrapper .s_left ul .lidemo{background :#1369c0;color:#fff;}
		/*header end*/
		
		/*center begin*/
			.banner{width:100%;height:600px;margin:0px auto;}
			.banner .b_content{width:1200px;height:0px;position:relative;margin:0 auto;z-index:2;}
			.banner .b_content .c_info{width:200px;position:absolute;top:-48px;left:0px;color:#fff;font-size:14px;border-left:1px solid #3586f2;border-bottom:1px solid #3487f2;z-index:4;}
			.banner .b_content .c_info .left_nav li:first-child{font-size:16px;line-height:47px;font-weight:700;font-weight:700;}
			.banner .b_content .c_info .left_nav li{line-height:40px;background:#3586f2;border-top:1px solid #5aa1fe;border-bottom:1px solid #3487f2;}
			.banner .b_content .c_info .left_nav li:nth-child(even){background:#2075D3;}
			.banner .b_content .c_info .left_nav li:hover{background:#fff;color:#256dda;}
			.banner .b_content .c_info .left_nav li:first-child:hover{background:#3586f2;color:#fff;}
			.banner .b_content .c_info .left_nav li:after{content:"";display:block;clear:both;}
			.banner .b_content .c_info .left_nav li .i_icon{float:left;display:block;width:20px;height:20px;background:url(images/index_refactor.png) -68px -90px no-repeat;margin:12px 0px 0px 10px}
			.banner .b_content .c_info .left_nav li .i_desc{padding-left:10px;display:block;float:left;}
			.banner .b_content .c_info .left_nav li .i_more{display:block;float:right;position:relative;font-weight:100;padding-right:10px;}
			.banner .b_content .left_content{position:absolute;top:-1px;left:200px;z-index:3;}
			.banner .b_content .left_content li{padding:20px 40px;border:2px solid #4594fd;background:#fff;width:769px;position:absolute;top:1px;left:-1px;display:none;}
			.banner .b_content .left_content li .c_list{background:#c2d9f8;line-height:20px;padding:5px 10px;margin:5px;}
			.banner .b_content .left_content li .c_list .l_second_item{font-weight:700;float:left; width:100px;text-align:center;margin-top:5px;}
			.banner .b_content .left_content li .c_list .l_second_item .span1{height:20px;float:left;}
			.banner .b_content .left_content li .c_list .l_second_item .span2{width:20px;height:20px;float:right;}
			.banner .b_content .left_content li .c_list .l_third_item{float:left;width:550px;text-align:left;}
			.banner .b_content .left_content li .c_list:after{content:"";display:block;clear:both;}
			.banner .b_content .left_content li .c_list .l_third_item a{color:#444;margin-top:5px;display:inline-block;border-left:1px solid #ccc;padding:0 10px;height:20px;}
			
		/*center end*/
		/*login begin*/
			.login{z-index:11;width:574px;height:308px;position:fixed;background:#fff;box-shadow:0 3px 7px 2px rgba(0,0,0,.4);-webkit-box-shadow:0 3px 7px 2px rgba(0,0,0,.4);-webkit-border-radius:3px;border-radius:3px;top:50%;left:50%;margin-left:-287px;margin-top:-154px;display:none;}
			.login .l_header{width:550px;height:40px;padding-left:24px;border-bottom:1px solid #dedede;background:#fbfbfb;}
			.login .l_header h2{font-size:14px;width:520px;height:40px;line-height:40px;color:#666;float:left;}
			.login .l_header span{width:20px;height:20px;display:block;background:url(images/wireless_icon.png) no-repeat -50px -2px;float:left;margin-top:10px;cursor:pointer;}
			.login .l_header span:hover{background-position:-71px -2px;}
			.login .l_left{width:270px;height:190px;float:left;margin:17px 20px 0px 30px;}
			.login .l_left .l_message{width:258px;height:20px; line-height:20px;border:1px solid #242424;text-align:center;color:#242424;margin-bottom:10px;}
			
			.login .l_left .l_select label{height:30px;line-height:20px;width:76px;display:block;float:left;}
			
			.login .l_left .l_input{width:260px;margin-top:10px;}
			.login .l_left .l_input .input{margin-bottom:10px;width:255px;height:30px;border:1px solid #ccc;line-height:30px;padding-left:4px;display:block;}
			.login .l_left .l_input .l_sel{width:250px;height:30px;display:block;line-height:30px;}
			.login .l_left .l_input .l_sel .l_box{width:20px;height:20px;margin-top:5px;background:url(images/wireless_icon.png) no-repeat -93px 0px;float:left;cursor:pointer;}
			.login .l_left .l_input .l_sel .l_text{display:block;float:left;}
			.login .l_left .l_input .l_sel a{display:block;float:right;color:#0181ec;}
			.login .l_left .l_input .l_submit{width:70px;height:30px;line-height:30px;text-align:center;color:#fff;background:#242424;display:block;-webkit-border-radius:3px;border-radius:3px;margin:15px 0 0 93px;}
			.login .l_right{width:251px;height:190px;float:left;border-left:1px dotted #ccc;margin-top:17px; }
			.login .l_right p{width:200px;height:30px;line-height:30px; font-weight:700;padding:10px 0 0 25px;}
			.login .l_right p a{color:#0181ec;cursor:pointer;}
			.login .l_right span{background:url(images/wireless_icon.png) no-repeat;width:45px;height:45px; float:left;margin-left:25px;display:block;margin-top:10px;}
			.login .l_right .weibo{background-position:1px -31px;}
			.login .l_right .weibo:hover{background-position:-51px -31px;}
			.login .l_right .QQ{background-position:-102px -31px;}
			.login .l_right .QQ:hover{background-position:-157px -31px;}
			.login .l_right .r_question{width:150px;height:20px;line-height:20px;color:#0181ec;display:block;margin:40px 0 0 100px;}
		/*login end*/
		</style>
		<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
		<script type="text/javascript" src="js/yjutil.js"></script>
		<script type="text/javascript" src="js/placeholder.js"></script>
	</head>
<body>
	<!-- header begin-->
	<div class="title_fixed">
		<div class="f_s">
			<div class="s_right" id="s_right">
				<div class="r_login">登录</div>
				<div class="r_register"><a href="register.jsp">注册</a></div>
			</div>
		</div>
	</div>
	<div class="header">
		<div class="h_fir">
			<div class="f_logo"><span>W</span>ireless <span>C</span>ity</div>
			<div class="f_search">
				<div class="s_input">
					<input type="text" placeholder="找服务资源" />
					<div class="i_btn">搜索</div>
				</div>
				<div id="clear"></div>
			</div>
		</div>
		<div class="h_sec">
			<div class="s_wrapper">
				<div class="s_left">
					<ul id="nav_ul">
						<li style="width:60px;margin-left:212px;" class="lidemo">首页</li>
						<li>求职就业</li>
						<li>购物</li>
						<li>教育培训</li>
						<li>旅游频道</li>
						<li>便民服务</li>
					</ul>
				</div>
			</div>
		</div>		
	</div>
	<!-- header end-->
	<!-- center begin-->
	<div class="banner">
		<div class="b_content">
			<div class="c_info">
				<ul id="left_nav" class="left_nav">
					<li>
						<span class="i_icon"></span>
						<span class="i_desc">全部服务资源</span>
					</li>
					<li>
						<span class="i_desc">无线政务</span>
						<span class="i_more">&gt;</span>
					</li>
					<li>
						<span class="i_desc">无线政务</span>
						<span class="i_more">&gt;</span>
					</li>
					<li>
						<span class="i_desc">无线政务</span>
						<span class="i_more">&gt;</span>
					</li>
					<li>
						<span class="i_desc">无线政务</span>
						<span class="i_more">&gt;</span>
					</li>
					<li>
						<span class="i_desc">无线政务</span>
						<span class="i_more">&gt;</span>
					</li>
					<li>
						<span class="i_desc">无线政务</span>
						<span class="i_more">&gt;</span>
					</li>
					<li>
						<span class="i_desc">无线政务</span>
						<span class="i_more">&gt;</span>
					</li>
					<li>
						<span class="i_desc">无线政务</span>
						<span class="i_more">&gt;</span>
					</li>
					<li>
						<span class="i_desc">无线政务</span>
						<span class="i_more">&gt;</span>
					</li>
					<li>
						<span class="i_desc">无线政务</span>
						<span class="i_more">&gt;</span>
					</li>
					<li>
						<span class="i_desc">无线政务</span>
						<span class="i_more">&gt;</span>
					</li>
					<li>
						<span class="i_desc">无线政务</span>
						<span class="i_more">&gt;</span>
					</li>
					
				</ul>
			</div>
			<ul class="left_content" id="left_content">
				<li>
					<div class="c_list">
						<div class="l_second_item">
							<span class="span1">二类目</span>
							<span class="span2">&gt;</span>
						</div>
						<div class="l_third_item">
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
						</div>
					</div>
					<div class="c_list">
						<div class="l_second_item">
							<span class="span1">二类目</span>
							<span class="span2">&gt;</span>
						</div>
						<div class="l_third_item">
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
						</div>
					</div>
					<div class="c_list">
						<div class="l_second_item">
							<span class="span1">二类目</span>
							<span class="span2">&gt;</span>
						</div>
						<div class="l_third_item">
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>

						</div>
					</div>
				</li>
				<li>
					<div class="c_list">
						<div class="l_second_item">
							<span class="span1">二类目</span>
							<span class="span2">&gt;</span>
						</div>
						<div class="l_third_item">
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
						</div>
					</div>
					<div class="c_list">
						<div class="l_second_item">
							<span class="span1">二类目</span>
							<span class="span2">&gt;</span>
						</div>
						<div class="l_third_item">
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
						</div>
					</div>
					<div class="c_list">
						<div class="l_second_item">
							<span class="span1">二类目</span>
							<span class="span2">&gt;</span>
						</div>
						<div class="l_third_item">
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
						</div>
					</div>
				</li>
				<li>
					<div class="c_list">
						<div class="l_second_item">
							<span class="span1">二类目</span>
							<span class="span2">&gt;</span>
						</div>
						<div class="l_third_item">
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
						</div>
					</div>
					<div class="c_list">
						<div class="l_second_item">
							<span class="span1">二类目</span>
							<span class="span2">&gt;</span>
						</div>
						<div class="l_third_item">
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
						</div>
					</div>
					<div class="c_list">
						<div class="l_second_item">
							<span class="span1">二类目</span>
							<span class="span2">&gt;</span>
						</div>
						<div class="l_third_item">
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
						</div>
					</div>
				</li>
				<li>
					<div class="c_list">
						<div class="l_second_item">
							<span class="span1">二类目</span>
							<span class="span2">&gt;</span>
						</div>
						<div class="l_third_item">
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
						</div>
					</div>
					<div class="c_list">
						<div class="l_second_item">
							<span class="span1">二类目</span>
							<span class="span2">&gt;</span>
						</div>
						<div class="l_third_item">
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
						</div>
					</div>
					<div class="c_list">
						<div class="l_second_item">
							<span class="span1">二类目</span>
							<span class="span2">&gt;</span>
						</div>
						<div class="l_third_item">
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
						</div>
					</div>
				</li>
				<li>
					<div class="c_list">
						<div class="l_second_item">
							<span class="span1">二类目</span>
							<span class="span2">&gt;</span>
						</div>
						<div class="l_third_item">
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
						</div>
					</div>
					<div class="c_list">
						<div class="l_second_item">
							<span class="span1">二类目</span>
							<span class="span2">&gt;</span>
						</div>
						<div class="l_third_item">
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
						</div>
					</div>
					<div class="c_list">
						<div class="l_second_item">
							<span class="span1">二类目</span>
							<span class="span2">&gt;</span>
						</div>
						<div class="l_third_item">
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
						</div>
					</div>
				</li>
				<li>
					<div class="c_list">
						<div class="l_second_item">
							<span class="span1">二类目</span>
							<span class="span2">&gt;</span>
						</div>
						<div class="l_third_item">
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
						</div>
					</div>
					<div class="c_list">
						<div class="l_second_item">
							<span class="span1">二类目</span>
							<span class="span2">&gt;</span>
						</div>
						<div class="l_third_item">
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
						</div>
					</div>
					<div class="c_list">
						<div class="l_second_item">
							<span class="span1">二类目</span>
							<span class="span2">&gt;</span>
						</div>
						<div class="l_third_item">
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
						</div>
					</div>
				</li>
				<li>
					<div class="c_list">
						<div class="l_second_item">
							<span class="span1">二类目</span>
							<span class="span2">&gt;</span>
						</div>
						<div class="l_third_item">
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
						</div>
					</div>
					<div class="c_list">
						<div class="l_second_item">
							<span class="span1">二类目</span>
							<span class="span2">&gt;</span>
						</div>
						<div class="l_third_item">
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
						</div>
					</div>
					<div class="c_list">
						<div class="l_second_item">
							<span class="span1">二类目</span>
							<span class="span2">&gt;</span>
						</div>
						<div class="l_third_item">
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
						</div>
					</div>
				</li>
				<li>
					<div class="c_list">
						<div class="l_second_item">
							<span class="span1">二类目</span>
							<span class="span2">&gt;</span>
						</div>
						<div class="l_third_item">
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
						</div>
					</div>
					<div class="c_list">
						<div class="l_second_item">
							<span class="span1">二类目</span>
							<span class="span2">&gt;</span>
						</div>
						<div class="l_third_item">
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
						</div>
					</div>
					<div class="c_list">
						<div class="l_second_item">
							<span class="span1">二类目</span>
							<span class="span2">&gt;</span>
						</div>
						<div class="l_third_item">
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
						</div>
					</div>
				</li>
				<li>
					<div class="c_list">
						<div class="l_second_item">
							<span class="span1">二类目</span>
							<span class="span2">&gt;</span>
						</div>
						<div class="l_third_item">
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
						</div>
					</div>
					<div class="c_list">
						<div class="l_second_item">
							<span class="span1">二类目</span>
							<span class="span2">&gt;</span>
						</div>
						<div class="l_third_item">
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
						</div>
					</div>
					<div class="c_list">
						<div class="l_second_item">
							<span class="span1">二类目</span>
							<span class="span2">&gt;</span>
						</div>
						<div class="l_third_item">
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
						</div>
					</div>
				</li>
				<li>
					<div class="c_list">
						<div class="l_second_item">
							<span class="span1">二类目</span>
							<span class="span2">&gt;</span>
						</div>
						<div class="l_third_item">
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
						</div>
					</div>
					<div class="c_list">
						<div class="l_second_item">
							<span class="span1">二类目</span>
							<span class="span2">&gt;</span>
						</div>
						<div class="l_third_item">
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
						</div>
					</div>
					<div class="c_list">
						<div class="l_second_item">
							<span class="span1">二类目</span>
							<span class="span2">&gt;</span>
						</div>
						<div class="l_third_item">
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
						</div>
					</div>
				</li>
				<li>
					<div class="c_list">
						<div class="l_second_item">
							<span class="span1">二类目</span>
							<span class="span2">&gt;</span>
						</div>
						<div class="l_third_item">
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
						</div>
					</div>
					<div class="c_list">
						<div class="l_second_item">
							<span class="span1">二类目</span>
							<span class="span2">&gt;</span>
						</div>
						<div class="l_third_item">
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
						</div>
					</div>
					<div class="c_list">
						<div class="l_second_item">
							<span class="span1">二类目</span>
							<span class="span2">&gt;</span>
						</div>
						<div class="l_third_item">
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
						</div>
					</div>
				</li>
				<li>
					<div class="c_list">
						<div class="l_second_item">
							<span class="span1">二类目</span>
							<span class="span2">&gt;</span>
						</div>
						<div class="l_third_item">
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
						</div>
					</div>
					<div class="c_list">
						<div class="l_second_item">
							<span class="span1">二类目</span>
							<span class="span2">&gt;</span>
						</div>
						<div class="l_third_item">
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
						</div>
					</div>
					<div class="c_list">
						<div class="l_second_item">
							<span class="span1">二类目</span>
							<span class="span2">&gt;</span>
						</div>
						<div class="l_third_item">
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
							<a href="javascript:void(0)">三类目</a>
						</div>
					</div>
				</li>
			</ul>
		</div>
	</div>
	
	<!-- bottom beign -->
	<s:include value="bottom.jsp"></s:include>
	<!-- bottom end -->
	
	<!-- login_page begin -->
	<div id="yy"></div>
	<div class="login" id="login_page">
		<div class="l_header">
			<h2>用户登录</h2>
			<span id="login_close"></span>
		</div>
		<div class="l_left">
			<div class="l_message">欢迎使用无线城市</div>
			<div class="l_select">
				<label><input type="radio" name="usertype" value="消费者">消费者</label>
				<label><input type="radio" name="usertype" value="服务商">服务商</label>
			</div>
			<div class="l_input">
				<input id="username" class="input" type="text" placeholder="账号" name="usermame" class="l_username"/>
				<input class="input" type="password" placeholder="密码" name="password" class="l_password"/>
				<label class="l_sel">
					<span id="l_box" class="l_box" data-sel="0"></span>
					<span class="l_text">下次自动登录</span>
					<a href="javascript:void(0)">忘记密码？</a>
				</label>
				<a href="javascript:void(0)" class="l_submit">登录</a> 
			</div>
		</div>
		<div class="l_right">
			<p>还没账号？<a>立即注册</a></p>
			<p>使用合作网站账号登录</p>
			<span class="weibo"></span>
			<span class="QQ"></span>
			<div id="clear"></div>
			<a class="r_question" href="javascript:void(0)">无法登录？点这里试试</a>
		</div>
	</div>
	<!-- login_age end -->
	<script type="text/javascript">
		$(function(){
			init();
			initialize();
		});
		function initialize(){
		$("input[placeholder]").placeholder();
		/*login show*/
			$("#s_right").on("click",".r_login",function(){
				$("#yy,#login_page").show();
				$("#username").focus();
			});
			$("#login_close").on("click",function(){
				$("#login_page,#yy").hide();
			});
			$("#l_box").on("click",function(){
				var sel=$(this).data("sel");
				if(sel=="0"){
					$(this).css("backgroundPosition","-114px 0px");
					$(this).data("sel","1");
				}else{
					$(this).css("backgroundPosition","-93px 0px");
					$(this).data("sel","0");
				}
			});
		/*login hide*/
		/*nav_ul click*/
			$("#nav_ul").find("li").each(function(){
				$(this).on({
					"mouseenter":function(){
						$(this).addClass("lidemo");
					},
					"mouseleave":function(){
						$(this).removeClass("lidemo");
					}
				});
			});
		/*nav_ul click*/
		/*left_nav hover*/
			$("#left_nav").find("li").each(function(index){
				var _index=index-1;
				if(_index!=-1){
					$(this).on({
						"mouseenter":function(){
							$(this).addClass("lihover");
							$(this).find(".i_more").text("");
							$("#left_content").find("li").eq(_index).show();
						},
						"mouseleave":function(){
							$(this).removeClass("lihover");
							$(this).find(".i_more").text(">");
							$("#left_content").find("li").eq(_index).hide();
						}
					});
				}
			});	
		
			$("#left_content").find("li").each(function(index){
				var _index=index+1;
				var top=1+index*10;
				var $this=$("#left_nav").find("li").eq(_index);
				$(this).on({
					"mouseenter":function(){
						$(this).show();
						$(this).css({"top":top});
					},
					"mouseleave":function(index){
						$(this).hide();
					}
				
				});
			});
		/*left_nav hover*/
		}
	</script>
</body>
</html>
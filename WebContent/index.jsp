<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!doctype html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
		<title>无线城市-主页（含登录页面）</title>
		<meta name="keywords" content="关键词,关键词">
		<meta name="description" content="">
		<!--css,js-->
		<link type="text/css" href="css/reset.css" rel="stylesheet">
		<style type="text/css">
		/*header beign*/
			::selection {color: #fff;background: #f99750;}
			body{background:#fafafa;cursor:default;color:#444;}
			.title_fixed{width:100%;height:40px;background:#fff;}
			.title_fixed .s_right{float:right;width:400px;font-size:16px;line-height:40px;}
			.title_fixed .s_right .r_login,.r_register{width:50px;height:43px;float:right;cursor:pointer;}
			.title_fixed .s_right .r_login,.r_register a{color:#444;}
			.header{width:100%;background:#fff;border-bottom:2px solid #b61d1d;border-top:2px solid #b61d1d;}
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
			.header .h_sec{width:100%;color:#333;font-size:16px;line-height:43px;}
			.header .h_sec .s_wrapper{width:1200px;height:43px;margin:0 auto;}
			.header .h_sec .s_wrapper .s_left{float:left;width:800px;}
			.header .h_sec .s_wrapper .s_left ul li{padding:0px 15px;height:43px;float:left;text-align:center;cursor:pointer;}
			.header .h_sec .s_wrapper .s_left ul .lidemo{background:#b61d1d;color:#fff;}
		/*header end*/
		
		/*center begin*/
			.banner{width:100%;height:454px;margin:0px auto;}
			.banner .b_content{width:1200px;height:0px;position:relative;margin:0 auto;z-index:2;}
			.banner .b_content .c_info{width:200px;position:absolute;top:-45px;left:0px;color:#fff;font-size:14px;border-left:1px solid #c81623;border-bottom:1px solid #c81623;z-index:4;}
			.banner .b_content .c_info .left_nav li:first-child{font-size:16px;line-height:45px;background:#b61d1d;padding-left:25px;}
			.banner .b_content .c_info .left_nav li{line-height:40px;font-weight:700;background:#c81623;}
			.banner .b_content .c_info .left_nav .lihover{background:#fafafa;color:#b61d1d;}
			.banner .b_content .c_info .left_nav li:after{content:"";display:block;clear:both;}
			.banner .b_content .c_info .left_nav li .i_icon{float:left;display:block;width:40px;height:40px;padding-left:10px;background:url(images/wireless_icon.png) no-repeat 0px -287px;}
			.banner .b_content .c_info .left_nav li .i_desc{padding-left:10px;display:block;float:left;}
			.banner .b_content .c_info .left_nav li .i_more{display:block;float:right;position:relative;font-weight:100;padding-right:10px;}
			.banner .b_content .left_content{position:absolute;top:-1px;left:200px;z-index:3;}
			.banner .b_content .left_content li{border:1px solid #b61d1d;background:#fafafa;width:769px;height:480px;position:absolute;top:0;left:0;display:none;}
			.banner .b_content .left_content li .c_list{width:700px; margin-top:20px;line-height:20px;}
			.banner .b_content .left_content li .c_list .l_second_item{font-weight:700px;float:left; width:100px;padding-left:50px;text-align:center;margin-top:5px;}
			.banner .b_content .left_content li .c_list .l_second_item .span1{height:20px;float:left;}
			.banner .b_content .left_content li .c_list .l_second_item .span2{width:20px;height:20px;float:right;}
			.banner .b_content .left_content li .c_list .l_third_item{float:left;width:550px;text-align:left;}
			.banner .b_content .left_content li .c_list .l_third_item a{color:#444;margin-top:5px;display:inline-block;border-left:1px solid #ccc;padding:0 10px;height:20px;}
			.banner .b_content .btn_ul{position:absolute;top:400px;left:800px;z-index:2;}
			.banner .b_content .btn_ul li{float:left;width:20px;height:20px;margin:0px 10px;background:#565656;border-radius:10px;-webkit-border-radius:10px;color:#fff;font-size:16px;line-height:20px;text-align:center;cursor:pointer;}
			.banner .b_content .img_ul{width:980px;overflow:hidden;margin-left:102px;}
			.banner .b_content .img_ul li{width:980px;margin-top:10px;}
			
		/*center end*/
		/*login begin*/
			.login{z-index:11;width:574px;height:278px;position:fixed;background:#fff;box-shadow:0 3px 7px 2px rgba(0,0,0,.4);-webkit-box-shadow:0 3px 7px 2px rgba(0,0,0,.4);-webkit-border-radius:3px;border-radius:3px;top:50%;left:50%;margin-left:-287px;margin-top:-139px;display:none;}
			.login .l_header{width:550px;height:40px;padding-left:24px;border-bottom:1px solid #dedede;background:#fbfbfb;}
			.login .l_header h2{font-size:14px;width:520px;height:40px;line-height:40px;color:#666;float:left;}
			.login .l_header span{width:20px;height:20px;display:block;background:url(images/wireless_icon.png) no-repeat -50px -2px;float:left;margin-top:10px;cursor:pointer;}
			.login .l_header span:hover{background-position:-71px -2px;}
			.login .l_left{width:270px;height:190px;float:left;margin:17px 20px 0px 30px;}
			.login .l_left .l_message{width:258px;height:20px; line-height:20px;border:1px solid #b61d1d;text-align:center;color:#b61d1d;}
			.login .l_left .l_input{width:260px;margin-top:10px;}
			.login .l_left .l_input .input{margin-bottom:10px;width:255px;height:30px;border:1px solid #ccc;line-height:30px;padding-left:4px;display:block;}
			.login .l_left .l_input .l_sel{width:250px;height:30px;display:block;line-height:30px;}
			.login .l_left .l_input .l_sel .l_box{width:20px;height:20px;margin-top:5px;background:url(images/wireless_icon.png) no-repeat -93px 0px;float:left;cursor:pointer;}
			.login .l_left .l_input .l_sel .l_text{display:block;float:left;}
			.login .l_left .l_input .l_sel a{display:block;float:right;color:#0181ec;}
			.login .l_left .l_input .l_submit{width:70px;height:30px;line-height:30px;text-align:center;color:#fff;background:#b61d1d;display:block;-webkit-border-radius:3px;border-radius:3px;margin:15px 0 0 93px;}
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
		<div class="h_sec">
			<div class="s_wrapper">
				<div class="s_left">
					<ul id="nav_ul">
						<li style="width:60px;margin-left:212px;" >首页</li>
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
						<span class="i_desc">全部服务资源分类</span>
					</li>
					<li>
						<span class="i_icon"></span>
						<span class="i_desc">无线政务</span>
						<span class="i_more">&gt;</span>
					</li>
					<li>
						<span class="i_icon"></span>
						<span class="i_desc">无线政务</span>
						<span class="i_more">&gt;</span>
					</li>
					<li>
						<span class="i_icon"></span>
						<span class="i_desc">无线政务</span>
						<span class="i_more">&gt;</span>
					</li>
					<li>
						<span class="i_icon"></span>
						<span class="i_desc">无线政务</span>
						<span class="i_more">&gt;</span>
					</li>
					<li>
						<span class="i_icon"></span>
						<span class="i_desc">无线政务</span>
						<span class="i_more">&gt;</span>
					</li>
					<li>
						<span class="i_icon"></span>
						<span class="i_desc">无线政务</span>
						<span class="i_more">&gt;</span>
					</li>
					<li>
						<span class="i_icon"></span>
						<span class="i_desc">无线政务</span>
						<span class="i_more">&gt;</span>
					</li>
					<li>
						<span class="i_icon"></span>
						<span class="i_desc">无线政务</span>
						<span class="i_more">&gt;</span>
					</li>
					<li>
						<span class="i_icon"></span>
						<span class="i_desc">无线政务</span>
						<span class="i_more">&gt;</span>
					</li>
					<li>
						<span class="i_icon"></span>
						<span class="i_desc">无线政务</span>
						<span class="i_more">&gt;</span>
					</li>
					<li>
						<span class="i_icon"></span>
						<span class="i_desc">无线政务</span>
						<span class="i_more">&gt;</span>
					</li>
					<li>
						<span class="i_icon"></span>
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
					<div>
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
					<div>
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
					<div>
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
					<div>
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
					<div>
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
					<div>
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
					<div>
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
					<div>
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
					<div>
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
					<div>
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
					<div>
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
					<div>
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
					<div>
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
					<div>
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
					<div>
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
					<div>
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
					<div>
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
					<div>
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
					<div>
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
					<div>
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
					<div>
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
					<div>
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
					<div>
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
					<div>
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
					<div>
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
					<div>
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
					<div>
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
					<div>
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
					<div>
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
					<div>
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
					<div>
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
					<div>
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
					<div>
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
					<div>
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
					<div>
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
					<div>
				</li>
			</ul>
			<ul class="btn_ul">
				<li>1</li>
				<li>2</li>
				<li>3</li>
			</ul>
			<ul class="img_ul">
				<li>
					<img src="images/banner1.jpg" alt="" height="471"/>
				</li>
			</ul>
		</div>
		
	</div>
	<div class="center">
		
	</div>
	<!-- center end -->
	
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
				var $this=$("#left_nav").find("li").eq(_index);
				$(this).on({
					"mouseenter":function(){
						$(this).show();
						$this.addClass("lihover");
						$this.find(".i_more").text("");
					},
					"mouseleave":function(index){
						$(this).hide();
						$this.removeClass("lihover");
						$this.find(".i_more").text(">");
					}
				
				});
			});
		/*left_nav hover*/
		}
	</script>
</body>
</html>
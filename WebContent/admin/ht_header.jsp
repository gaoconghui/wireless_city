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
		<title>无线城市-后台头部</title>
		<meta http-eqive="pragma" content="no-cache">
		<meta http-eqive="cache-control" content="no-cache">
		<meta http-eqive="expires" content="0">
		<meta name="keywords" content="">
		<meta name="description" content="">
		<link type="text/css" href="css/reset.css" rel="stylesheet">
		<style type="text/css">
			.tzht{width:100%,background:#282828;font-weight:700;min-width:1046px;}
			/*t_left start*/
			/*
			蓝：#1e90ff
			橙：#ff912f
			红：#bd2d30
			绿：#28b779
			蒙版：#2f3437
			*/
			.tzht .t_left{height:100%;width:200px;position:fixed;top:0;left:0;background:#282828;z-index:2;}
			.tzht .t_left .l_img{font-size:28px;width:100%;height:55px;line-height:55px;font-family:Viner Hand ITC,hakuyoxingshu7000,Kunstler Script;color:#fff;font-weight:700;text-align:center;border-bottom:1px solid #000;}
			.tzht .t_left .l_content{width:100%;border-bottom:1px solid #414141;}
			.tzht .t_left .l_content ul li{line-height:50px;border-bottom:1px solid #000;border-top:1px solid #414141;}
			.tzht .t_left .l_content ul li a{display:block;padding-left:30px;}
			.tzht .t_left .l_content ul li a:hover span{text-decoration:underline;}
			.tzht .t_left .l_content ul li a i{background:url("images/ht/ht_icon.png") no-repeat;width:16px;height:16px;display:block;float:left;margin-top:20px;}
			.tzht .t_left .l_content ul li a span{margin-left:10px;font-size:14px;color:#fff;float:left;cursor:pointer;}
			.tzht .t_left .l_content ul li a .l_icon1{background-position:-233px -52px}
			.tzht .t_left .l_content ul li a .l_icon2{background-position:-254px -52px;}
			.tzht .t_left .l_content ul li a .l_icon3{background-position:-211px -52px;}
			.tzht .t_left .l_content ul li a .l_icon4{background-position:-274px -52px;}
			.tzht .t_left .l_content ul li a .l_icon5{background-position:-295px -52px;}
			.tzht .t_left .l_content ul li a .l_icon6{background-position:-315px -52px;width:19px;height:6px;margin-top:24px;}
			/*end t_left*/

			/*t_header start*/
			.tzht .t_header{width:100%;height:56px;background:#2f3437;}
			.tzht .t_header .fixbox{background:#2f3437;position:fixed;z-index:1;top:0;left:0;height:56px;width:100%;}
			.tzht .t_header .h_nav{margin-left:200px;float:left;}
			.tzht .t_header .h_nav ul li{width:110px;height:56px;border-left:1px solid #414141;border-right:1px solid #000;float:left;}
			.tzht .t_header .h_nav ul li a{display:block;text-align:center;color:#838383;}
			.tzht .t_header .h_nav ul li a:hover{color:#fff;}
			.tzht .t_header .h_nav ul li a i{width:18px;height:17px;display:block;background:url("images/ht/ht_icon.png") no-repeat;margin:11px auto 3px auto;}
			.tzht .t_header .h_nav ul li a .h_icon1{background-position:0 -25px;}
			.tzht .t_header .h_nav ul li a .h_icon2{background-position:-24px 0;}
			.tzht .t_header .h_nav ul li a:hover .h_icon2{background-position:-24px -25px;}
			.tzht .t_header .h_nav ul li a .h_icon3{background-position:-48px 0;}
			.tzht .t_header .h_nav ul li a:hover .h_icon3{background-position:-48px -25px;}
			.tzht .t_header .h_nav ul li a .h_icon4{background-position:-68px 0;}
			.tzht .t_header .h_nav ul li a:hover .h_icon4{background-position:-68px -25px;}
			.tzht .t_header .h_nav ul li a .h_icon5{background-position:-91px 0;}
			.tzht .t_header .h_nav ul li a:hover .h_icon5{background-position:-91px -25px;}
			.tzht .t_header .h_nav ul li a .h_icon6{background-position:-113px 0;}
			.tzht .t_header .h_nav ul li a:hover .h_icon6{background-position:-113px -25px;}
			.tzht .t_header .h_nav ul li a .h_icon7{background-position:-133px 0;}
			.tzht .t_header .h_nav ul li a:hover .h_icon7{background-position:-133px -25px;}
			.tzht .t_header .h_nav ul li a .h_icon8{background-position:-152px 0;}
			.tzht .t_header .h_nav ul li a:hover .h_icon8{background-position:-152px -25px;}
			.tzht .t_header .h_nav ul li .h_sel{color:#fff;}
			.tzht .t_header .h_info{height:56px;position:absolute;top:0;right:10px;float:left;}
			.tzht .t_header .h_info .h_mess{line-height:56px;color:#fff;float:left;}
			.tzht .t_header .h_info .h_exit{cursor:pointer;width:65px;height:30px;background:#28b779;margin:13px 5px 0 10px;float:left;}
			.tzht .t_header .h_info .h_exit:hover{background:#bd2d30;}
			.tzht .t_header .h_info .h_exit a{display:block;line-height:30px;padding-left:10px;color:#fff;}
			.tzht .t_header .h_info .h_exit a span{float:left;cursor:pointer;}
			.tzht .t_header .h_info .h_exit a i{width:14px;height:13px;display:block;background:url("images/ht/ht_icon.png") no-repeat 0 -51px;;margin:9px 8px;float:left;}
			/*end t_hearder*/
		</style>
	</head>
<body>
		<!-- t_left start -->
		<div class="t_left" id="t_left">
			<div class="l_img">Wireless City</div>
			<div class="l_content">
				<ul id="choices">
					<li><a href="admin/ht_1.jsp"><i class="l_icon1"></i><span>服务类目管理</span><div class="clear"></div></a></li>
					<li><a href="admin/ht_2.jsp"><i class="l_icon2"></i><span>资源模板管理</span><div class="clear"></div></a></li>
					<li><a href="admin/ht_3.jsp"><i class="l_icon3"></i><span>服务商管理</span><div class="clear"></div></a></li>
					<li><a href="admin/ht_4.jsp"><i class="l_icon4"></i><span>服务资源管理</span><div class="clear"></div></a></li>
				</ul>
			</div>
		</div>
		<!-- end t_left -->
		<!-- t_header start -->
		<div class="t_header">
			<div class="fixbox">
				<div class="h_nav">
					<ul>
						<li><a href="javascript:void(0)" class="h_sel"><i class="h_icon1"></i><span>首页</span></a></li>
						<li><a href="javascript:void(0)"><i class="h_icon2"></i><span>公告</span></a></li>
						<li><a href="javascript:void(0)"><i class="h_icon3"></i><span>回收站</span></a></li>
						<li><a href="javascript:void(0)"><i class="h_icon8"></i><span>设置</span></a></li>
					</ul>
				</div>
				<div class="h_info">
					<div class="h_mess">管理员 : 武汉理工大学教务处</div>
					<div class="h_exit"><a href="admin/ht_login.jsp"><span>注销</span><i></i></a></div>
				</div>
			</div>
		</div>
		<!-- end t_header -->
		<script type="text/javascript">
		$(function(){
			var a=$("#choose").text();
			$("#choices").find("li").each(function(){
				var b=$(this).find("span").text();
				if(b==a){
					$(this).css({"backgroundColor":"#000"});
					$(this).find("span").css({"color":"#28b779"});
				}
			});
		});
		
	</script>
</body>
</html>
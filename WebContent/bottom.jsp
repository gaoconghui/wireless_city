<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!doctype html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
		<title>无线城市-页面底部</title>
		<meta name="keywords" content="关键词,关键词">
		<meta name="description" content="">
		<style type="text/css">
		/*bottom begin*/
			.bottom{width:100%;background:#39393f;color:#c9cad6;margin-top:40px;}
			.bottom .about_us{width:1200px;margin:0px auto;}
			.bottom .about_us ul{padding-left:10px;width:800px; float:left;margin:20px 0px;}
			.bottom .about_us ul li{width:200px;float:left;margin:0px 0px 0px 0px;}
			.bottom .about_us ul li p{margin-top:20px;color:#8b8d93;cursor:pointer;}
			.bottom .about_us ul li p:hover{color:#fff;}
			.bottom .about_us .b_contact{width:270px;float:left;margin-top:50px;}
			.bottom .about_us .b_contact .c_icon{width:60px;height:60px;display:block;float:left;background:url(images/wireless_icon.png) no-repeat 5px -82px;}
			.bottom .about_us .b_contact .c_tel{width:200px;height:60px;float:left; }
			.bottom .about_us .b_contact .c_tel .tel{width:250px;font-size:32px;}
			.bottom .about_us .b_contact .c_tel .time{width:180px;margin-top:3px;}
			.bottom .copyright .before{height:1px;border-top: 1px solid #1c1c1d;background:#4c4d53;}
			.bottom .friend_link .before{height:1px;border-top: 1px solid #1c1c1d;background:#4c4d53;}
			.bottom .friend_link{width:1200px;margin:0 auto;line-height:20px;margin-bottom:20px;}
			.bottom .friend_link h3{padding:10px;}
			.bottom .friend_link a{display:inline-block;padding:0 10px;height:20px;color:#8b8d93;}
			.bottom .copyright{width:1200px;height:50px;margin:0px auto;}
			.bottom .copyright p{width:1200px;height:50px;line-height:50px;font-size:14px;color:#fff;margin:0px auto;text-align:center;}
			#feedback-link{width:28px;height:86px;position:fixed;right:0;top:50%;margin:-45px 0;z-index:100;}
			#feedback-link a{width:20px;height:86px;display:block;color:#fff;background:#333;font-size:12px;line-height:21px;text-lagin:center;padding:0 4px;}
			#feedback-link a:hover{background-position:-372px -91px;}
			#totop{width:43px;height:44px;position:fixed;right:30px;bottom:100px;z-index:100;display:none;}
			#totop a{width:43px;height:44px;display:block;background-color: #000;background-image: url(images/wireless_icon.png);background-repeat: no-repeat;background-position:1px -285px;opacity:0.8;filter:alpha(opacity=80);}
			#totop a:hover{opacity:0.5;filter:alpha(opacity=50);}
		/*bottom end*/
		</style>
		
	</head>
<body>
	
	<!-- bottom beign -->
	<div class="bottom">
		<div class="about_us">
			<ul>
				<li>
					<h3>关于我们</h3>
					<p>了解我们</p>
					<p>关注我们</p>
					<p>加入我们</p>
				</li>
				<li>
					<h3>关于我们</h3>
					<p>了解我们</p>
					<p>关注我们</p>
					<p>加入我们</p>
				</li>
				<li>
					<h3>关于我们</h3>
					<p>了解我们</p>
					<p>关注我们</p>
					<p>加入我们</p>
				</li>
			</ul>
			<div class="b_contact">
				<span class="c_icon"></span>
				<div class="c_tel">
					<p class="tel">027-01293604</p>
					<p class="time">服务时间 9:00-17:00</p>
				</div>
			</div>
			<div id="clear"></div>
		</div>
		<div class="friend_link">
			<div class="before"></div>
			<h3>友情链接</h3>
			<a href="javascript:void(0)">武汉天喻信息产业股份有限公司</a>
			<a href="javascript:void(0)">武汉天喻信息产业股份有限公司</a>
			<a href="javascript:void(0)">武汉天喻信息产业股份有限公司</a>
			<a href="javascript:void(0)">武汉天喻信息产业股份有限公司</a>
			<a href="javascript:void(0)">武汉天喻信息产业股份有限公司</a>
			<a href="javascript:void(0)">武汉天喻信息产业股份有限公司</a>
		</div>
		<div class="copyright">
			<div class="before"></div>
			<p>Copyright &copy; 2015 All Rights Reserved 版权所有：武汉理工大学 备案ID:xxxxxxx</p>
		</div>
	</div>
	<div id="feedback-link">
		<a href="javascript:void(0);" title="意见反馈">意见反馈</a>
	</div>
	<div id="totop">
		<a href="javascript:void(0);" title="返回顶部"></a>
	</div>
	<!-- bottom end -->
	<script type="text/javascript">
		
		function init(){
			$("#totop").click(function(){
				$("html,body").animate({
					scrollTop:0
				},600);
			});
			$(window).scroll(function(){
				if($(window).scrollTop()>=200)
				{
					$("#totop").fadeIn(1000);
				}else
				{
					$("#totop").stop(true,true).fadeOut(1000);
				}
			});
		}
	</script>
</body>
</html>
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
			body{background:#fafafa;cursor:default;color:#444;}
			.title_fixed{width:100%;height:26px;background:#fafafa;}
			.title_fixed .s_right{float:right;width:400px;font-size:12px;line-height:26px;}
			.title_fixed .s_right .r_login,.r_register,.r_info{width:50px;height:43px;float:right;cursor:pointer;}
			.title_fixed .s_right .r_login,.r_register,.r_info a{color:#444;}
			.title_fixed .s_right .r_wel{width:50px;height:43px;float:right;}
			
			.header{width:100%;background:#fff;border-bottom:2px solid #b61d1d;}
			.header .h_fir{width:1200px;height:80px;margin:0px auto;}
			.header .h_fir .f_logo{width:188px;height:50px;margin:10px 100px 0px 25px; background:url(images/logo.png) no-repeat;float:left;}
			.header .h_fir .f_search{width:600px;height:60px;float:left;}
			.header .h_fir .f_search .s_input{width:500px;height:42px;margin-top:8px;}
			.header .h_fir .f_search .s_input input:first-child{width:400px;height:40px;border:2px solid #b61d1d;border-right:0;line-height:40px;color:#666;padding-left:10px;display:block;float:left;}
			.header .h_fir .f_search .s_input .i_btn{width:80px;height:44px;background:#b61d1d;color:#fff;line-height:40px;text-align:center;font-size:16px; border:0;float:left;cursor:pointer;}
			.header .h_fir .f_search .s_input .i_btn:hover{background:#c81623;}
			.header .h_fir .f_contact{float:left;width:250px;height:70px;line-height:70px; }
			.header .h_fir .f_contact .c_fir{width:250px;height:70px; color:#b61d1d;font-size:18px;font-weight:400;}
			.header .h_fir .f_contact .c_fir .f_icon{width:20px;height:20px;background:url(images/wireless_icon.png) no-repeat -24px -1px; display:block;margin:25px 5px 0px 5px;float:left;}
			.header .h_fir .f_contact .c_fir .f_text{float:left;}
			.header .h_sec{width:100%;color:#333;font-size:16px;line-height:43px;height:50px;}
			.header .h_sec .s_wrapper{width:1200px;height:43px;margin:0px auto;}
			.header .h_sec .s_wrapper .s_left ul li{padding:0px 15px;height:43px;float:left;text-align:center;cursor:pointer;}
			.header .h_sec .s_wrapper .s_left ul:after{display:block;clear:both;content:"";}
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
			.banner .b_content .c_info .left_nav li .i_desc a{color:#fff;}
			.banner .b_content .c_info .left_nav li .i_more{display:block;float:right;position:relative;font-weight:100;padding-right:10px;}
			.banner .b_content .left_content{position:absolute;top:-1px;left:200px;z-index:3;}
			.banner .b_content .left_content li{display:none;padding:15px 50px 20px 50px;border:1px solid #b61d1d;background:#fafafa;width:668px;position:absolute;top:0;left:0;}
			.banner .b_content .left_content li .c_list{line-height:20px; }
			.banner .b_content .left_content li .c_list:after{display:block;content:"";clear:both;}
			.banner .b_content .left_content li .c_list .l_second_item{ font-weight:700;float:left; width:100px; text-align:center;margin-top:10px;}
			.banner .b_content .left_content li .c_list .l_second_item .span1{height:20px;float:left;}
			.banner .b_content .left_content li .c_list .l_second_item .span2{width:20px;height:20px;float:right;}
			.banner .b_content .left_content li .c_list .l_third_item{float:left;text-align:left;width:550px;}
			.banner .b_content .left_content li .c_list .l_third_item a{color:#444;margin-top:10px;display:inline-block;border-left:1px solid #ccc;padding:0 10px;height:20px;}
			.banner .b_content .btn_ul{position:absolute;top:400px;left:800px;z-index:2;}
			.banner .b_content .btn_ul li{float:left;width:20px;height:20px;margin:0px 10px;background:#565656;border-radius:10px;-webkit-border-radius:10px;color:#fff;font-size:16px;line-height:20px;text-align:center;cursor:pointer;}
			.banner .b_content .img_ul{width:980px;overflow:hidden;margin-left:102px;}
			.banner .b_content .img_ul li{width:980px;margin-top:10px;}
			
		/*center end*/
		/*login begin*/
			.login{z-index:11;width:574px;height:308px;position:fixed;background:#fff;box-shadow:0 3px 7px 2px rgba(0,0,0,.4);-webkit-box-shadow:0 3px 7px 2px rgba(0,0,0,.4);-webkit-border-radius:3px;border-radius:3px;top:50%;left:50%;margin-left:-287px;margin-top:-154px;display:none;}
			.login .l_header{width:550px;height:40px;padding-left:24px;border-bottom:1px solid #dedede;background:#fbfbfb;}
			.login .l_header h2{font-size:14px;width:520px;height:40px;line-height:40px;color:#666;float:left;}
			.login .l_header span{width:20px;height:20px;display:block;background:url(images/wireless_icon.png) no-repeat -50px -2px;float:left;margin-top:10px;cursor:pointer;}
			.login .l_header span:hover{background-position:-71px -2px;}
			.login .l_left{width:270px;height:190px;float:left;margin:17px 20px 0px 30px;}
			.login .l_left .l_message{width:258px;height:20px; line-height:20px;border:1px solid #209ddd;text-align:center;color:#209ddd;margin-bottom:10px;}
			
			.login .l_left .l_select label{height:30px;line-height:20px;width:76px;display:block;float:left;}
			
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
		/* begin info */
		.info{padding:5px 10px;background:#222;color:#fff;position:fixed;top:100px;left:400px;border-radius:10px;display:none;}
		.info span{display:block;float:left;line-height:24px;padding:2px;}
		.info span.i_icon{background-repeat:no-repeat;background-position:cneter;width:24px;height:24px;}
		/* end info */
		</style>
		<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
		<script type="text/javascript" src="js/tmAjax.js"></script>
		<script type="text/javascript" src="js/util.js"></script>
		<script type="text/javascript" src="js/placeholder.js"></script>
		
	</head>
<body>
	<!-- header begin-->
	<div class="title_fixed">
		<div class="s_right" id="s_right">
			
			<div class="r_login">登录</div>
			<div class="r_register"><a href="font/register.jsp">注册</a></div>
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
					
				</ul>
			</div>
			<ul class="left_content" id="left_content" >
				
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
			<div class="l_message" id="message">欢迎使用无线城市</div>
			<div class="l_select" id="userType">
				<label><input type="radio" name="usertype" checked value="0">消费者</label>
				<label><input type="radio" name="usertype" value="1">服务商</label>
			</div>
			<div class="l_input">
				<input id="username" class="input" type="text" placeholder="账号" class="l_username"/>
				<input id="password" class="input" type="password" placeholder="密码"  class="l_password"/>
				<label class="l_sel">
					<span id="l_box" class="l_box" data-sel="0"></span>
					<span class="l_text">下次自动登录</span>
					<a href="javascript:void(0)">忘记密码？</a>
				</label>
				<a href="javascript:void(0)" class="l_submit" id="submit">登录</a> 
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
	<!-- begin info -->
	<div class="info">
		<span class="i_icon"></span>
		<span class="i_content"></span>
	</div>
	<!-- end info -->
	<script type="text/javascript">
		$(function(){
			init();
			initialize();
		});
		
		function initialize(){
		//登录
		var timer=null;
		$("#submit").click(function(){
			var name=$("#username").val();
			var loginPwd=$("#password").val();
			if(isEmpty(name)){
				$("#message").css({"borderColor":"#b61d1d","color":"#b61d1d"}).text("用户名不能为空！");
				return;
			}
			if(isEmpty(loginPwd)){
				$("#message").css({"borderColor":"#b61d1d","color":"#b61d1d"}).text("密码不能为空！");
				return;
			}
			/* 
			LoginAction_login	name:用户登陆账号
									loginPwd:用户登陆密码
				
			ProviderAction_login	loginName:服务商登陆账号
									loginPwd:服务商登陆密码
			*/
			var userType=$("#userType").find("input:checked").val();
			if(userType=="0"){
				var param={name:name,loginPwd:loginPwd};
				clearTimeout(timer);
				timer=setTimeout(function(){
					$.ajax({
						url:"LoginAction_login",
						type:"post",
						data:param,
						success:function(data){
							if(data=="0"){
								//失败返回0；
								$("#message").css({"borderColor":"#b61d1d","color":"#b61d1d"}).text("用户名或密码不正确！");
							}else{
								//成功返回id
								$("#login_page").hide();
								$("#yy").hide();
								var html="<div class='r_info'><a href='font/buyer.jsp?id="+data+"'>"+name+"</a></div>"+
										"<div class='r_wel'>欢迎您,</div>";
								$("#s_right").html(html);
							}
						}
					});
				},200);
			}else{
				var param={loginName:name,loginPwd:loginPwd};
				clearTimeout(timer);
				timer=setTimeout(function(){
					$.ajax({
						url:"ProviderAction_login",
						type:"post",
						data:param,
						success:function(data){
							alert(data);
							if(data=="0"){
								$("#message").css({"borderColor":"#b61d1d","color":"#b61d1d"}).text("用户名或密码不正确！");
							}else{
								//返回id
								$("#login_page").hide();
								$("#yy").hide();
								var html="<div class='r_info'><a href='font/buyer.jsp?id="+data+"'>"+name+"</a></div>"+
										"<div class='r_wel'>欢迎您,</div>";
								$("#s_right").html(html);
							}
						}
					});
				},200);
			}
		});
			
			
		$("input[placeholder]").placeholder();
		
		/* findCategory begin*/
		//查询1类目
		var options={
				async:false,
				params:{parentid:"1"},
				callback:function(data){
					var $data=$.parseJSON(data);
					var length=$data.length;
					var html="";
					for(var i=0;i<length;i++){
						html+="<li data-id='"+$data[i].id+"' data-index='"+i+"'>"+
						"	<span class='i_icon'></span>"+
						"	<span class='i_desc'><a href='font/search.jsp?pid="+$data[i].id+"'>"+$data[i].name+"</a></span>"+
						"	<span class='i_more'>&gt;</span>"+
						"</li>";
					}
					$("#left_nav").append(html);
				}	
		};
		findCategory(options);
		//查询2类目
		var html="";
		$("#left_nav").find("li").each(function(index){
			if(index!=0){
				var parentid=$(this).data("id");
				var options={
					async:false,
					params:{parentid:parentid},
					callback:function(data){
						if(data=="[]"){
							html+="<li></li>";
						}else{
							var $data=$.parseJSON(data);
							var length=$data.length;
							var h="";
							for(var i=0;i<length;i++){
								h+="<div class='c_list' data-id='"+$data[i].id+"'>"+
								"		<div class='l_second_item'>"+
								"			<span class='span1'><a href='font/search.jsp?pid="+$data[i].id+"'>"+$data[i].name+"</a></span>"+
								"			<span class='span2'>&gt;</span>"+
								"		</div>"+
								"		<div class='l_third_item'>"+
								"		</div>"+
								"	</div>";
							}
							html+="<li>"+h+"</li>";
						}
					}
				};
				findCategory(options);
			}
		});
		$("#left_content").html(html);
		//查询3类目
		$("#left_content").find("li").each(function(index){
			$(this).find(".c_list").each(function(index){
				var parentid=$(this).data("id");
				var html="";
				var options={
					async:false,
					params:{parentid:parentid},
					callback:function(data){
						if(data=="[]"){
						}else{
							console.log(data);
							var $data=$.parseJSON(data);
							var length=$data.length;
							console.log(length+"-------------");
							for(var i=0;i<length;i++){
								html+="<a href='font/search.jsp?pid="+$data[i].id+"' data-id='"+$data[i].id+"'>"+$data[i].name+"</a>";
							}
						}
					}
				};
				findCategory(options);
				$(this).find(".l_third_item").html(html);
			});
		});
		/* findCAtegory end */
		/*login show*/
			$("#s_right").on("click",".r_login",function(){
				$("#yy,#login_page").show();
				$("#username").focus();
			});
			$("#login_close").on("click",function(){
				$("#login_page,#yy").hide();
				$("#password,#username").val("");
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
			$("#left_nav").on({
				"mouseenter":function(){
					var _index=$(this).data("index"); 
					$(this).addClass("lihover");
					$(this).find("a").css({"color":"#b61d1d"});
					$(this).find(".i_more").text("");
					$("#left_content").find("li").eq(_index).css("top",40*_index+"px").show();
					
				},
				"mouseleave":function(index){
					var _index=$(this).data("index"); 
					$(this).removeClass("lihover");
					$(this).find(".i_more").text(">");
					$(this).find("a").css({"color":"#fff"});
					$("#left_content").find("li").eq(_index).hide();
				}
			},"li");
			
			$("#left_content").on({
				"mouseenter":function(index){
					var _index=index+1;
					var $this=$("#left_nav").find("li").eq(_index);
					$(this).show();
					$this.addClass("lihover");
					$this.find(".i_more").text("");
				},
				"mouseleave":function(index){
					var _index=index+1;
					var $this=$("#left_nav").find("li").eq(_index);
					$(this).hide();
					$this.removeClass("lihover");
					$this.find(".i_more").text(">");
				}
			},"li");
		/*left_nav hover*/
		}
	</script>
</body>
</html>
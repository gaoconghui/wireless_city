<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!doctype html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
		<title>无线城市-后台-服务类目管理</title>
		<meta name="keywords" content="">
		<meta name="description" content="">
		<link type="text/css" href="css/reset.css" rel="stylesheet">
		<!--css,js-->
		<style type="text/css">
			.tzht{width:100%,background:#282828;font-weight:700;}
		/*start t_right*/
			.tzht .t_right{background:#f3f4f5;margin-left:200px;}
			/*start r_location*/
			.tzht .t_right .r_location{width:100%;height:51px;background:#e5e5e5;line-height:51px;border-bottom:1px solid #ccc;}
			.tzht .t_right .r_location i{width:14px;height:18px;background:url("images/ht/ht_icon.png") no-repeat -16px -51px;margin:16px 20px 0 20px;float:left;}
			.tzht .t_right .r_location span{display:blcok;float:left;}
			.tzht .t_right .r_location .r_t_action{width:108px;height:24px;float:left;margin:12px 0 0 10px;}
			.tzht .t_right .r_location .r_t_action .ra{width:24px;height:24px;margin-right:2px;background:url("images/ht/ht_icon.png") no-repeat;display:block;float:left;cursor:pointer;}
			.tzht .t_right .r_location .r_t_action .ra:hover{background-color:#2f3437;}
			
			.tzht .t_right .r_location .r_t_action .r_t_a2{background-position:-379px -47px;background-color:#1e90ff;}
			
			.tzht .t_right .r_location .r_t_action .r_t_a4{background-position:-417px -48px;background-color:#bd2d30;}
			/*end r_location*/

			.tzht .t_right .r_table{background:#fff;margin:0 1%;border:1px solid #ccc;margin-top:20px;padding-bottom:10px;}

			.tzht .t_right .r_table .r_title{width:100%;height:40px;background:#eee;border-bottom:1px solid #ccc;}
			.tzht .t_right .r_table .r_title i{width:16px;height:14px;background:url("images/ht/ht_icon.png") no-repeat -386px -15px;display:block;float:left;margin:13px 0 0 10px;}
			.tzht .t_right .r_table .r_title span{border-left:1px solid #ccc;height:40px;line-height:40px;padding-left:5px;color:#000;}

			.tzht .t_right .r_table .r_label{width:100%;}
			.tzht .t_right .r_table .r_label ul li{background:#999;margin:10px;float:left;display:block;}
			.tzht .t_right .r_table .r_label ul li:hover{background:#2f3437;}
			.tzht .t_right .r_table .r_label ul li a{color:#fff;line-height:40px;padding:0px 20px;display:block;white-space:nowrap; height:40px;}

			.tzht .t_right .r_table .r_label ul li a i{width:15px;height:14px;display:block;background:url("images/ht/ht_icon.png") no-repeat -33px -52px;float:left;margin-top:13px;}
		/*end t_right*/
		
		/*yp_dialog begin*/
		#yp_dialog{width:250px;height:150px;border:1px solid #282828;background:#f7f7f7;position:fixed;z-index:10;display:none;}
		#yp_dialog .dialog_title{width:250px;height:40px;background:#282828;color:#fff;text-indent:4px;line-height:40px;font-size:14px;position:relative;}
		#yp_dialog .dialog_title span{line-height:20px;width:20px;height:20px;position:absolute;top:10px;right:10px;cursor:pointer;}
		#yp_dialog .dialog_content{width:250px;height:110px;}
		#yp_dialog .dialog_content a{background:#1e90ff;display:block;height:30px;width:50px;margin:40px 0 0 47px;float:left;color:#fff;line-height:30px;font-size:14px;text-align:center;border-radius:3px;}
		/*yp_dialog end*/
		
		/* add_module begin */
		.add_module{display:none;border:1px solid #282828;width:300px;position:fixed;z-index:11;background:#fff;}
		.add_module .a_d_header{text-indent:10px;background:#282828;color:#fff;font-size:16px;font-weight:700;line-height:40px;height:40px;width:100%;}
		.add_module .a_d_main p{margin-left:20px;margin-top:10px;height:30px;line-height:30px;}
		.add_module .a_d_main p input{font-size:12px;padding-left:4px;width:198px;}
		.add_module .a_d_main textarea{padding-left:4px;margin-left:47px;resize:none;overflow-y:hidden;width:200px;height:100px;}
		.add_module .a_d_footer{width:100%;height:30px;padding:10px 0;}
		.add_module .a_d_footer span{float:left;width:50px;height:30px;line-height:30px;cursor:pointer;font-size:14px;background:#1e90ff;display:block;margin-left:67px;color:#fff;text-align:center;}
		/* end add_module */
		</style>
		<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
		<script type="text/javascript" src="js/yjutil.js"></script>
	</head>
<body>
	<div class="tzht">
		<!-- header begin -->
		<%-- <s:include value="ht_header.jsp"></s:include> --%>
		<jsp:include page="ht_header.jsp" />
		<!-- end header -->
		<!-- t_right start -->
		<div class="t_right">
			<!-- r_location start -->
			<div class="r_location" id="location">
				<i></i><span>您当前所在位置：<a href="#" id="choose">服务类目管理</a>&gt;<a href="javascript:void(0)">无线城市</a></span>
				<div class="r_t_action">
					<span class="r_t_a2 ra" id="update_btn" title="修改"></span>
					<span class="r_t_a4 ra" id="delete_btn" title="删除"></span>
				</div>	
			</div>
			<!-- end r_location -->
			<div class="r_table">
				<div class="r_title"><i></i><span>一类类目</span></div>
				<div class="r_label">
					<ul>
						<li><a href="#"><span>无线政务</span></a></li>
						<li><a href="#"><span>二类目</span></a></li>
						<li><a href="#"><span>二类目</span></a></li>
						<li><a href="#"><span>二类目</span></a></li>
						<li><a href="#"><span>二类目</span></a></li>
						<li><a href="#"><span>二类目</span></a></li>
						<li><a href="#"><span>二类目</span></a></li>
						<li><a href="#"><span>二类目</span></a></li>
						<li><a href="#"><span>二类目</span></a></li>
						<li><a href="#"><span>二类目</span></a></li>
						<li><a href="#"><span>二类目</span></a></li>
						<li><a href="#"><span>二类目</span></a></li>
						<li><a href="#"><span>二类目</span></a></li>
						<li style="background:#1e90ff;" class="add_btn" title="添加"><a href="javascript:void(0)"><i></i></a></li>
						<div class="clear"></div>
					</ul>
				</div>
			</div>
			<div class="r_table">
				<div class="r_title"><i></i><span>二类目</span></div>
				<div class="r_label">
					<ul>
						<li><a href="#"><span>二类目</span></a></li>
						<li><a href="#"><span>二类目</span></a></li>
						<li><a href="#"><span>二类目</span></a></li>
						<li><a href="#"><span>二类目</span></a></li>
						<li><a href="#"><span>二类目</span></a></li>
						<li><a href="#"><span>二类目</span></a></li>
						<li><a href="#"><span>二类目</span></a></li>
						<li><a href="#"><span>二类目</span></a></li>
						<li><a href="#"><span>二类目</span></a></li>
						<li><a href="#"><span>二类目</span></a></li>
						<li><a href="#"><span>二类目</span></a></li>
						<li><a href="#"><span>二类目</span></a></li>
						<li><a href="#"><span>二类目</span></a></li>
						<li style="background:#1e90ff;" class="add_btn"  title="添加"><a href="javascript:void(0)"><i></i></a></li>
						<div class="clear"></div>
					</ul>
				</div>
			</div>
			<div class="r_table">
				<div class="r_title"><i></i><span>三类目</span></div>
				<div class="r_label">
					<ul>
						<li><a href="#"><span>三类目</span></a></li>
						<li><a href="#"><span>三类目</span></a></li>
						<li><a href="#"><span>三类目</span></a></li>
						<li><a href="#"><span>三类目</span></a></li>
						<li><a href="#"><span>三类目</span></a></li>
						<li><a href="#"><span>三类目</span></a></li>
						<li><a href="#"><span>三类目</span></a></li>
						<li><a href="#"><span>三类目</span></a></li>
						<li><a href="#"><span>二类目</span></a></li>
						<li><a href="#"><span>二类目</span></a></li>
						<li><a href="#"><span>二类目</span></a></li>
						<li><a href="#"><span>二类目</span></a></li>
						<li><a href="#"><span>二类目</span></a></li>
						<li style="background:#1e90ff;" class="add_btn"  title="添加"><a href="javascript:void(0)"><i></i></a></li>
						<div class="clear"></div>
					</ul>
				</div>
			</div>
			<div class="r_table">
				<div class="r_title"><i></i><span>四类目</span></div>
				<div class="r_label">
					<ul>
						<li><a href="#"><span>二类目</span></a></li>
						<li><a href="#"><span>二类目</span></a></li>
						<li><a href="#"><span>二类目</span></a></li>
						<li><a href="#"><span>二类目</span></a></li>
						<li><a href="#"><span>二类目</span></a></li>
						<li><a href="#"><span>二类目</span></a></li>
						<li><a href="#"><span>二类目</span></a></li>
						<li><a href="#"><span>二类目</span></a></li>
						<li><a href="#"><span>二类目</span></a></li>
						<li><a href="#"><span>二类目</span></a></li>
						<li><a href="#"><span>二类目</span></a></li>
						<li><a href="#"><span>二类目</span></a></li>
						<li><a href="#"><span>二类目</span></a></li>
						<li style="background:#1e90ff;" class="add_btn" title="添加"><a href="javascript:void(0)"><i></i></a></li>
						<div class="clear"></div>
					</ul>
				</div>
			</div>
			<div class="r_table">
				<div class="r_title"><i></i><span>五类目</span></div>
				<div class="r_label">
					<ul>
						<li><a href="#"><span>二类目</span></a></li>
						<li><a href="#"><span>二类目</span></a></li>
						<li><a href="#"><span>二类目</span></a></li>
						<li><a href="#"><span>二类目</span></a></li>
						<li><a href="#"><span>二类目</span></a></li>
						<li><a href="#"><span>二类目</span></a></li>
						<li><a href="#"><span>二类目</span></a></li>
						<li><a href="#"><span>二类目</span></a></li>
						<li><a href="#"><span>二类目</span></a></li>
						<li><a href="#"><span>二类目</span></a></li>
						<li><a href="#"><span>二类目</span></a></li>
						<li><a href="#"><span>二类目</span></a></li>
						<li><a href="#"><span>二类目</span></a></li>
						<li style="background:#1e90ff;" class="add_btn"  title="添加"><a href="javascript:void(0)"><i></i></a></li>
						<div class="clear"></div>
					</ul>
				</div>
			</div>
		</div>
		<!-- end t_right -->
	</div>
	<!-- dialog beigin -->
	<div id="yy"></div>
	<div id="yp_dialog">
		<p class="dialog_title">确定删除吗？<span class="close">X</span></p>
		<div class="dialog_content">
			<a href="javascript:void(0)" class="sure">确定</a>
			<a href="javascript:void(0)" class="close">取消</a>
		</div>
	</div>
	<!-- end dialog -->
	<!-- add_module begin -->
	<div class="add_module" id="add_module">
		<div class="a_d_header">增加类目</div>
		<div class="a_d_main">
			<p>父节点为：<span>无线城市</span></p>
			<p>
				<span>名称</span>
				<input type="text"/>
			</p>
			<p>
				<span>描述</span>
			</p>
			<textarea></textarea>
		</div>
		<div class="a_d_footer">
			<span class="sure">确定</span>
			<span class="close">取消</span>
		</div>
	</div>
	<!-- end add_module -->
	<!-- update_module begin -->
	<div class="add_module" id="update_module">
		<div class="a_d_header">增加类目</div>
		<div class="a_d_main">
			<p>
				<span>名称</span>
				<input />
			</p>
			<p>
				<span>描述</span>
			</p>
			<textarea></textarea>
		</div>
		<div class="a_d_footer">
			<span class="sure">确定</span>
			<span class="close">取消</span>
		</div>
	</div>
	<!-- end update_module -->
	<script type="text/javascript">
		$(function(){
			
			//alert(111);
			initialize();
			
		});
		function initialize(){
			/* delete begin */
			$("#delete_btn").click(function(){
				$("#yy").show();
				dialogShow($(this));
			});
			/* end delete */
			/* add begin */
			$(".add_btn").each(function(index){
				
				$(this).on("click",function(){
					$("#yy").show();
					var top=(getHeight()-$("#add_module").height())/2;
					var left=(getWidth()-$("#add_module").width())/2;
					$("#add_module").css({"top":top,"left":left});
					$("#add_module").show();
					$("#add_module").find(".sure").click(function(){
						$("#add_module").hide();
						$("#yy").hide();
						$("#add_module").find("input,textarea").val("");
						//添加类目操作
					});
					$("#add_module").find(".close").click(function(){
						$("#add_module").hide();
						$("#yy").hide();
						$("#add_module").find("input,textarea").val("");
					});
				});
			});
			/* end add */
			/* update begin */
			$("#update_btn").click(function(){
				$("#yy").show();
				var top=(getHeight()-$("#update_module").height())/2;
				var left=(getWidth()-$("#update_module").width())/2;
				$("#update_module").css({"top":top,"left":left});
				$("#update_module").show();
				$("#update_module").find(".sure").click(function(){
					$("#update_module").hide();
					$("#yy").hide();
					$("#update_module").find("input,textarea").val("");
					//添加类目操作
				});
				$("#update_module").find(".close").click(function(){
					$("#update_module").hide();
					$("#yy").hide();
					$("#update_module").find("input,textarea").val("");
				});
				
			});
			/* end update */
			$(window).scroll(function(){
				if($(window).scrollTop()>=56)
				{
					$("#location").css({"height":"54px","position":"fixed","top":"0","left":"200"});
				}else
				{
					$("#location").css({"position":"static"});
				}
			});
		}
		/*dialog show*/
		function dialogShow(obj){
			var $dialog=$("#yp_dialog");
			var dW=$dialog.width();
			var dH=$dialog.height();
			//var cW=getWidth();
			//var cH=getHeight();
			var newTop=-dH/2;
			var newLeft=-dW/2;
			$dialog.css({"marginLeft":newLeft,"marginTop":newTop,"top":"50%","left":"50%"}).slideDown("slow");
			$dialog.find(".close").click(function(){
				$dialog.slideUp("slow");
				$("#yy").hide();
			});
			$dialog.find(".sure").off("click").on("click",function(){
				//操作
				$dialog.slideUp("slow");
				$("#yy").hide();
			});
		}
		/*dialog show*/
	</script>
</body>
</html>
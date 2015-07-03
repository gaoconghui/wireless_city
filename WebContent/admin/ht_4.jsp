<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!doctype html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
		<title>无线城市-后台-资源模板管理</title>
		<meta name="keywords" content="">
		<meta name="description" content="">
		<!-- <link type="text/css" href="css/reset.css" rel="stylesheet"> -->
		<!--css,js-->
		<style type="text/css">
			.tzht{width:100%,background:#282828;font-weight:700;}
		/*start t_right*/
			.tzht .t_right{background:#f3f4f5;margin-left:200px;padding-bottom:20px;border-bottom:1px solid #ccc;}
			/*start r_location*/
			.tzht .t_right .r_location{width:100%;height:51px;background:#e5e5e5;line-height:51px;border-bottom:1px solid #ccc;}
			.tzht .t_right .r_location i{width:14px;height:18px;background:url("../images/ht/ht_icon.png") no-repeat -16px -51px;margin:16px 20px 0 20px;float:left;}
			.tzht .t_right .r_location span{display:blcok;float:left;}
			
			/*end r_location*/

			.tzht .t_right .r_table{background:#fff;margin:0 1%;border:1px solid #ccc;margin-top:20px;padding-bottom:10px;}

			.tzht .t_right .r_table .r_title{width:100%;height:40px;background:#eee;border-bottom:1px solid #ccc;}
			.tzht .t_right .r_table .r_title i{width:16px;height:14px;background:url("../images/ht/ht_icon.png") no-repeat -386px -15px;display:block;float:left;margin:13px 0 0 10px;}
			.tzht .t_right .r_table .r_title .span{height:40px;line-height:40px;padding-left:5px;color:#000;display:block;float:left;}
			.tzht .t_right .r_table .r_title .r_t_action{height:24px;float:left;margin:8px 0 0 10px;}
			.tzht .t_right .r_table .r_title .r_t_action .ra{margin:2px;width:20px;height:20px;background:url("../images/ht/ht_icon.png") no-repeat;display:block;float:left;cursor:pointer;}
			
			
			.tzht .t_right .r_table .r_title .r_t_action .ra:hover{background-color:#2f3437;}
			.tzht .t_right .r_table .r_title .r_t_action .r_t_a2{background-position:-68px -23px;background-color:#1e90ff;}
			.tzht .t_right .r_table .r_title .r_t_action .r_t_a3{background-position:-120px -49px;background-color:#ff912f;}
			.tzht .t_right .r_table .r_title .r_t_action .r_t_a4{background-position:-419px -50px;background-color:#bd2d30;}
			
			
			
			
			.tzht .t_right .r_table .r_label{width:100%;padding:1% 2%;}
			.tzht .t_right .r_table .r_label .l_form{width:96%;border:1px solid #1e90ff;}
			.tzht .t_right .r_table .r_label .l_tr{border-top:1px dotted #1e90ff;width:100%;height:30px;line-height:30px;}
			.tzht .t_right .r_table .r_label .l_tr:nth-child(2){border:0;}
			.tzht .t_right .r_table .r_label .l_tr:first-child{border:0;height:40px;line-height:40px;background:#1e90ff;font-size:14px;color:#fff;}
			.tzht .t_right .r_table .r_label .l_tr span{width:19%;display:block;float:left;text-indent:4px;}
			.tzht .t_right .r_table .r_label .l_tr .span:before{content:"";border-left:1px dotted #ddd;display:block;float:left;height:40px;}
			.tzht .t_right .r_table .r_label .l_tr span a{background:url("../images/ht/ht_icon.png") no-repeat;width:20px;height:20px;margin:5px;float:left;}
			.tzht .t_right .r_table .r_label .l_tr span a.delete{background-position:-419px -50px;background-color:#bd2d30;}
			.tzht .t_right .r_table .r_label .l_tr span a.info{background-position:-112px -21px;background-color:#28b779;}
			.tzht .t_right .r_table .r_label .l_tr span a.submit{background-position:-68px -23px;background-color:#1e90ff;}
			.tzht .t_right .r_table .r_label .l_tr span a.offsheet{background-position:-120px -49px;background-color:#ff912f;}
			.tzht .t_right .r_table .r_label .l_tr span a.detail{background-position:-23px -23px;background-color:#6297bc;}
			.tzht .t_right .r_table .r_label .l_tr span .ra:hover{background-color:#2f3437;}
			.tzht .t_right .r_table .r_label .l_tr span a.choose{background-position:-478px -50px;}
			.tzht .t_right .r_table .r_label .l_tr span.first_span{width:4%;}
			
			
			.tzht .t_right .r_table .paging{height:40px;margin:0 auto;margin:0 auto;width:210px;}
			.tzht .t_right .r_table .paging a{color:#1e90ff;width:20px;height:20px;display:block;float:left;line-height:20px;border:1px solid #ccc;margin-left:10px;margin-top:10px;border-radius:2px;-webkit-border-radius:2px;}
			.tzht .t_right .r_table .paging a.sel{border-color:#1e90ff;background:#1e90ff;color:#fff;font-weight:700;}
			.tzht .t_right .r_table .paging .next{width:60px;}
		/*end t_right*/
		
		
		
		
		/*yp_dialog begin*/
		#yp_dialog{width:250px;height:150px;border:1px solid #282828;background:#f7f7f7;position:fixed;z-index:10;display:none;}
		#yp_dialog .dialog_title{width:250px;height:40px;background:#282828;color:#fff;text-indent:4px;line-height:40px;font-size:14px;position:relative;}
		#yp_dialog .dialog_title span{line-height:20px;width:20px;height:20px;position:absolute;top:10px;right:10px;cursor:pointer;}
		#yp_dialog .dialog_content{width:250px;height:110px;}
		#yp_dialog .dialog_content a{background:#1e90ff;display:block;height:30px;width:50px;margin:40px 0 0 47px;float:left;color:#fff;line-height:30px;font-size:14px;text-align:center;border-radius:3px;}
		/*yp_dialog end*/
		</style>
		<%-- <script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
		<script type="text/javascript" src="js/yjutil.js"></script> --%>
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
				<i></i><span>您当前所在位置：<a href="#" id="choose">服务资源管理</a></span>
				
			</div>
			<!-- end r_location -->
			<div class="r_table">
				<div class="r_title">
					<i></i><span class="span">服务资源管理</span>
					<div class="r_t_action">
						<span class="r_t_a2 ra" id="submit_btn"></span>
						<span class="r_t_a3 ra" id="offsheet_btn"></span>
						<span class="r_t_a4 ra" id="delete_btn"></span>
					</div>	
				</div>
				<div class="r_label">
					<div class="l_label">
						<div class="l_form" id="l_form">
							<div class="l_tr">
								<span class="first_span">
									<a href="javascript:void(0)" style="background:none;"></a>
								</span>
								<span class="span">服务资源</span>
								<span class="span">所属模板/类目</span>
								<span class="span">操作</span>
								<span class="span">审核</span>
								<span class="span">请求时间</span>
							</div>
							<div class="l_tr">
								<span class="first_span">
									<a href="javascript:void(0)" class="choose"></a>
								</span>
								<span>巴宝莉香水</span>
								<span>香水模板</span>
								<span>
									<a href="javascript:void(0)" class="ra detail" title="详情"></a>	
									<a href="javascript:void(0)" class="ra info" title="通知修改"></a>
									<a href="javascript:void(0)" class="ra submit" title="通过"></a>
									<a href="javascript:void(0)" class="ra offsheet" title="下架"></a>
									<a href="javascript:void(0)" class="ra delete" title="删除"></a>
								</span>
								<span>
									已通过
								</span>
								<span>
									2天前						
								</span>
							</div>
							<div class="l_tr">
								<span class="first_span">
									<a href="javascript:void(0)" class="choose"></a>
								</span>
								<span>巴宝莉香水</span>
								<span>香水模板</span>
								<span>
									<a href="javascript:void(0)" class="ra detail" title="详情"></a>	
									<a href="javascript:void(0)" class="ra info" title="通知修改"></a>
									<a href="javascript:void(0)" class="ra submit" title="通过"></a>
									<a href="javascript:void(0)" class="ra offsheet" title="下架"></a>
									<a href="javascript:void(0)" class="ra delete" title="删除"></a>
								</span>
								<span>
									通知修改中
								</span>
								<span>
									2天前						
								</span>
							</div>
							<div class="l_tr">
								<span class="first_span">
									<a href="javascript:void(0)" class="choose"></a>
								</span>
								<span>巴宝莉香水</span>
								<span>香水模板</span>
								<span>
									<a href="javascript:void(0)" class="ra detail" title="详情"></a>	
									<a href="javascript:void(0)" class="ra info" title="通知修改"></a>
									<a href="javascript:void(0)" class="ra submit" title="通过"></a>
									<a href="javascript:void(0)" class="ra offsheet" title="下架"></a>
									<a href="javascript:void(0)" class="ra delete" title="删除"></a>
								</span>
								<span>
									已下架
								</span>
								<span>
									2天前						
								</span>
							</div>
							
							
							
							
						</div>
					</div>
				</div>
				<div class="paging">
					<a href="javascript:void(0)" class="sel">1</a>
					<a href="javascript:void(0)">2</a>
					<a href="javascript:void(0)">3</a>
					<a href="javascript:void(0)">4</a>
					<a href="javascript:void(0)" class="next">下一页&gt;</a>
				</div>
			</div>
		</div>
		<!-- end t_right -->
	</div>
	
	<!-- dailog begin  -->
	<div id="yp_dialog">
		<p class="dialog_title">确定删除吗？<span class="close">X</span></p>
		<div class="dialog_content">
			<a href="javascript:void(0)" class="sure">确定</a>
			<a href="javascript:void(0)" class="close">取消</a>
		</div>
	</div>
	<!-- end dialog  -->
	<script type="text/javascript">
		$(function(){
			initialize();
		});
		function initialize(){
			/* 选择开始 */
			$("#l_form").find(".choose").each(function(){
				var n=0;
				$(this).on("click",function(){
					n++;
					if(n%2==1){
						$(this).css({"background-position":"-338px -50px"});
					}else{
						$(this).css({"background-position":"-478px -50px"});
					}
				});
			});
			/* 选择结束 */
			/* 单个删除开始 */
			$("#l_form").find(".delete").each(function(){
				$(this).click(function(){
					$("#yy").show();
					dialogShow($(this));
				});
			});
			/* 单个删除结束 */
			
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
				$(obj).each(function(){
					$(this).parents(".l_tr").slideUp("slow",function(){
						$(this).remove();
					});
				});
				$dialog.slideUp("slow");
				$("#yy").hide();
			});
		}
		/*dialog show*/

	</script>
</body>
</html>
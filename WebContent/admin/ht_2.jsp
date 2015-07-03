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
			.tzht .t_right .r_table .r_title span{border-left:1px solid #ccc;height:40px;line-height:40px;padding-left:5px;color:#000;}
			
			.tzht .t_right .r_table .r_title .s_input{width:219px;height:30px;margin-top:8px;float:right;}
			.tzht .t_right .r_table .r_title .s_input input:first-child{width:130px;height:22px;border:2px solid #28b779;border-right:0;line-height:22px;color:#666;padding-left:4px;display:block;float:left;}
			.tzht .t_right .r_table .r_title .s_input .i_btn{width:60px;height:26px;background:#28b779;color:#fff;line-height:26px;text-align:center;font-size:14px; border:0;float:left;cursor:pointer;}
			.tzht .t_right .r_table .r_title .s_input .i_btn:hover{background:#28B79E;}
			
			.tzht .t_right .r_table .r_label{width:100%;}
			.tzht .t_right .r_table .r_label .l_select{width:30%; float:left;}
			.tzht .t_right .r_table .r_label .l_select p{line-height:40px; height:40px;margin-top:10px;margin-left:20px;}
			.tzht .t_right .r_table .r_label .l_select p label{width:38%;font-size:14px;text-align:right;padding-right:10px; }
			.tzht .t_right .r_table .r_label .l_select p .field select{width:60%; height:40px;}
		
			.tzht .t_right .r_table .r_label .l_show{width:66%;float:left;margin:10px 0 0 20px;}
			.tzht .t_right .r_table .r_label .l_show .s_title{height:40px;background:#e5e5e5;line-height:40px;border:1px solid #1e90ff;}
			.tzht .t_right .r_table .r_label .l_show .s_title:first-child{background:#1e90ff;font-size:14px;}
			.tzht .t_right .r_table .r_label .l_show .s_title span{display:block;width:25%;float:left;text-indent:4px;}
			.tzht .t_right .r_table .r_label .l_show .s_title .span:before{content:"";border-left:1px dotted #ddd;height:40px;display:block;float:left;}
			.tzht .t_right .r_table .r_label .l_show .s_title span a{margin-top:8px;width:24px;height:24px;margin-right:2px;background:url("../images/ht/ht_icon.png") no-repeat;display:block;float:left;}
			.tzht .t_right .r_table .r_label .l_show .s_title span a:hover{background-color:#2f3437;}
			.tzht .t_right .r_table .r_label .l_show .s_title span .r_t_a2{background-position:-379px -47px;background-color:#1e90ff;}
			.tzht .t_right .r_table .r_label .l_show .s_title span .r_t_a3{background-position:-21px -20px;background-color:#6297bc;}
			.tzht .t_right .r_table .r_label .l_show .s_title span .r_t_a4{background-position:-417px -48px;background-color:#bd2d30;}
			.tzht .t_right .r_table .r_label .l_show .s_content{display:none;padding-top:10px;border:1px solid #1e90ff;border-top:0px;}
			.tzht .t_right .r_table .r_label .l_show .s_content .c_name{width:25%;float:left;padding-bottom:10px;}
			.tzht .t_right .r_table .r_label .l_show .s_content .c_desc{width:70%;float:right;padding-bottom:10px;}
			.tzht .t_right .r_table .r_label .l_show .s_content span{display:block;margin:0 4px;}
			.tzht .t_right .r_table .r_label .l_show .s_content span.normal{font-weight:500;color:#666;text-indent:30px;}
			.tzht .t_right .r_table .r_label .l_show .s_content .c_attribute{border-top:1px dotted #1e90ff;margin:0 10px;padding:10px 20px;}
			.tzht .t_right .r_table .r_label .l_show .s_content .c_attribute p{width:193px;background:#1e90ff;color:#fff;float:left;margin:0px 10px 10px 10px;}
			.tzht .t_right .r_table .r_label .l_show .s_content .c_attribute p span{line-height:20px;padding-bottom:5px;display:block;float:left;width:115px;font-weight:300;}
			.tzht .t_right .r_table .r_label .l_show .s_content .c_attribute p span:nth-child(odd){width:61px;text-align:right;font-weight:700;}
		
			.tzht .t_right .r_table .r_label .l_show .s_add{border:1px solid #1e90ff;border-top:0;padding:10px 20px;}
			.tzht .t_right .r_table .r_label .l_show .s_add .empty_pic{float:left;border:1px solid #ccc;}
			.tzht .t_right .r_table .r_label .l_show .s_add .add_resource{background:url("../images/ht/add_resource.png") no-repeat;float:right;margin-right:20px;width:100px;height:100px;cursor:pointer;}
			.tzht .t_right .r_table .r_label .l_show .s_add .add_resource:hover{background-color:#ddd;}
		/*end t_right*/
		
		/* add_module begin */
			.add_module{display:none;border:1px solid #282828;width:300px;position:fixed;z-index:11;background:#fff;}
			.add_module .a_d_header{text-indent:10px;background:#282828;color:#fff;font-size:16px;font-weight:700;line-height:40px;height:40px;width:100%;}
			.add_module .a_d_main p{margin-left:20px;margin-top:10px;height:30px;line-height:30px;}
			.add_module .a_d_main p input{font-size:12px;padding-left:4px;width:161px;}
			.add_module .a_d_main textarea{padding-left:4px;margin-left:47px;resize:none;overflow-y:hidden;width:200px;height:100px;}
			.add_module .a_d_footer{width:100%;height:30px;padding:10px 0;}
			.add_module .a_d_footer span{float:left;width:50px;height:30px;line-height:30px;cursor:pointer;font-size:14px;background:#1e90ff;display:block;margin-left:67px;color:#fff;text-align:center;}
			.add_module .a_d_footer .span{margin-left:34px;}
			.add_module .a_d_main p select{width:168px;}
		
			.add_module_attribute{display:none;width:886px;height:355px;position:fixed;z-index:11;}
			.add_module_attribute .add_module{float:left;background:#fff;position:static;display:block;}
			.add_module_attribute .add_delete{float:left;margin:137px 20px;}
			.add_module_attribute .add_delete div{background:url(../images/ht/arrow_btn.png) no-repeat;width:39px;height:38px;margin-bottom:20px;}
			.add_module_attribute .add_delete .next_btn{background-position:-45px -1px;}
			.add_module_attribute .add_delete .back_btn{background-position:-136px -1px;}
			.add_module_attribute .attribute_show{height:353px;float:left;border:1px solid #282828;text-align:center;}
			.add_module_attribute .attribute_show .s_scroll {height:313px;overflow-y:auto;overflow-x:hidden;}
			
			.add_module_attribute .attribute_show .s_title{height:40px;line-height:40px;font-size:14px;background:#282828;color:#fff;border:0;}
			.add_module_attribute .attribute_show .s_scroll .s_title{background:#fff;color:#444;height:20px;width:500px;line-height:20px;border-bottom:1px solid #999;}
			.add_module_attribute .attribute_show .s_title span{width:124px;border-left:1px dotted #999;display:block;float:left;}
			.add_module_attribute .attribute_show .s_title span:first-child{border:0;}
			
			
			
		/* end add_module */
		
		
		/*yp_dialog begin*/
		#yp_dialog{width:250px;height:150px;border:1px solid #282828;background:#f7f7f7;position:fixed;z-index:10;display:none;}
		#yp_dialog .dialog_title{width:250px;height:40px;background:#282828;color:#fff;text-indent:4px;line-height:40px;font-size:14px;position:relative;}
		#yp_dialog .dialog_title span{line-height:20px;width:20px;height:20px;position:absolute;top:10px;right:10px;cursor:pointer;}
		#yp_dialog .dialog_content{width:250px;height:110px;}
		#yp_dialog .dialog_content a{background:#3083eb;display:block;height:30px;width:50px;margin:40px 0 0 47px;float:left;color:#fff;line-height:30px;font-size:14px;text-align:center;border-radius:3px;}
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
				<i></i><span>您当前所在位置：<a href="#" id="choose">资源模板管理</a></span>
			</div>
			<!-- end r_location -->
			<div class="r_table">
				<div class="r_title">
					<i></i><span>资源模板管理</span>
					<div class="s_input">
						<input type="text" placeholder="找服务资源" />
						<div class="i_btn">搜索</div>
					</div>
				</div>
				<div class="r_label">
					<div class="l_select">
						<p>
                            <label>一级类目</label>
                            <span class="field">
	                            <select name="select" class="uniformselect">
	                            	<option value="">Choose One</option>
	                            	<option value="">Choose One</option>
	                            	<option value="">Choose One</option>
	                            </select>
                            </span>
                        </p>
                        <p>
                            <label>二级类目</label>
                            <span class="field">
	                            <select name="select" class="uniformselect">
	                            	<option value="">Choose One</option>
	                            </select>
                            </span>
                        </p>
                        <p>
                            <label>三级类目</label>
                            <span class="field">
	                            <select name="select" class="uniformselect">
	                            	<option value="">Choose One</option>
	                            </select>
                            </span>
                        </p>
                        <p>
                            <label>四级类目</label>
                            <span class="field">
                            <select name="select" class="uniformselect">
                            	<option value="">Choose One</option>
                            </select>
                            </span>
                        </p>
                        <p>
                            <label>五级类目</label>
                            <span class="field">
                            <select name="select" class="uniformselect">
                            	<option value="">Choose One</option>
                            </select>
                            </span>
                        </p>
					</div>
					<div class="l_show" id="l_show">
						<div class="s_title">
							<span>资源名称</span>
							<span class="span">操作</span>
							<span class="span">更新时间</span>
							<span class="span">详情</span>
						</div>
						<div class="s_add" id="s_add">
							<div class="empty_pic"><img alt="空空如也图片" src="" width="300" height="100" /></div>
							<div class="add_resource" id="add_resource"  title="添加模板"></div>
							<div class="clear"></div>
						</div>
						<%-- 
						<div class="s_title">
							<span>衣服</span>
							<span class="span">
								<a class="r_t_a2" href="javascript:void(0)"></a>
								<a class="r_t_a4" href="javascript:void(0)"></a>
							</span>
							<span class="span">2天前</span>
							<span class="span"><a class="r_t_a3" href="javascript:void(0)"></a></span>
						</div>
						<div class="s_content">
							<div class="c_name">
								<span>名称：</span>
								<span class="normal">衣服</span>
							</div>
							<div class="c_desc">
								<span>描述:</span>
								<span class="normal">这是衣服的模板！这是衣服的模板！这是衣服的模板！这是衣服的模板！这是衣服的模板！这是衣服的模板！这是衣服的模板！</span>
							</div>
							<div class="clear"></div>
							<div class="c_attribute">
								<p>
									<span>属性名称：</span>
									<span>价格</span>
									<span>属性描述：</span>
									<span style="text-indent:24px;">价格撒旦撒厉害的卡上了看到就爱上了咖啡拉萨路返回了山东路返回拉黑塑料袋和覅都if哦度是否看见</span>
									<span>属性类型：</span>
									<span>枚举</span>
									<span>枚举类型：</span>
									<span>100,500,1000</span>
								</p>
								<p>
									<span>属性名称：</span>
									<span>价格</span>
									<span>属性描述：</span>
									<span style="text-indent:24px;">价格撒旦撒厉害的卡上了看到就爱上了咖啡拉萨路返回了山东路返回拉黑塑料袋和覅都if哦度是否看见</span>
									<span>属性类型：</span>
									<span>枚举</span>
									<span>枚举类型：</span>
									<span>100,500,1000</span>
								</p>
								<p>
									<span>属性名称：</span>
									<span>价格</span>
									<span>属性描述：</span>
									<span style="text-indent:24px;">价格撒旦撒厉害的卡上了看到就爱上了咖啡拉萨路返回了山东路返回拉黑塑料袋和覅都if哦度是否看见</span>
									<span>属性类型：</span>
									<span>枚举</span>
									<span>枚举类型：</span>
									<span>100,500,1000</span>
								</p>
								<p>
									<span>属性名称：</span>
									<span>价格</span>
									<span>属性描述：</span>
									<span style="text-indent:24px;">价格撒旦撒厉害的卡上了看到就爱上了咖啡拉萨路返回了山东路返回拉黑塑料袋和覅都if哦度是否看见</span>
									<span>属性类型：</span>
									<span>枚举</span>
									<span>枚举类型：</span>
									<span>100,500,1000</span>
								</p>
								<div class="clear"></div>
								
							</div>
						</div>
					 --%>
					</div>
					<div class="clear"></div>
				</div>
			</div>
		</div>
		<!-- end t_right -->
	</div>
	<!-- add_resource begin -->
	<div id="yy"></div>
	<div class="add_module" id="add_module">
		<div class="a_d_header">增加资源模板</div>
		<div class="a_d_main">
			<p>
				<span>模板名称</span>
				<input />
			</p>
			<p>
				<span>模板描述</span>
			</p>
			<textarea></textarea>
		</div>
		<div class="a_d_footer">
			<span class="sure">下一步</span>
			<span class="close">取消</span>
		</div>
	</div>
	<div class="add_module_attribute" id="add_module_attribute">
		<div class="add_module">
			<div class="a_d_header">资源模板属性</div>
			<div class="a_d_main">
				<p>
					<span>属性名称：</span>
					<input type="text"/>
				</p>
				<p>
					<span>属性描述：</span>
				</p>
				<textarea></textarea>
				<p>
					<span>属性类型：</span>
					<select>
						<option>Selcet one</option>
					</select>
				</p>
				<p>
					<span>枚举内容：</span>
					<input type="text"/>
				</p>
			</div>
			<div class="a_d_footer">
				<span class="sure span" >保存</span>
				<span class="close span">取消</span>
				<span class="back_step span">上一步</span>
			</div>
		</div>
		<div class="add_delete">
			<div class="next_btn"></div>
			<div class="back_btn"></div>
		</div>
		<div class="attribute_show">
			<div class="s_title">
				<span>属性名称</span>
				<span>属性描述</span>
				<span>属性类型</span>
				<span>枚举内容</span>
			</div>
			<div class="s_scroll">
				<div class="s_title">
					<span>价格</span>
					<span>即多少钱</span>
					<span>枚举类型</span>
					<span>100,500,1000</span>
				</div>
				<div class="s_title">
					<span>价格</span>
					<span>即多少钱</span>
					<span>枚举类型</span>
					<span>100,500,1000</span>
				</div>	
				<div class="s_title">
					<span>价格</span>
					<span>即多少钱</span>
					<span>枚举类型</span>
					<span>100,500,1000</span>
				</div>
				<div class="s_title">
					<span>价格</span>
					<span>即多少钱</span>
					<span>枚举类型</span>
					<span>100,500,1000</span>
				</div>
				<div class="s_title">
					<span>价格</span>
					<span>即多少钱</span>
					<span>枚举类型</span>
					<span>100,500,1000</span>
				</div>
				<div class="s_title">
					<span>价格</span>
					<span>即多少钱</span>
					<span>枚举类型</span>
					<span>100,500,1000</span>
				</div>
				<div class="s_title">
					<span>价格</span>
					<span>即多少钱</span>
					<span>枚举类型</span>
					<span>100,500,1000</span>
				</div>
				<div class="s_title">
					<span>价格</span>
					<span>即多少钱</span>
					<span>枚举类型</span>
					<span>100,500,1000</span>
				</div>
				<div class="s_title">
					<span>价格</span>
					<span>即多少钱</span>
					<span>枚举类型</span>
					<span>100,500,1000</span>
				</div>
				<div class="s_title">
					<span>价格</span>
					<span>即多少钱</span>
					<span>枚举类型</span>
					<span>100,500,1000</span>
				</div>
				<div class="s_title">
					<span>价格</span>
					<span>即多少钱</span>
					<span>枚举类型</span>
					<span>100,500,1000</span>
				</div>
				<div class="s_title">
					<span>价格</span>
					<span>即多少钱</span>
					<span>枚举类型</span>
					<span>100,500,1000</span>
				</div>
				<div class="s_title">
					<span>价格</span>
					<span>即多少钱</span>
					<span>枚举类型</span>
					<span>100,500,1000</span>
				</div>
				<div class="s_title">
					<span>价格</span>
					<span>即多少钱</span>
					<span>枚举类型</span>
					<span>100,500,1000</span>
				</div>
				<div class="s_title">
					<span>价格</span>
					<span>即多少钱</span>
					<span>枚举类型</span>
					<span>100,500,1000</span>
				</div>
				<div class="s_title">
					<span>价格</span>
					<span>即多少钱</span>
					<span>枚举类型</span>
					<span>100,500,1000</span>
				</div>
			</div>
		</div>
		<div class="clear"></div>
	</div>
	
	
	<!-- end add_resource -->
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
			//增加模板
			
			$("#l_show").on("click",".r_t_a3",function(){
				$(this).parents(".s_title").next().slideDown("slow");
			});
			$("#add_resource").click(function(){
				$("#yy").show();
				var top=(getHeight()-$("#add_module").height())/2;
				var left=(getWidth()-$("#add_module").width())/2;
				$("#add_module").css({"top":top,"left":left});
				$("#add_module").show();
				$("#add_module").find(".sure").click(function(){
					
					$("#add_module").hide();
					$("#add_module_attribute").show();
					var n_top=(getHeight()-$("#add_module_attribute").height())/2;
					var n_left=(getWidth()-$("#add_module_attribute").width())/2;
					
					$("#add_module_attribute").css({"top":n_top,"left":n_left});
					$("#add_module").find("input,textarea").val("");
					$("#add_module_attribute").find(".close").click(function(){
						$("#add_module_attribute").hide();
						$("#yy").hide();
						//取消
					});
					$("#add_module_attribute").find(".sure").off("click").on("click",function(){
						
						$("#add_module_attribute").hide();
						$("#yy").hide();
						//保存成功
						var html="<div class='s_title' style='display:none;'>"+
						"	<span>衣服</span>"+
						"	<span class='span'>"+
						"		<a class='r_t_a2' href='javascript:void(0)' title='修改'></a>"+
						"		<a class='r_t_a4' href='javascript:void(0)' title='删除'></a>"+
						"	</span>"+
						"	<span class='span'>2天前</span>"+
						"	<span class='span'><a class='r_t_a3' href='javascript:void(0)'></a></span>"+
						"</div>"+
						"<div class='s_content'>"+
						"	<div class='c_name'>"+
						"		<span>名称：</span>"+
						"		<span class='normal'>衣服</span>"+
						"	</div>"+
						"	<div class='c_desc'>"+
						"		<span>描述:</span>"+
						"		<span class='normal'>这是衣服的模板！这是衣服的模板！这是衣服的模板！这是衣服的模板！这是衣服的模板！这是衣服的模板！这是衣服的模板！</span>"+
						"	</div>"+
						"	<div class='clear'></div>"+
						"	<div class='c_attribute'>"+
						"		<p>"+
						"			<span>属性名称：</span>"+
						"			<span>价格</span>"+
						"			<span>属性描述：</span>"+
						"			<span style='text-indent:24px;'>价格撒旦撒厉害的卡上了看到就爱上了咖啡拉萨路返回了山东路返回拉黑塑料袋和覅都if哦度是否看见</span>"+
						"			<span>属性类型：</span>"+
						"			<span>枚举</span>"+
						"			<span>枚举类型：</span>"+
						"			<span>100,500,1000</span>"+
						"		</p>"+
						"		<div class='clear'></div>"+
						"	</div>"+
						"</div>";
						$("#l_show").append(html);
						$("#l_show").find(".s_title").each(function(index){
							if($(this).eq(index)){
								$(this).fadeIn(3000);
							}
						});
						$("#s_add").slideUp(2000);
					});
					$("#add_module_attribute").find(".back_step").click(function(){
						$("#add_module_attribute").hide();
						$("#add_module").show();
						//上一步
					});	
				});
						
				$("#add_module").find(".close").click(function(){
					$("#add_module").hide();
					$("#yy").hide();
					$("#add_module").find("input,textarea").val("");
				});
			});
			//编辑模板
			$("#l_show").on("click",".r_t_a2",function(){
				$("#yy").show();
				var top=(getHeight()-$("#add_module").height())/2;
				var left=(getWidth()-$("#add_module").width())/2;
				$("#add_module").css({"top":top,"left":left});
				$("#add_module").show();
				$("#add_module").find(".sure").click(function(){
					
					$("#add_module").hide();
					$("#add_module_attribute").show();
					var n_top=(getHeight()-$("#add_module_attribute").height())/2;
					var n_left=(getWidth()-$("#add_module_attribute").width())/2;
					
					$("#add_module_attribute").css({"top":n_top,"left":n_left});
					$("#add_module").find("input,textarea").val("");
					$("#add_module_attribute").find(".close").click(function(){
						$("#add_module_attribute").hide();
						$("#yy").hide();
						//取消
					});
					$("#add_module_attribute").find(".sure").click(function(){
						$("#add_module_attribute").hide();
						$("#yy").hide();
						//保存成功
						//将现有的删除,保存修改的
					});
					$("#add_module_attribute").find(".back_step").click(function(){
						$("#add_module_attribute").hide();
						$("#add_module").show();
						//上一步
					});		
				});
				$("#add_module").find(".close").click(function(){
					$("#add_module").hide();
					$("#yy").hide();
					$("#add_module").find("input,textarea").val("");
				});
			});
			
			//删除
			$("#l_show").find(".r_t_a4").on("click",function(){
				$("#yy").show();
				dialogShow(this);
			});
			$("#l_show").on("click",".r_t_a4",function(){
				$("#yy").show();
				dialogShow(this);
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
				$(obj).each(function(){
					$(obj).parents(".s_title").next(".s_content").slideUp("slow",function(){
						$(this).remove();
						$(obj).parents(".s_title").slideUp("slow",function(){
							$(this).remove();
							$("#s_add").fadeIn(2000);
						});
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
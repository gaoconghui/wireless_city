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
		<title>无线城市-后台-服务类目管理</title>
		<meta http-eqive="pragma" content="no-cache">
		<meta http-eqive="cache-control" content="no-cache">
		<meta http-eqive="expires" content="0">
		
		<meta name="keywords" content="">
		<meta name="description" content="">
		<!-- <link type="text/css" href="css/reset.css" rel="stylesheet"> -->
		<!--css,js-->
		<style type="text/css">
			.tzht{width:100%,background:#282828;font-weight:700;}
		/*start t_right*/
			.tzht .t_right{background:#f3f4f5;margin-left:200px;}
			/*start r_location*/
			.tzht .t_right .r_location{position:fixed;width:100%;height:51px;background:#e5e5e5;line-height:51px;border-bottom:1px solid #ccc;top:56px;left:200px;}
			.tzht .t_right .r_location i{width:14px;height:18px;background:url("images/ht/ht_icon.png") no-repeat -16px -51px;margin:16px 20px 0 20px;float:left;}
			.tzht .t_right .r_location span{display:blcok;float:left;}
			.tzht .t_right .r_location .r_t_action{display:none;width:108px;height:24px;float:left;margin:12px 0 0 10px;}
			.tzht .t_right .r_location .r_t_action .ra{width:24px;height:24px;margin-right:4px;background:url("images/ht/ht_icon.png") no-repeat;display:block;float:left;cursor:pointer;}
			.tzht .t_right .r_location .r_t_action .ra:hover{background-color:#2f3437;}
			.tzht .t_right .r_location .r_t_action .r_t_a3{background-position:-21px -21px;background-color:#6297bc;}
			
			.tzht .t_right .r_location .r_t_action .r_t_a4{background-position:-417px -48px;background-color:#bd2d30;}
			/*end r_location*/

			.tzht .t_right .r_table{background:#fff;margin:0 1%;border:1px solid #ccc;margin-top:20px;padding-bottom:10px;}

			.tzht .t_right .r_table .r_title{width:100%;height:40px;background:#eee;border-bottom:1px solid #ccc;}
			.tzht .t_right .r_table .r_title i{width:16px;height:14px;background:url("images/ht/ht_icon.png") no-repeat -386px -15px;display:block;float:left;margin:13px 0 0 10px;}
			.tzht .t_right .r_table .r_title span{border-left:1px solid #ccc;height:40px;line-height:40px;padding-left:5px;color:#000;}

			.tzht .t_right .r_table .r_label{width:100%;}
			.tzht .t_right .r_table .r_label ul li{background:#999;margin:10px;float:left;display:block;}
			.tzht .t_right .r_table .r_label ul .add_li{margin:10px;float:left;display:block;background:#28b779;}
			.tzht .t_right .r_table .r_label ul .add_li:hover{background:#28B7AA;}
			.tzht .t_right .r_table .r_label ul li:hover{background:#2f3437;}
			.tzht .t_right .r_table .r_label ul li a{color:#fff;line-height:40px;padding:0px 20px;display:block;white-space:nowrap; height:40px;}
			.tzht .t_right .r_table .r_label ul .add_li a{color:#fff;line-height:40px;padding:0px 20px;display:block;white-space:nowrap; height:40px;}

			.tzht .t_right .r_table .r_label ul .add_li a i{width:15px;height:14px;display:block;background:url("images/ht/ht_icon.png") no-repeat -33px -52px;float:left;margin-top:13px;}
			.tzht .t_right .r_table .r_label ul:after{content:"";display:block;clear:both;}
		/*end t_right*/
		
		/*yp_dialog begin*/
		.yp_dialog{width:250px;height:150px;border:1px solid #282828;background:#f7f7f7;position:fixed;z-index:10;display:none;}
		.yp_dialog .dialog_title{height:40px;background:#282828;color:#fff;text-indent:4px;line-height:40px;font-size:14px;position:relative;}
		.yp_dialog .dialog_title span{line-height:20px;width:20px;height:20px;position:absolute;top:10px;right:10px;cursor:pointer;}
		.yp_dialog .dialog_content{width:250px;height:110px;}
		.yp_dialog .dialog_content a{background:#1e90ff;display:block;height:30px;padding:0px 6px;margin:45px 0 0 47px;float:left;color:#fff;line-height:30px;font-size:14px;text-align:center;border-radius:3px;}
		/*yp_dialog end*/
		
		/* add_category begin */
		.add_category{display:none;border:1px solid #282828;width:300px;position:fixed;z-index:11;background:#fff;}
		.add_category .a_d_header{text-indent:10px;background:#282828;color:#fff;font-size:16px;font-weight:700;line-height:40px;height:40px;width:100%;}
		.add_category .a_d_main p{margin-left:20px;margin-top:10px;height:30px;line-height:30px;}
		.add_category .a_d_main p input,.input{font-size:12px;padding-left:4px;width:198px;}
		.add_category .a_d_main textarea{padding-left:4px;margin-left:47px;resize:none;overflow-y:hidden;width:200px;height:100px;}
		.add_category .a_d_main .textarea{padding-left:4px;margin-left:47px;resize:none;overflow-y:hidden;width:200px;}
		.add_category .a_d_footer{width:100%;height:30px;padding:10px 0;}
		.add_category .a_d_footer span{float:left;width:50px;height:30px;line-height:30px;cursor:pointer;font-size:14px;background:#1e90ff;display:block;margin-left:67px;color:#fff;text-align:center;}
		/* end add_category */
		
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
			.add_module_attribute .add_delete div{background:url(images/ht/arrow_btn.png) no-repeat;width:39px;height:38px;margin-bottom:20px;}
			.add_module_attribute .add_delete .next_btn{cursor:pointer;background-position:-45px -1px;}
			.add_module_attribute .add_delete .back_btn{cursor:pointer;background-position:-136px -1px;}
			.add_module_attribute .attribute_show{height:353px;float:left;border:1px solid #282828;text-align:center;}
			.add_module_attribute .attribute_show .s_scroll {height:313px;overflow-y:auto;overflow-x:hidden;background:#fff;}
			
			.add_module_attribute .attribute_show .s_title{height:40px;line-height:40px;font-size:14px;background:#282828;color:#fff;border:0;}
			.add_module_attribute .attribute_show .s_scroll .s_title{cursor:pointer;background:#fff;color:#444;height:20px;width:500px;line-height:20px;border-bottom:1px solid #999;}
			.add_module_attribute .attribute_show .s_title span{width:124px;border-left:1px dotted #999;height:20px;display:block;float:left;}
			.add_module_attribute .attribute_show .s_title span:first-child{border:0;}
			.add_module_attribute .attribute_show .s_title1 span{height:40px;}
			
		/* end add_module */
		
		/* begin info */
		.info{padding:5px 10px;background:#222;color:#fff;position:fixed;top:100px;left:400px;border-radius:10px;display:none;}
		.info span{display:block;float:left;line-height:24px;padding:2px;}
		.info span.i_icon{background-repeat:no-repeat;background-position:cneter;width:24px;height:24px;}
		/* end info */
		</style>
		<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
		<script type="text/javascript" src="js/util.js"></script>
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
				<i></i>
				<span>您当前所在位置：
					<a href="javascript:void(0)" id="choose">服务类目管理</a>
					<a href="javascript:void(0)" id="location_1"></a>
					<a href="javascript:void(0)" id="location_2"></a>
					<a href="javascript:void(0)" id="location_3"></a>
					<a href="javascript:void(0)" id="location_4"></a>
					<a href="javascript:void(0)" id="location_5"></a>
				</span>
				<div class="r_t_action" id="r_action">
					<span class="r_t_a3 ra" id="details_btn" title="详情"></span>
					<span class="r_t_a4 ra" id="delete_btn" title="删除"></span>
				</div>	
			</div>
			<!-- end r_location -->
			<div class="r_table"  data-index="0">
				<div class="r_title"><i></i><span>一类类目</span></div>
				<div class="r_label" id="fir_category">
					<ul>
						<div class="add_li">
							<a href="javascript:void(0)"><i></i></a>
						</div>
					</ul>
				</div>
			</div>
			<div class="r_table"  data-index="1">
				<div class="r_title"><i></i><span>二类目</span></div>
				<div class="r_label" id="sec_category">
					<ul></ul>
				</div>
			</div>
			<div class="r_table"  data-index="2">
				<div class="r_title"><i></i><span>三类目</span></div>
				<div class="r_label" id="thi_category">
					<ul></ul>
				</div>
			</div>
			<div class="r_table"  data-index="3">
				<div class="r_title"><i></i><span>四类目</span></div>
				<div class="r_label" id="for_category">
					<ul></ul>
				</div>
			</div>
			<div class="r_table"  data-index="4">
				<div class="r_title"><i></i><span>五类目</span></div>
				<div class="r_label"  id="fif_category">
					<ul></ul>
				</div>
			</div>
		</div>
		<!-- end t_right -->
	</div>
	<!-- dialog beigin -->
	<div id="yy"></div>
	<div id="yp_dialog" class="yp_dialog">
		<p class="dialog_title">确定删除吗？<span class="close">X</span></p>
		<div class="dialog_content">
			<a href="javascript:void(0)" class="sure">确定</a>
			<a href="javascript:void(0)" class="close">取消</a>
		</div>
	</div>
	<div class="yp_dialog" id="fill_module" style="width:280px;">
		<p class="dialog_title">现在开始填写相应模板？<span class="close">X</span></p>
		<div class="dialog_content">
			<a href="javascript:void(0)" class="sure">确定</a>
			<a href="javascript:void(0)" class="close">使用默认模板</a>
		</div>
	</div>
	<!-- end dialog -->
	<!-- add_category begin -->
	<div class="add_category" id="add_category">
		<div class="a_d_header">增加类目</div>
		<div class="a_d_main">
			<p>父节点为：<span class="parent_name"></span></p>
			<p>
				<span>名称:</span>
				<input type="text" id="category_name"/>
			</p>
			<p>
				<span>描述:</span>
			</p>
			<textarea id="category_desc"></textarea>
		</div>
		<div class="a_d_footer">
			<span class="sure">下一步</span>
			<span class="close">取消</span>
		</div>
	</div>
	<!-- end add_category -->
	<!-- update_module begin -->
	<div class="add_category" id="update_category">
		<div class="a_d_header">修改类目 </div>
		<div class="a_d_main">
			<p>
				<span>名称:</span>
				<input id="update_cate_name"/>
			</p>
			<p>
				<span>描述:</span>
			</p>
			<textarea id="update_cate_desc"></textarea>
		</div>
		<div class="a_d_footer">
			<span class="sure">确定</span>
			<span class="close">取消</span>
		</div>
	</div>
	<!-- end update_module -->
	<!-- add_resource begin -->
	<div class="add_module" id="add_module">
		<div class="a_d_header">增加资源模板</div>
		<div class="a_d_main">
			<p>
				<span>模板名称:</span>
				<input  id="module_name"/>
			</p>
			<p>
				<span>模板描述:</span>
			</p>
			<textarea id="module_desc"></textarea>
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
					<input type="text" id="module_attribute_name"/>
				</p>
				<p>
					<span>属性描述：</span>
				</p>
				<textarea id="module_attribute_desc"></textarea>
				<p>
					<span>属性类型：</span>
					<select id="module_attribute_type">
						<option selected="selected" value="1">文本</option>
						<option value="2">小数</option>
						<option value="3">整形</option>
						<option value="4">时间</option>
						<option value="5">枚举</option>
					</select>
				</p>
				<p id="enmu_type"  style="display:none;">
					<span>枚举内容：</span>
					<input type="text" id="module_attribute_content"/>
				</p>
			</div>
			<div class="a_d_footer">
				<span class="back_step span">上一步</span>
				<span class="sure span" >保存</span>
				<span class="close span">取消</span>
				
			</div>
		</div>
		<div class="add_delete">
			<div class="next_btn" id="next_btn"></div>
			<div class="back_btn" id="back_btn"></div>
		</div>
		<div class="attribute_show">
			<div class="s_title s_title1">
				<span>属性名称</span>
				<span>属性描述</span>
				<span>属性类型</span>
				<span>枚举内容</span>
			</div>
			<div class="s_scroll" id="s_scroll">
				<%-- <div class="s_title">
					<span>价格</span>
					<span>即多少钱</span>
					<span>1</span>
					<span>100,500,1000</span>
				</div> --%>
			</div>
		</div>
		<div class="clear"></div>
	</div>
	<!-- end add_resource -->
	<!-- begin info -->
	<div class="info">
		<span class="i_icon"></span>
		<span class="i_content"></span>
	</div>
	<!-- end info -->
	<!-- details begin -->
	<div class="add_category" id="details_show">
		<div class="a_d_header">类目详情</div>
		<div class="a_d_main">
			<p>id:<span class="parent_name" id="cate_id"></span></p>
			<p>
				<span>名称:</span>
				<span class="input" id="cate_name"></span>
			</p>
			<p>
				<span>描述:</span>
			</p>
			<div class="textarea" id="cate_desc"></div>
			<div class="a_d_footer">
			<span class="sure">更改</span>
			<span class="close">取消</span>
		</div>
		</div>
	</div>
	<!-- end details -->
	<script type="text/javascript" src="js/tmAjax.js"></script>
	<script type="text/javascript" src="js/ht_1.js"></script>
	<script type="text/javascript">
	
		$(function(){
			initialize();	
		});
		function initialize(){
			//findCategory1
			var param={parentid:"1"};
			findCategory("fir_category","CatalogueAction_getRootCatalogueByAJAX",param);
			//findCategory2
			var NextIdNameArg=["sec_category","thi_category","for_category","fif_category"];
			findChildCategory("fir_category",1,NextIdNameArg);
			//findCategory3
			var NextIdNameArg=["thi_category","for_category","fif_category"];
			findChildCategory("sec_category",2,NextIdNameArg);
			//findCategory4
			var NextIdNameArg=["for_category","fif_category"];
			findChildCategory("thi_category",3,NextIdNameArg);
			//findCategory5
			var NextIdNameArg=["fif_category"];
			findChildCategory("for_category",4,NextIdNameArg);
			//init
			/* details begin */
			var $yy=$("#yy");
			$("#details_btn").off("click").click(function(){
				var id=1;
				$("#location").find("span a").each(function(){
					if($(this).data("last")=="1"){
						id=$(this).data("selId");
					}
				});
				var param={"id":id};
				checkCategoryDetails("CatalogueAction_getCatalogueDetailByAJAX",param);
			});
			/* end details */
			/* delete begin */
			$("#delete_btn").off("click").click(function(){
				$yy.show();
				dialogShow($(this));
			});
			/* end delete */
			/* add begin */
			$(".r_table").off("click").on("click",".add_li",function(){
				var $currentLine=$(this).parents(".r_table");
				var $add_category=$("#add_category");
				var index=$(this).parents(".r_table").data("index");
				var str=$("#location_"+index).text();
				var str2=$("#location_"+index).data("selId");
				//alert(str2);
				if(isEmpty(str2)){str2="1";}
				var length=str.length;
				var parent_name=str.substr(1,length-1);
				$add_category.find(".parent_name").text(parent_name);
				$yy.show();
				center_dialog("#add_category");
				resize("#add_category");
				$add_category.show();
				var $category_desc=$("#category_desc");
				var $category_name=$("#category_name");
				
				//保存操作或更新模板
				$add_category.find(".sure").off("click").click(function(){
					var category_desc=$category_desc.val();
					var category_name=$category_name.val();
					var params={parentid:str2,name:category_name,description:category_desc};
					
					
					addCategory("CatalogueAction_addCatalogueByAJAX",params,$currentLine);
					
					
					$category_desc.val("");
					$category_name.val("");
					var $fill_module=$("#fill_module");
					$add_category.hide();
					center_dialog("#fill_module");
					resize("#fill_module");
					$fill_module.show();
					$fill_module.find(".sure").off("click").click(function(){
						var $add_module=$("#add_module");
						$fill_module.hide();
						center_dialog("#add_module");
						resize("#add_module");
						$add_module.show();
						var $module_desc=$("#module_desc");
						var $module_name=$("#module_name");
						$add_module.find(".sure").off("click").click(function(){
							var $add_module_attribute=$("#add_module_attribute");
							$add_module.hide();
							center_dialog("#add_module_attribute");
							resize("#add_module_attribute");
							$add_module_attribute.show();
							var $module_attribute_desc=$("#module_attribute_desc");
							var $module_attribute_name=$("#module_attribute_name");
							var $module_attribute_type=$("#module_attribute_type");
							var $module_attribute_content=$("#module_attribute_content");
							var $s_scroll=$("#s_scroll");
							$module_attribute_type.change(function(){
								if($module_attribute_type.val()=="5"){
									$("#enmu_type").show();
								}else{
									$("#enmu_type").hide();
								}
							});
							$add_module_attribute.find(".close").off("click").click(function(){
								$add_module_attribute.hide();
								$module_desc.val("");
								$module_name.val("");
								$module_attribute_desc.val("");
								$module_attribute_name.val("");
								$module_attribute_type.find("option:eq(0)").attr("selected","selected");
								$module_attribute_content.val("");
								$s_scroll.empty();
								$.tmUtil.infoShow({"message":"默认模板"}).fadeOut(2000);
								$yy.hide();
								var length=$currentLine.find("ul li").length-1;
								//alert("被添加行li的长度为："+length);
								$currentLine.find("ul li").eq(length).fadeIn(2000);
							});
							$add_module_attribute.find(".sure").off("click").click(function(){
								
								var module_desc=$module_desc.val();
								var module_name=$module_name.val();
								var id=newCategoryId;
								//alert("模板名字："+module_name);
								//alert("模板描述："+module_desc);
								//alert("模板id："+id);
								
								//保存模板操作TemplateAction_updateTemplateByAJAX
								var params={templateName:module_name,description:module_desc,id:id};
								updateModule("TemplateAction_updateTemplateByAJAX",params);
								//保存模板属性操作
								/* <div class="s_scroll" id="s_scroll">
									<div class="s_title">
										<span>价格</span>
										<span>即多少钱</span>
										<span>枚举类型</span>
										<span>100,500,1000</span>
									</div> 
								</div> */
								var args= {};
								args["tid"] = id;
								//alert(id+ typeof (id));
								//为什么是0
								$s_scroll.find(".s_title").each(function(index){
									var txt_name=$(this).find("span").eq(0).text();
									var txt_desc=$(this).find("span").eq(1).text();
									var txt_type=$(this).find("span").eq(2).data("value");
									var txt_content=$(this).find("span").eq(3).text();
									args["attributes["+index+"].id"] = "0";
									args["attributes["+index+"].name"] = txt_name;
							        args["attributes["+index+"].description"] = txt_desc;
							        args["attributes["+index+"].type"] = txt_type;
							        args["attributes["+index+"].value"] = txt_content;	
								});
		
					    	        
					    	   // alert(args["attributes[0].name"]+"--"+args["attributes[0].description"]+"--"+args["attributes[0].type"]+"--"+args["attributes[0].value"]);
								//alert(args["attributes[1].name"]+"--"+args["attributes[1].description"]+"--"+args["attributes[1].type"]+"--"+args["attributes[1].value"]);
								saveModuleAttr("AttributeAction_doAttributesByAJAX",args);
								$module_desc.val("");
								$module_name.val("");
								$module_attribute_desc.val("");
								$module_attribute_name.val("");
								$module_attribute_type.find("option:eq(0)").attr("selected","selected");
								$module_attribute_content.val("");
								$add_module_attribute.hide();
								$.tmUtil.infoShow({"message":"自定义模板"}).fadeOut(2000);
								$s_scroll.empty();
								$yy.hide();
								var length=$currentLine.find("ul li").length-1;
								//alert("被添加行li的长度为："+length);
								$currentLine.find("ul li").eq(length).fadeIn(2000);
							});
							$add_module_attribute.find(".back_step").off("click").click(function(){
								$add_module_attribute.hide();
								$add_module.show();
							});
							$add_module_attribute.find(".next_btn").off("click").click(function(){
								var module_attribute_desc=$module_attribute_desc.val();
								var module_attribute_name=$module_attribute_name.val();
								var module_attribute_type=$module_attribute_type.val();
								var module_attribute_content=$module_attribute_content.val();
								var module_attribute_type_text=$module_attribute_type.find("option:selected").text();
								
								var html="<div class='s_title'>"+
									"<span>"+module_attribute_name+"</span>"+
									"<span>"+module_attribute_desc+"</span>"+
									"<span data-value='"+module_attribute_type+"'>"+module_attribute_type_text+"</span>"+
									"<span>"+module_attribute_content+"</span>"+
								"</div>";
								$s_scroll.append(html);
								$module_attribute_desc.val("");
								$module_attribute_name.val("");
								$module_attribute_type.find("option:eq(0)").attr("selected","selected");
								$module_attribute_content.val("");
								$module_attribute_type.trigger("change");
								var length=$s_scroll.find(".s_title").length-1;
								$s_scroll.find(".s_title").eq(length).trigger("click");
								
							});
							$add_module_attribute.find(".back_btn").off("click").click(function(){
								$s_scroll.find(".s_title").each(function(){
									var $this=$(this);
									if($this.data("sel")=="1"){
										var args=[];
										for(var i=0;i<4;i++){
											args[i]=$(this).find("span").eq(i).text();
										}
										$module_attribute_desc.val(args[1]);
										$module_attribute_name.val(args[0]);
										$module_attribute_content.val(args[3]);
										$module_attribute_type.find("option").each(function(){
											if($(this).text()==args[2]){
												$(this).attr("selected","selected");
											}
										});
										$module_attribute_type.trigger("change");
										$this.fadeOut(2000,function(){
											$this.remove();
										});
									}
								});
							});
							//列表点击操作
							$s_scroll.off("click").on("click",".s_title",function(){
								$(this).css({"background":"#f0f0f0"}).siblings().css({"background":"#fff"});
								$(this).data("sel","1").siblings().data("sel","0");
							});
							$s_scroll.on("mouseenter",".s_title",function(){
								if($(this).data("sel")=="0"){
									$(this).css({"background":"#f9f9f9"});
								}
							});
							$s_scroll.on("mouseleave",".s_title",function(){
								if($(this).data("sel")=="0"){
									$(this).css({"background":"#fff"});
								}
							});
						});
						$add_module.find(".close").off("click").click(function(){
							$add_module.hide();
							$.tmUtil.infoShow({"message":"默认模板"}).fadeOut(2000);
							$yy.hide();
							$module_desc.val("");
							$module_name.val("");
							var length=$currentLine.find("ul li").length-1;
							//alert("被添加行li的长度为："+length);
							$currentLine.find("ul li").eq(length).fadeIn(2000);
							//使用默认模板
						});
					});
					$fill_module.find(".close").off("click").click(function(){
						$fill_module.hide();
						$.tmUtil.infoShow({"message":"默认模板"}).fadeOut(2000);
						$yy.hide();
						//编辑操作
						var length=$currentLine.find("ul li").length-1;
						//alert("被添加行li的长度为："+length);
						$currentLine.find("ul li").eq(length).fadeIn(2000);
					});			
				});
				$add_category.find(".close").off("click").click(function(){
					$category_desc.val("");
					$category_name.val("");
					$add_category.hide();
					$yy.hide();
				});
			});
			/* end add */
		}
	</script>
</body>
</html>
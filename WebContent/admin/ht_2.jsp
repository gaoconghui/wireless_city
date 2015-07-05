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
			.tzht .t_right .r_location i{width:14px;height:18px;background:url("images/ht/ht_icon.png") no-repeat -16px -51px;margin:16px 20px 0 20px;float:left;}
			.tzht .t_right .r_location span{display:blcok;float:left;}
			/*end r_location*/

			.tzht .t_right .r_table{background:#fff;margin:0 1%;border:1px solid #ccc;margin-top:20px;padding-bottom:10px;}

			.tzht .t_right .r_table .r_title{width:100%;height:40px;background:#eee;border-bottom:1px solid #ccc;}
			.tzht .t_right .r_table .r_title i{width:16px;height:14px;background:url("images/ht/ht_icon.png") no-repeat -386px -15px;display:block;float:left;margin:13px 0 0 10px;}
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
			.tzht .t_right .r_table .r_label .l_show .details .s_title{height:40px;background:#e5e5e5;line-height:40px;border:1px solid #1e90ff;}
			.tzht .t_right .r_table .r_label .l_show .s_title{height:40px;background:#1e90ff;line-height:40px;border:1px solid #1e90ff;font-size:14px;}
			.tzht .t_right .r_table .r_label .l_show .s_title span{display:block;width:25%;float:left;text-indent:4px;}
			.tzht .t_right .r_table .r_label .l_show .s_title .span:before{content:"";border-left:1px dotted #ddd;height:40px;display:block;float:left;}
			.tzht .t_right .r_table .r_label .l_show .s_title span a{margin-top:8px;width:24px;height:24px;margin-right:2px;background:url("images/ht/ht_icon.png") no-repeat;display:block;float:left;}
			.tzht .t_right .r_table .r_label .l_show .s_title span a:hover{background-color:#2f3437;}
			.tzht .t_right .r_table .r_label .l_show .s_title span .r_t_a2{background-position:-379px -47px;background-color:#1fac75;}
			.tzht .t_right .r_table .r_label .l_show .s_title span .r_t_a3{background-position:-21px -20px;background-color:#6297bc;}
			.tzht .t_right .r_table .r_label .l_show .s_content{display:none;padding-top:10px;border:1px solid #1e90ff;border-top:0px;}
			.tzht .t_right .r_table .r_label .l_show .s_content .c_desc{width:100%;padding-bottom:10px;}
			.tzht .t_right .r_table .r_label .l_show .s_content span{display:block;margin:0 4px;}
			.tzht .t_right .r_table .r_label .l_show .s_content span.normal{font-weight:500;color:#666;text-indent:30px;}
			.tzht .t_right .r_table .r_label .l_show .s_content .c_attribute{border-top:1px dotted #1e90ff;margin:0 10px;padding:10px 20px;}
			.tzht .t_right .r_table .r_label .l_show .s_content .c_attribute:after{content:"";display:block;clear:both;}
			.tzht .t_right .r_table .r_label .l_show .s_content .c_attribute p{width:193px;background:#1e90ff;color:#fff;float:left;margin:0px 10px 10px 10px;}
			.tzht .t_right .r_table .r_label .l_show .s_content .c_attribute p span{line-height:20px;padding-bottom:5px;display:block;float:left;width:115px;font-weight:300;word-wrap: break-word;word-break:break-all;}
			.tzht .t_right .r_table .r_label .l_show .s_content .c_attribute p span:nth-child(odd){width:61px;text-align:right;font-weight:700;}
		

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
			.add_module_attribute .add_delete div{background:url(images/ht/arrow_btn.png) no-repeat;width:39px;height:38px;margin-bottom:20px;}
			.add_module_attribute .add_delete .next_btn{background-position:-45px -1px;}
			.add_module_attribute .add_delete .back_btn{background-position:-136px -1px;}
			.add_module_attribute .attribute_show{height:353px;float:left;border:1px solid #282828;text-align:center;}
			.add_module_attribute .attribute_show .s_scroll {background:#fff;height:313px;overflow-y:auto;overflow-x:hidden;}
			
			.add_module_attribute .attribute_show .s_title{height:40px;line-height:40px;font-size:14px;background:#282828;color:#fff;border:0;}
			.add_module_attribute .attribute_show .s_scroll .s_title{background:#fff;color:#444;height:20px;width:500px;line-height:20px;border-bottom:1px solid #999;}
			.add_module_attribute .attribute_show .s_title span{height:20px;width:124px;border-left:1px dotted #999;display:block;float:left;}
			.add_module_attribute .attribute_show .s_title span:first-child{border:0;}
			.add_module_attribute .attribute_show .s_title1 span{height:40px;}
			
			
			
		/* end add_module */
		
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
	                            <select name="select" class="uniformselect" id="category_1">
	                            	<option value="">Choose One</option>
	                            </select>
                            </span>
                        </p>
                        <p>
                            <label>二级类目</label>
                            <span class="field">
	                            <select name="select" class="uniformselect" id="category_2">
	                            	<option value="">Choose One</option>
	                            </select>
                            </span>
                        </p>
                        <p>
                            <label>三级类目</label>
                            <span class="field">
	                            <select name="select" class="uniformselect" id="category_3">
	                            	<option value="">Choose One</option>
	                            </select>
                            </span>
                        </p>
                        <p>
                            <label>四级类目</label>
                            <span class="field">
	                            <select name="select" class="uniformselect" id="category_4">
	                            	<option value="">Choose One</option>
	                            </select>
                            </span>
                        </p>
                        <p>
                            <label>五级类目</label>
                            <span class="field">
	                            <select name="select" class="uniformselect" id="category_5">
	                            	<option value="">Choose One</option>
	                            </select>
                            </span>
                        </p>
					</div>
					<div class="l_show">
						<div class="s_title"  id="l_show">
							<span>资源名称</span>
							<span class="span">操作</span>
							<span class="span">更新时间</span>
							<span class="span">详情</span>
						</div>
						<!-- script -->
						<div id="show_template_details" class="details">
							
							<div class="s_title" id="module_show">
								<span id="current_module_name">-</span>
								<span class="span">
									<a style="display:none;" class="r_t_a2" href="javascript:void(0)"></a>
								</span>
								<span class="span">-</span>
								<span class="span"><a style="display:none;" class="r_t_a3" href="javascript:void(0)"></a></span>
							</div>
							<div class="s_content">
								<div class="c_desc">
									<span>描述:</span>
									<span class="normal" id="current_module_desc">这是衣服的模板！这是衣服的模板！这是衣服的模板！这是衣服的模板！这是衣服的模板！这是衣服的模板！这是衣服的模板！</span>
								</div>
								<div class="clear"></div>
								<div class="c_attribute" id="mod_attribute">
									<%-- <p>
										<span>属性名称：</span>
										<span>价格</span>
										<span>属性描述：</span>
										<span style="text-indent:24px;">价格撒旦撒厉害的卡上了看到就爱上了咖啡拉萨路返回了山东路返回拉黑塑料袋和覅都if哦度是否看见</span>
										<span>属性类型：</span>
										<span>枚举</span>
										<span>枚举类型：</span>
										<span>100,500,1000</span>
									</p> --%>
									
								</div>
							</div>
						</div>
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
	<script type="text/javascript" src="js/tmAjax.js"></script>
	<script type="text/javascript" src="js/ht_2.js"></script>
	<!-- end dialog  -->
	<script type="text/javascript">
		$(function(){
			
			initialize();
		});
		function initialize(){
			//查看详情
			var n=0;
			$("#show_template_details").find(".r_t_a3").off("click").on("click",function(){
				n++;
				if(n%2==1){
					$(this).closest(".s_title").next().slideDown("slow");
				}else{
					$(this).closest(".s_title").next().slideUp("slow");
				}	
			});
			/* 根据类目查询模板 */
			var param={parentid:"1"};
			findCategory("category_1","CatalogueAction_getRootCatalogueByAJAX",param);
			//findCategory2
			findChildCategory("category_1",2);
			//findCategory3
			findChildCategory("category_2",3);
			//findCategory4
			findChildCategory("category_3",4);
			//findCategory5
			findChildCategory("category_4",5);
			/* 根据类目查询模板 */
			//编辑模板
			var $yy=$("#yy");
			$("#show_template_details").find(".r_t_a2").off("click").on("click",function(){
				var $add_module=$("#add_module");
				center_dialog("#add_module");
				resize("#add_module");
				$add_module.show();
				$yy.show();
				var $module_desc=$("#module_desc");
				var $module_name=$("#module_name");
				var oldName=$("#current_module_name").text();
				var oldDesc=$("#current_module_desc").text();
				console.log(oldName+"==="+oldDesc);
				$module_name.val(oldName);
				$module_desc.val(oldDesc);
				$add_module.find(".sure").off("click").click(function(){
					//delete id args
					var delIdArgs=[];
					var $module_attribute_desc=$("#module_attribute_desc");
					var $module_attribute_name=$("#module_attribute_name");
					var $module_attribute_type=$("#module_attribute_type");
					var $module_attribute_content=$("#module_attribute_content");
					var $s_scroll=$("#s_scroll");
					//enter attribute editor
					var html="";
					$("#mod_attribute").find("p").each(function(){
						var id=$(this).data("attrid");
						
						var name=$(this).find("span:eq(1)").text();
						var desc=$(this).find("span:eq(3)").text();
						var type=$(this).find("span:eq(5)").text();
						var value=$(this).find("span:eq(7)").text();
						html+="<div class='s_title' data-id='"+id+"'>"+
						"	<span>"+name+"</span>"+
						"	<span>"+desc+"</span>"+
						"	<span>"+type+"</span>"+
						"	<span>"+value+"</span>"+
						"</div> ";
					});
					$s_scroll.html(html);
					var $add_module_attribute=$("#add_module_attribute");
					$add_module.hide();
					center_dialog("#add_module_attribute");
					resize("#add_module_attribute");
					$add_module_attribute.show();
					
					
					$module_attribute_type.change(function(){
						if($module_attribute_type.val()=="5"){
							$("#enmu_type").show();
						}else{
							$("#enmu_type").hide();
						}
					});
					$add_module_attribute.find(".close").off("click").click(function(){
						$add_module_attribute.hide();
						$module_attribute_desc.val("");
						$module_attribute_name.val("");
						$module_attribute_type.find("option:eq(0)").attr("selected","selected");
						$module_attribute_content.val("");
						$.tmUtil.infoShow({"message":"取消修改"}).fadeOut(2000);
						$yy.hide();
					});
					$add_module_attribute.find(".sure").off("click").click(function(){
						var module_desc=$module_desc.val();
						var module_name=$module_name.val();
						var templateId=$("#current_module_name").data("templateId");
						if(module_desc!=oldDesc&&module_name!=oldName){
							//修改模板名称，描述
							var params={templateName:module_name,description:module_desc,id:templateId};
							updateModule("TemplateAction_updateTemplateByAJAX",params);
							$("#current_module_name").text(module_name);
							$("#current_module_desc").text(module_desc);
						}
						//templateid delIdArgs[] args
						
					
						
						
						
						//保存模板属性操作
						var args= {};
						args["tid"] = templateId;
						//alert(id+ typeof (id));
						//为什么是0
						var n=-1;
						$s_scroll.find(".s_title").each(function(){
							if(isEmpty($(this).data("id"))){
								n++;
								var txt_name=$(this).find("span").eq(0).text();
								var txt_desc=$(this).find("span").eq(1).text();
								var txt_type=$(this).find("span").eq(2).data("value");
								var txt_content=$(this).find("span").eq(3).text();
								args["attributes["+n+"].id"] = "0";
								args["attributes["+n+"].name"] = txt_name;
						        args["attributes["+n+"].description"] = txt_desc;
						        args["attributes["+n+"].type"] = txt_type;
						        args["attributes["+n+"].value"] = txt_content;	
						        alert("add attribute==="+txt_name+"==="+txt_desc+"==="+txt_type+"==="+txt_content);
							}	
						});
						var length=delIdArgs.length;
						alert(length);
						for(var i=n+1;i<n+1+length;i++){
							args["attributes["+i+"].id"] = "-"+delIdArgs[i-n-1]+"";
							alert(args["attributes["+i+"].id"]);
						}
			    	        
			    	    //alert(args["attributes[0].name"]+"--"+args["attributes[0].description"]+"--"+args["attributes[0].type"]+"--"+args["attributes[0].value"]);
						//alert(args["attributes[1].name"]+"--"+args["attributes[1].description"]+"--"+args["attributes[1].type"]+"--"+args["attributes[1].value"]);
						//delete/save
						saveModuleAttr("AttributeAction_doAttributesByAJAX",args);
						
						
						
						$module_attribute_desc.val("");
						$module_attribute_name.val("");
						$module_attribute_type.find("option:eq(0)").attr("selected","selected");
						$module_attribute_content.val("");
						$add_module_attribute.hide();
						$.tmUtil.infoShow({"message":"修改完成！"}).fadeOut(2000);
						$yy.hide();
						alert("准备更新模板属性");
						var p={tid:templateId};
						findModuleAttrDetails("AttributeAction_getAttributesByAJAX",p);
						
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
								alert($this.data("id"));
								if(isNotEmpty($this.data("id"))){
									delIdArgs.push($this.data("id"));
									alert("delete id args==="+delIdArgs);
								}
								
								
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
					$yy.hide();
					//使用默认模板
				});
			});
		}
	</script>
</body>
</html>
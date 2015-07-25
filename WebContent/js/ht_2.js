/* findCategory ajax */	
var newCategoryId;
var ajaxqueue=1;
	function findCategory(idName,url,dataParams){
		$.tmAjax.request({
			url:url,
			beforeSend:function(){
				//$.tmUtil.infoShow({"message":"加载中..."});
			},
			error:function(){
				//$.tmUtil.infoShow({"message":"服务器出错"}).stop(true,true).fadeOut(1000);
				//$("#yy").hide();
			},
			callback:function(data){
				if(data=="[]"){
					//$.tmUtil.infoHide();
				}else if(data=="0"){
					alert("异常！");
					//$.tmUtil.infoHide();
					//$.tmUtil.infoShow({"message":"数据异常"}).stop(true,true).fadeOut(1000);
				}else{
					var html="";
					console.log(data);
					var $data=$.parseJSON(data);
					var length=$data.length;
					for(var i=0;i<length;i++){
						html+="<option value='"+$data[i].id+"'>"+$data[i].name+"</option>";
					}
					$("#"+idName).append(html);
					//$.tmUtil.infoHide();
				}
			}
		},dataParams);
	}

	function findChildCategory(currentIdName,nextId){
		$("#"+currentIdName).off("change").on("change",function(){
			var $r_t_a3=$("#show_template_details").find(".r_t_a3");
			if($r_t_a3.css("display")=="none")$r_t_a3.show();
			var $r_t_a2=$("#show_template_details").find(".r_t_a2");
			if($r_t_a2.css("display")=="none")$r_t_a2.show();
			var p_id=$("#"+currentIdName).val();
			
			var html="<option value=''>Choose One</option>";
			for(var i=nextId;i<6;i++){
				$("#category_"+i).html(html);
			}
			if(isEmpty(p_id)){return;}
			//查询模板
			//TemplateAction_getTemplateDetailByAJAX
			
			var param={parentid:p_id};
			var params={id:p_id};
			findModule("TemplateAction_getTemplateDetailByAJAX",params);
			findCategory("category_"+nextId,"CatalogueAction_getChildCatalogueByAJAX",param);
			//alert(p_id);
			var p={tid:p_id};
			findModuleAttrDetails("AttributeAction_getAttributesByAJAX",p);
		});
	}
/* findCategory ajax */
/* findModuleAttrDetails ajax */
	function findModuleAttrDetails(url,dataParams){
		$.ajax({
			type:"post",
			url:url,
			data:dataParams,
			success:function(data){
				if(data=="[]"){
					alert("null");
					$.tmUtil.infoShow({"message":"none attribute"}).stop(true,true).fadeOut(1000);
					$("#yy").hide();
				}else if(data=="0"){
					$("#mod_attribute").html("");
				}else{
					console.log("标识"+data);
					$.tmUtil.infoHide();
					var $data=$.parseJSON(data);
					var html="";
					var length=$data.length;
					var color="";
					for(var i=0;i<length;i++){
						var type="";
						switch($data[i].type){
							case 1:type="文本";break;
							case 2:type="小数";break;
							case 3:type="整形";break;
							case 4:type="时间";break;
							case 5:type="枚举";break;
							default:type="-";break;
						}
						if($data[i].templateid==dataParams.tid){color="#1e90ff";}else{color="#bd2d30";}
						html+="<p data-attrid='"+$data[i].id+"'  style='background:"+color+";'  data-templateid='"+$data[i].templateid+"'>"+
						"			<span>属性名称：</span>"+
						"			<span>"+getDefalutSpan($data[i].name)+"</span>"+
						"			<span>属性描述：</span>"+
						"			<span>"+getDefalutSpan($data[i].description)+"</span>"+
						"			<span>属性类型：</span>"+
						"			<span>"+type+"</span>";
							 
						if(isNotEmpty($data[i].value)){
							html+="	<span>枚举内容：</span>"+
							"	<span>"+$data[i].value+"</span>"+
							"</p>";
						}else{
							html+="</p>";
						}
					}
					$("#mod_attribute").html(html);
					fallsFlow("#mod_attribute","p");
					$(window).resize(function(){
						fallsFlow("#mod_attribute","p");
					});
				}
			}
		});
	}
	function getDefalutSpan(str){
		var string="空";
		isEmpty(str)? string="-": string=str;
		return string;
	}
/* findModuleAttrDetails ajax */
/* findModule ajax */
	function findModule(url,dataParams){
		$.ajax({
			type:"post",
			url:url,
			data:dataParams,
			success:function(data){
				if(data=="[]"){
					$.tmUtil.infoShow({"message":"没有模板"}).stop(true,true).fadeOut(1000);
					$("#yy").hide();
				}else if(data=="0"){
					$.tmUtil.infoShow({"message":"数据异常"}).stop(true,true).fadeOut(1000);
					$("#yy").hide();
				}else{
					console.log(data);
					$.tmUtil.infoHide();
					var $data=$.parseJSON(data);
					$("#current_module_name").text($data.name);
					$("#current_module_name").data("templateId",$data.id);
					$("#current_module_desc").text($data.description);
				}
			}
		});
		/*$.tmAjax.request({
			url:url,
			beforeSend:function(){
				//$.tmUtil.infoShow();
			},
			error:function(){
				//$.tmUtil.infoShow({"message":"服务器访问出错"}).stop(true,true).fadeOut(1000);
			},
			callback:function(data){
				if(data=="[]"){
					$.tmUtil.infoShow({"message":"没有模板"}).stop(true,true).fadeOut(1000);
					$("#yy").hide();
				}else if(data=="0"){
					$.tmUtil.infoShow({"message":"数据异常"}).stop(true,true).fadeOut(1000);
					$("#yy").hide();
				}else{
					console.log(data);
					$.tmUtil.infoHide();
					var $data=$.parseJSON(data);
					$("#module_show").find("span:eq(0)").text($data.name);
					$("#module_name").text($data.name);
					$("#module_desc").text($data.description);
				}
				
			}
		},dataParams);*/
	}
/* findModule ajax */
/* update_module  ajax*/
	function updateModule(url,dataParams){
		$.ajax({
			type:"post",
			data:dataParams,
			url:url,
			success:function(data){
				if(data=="0"){
					$.tmUtil.infoHide();
					$.tmUtil.infoShow({"message":"数据异常"}).stop(true,true).fadeOut(1000);
				}else if(data=="1"){
					$.tmUtil.infoHide();
					$.tmUtil.infoShow({"message":"创建成功"}).stop(true,true).fadeOut(1000);
				}else{
					$.tmUtil.infoShow({"message":"未知错误"}).stop(true,true).fadeOut(1000);
				}
			}
		});
	}
/* update_module ajax*/
	/* save_module_attribute  ajax*/
	function saveModuleAttr(url,dataParams,p){
		$.ajax({
			type:"post",
			data:dataParams,
			url:url,
			success:function(data){
				if(data=="0"){
					$.tmUtil.infoHide();
					$.tmUtil.infoShow({"message":"数据异常"}).stop(true,true).fadeOut(1000);
				}else if(data=="1"){
					//alert("保存属性成功！");
					findModuleAttrDetails("AttributeAction_getAttributesByAJAX",p);
					$.tmUtil.infoHide();
				}else{
					$.tmUtil.infoShow({"message":"未知错误"}).stop(true,true).fadeOut(1000);
				}
			}
		});
	}
/* save_module_attribute ajax*/
/*dialog show*/
	function dialogShow(obj){
		var $dialog=$("#yp_dialog");
		var dW=$dialog.width();
		var dH=$dialog.height();
		var newTop=-dH/2;
		var newLeft=-dW/2;
		$dialog.css({"marginLeft":newLeft,"marginTop":newTop,"top":"50%","left":"50%"}).show();
		$dialog.find(".close").off("click").click(function(){
			$dialog.hide();
			$("#yy").hide();
		});
		$dialog.find(".sure").off("click").on("click",function(){
			var id=1;
			$("#location").find("span a").each(function(){
				if($(this).data("last")=="1"){
					id=$(this).data("selId");
				}
			});
			var param={"id":id};
			deleteCategory("CatalogueAction_deleteCatalogueByAJAX",param);
			$dialog.hide();
			$("#yy").hide();
		});
	}
/*dialog show*/
/*main begin*/
	$(function(){
		initialize();
	});
	function initialize(){
		//查看详情
		$("#show_template_details").find(".r_t_a3").off("click").on("click",function(){
			alert("待开发！");	
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
				var templateId=$("#current_module_name").data("templateId");
				$("#mod_attribute").find("p").each(function(){
					var templateid=$(this).data("templateid");
					if(templateid==templateId){
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
					}
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
					$.tmUtil.infoShow({"message":"取消修改"}).stop(true,true).fadeOut(1000);
					$yy.hide();
				});
				$add_module_attribute.find(".sure").off("click").click(function(){
					var module_desc=$module_desc.val();
					var module_name=$module_name.val();
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
					       // alert("add attribute==="+txt_name+"==="+txt_desc+"==="+txt_type+"==="+txt_content);
						}	
					});
					var length=delIdArgs.length;
					//alert(length);
					for(var i=n+1;i<n+1+length;i++){
						args["attributes["+i+"].id"] = "-"+delIdArgs[i-n-1]+"";
						//alert(args["attributes["+i+"].id"]);
					}
		    	        
		    	    //alert(args["attributes[0].name"]+"--"+args["attributes[0].description"]+"--"+args["attributes[0].type"]+"--"+args["attributes[0].value"]);
					//alert(args["attributes[1].name"]+"--"+args["attributes[1].description"]+"--"+args["attributes[1].type"]+"--"+args["attributes[1].value"]);
					//delete/save
					var p={tid:templateId};
					saveModuleAttr("AttributeAction_doAttributesByAJAX",args,p);
					
					
					
					$module_attribute_desc.val("");
					$module_attribute_name.val("");
					$module_attribute_type.find("option:eq(0)").attr("selected","selected");
					$module_attribute_content.val("");
					$add_module_attribute.hide();
					$.tmUtil.infoShow({"message":"修改完成！"}).stop(true,true).fadeOut(1000);
					$yy.hide();
					//alert("准备更新模板属性");
					
					
					
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
							//alert($this.data("id"));
							if(isNotEmpty($this.data("id"))){
								delIdArgs.push($this.data("id"));
								//alert("delete id args==="+delIdArgs);
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
							$this.fadeOut(500,function(){
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
/*main end*/

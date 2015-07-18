/* findCategory ajax */	
var newCategoryId;
	function findCategory(idName,url,dataParams){
		$.tmAjax.request({
			url:url,
			beforeSend:function(){
				$.tmUtil.infoShow({"message":"加载中..."});
			},
			error:function(){
				$.tmUtil.infoShow({"message":"服务器出错"}).stop(true,true).fadeOut(1000);
				$("#yy").hide();
			},
			callback:function(data){
				if(data=="[]"){
					$.tmUtil.infoHide();
				}else if(data=="0"){
					$.tmUtil.infoHide();
					$.tmUtil.infoShow({"message":"数据异常"}).stop(true,true).fadeOut(1000);
				}else{
					var html="";
					var $data=$.parseJSON(data);
					var length=$data.length;
					for(var i=0;i<length;i++){
						html+="<li data-id="+$data[i].id+" data-patentId="+dataParams.parentid+"><a href='javascript:void(0)'><span>"+$data[i].name+"</span></a></li>";
					}
					$("#"+idName).find("ul").prepend(html);
					$.tmUtil.infoHide();
				}
			}
		},dataParams);
	}

	function findChildCategory(currentIdName,locationNameIndex,nextIdNameArg){
		$("#"+currentIdName).off("click").on("click","li",function(){
			/*编辑框*/
			if(currentIdName=="fir_category"){
				if($("#r_action").css("display")=="none"){
					$("#r_action").show();
				}
			}
			/*当前点击第3行框的id,便于第4行的查询*/
			var id=$(this).data("id");
			var html="<div class='add_li'>"+
			"<a href='javascript:void(0)'><i></i></a>"+
			"</div>";
			//清空4 5 行    length=2 两次 
			var length=nextIdNameArg.length;
			for(var i=0;i<length;i++){
				$("#"+nextIdNameArg[i]).find("ul").html("");
			}
			//第四行出现add_btn
			$("#"+nextIdNameArg[0]).find("ul").append(html);
			//其他行remove add_btn
			$("#"+nextIdNameArg[0]).parent().siblings().find("ul").each(function(){
				$(this).find("div").remove(".add_li");
			});
			for(var i=locationNameIndex;i<5;i++){
				$("#location_"+(i+1)).html("");
			}
			$(this).css({"background":"#000"}).siblings("li").css({"background":"#999"});
			$(this).attr("data-sel","1").siblings("li").attr("data-sel","0");
			$("#location_"+locationNameIndex).html("&gt;"+$(this).text()).data({"selId":id,"last":"1"}).siblings().data("last","0");
			var p_id=$(this).data("id");
			var param={parentid:p_id};
			findCategory(nextIdNameArg[0],"CatalogueAction_getChildCatalogueByAJAX",param);
		});
	}
/* findCategory ajax */
/*deleteCategory ajax*/
	function deleteCategory(url,dataParams){
		$.tmAjax.request({
			url:url,
			beforeSend:function(){
				$.tmUtil.infoShow({message:"拼命删除中..."});
			},
			error:function(){},
			callback:function(data){
				if(data=="1"){
					$.tmUtil.infoHide();
					$(".r_table").find("ul li").each(function(){
						if($(this).data("id")==dataParams.id){
							$(this).stop(true,true).fadeOut(1000,function(){
								$(this).remove();
							});
							$(this).parents(".r_table").next().find("ul li").fadeOut(1000,function(){
								$(this).parent().empty();
							});
						}
					});
				}else if(data=="0"){
					$.tmUtil.infoShow({"message":"请选择要删除的类目！"}).stop(true,true).fadeOut(1000);
					$("#yy").hide();
				}else{
					$.tmUtil.infoShow({"message":"未知异常"}).stop(true,true).fadeOut(1000);
					$("#yy").hide();
				}
			}
		},dataParams);
	}
/*deleteCategory ajax*/
/*checkCategory ajax*/
	function checkCategoryDetails(url,dataParams){
		$.tmAjax.request({
			url:url,
			beforeSend:function(){
				$.tmUtil.infoShow();
			},
			error:function(){
				$.tmUtil.infoShow({"message":"服务器访问出错"}).stop(true,true).fadeOut(1000);
			},
			callback:function(data){
				if(data=="[]"){
					$.tmUtil.infoShow({"message":"没有子类目"}).stop(true,true).fadeOut(1000);
					$.tmUtil.infoHide();
				}else if(data=="0"){
					$.tmUtil.infoShow({"message":"数据异常"}).stop(true,true).fadeOut(1000);
					$.tmUtil.infoHide();
				}else{
					$.tmUtil.infoHide();
					var $data=$.parseJSON(data);
					$("#cate_id").text($data.id);
					$("#cate_name").text($data.name);
					$("#cate_desc").text($data.description); 
					center_dialog("#details_show");
					resize("#details_show");
					var $yy=$("#yy");
					$yy.show();
					var $details_show=$("#details_show");
					$details_show.show();
					$details_show.find(".close").off("click").click(function(){
						$details_show.hide();
						$yy.hide();
					});
					$details_show.find(".sure").off("click").click(function(){
						$details_show.hide();
						var name=$data.name;
						var description=$data.description;
						console.log(name + description);
						update_cate(name,description);
					});
				}
			}
		},dataParams);
	}
/* checkCategory ajax */
	
	//问题是  调用update的时候要赋值
/*updateCategory ajax*/
	function update_cate(name,description){
		var $yy=$("#yy");
		$yy.show();
		var $update_category=$("#update_category");
		$update_category.show();
		$("#update_cate_name").val(name);
		$("#update_cate_desc").val(description);
		center_dialog("#update_category");
		resize("#update_category");
		$update_category.find(".close").off("click").click(function(){
			$update_category.hide();
			$yy.hide();
		});
		$update_category.find(".sure").off("click").click(function(){
			var id=1;
			$("#location").find("span a").each(function(){
				if($(this).data("last")=="1"){
					id=$(this).data("selId");
				}
			});
			var n=$("#update_cate_name").val();
			var desc=$("#update_cate_desc").val();
			if(n==name&&desc==description){
				$.tmUtil.infoShow({"message":"没有更新任何数据"}).stop(true,true).fadeOut(1000);
			}else{
				var param={"id":id,"name":n,"description":desc};
				updateCategory("CatalogueAction_UpdateCataloguelByAJAX",param);
			}
			$update_category.hide();
			$yy.hide();
		});
	}
	function updateCategory(url,dataParams){
		$.tmAjax.request({
			url:url,
			beforeSend:function(){
				$.tmUtil.infoShow();
			},
			error:function(){
				$.tmUtil.infoShow({"message":"服务器出错"}).stop(true,true).fadeOut(1000);
			},
			callback:function(data){
				if(data=="0"){
					$.tmUtil.infoShow({"message":"请选择要更新的类目！"}).stop(true,true).fadeOut(1000);
					$.tmUtil.infoHide();
				}else if(data==1){
					$.tmUtil.infoHide();
					//更新类目名
					$(".r_table").find("ul li").each(function(){
						if($(this).data("id")==dataParams.id){
							$(this).find("span").text(dataParams.name);
						}
					});
				}else{
					$.tmUtil.infoShow({"message":"未知异常"}).stop(true,true).fadeOut(1000);
				}
			}
		},dataParams);
	}
/*updateCategory ajax*/
/* add_category  ajax*/
	function addCategory(url,dataParams,$currentLine){
		$.tmAjax.request({
			url:url,
			beforeSend:function(){
				$.tmUtil.infoShow({"message":"保存成功！"});
			},
			error:function(){
				$.tmUtil.infoShow({"message":"服务器出错"}).stop(true,true).fadeOut(1000);
			},
			callback:function(data){
				if(data=="0"){
					$.tmUtil.infoHide();
					$.tmUtil.infoShow({"message":"数据异常"}).stop(true,true).fadeOut(1000);
				}else{
					//alert(data);
					newCategoryId=data;
					var html="<li style='display:none;' data-id="+newCategoryId+" data-patentId="+dataParams.parentid+"><a href='javascript:void(0)'><span>"+dataParams.name+"</span></a></li>";
					html+="<div class='add_li'>"+
					"<a href='javascript:void(0)'><i></i></a>"+
					"</div>";
					$currentLine.find("ul div").remove(".add_li");
					$currentLine.find("ul").append(html);
					
					$.tmUtil.infoShow();
					$.tmUtil.infoHide();
					$("#yy").show();
				}
			}
		},dataParams);
	}
/* add_category ajax*/
/* update_module  ajax*/
	function updateModule(url,dataParams){
		$.ajax({
			type:"post",
			data:dataParams,
			url:url,
			success:function(data){
				if(data=="0"){
					$.tmUtil.infoHide();
					$.tmUtil.infoShow({"message":"请选择要更新的类目!"}).stop(true,true).fadeOut(1000);
				}else if(data=="1"){
					$.tmUtil.infoHide();
					$.tmUtil.infoShow({"message":"创建成功"}).stop(true,true).fadeOut(1000);
					$("#yy").hide();
				}else{
					$.tmUtil.infoShow({"message":"未知错误"}).stop(true,true).fadeOut(1000);
				}
			}
		});
		/*$.tmAjax.request({
			url:url,
			beforeSend:function(){
				$.tmUtil.infoShow({"message":"创建模板中..."});
			},
			error:function(){
				$.tmUtil.infoShow({"message":"服务器出错"}).stop(true,true).fadeOut(1000);
			},
			callback:function(data){
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
		},dataParams);*/
	}
/* update_module ajax*/
/* save_module_attribute  ajax*/
	function saveModuleAttr(url,dataParams){
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
					$.tmUtil.infoHide();
					$("#yy").hide();
				}else{
					$.tmUtil.infoShow({"message":"未知错误"}).stop(true,true).fadeOut(1000);
				}
			}
		});
		/*$.tmAjax.request({
			url:url,
			beforeSend:function(){
				$.tmUtil.infoShow({"message":"创建模板中..."});
			},
			error:function(){
				$.tmUtil.infoShow({"message":"服务器出错"}).stop(true,true).fadeOut(1000);
			},
			callback:function(data){
				if(data=="0"){
					$.tmUtil.infoHide();
					$.tmUtil.infoShow({"message":"数据异常"}).stop(true,true).fadeOut(1000);
				}else if(data=="1"){
					alert("保存属性成功！");
					$.tmUtil.infoHide();
				}else{
					$.tmUtil.infoShow({"message":"未知错误"}).stop(true,true).fadeOut(1000);
				}
			}
		},dataParams);*/
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
/*mian function begin*/
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
							$.tmUtil.infoShow({"message":"默认模板"}).stop(true,true).fadeOut(1000);
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
							$.tmUtil.infoShow({"message":"自定义模板"}).stop(true,true).fadeOut(1000);
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
									$this.stop(true,true).fadeOut(1000,function(){
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
						$.tmUtil.infoShow({"message":"默认模板"}).stop(true,true).fadeOut(1000);
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
					/*$.tmUtil.infoShow({"message":"默认模板"}).stop(true,true).fadeOut(1000);*/
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
/*main function end*/

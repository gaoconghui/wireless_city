/* findCategory ajax */	
var newCategoryId;
	function findCategory(idName,url,dataParams){
		$.tmAjax.request({
			url:url,
			beforeSend:function(){
				$.tmUtil.infoShow({"message":"加载中..."});
			},
			error:function(){
				$.tmUtil.infoShow({"message":"服务器出错"}).fadeOut(2000);
				$("#yy").hide();
			},
			callback:function(data){
				if(data=="[]"){
					$.tmUtil.infoHide();
				}else if(data=="0"){
					$.tmUtil.infoHide();
					$.tmUtil.infoShow({"message":"数据异常"}).fadeOut(2000);
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
							$(this).fadeOut(2000,function(){
								$(this).remove();
							});
							$(this).parents(".r_table").next().find("ul li").fadeOut(1000,function(){
								$(this).parent().empty();
							});
						}
					});
				}else if(data=="0"){
					$.tmUtil.infoShow({"message":"数据异常"}).fadeOut(2000);
					$("#yy").hide();
				}else{
					$.tmUtil.infoShow({"message":"未知异常"}).fadeOut(2000);
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
				$.tmUtil.infoShow({"message":"服务器访问出错"}).fadeOut(2000);
			},
			callback:function(data){
				if(data=="[]"){
					$.tmUtil.infoShow({"message":"没有子类目"}).fadeOut(2000);
					$.tmUtil.infoHide();
				}else if(data=="0"){
					$.tmUtil.infoShow({"message":"数据异常"}).fadeOut(2000);
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
				$.tmUtil.infoShow({"message":"没有更新任何数据"}).fadeOut(2000);
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
				$.tmUtil.infoShow({"message":"服务器出错"}).fadeOut(2000);
			},
			callback:function(data){
				if(data=="0"){
					$.tmUtil.infoShow({"message":"数据异常"}).fadeOut(2000);
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
					$.tmUtil.infoShow({"message":"未知异常"}).fadeOut(2000);
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
				$.tmUtil.infoShow();
			},
			error:function(){
				$.tmUtil.infoShow({"message":"服务器出错"}).fadeOut(2000);
			},
			callback:function(data){
				if(data=="0"){
					$.tmUtil.infoHide();
					$.tmUtil.infoShow({"message":"数据异常"}).fadeOut(2000);
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
					$.tmUtil.infoShow({"message":"数据异常"}).fadeOut(2000);
				}else if(data=="1"){
					$.tmUtil.infoHide();
					$.tmUtil.infoShow({"message":"创建成功"}).fadeOut(2000);
				}else{
					$.tmUtil.infoShow({"message":"未知错误"}).fadeOut(2000);
				}
			}
		});
		/*$.tmAjax.request({
			url:url,
			beforeSend:function(){
				$.tmUtil.infoShow({"message":"创建模板中..."});
			},
			error:function(){
				$.tmUtil.infoShow({"message":"服务器出错"}).fadeOut(2000);
			},
			callback:function(data){
				if(data=="0"){
					$.tmUtil.infoHide();
					$.tmUtil.infoShow({"message":"数据异常"}).fadeOut(2000);
				}else if(data=="1"){
					$.tmUtil.infoHide();
					$.tmUtil.infoShow({"message":"创建成功"}).fadeOut(2000);
				}else{
					$.tmUtil.infoShow({"message":"未知错误"}).fadeOut(2000);
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
					$.tmUtil.infoShow({"message":"数据异常"}).fadeOut(2000);
				}else if(data=="1"){
					//alert("保存属性成功！");
					$.tmUtil.infoHide();
				}else{
					$.tmUtil.infoShow({"message":"未知错误"}).fadeOut(2000);
				}
			}
		});
		/*$.tmAjax.request({
			url:url,
			beforeSend:function(){
				$.tmUtil.infoShow({"message":"创建模板中..."});
			},
			error:function(){
				$.tmUtil.infoShow({"message":"服务器出错"}).fadeOut(2000);
			},
			callback:function(data){
				if(data=="0"){
					$.tmUtil.infoHide();
					$.tmUtil.infoShow({"message":"数据异常"}).fadeOut(2000);
				}else if(data=="1"){
					alert("保存属性成功！");
					$.tmUtil.infoHide();
				}else{
					$.tmUtil.infoShow({"message":"未知错误"}).fadeOut(2000);
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
		$dialog.css({"marginLeft":newLeft,"marginTop":newTop,"top":"50%","left":"50%"}).slideDown("slow");
		$dialog.find(".close").off("click").click(function(){
			$dialog.slideUp("slow");
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
			$dialog.slideUp("slow");
			$("#yy").hide();
		});
	}
/*dialog show*/

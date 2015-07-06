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
				//$.tmUtil.infoShow({"message":"服务器出错"}).fadeOut(2000);
				//$("#yy").hide();
			},
			callback:function(data){
				if(data=="[]"){
					//$.tmUtil.infoHide();
				}else if(data=="0"){
					alert("异常！");
					//$.tmUtil.infoHide();
					//$.tmUtil.infoShow({"message":"数据异常"}).fadeOut(2000);
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
					$.tmUtil.infoShow({"message":"none attribute"}).fadeOut(2000);
					$("#yy").hide();
				}else if(data=="0"){
					alert("exception");
					$("#mod_attribute").html("");
					$.tmUtil.infoShow({"message":"数据异常"}).fadeOut(2000);
					$("#yy").hide();
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
							html+="			<span>枚举内容：</span>"+
							"			<span>"+$data[i].value+"</span>"+
							"		</p>";
						}else{
							html+="		</p>";
						}
					}
					$("#mod_attribute").html(html);
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
					$.tmUtil.infoShow({"message":"没有模板"}).fadeOut(2000);
					$("#yy").hide();
				}else if(data=="0"){
					$.tmUtil.infoShow({"message":"数据异常"}).fadeOut(2000);
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
				//$.tmUtil.infoShow({"message":"服务器访问出错"}).fadeOut(2000);
			},
			callback:function(data){
				if(data=="[]"){
					$.tmUtil.infoShow({"message":"没有模板"}).fadeOut(2000);
					$("#yy").hide();
				}else if(data=="0"){
					$.tmUtil.infoShow({"message":"数据异常"}).fadeOut(2000);
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
					$.tmUtil.infoShow({"message":"数据异常"}).fadeOut(2000);
				}else if(data=="1"){
					$.tmUtil.infoHide();
					$.tmUtil.infoShow({"message":"创建成功"}).fadeOut(2000);
				}else{
					$.tmUtil.infoShow({"message":"未知错误"}).fadeOut(2000);
				}
			}
		});
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

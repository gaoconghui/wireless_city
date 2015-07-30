//项目根目录
var basePath=getRootPath()+"/";
/*查询页初始化*/

/*更多收起*/
function more_less(){
	$("#hd_attribute").find(".p").each(function(){
		var width=$(this).find(".attr_value").width();
		var length=$(this).find(".attr_value a").length;
		var total_width=0;
		var _index=[];
		$(this).find(".attr_value a").each(function(index){
			var each_width=$(this).outerWidth(true);
			total_width+=each_width;
			if(total_width>=width){
				$(this).hide();
				_index.push(index);
			}
		});
		if(total_width>=width){
			$(this).find(".more_attr").show();
		}
		
		$(this).find(".more_attr").off("click").click(function(){
			if($(this).data("state")=="more"){
				$(this).data("state","less");
				$(this).html("收起<i class='iconfont'>&#xe619;</i>");
				for(var i=_index[0];i<length;i++){
					$(this).parent().find(".attr_value a").eq(i).show();
				}
			}else{
				$(this).data("state","more");
				$(this).html("更多<i class='iconfont'>&#xe60b;</i>");
				for(var i=_index[0];i<length;i++){
					$(this).parent().find(".attr_value a").eq(i).hide();
				}
			}
		});
		$(this).find(".more_attr").hover(function(){
			$(this).css("color","#b61d1d");
		},function(){
			$(this).css("color","#444");
		});
	});
}
/*更多收起*/
/*服务商管理页*/
function getChildCategory(idName, nextIdName) {
	$("#" + idName).off("change").on("change",function() {
		var h = "<option value=''>-请选择-</option>";
		var nextId = nextIdName.substr(8, 1);
		$("#category" + nextId).parents(".s_main").show();
		for (var i = nextId; i < 7; i++) {
			$("#category" + i).html(h);
			if (i < 6) {$("#category" + (i * 1 + 1)).parents(".s_main").hide();}
		}
		var pid = $(this).val();
		if (isEmpty(pid)) {return;}
		if (nextId != 6) {
			var options = {
				beforeSend: function() {},
				params: {
					parentid: pid
				},
				callback: function(data) {
					if (data == "[]") {} else {
						var $data = $.parseJSON(data);
						var length = $data.length;
						var html = "";
						for (var i = 0; i < length; i++) {
							html += "<option value='" + $data[i].id + "'>" + $data[i].name + "</option>";
						}
						$("#" + nextIdName).append(html);
					}
				}
			};
			findCategory(options);
		}
	});
}
function initialize_salor() {
	//审核状态切换
	$("#changeState").change(function() {
		var href = $(this).val();
		location.href = href;
	});
	//页码居中
	var width = $("#paging").width();
	$("#center_page").css("marginLeft", -width / 2);
	//查询服务资源
	$("#search_service").click(function() {
		$("#search_service_form")[0].submit();
	});
	//属性筛选
	$("#hd_attrref").find(".attr_show").on({
		"mouseenter": function() {
			$(this).css("border-color", "#f00");
			$(this).find(".delete_icon").css("color", "#f00");
		},
		"mouseleave": function() {
			$(this).css("border-color", "#ccc");
			$(this).find(".delete_icon").css("color", "#444");
		}
	});
	/*添加服务按钮*/
	$("#add_service_btn").off("click").on("click",
	function() {
		var height = $("#add_services").height() + 42;
		$("#add_services").css("marginTop", "-" + height / 2 + "px");
		$("#add_services,#yy").show();
		//查询一类目
		var options = {
			params: {parentid: "1"},
			callback: function(data) {
				if (data == "[]") {} else {
					var $data = $.parseJSON(data);
					var length = $data.length;
					var html = "";
					for (var i = 0; i < length; i++) {
						html += "<option value='" + $data[i].id + "'>" + $data[i].name + "</option>";
					}
					$("#category1").append(html);
				}
			}
		};
		findCategory(options);
		//查询2类目
		getChildCategory("category1", "category2");
		//查询3类目
		getChildCategory("category2", "category3");
		//查询4类目
		getChildCategory("category3", "category4");
		//查询5类目
		getChildCategory("category4", "category5");
		//定制block
		getChildCategory("category5", "category6");
		$("#close_1").on("click",function() {
			$("#add_services,#yy").hide();
			$("#a_s_2").hide();
			$("#a_s_1").show();
			$("#at_new").html("");
			$("#service_name").val("");
			$("#service_desc").val("");
			$("#category1").html("<option value=''>-请选择-</option>");
			$("#category2").parents(".s_main").hide();
			$("#category3").parents(".s_main").hide();
			$("#category4").parents(".s_main").hide();
			$("#category5").parents(".s_main").hide();
		});
		/*下一步 begin*/
		$("#next_step").off("click").on("click",
		function() {
			var n = -2;
			$("#s_sort").find(".s_main").each(function() {
				if ($(this).css("display") == "block") n++;
			});
			if (n < 0) {alert("请选择类目！");return;}
			var pid = $("#s_sort").find(".s_main:eq(" + n + ")").find("select").val();
			var param = {tid: pid};
			$.ajax({
				data: param,
				type: "post",
				url: "AttributeAction_getAttributesByAJAX",
				/* 查询服务资源模板属性名称action */
				/* 修改2 */
				success: function(data) {
					var html = "";
					var $data = $.parseJSON(data);
					var length = $data.length;
					for (var i = 0; i < length; i++) {
						var type = "";
						switch ($data[i].type) {
						case 1:
							type = "文本";
							break;
						case 2:
							type = "小数";
							break;
						case 3:
							type = "整形";
							break;
						case 4:
							type = "时间";
							break;
						case 5:
							type = "枚举";
							break;
						default:
							type = "-";
							break;
						}
						if ($data[i].type != 5) {
							html += "<p data-attrid='" + $data[i].id + "'>" + "	<span title='" + $data[i].name + "'>" + $data[i].name + ":</span><input type='text' placeholder='" + type + "'/>" + "</p>";
						} else {
							var args = [];
							args = $data[i].value.split(",");
							var h = "";
							var optionlength = args.length;
							for (var j = 0; j < optionlength; j++) {
								h += "<option value='" + j + "'>" + args[j] + "</option>";
							}
							html += "<p data-attrid='" + $data[i].id + "'>" + "	<span title='" + $data[i].name + "'>" + $data[i].name + ":</span>" + "<select>" + "	<option value='-1'>-请选择-</option>" + h + "</select>" + "</p>";
						}
					}
					$("#at_fill").html(html);
				}
			});
			$("#a_s_1").hide();
			$("#a_s_2").show();
			var height = $("#add_services").height() + 42;
			$("#add_services").css("marginTop", "-" + height / 2 + "px");
			$("#pre_step").on("click",function() {
				$("#a_s_2").hide();
				$("#a_s_1").show();
				var height = $("#add_services").height() + 42;
				$("#add_services").css("marginTop", "-" + height / 2 + "px");
				$("#at_new").html("");
			});
			$("#submit").off("click").on("click",function() {
				var service_name = $("#service_name").val();
				var service_desc = $("#service_desc").val();
				var param = {
					cid: pid,
					resource_name: service_name,
					description: service_desc
				};
				var enumnotsel=0;
				$("#at_fill").find("p").each(function(index) {
					var value = "";
					if ($(this).find("select").val() == "-1") {
						enumnotsel++;
					} else {
						value = $(this).find("input").val() || $(this).find("select").val();
					}
					var id = $(this).data("attrid");
					param["resourceAttrs[" + index + "].value"] = value;
					param["resourceAttrs[" + index + "].attribute.id"] = id;
				});
				if(enumnotsel!=0){
					alert("枚举类型必须选择！");
					return;
				}
				$.ajax({
					beforeSend: function() {},
					error: function() {
						alert("非常抱歉,服务器出错！");
					},
					data: param,
					url: "AddResourceAction_addResource",
					type: "post",
					success: function(data) {
						if (data == 0) {
							alert("后台异常！");
						} else {
							location.href = "SearchProviderResourceAction_searchResourceBycatalogue?catalogueId=" + pid + "";
						}
					}
				});
				$("#add_services,#yy").hide();
				$("#a_s_2").hide();
				$("#a_s_1").show();
				$("#at_new").html("");
				$("#service_name").val("");
				$("#service_desc").val("");
				$("#category1").html("<option value=''>-请选择-</option>");
				$("#category2").parents(".s_main").hide();
				$("#category3").parents(".s_main").hide();
				$("#category4").parents(".s_main").hide();
				$("#category5").parents(".s_main").hide();
			});
			$("#new_attribute").off("click").on("click",
			function() {
				var html = "<p>" + "<input placeholder='属性' type='text'/><input type='text' placeholder='属性值'/>" + "<i class='iconfont dis_none'>&#xe616;</i>" + "</p>";
				$(this).next().append(html);
			});
			$("#at_new").on("click", "i",
			function() {
				$(this).closest("p").fadeOut("slow",
				function() {
					$(this).remove();
				});
			});
			$("#at_new").on({
				"mouseenter": function() {
					$(this).find("i").show();
					$(this).css("background", "#e45050");
				},
				"mouseleave": function() {
					$(this).find("i").hide();
					$(this).css("background", "#fff");
				}
			},
			"p");
		});
	});
	/*添加服务按钮*/
	/*删除服务按钮*/
	$("#l_content").off("click").on("click", ".delete",function() {
		$("#yy").show();
		dialogShow($(this));
	});
	/*删除服务按钮*/
	/*dialog show*/
	function dialogShow(obj) {
		var $dialog = $("#yp_dialog");
		var dW = $dialog.width();
		var dH = $dialog.height();
		var newTop = -dH / 2;
		var newLeft = -dW / 2;
		$dialog.css({
			"marginLeft": newLeft,
			"marginTop": newTop,
			"top": "50%",
			"left": "50%"
		}).show();
		$dialog.find(".close").click(function() {
			$dialog.hide();
			$("#yy").hide();
		});
		$dialog.find(".sure").off("click").on("click",
		function() {
			var deleteid = $(obj).closest(".l_content").data("rid");
			$.ajax({
				data: {
					rid: deleteid
				},
				url: "AddResourceAction_deleteResource",
				type: "post",
				success: function(data) {
					if (data == "1") {
						var categoryID = $(obj).closest(".l_content").data("parentid");
						location.href = "SearchProviderResourceAction_searchResourceBycatalogue?catalogueId=" + categoryID + "";
					} else {
						alert("后台异常！");
					}
				}
			});
		});
	}
	/*dialog show*/
}


/**/
/*修改资源*/
function edit_rs(){
	$("#edit").off("click").on("click",function(){
		//标题变化
		$("#title").html("修改资源");
		//编辑转保存，取消
		var html="<a href='javascript:void(0)' id='save'>保存</a><a href='javascript:void(0)' id='cancle'>取消</a>";
		$("#operation_panel").empty().css({"marginLeft":"380px","width":"140px"}).html(html);
		$("#save").click(function(){
			$("#update_rs")[0].submit();
		});
		$("#cancle").click(function(){
			var id=$("#rs_id").text();
			location.href="AddResourceAction_toUpdateResource?id="+id;
		});
		//审核和时间消失
		$("#updatetime,#state").remove();
		//span.value变为input
		var name_content=$("#update_rs").find(".name").find(".value").text();
		$("#update_rs").find(".name").html("<span class='key'>资源名称</span><input name='resource_name' value='"+name_content+"'/>");
		var desc_content=$("#update_rs").find(".desc").find(".value").text();
		$("#update_rs").find(".desc").html("<span class='key'>资源描述</span><textarea name='description'>"+desc_content+"</textarea>");
		$("#update_rs").find(".right_wrapper").find("p").each(function(){
			var type=$(this).find(".value").data("type");
			var content=$(this).find(".value").attr("title");
			var name=$(this).find(".key").attr("title");
			var name_index=$(this).find(".value").data("name");
			var args=[];
			if(type=="0"){
				$(this).html("<span class='key' title='"+name+"'>"+name+"</span><input value='"+content+"' name='resourceAttrs["+name_index+"].value' />");
			}else{
				$(this).find(".value .enum_str").each(function(){
					var arg=$(this).text(); 
					args.push(arg);
				});
				var selHtml="";
				var length=args.length;
				for(var i=0;i<length;i++){
					if(content==i){
						selHtml+="<option value='"+i+"' selected>"+args[i]+"</option>";
					}else{
						selHtml+="<option value='"+i+"'>"+args[i]+"</option>";
					}
				}
				$(this).html("<span class='key' title='"+name+"'>"+name+"</span><select name='resourceAttrs["+name_index+"].value'>"+selHtml+"</select>");
			}
		});
		
	});
}
/*修改资源*/
function searchInitialize() {
	//页码居中
	var width = $("#paging").width();
	$("#center_page").css("marginLeft", -width / 2);
	//seach
	$("#search_self").off("click").click(function() {
		$("#s_self")[0].submit();
	});
	//属性筛选
	$("#hd_attrref").find(".attr_show").on({
		"mouseenter": function() {
			$(this).css("border-color", "#f00");
			$(this).find(".delete_icon").css("color", "#f00");
		},
		"mouseleave": function() {
			$(this).css("border-color", "#ccc");
			$(this).find(".delete_icon").css("color", "#444");
		}
	});
	//查询条数
	$("#bd_left").on("change","select",function(){
		var value=$(this).val();
		window.location.href=value;
		});
	}
	//价格范围查询
	$("#hd_attribute").find(".inner").each(function(){
		var $prices=$(this).parents(".bd_prices");
		var $info=$prices.find(".info");
		$(this).hover(function(){
			$(this).css("background","#fff");
			$(this).find("input[type=submit]").show();
		},function(){
			$(this).css("background","inherit");
			$(this).find("input[type=submit]").hide();
		});
		$(this).find(".sub_btn").each(function(){
			$(this).off("click").click(function(){
				var min=$prices.find("input[name=min]").val();
				var max=$prices.find("input[name=max]").val();
				if(!numCheck(min)||!numCheck(max)){
					var errortxt=$info.data("error");
					$info.find("i").css("color","rgb(220, 102, 102)").html("&#xe602;");
					$info.find("span").text(errortxt);
					return false;
				}
				if(min*1>=max*1){
					$(this).parents(".bd_prices").find(".info").find("i").css("color","rgb(220, 102, 102)").html("&#xe602;");
					$(this).parents(".bd_prices").find(".info").find("span").text("右边数值必须大于左边");
					return false;
				}
			});
		});
		$(this).find("input[type=text]").focus(function(){
			var info=$info.data("info");
			$info.find("i").css("color","rgb(117,176,226)").html("&#xe610;");
			$info.find("span").text(info);
		});
	});
	//价格数字验证
/*查询页初始化*/
/*首页nav*/
function navOperation(){
	/*nav_ul click*/
	$("#nav_ul").find("li").each(function() {
		$(this).on({
			"mouseenter" : function() {
				$(this).addClass("lidemo");
			},
			"mouseleave" : function() {
				$(this).removeClass("lidemo");
			}
		});
	});
	/*nav_ul click*/
	/*left_nav hover*/
	$("#left_nav").on({
		"mouseenter" : function() {
			var _index = $(this).data("index");
			$(this).addClass("lihover");
			$(this).find("a").css({
				"color" : "#b61d1d"
			});
			$("#left_content").find("li").eq(_index).css("top",
					40 * _index + "px").show();

		},
		"mouseleave" : function(index) {
			var _index = $(this).data("index");
			$(this).removeClass("lihover");
			$(this).find("a").css({
				"color" : "#fff"
			});
			$("#left_content").find("li").eq(_index).hide();
		}
	}, "li");

	$("#left_content").on({
		"mouseenter" : function(index) {
			var _index = index + 1;
			var $this = $("#left_nav").find("li").eq(_index);
			$(this).show();
			$this.addClass("lihover");
			$this.find(".i_more").text("");
		},
		"mouseleave" : function(index) {
			var _index = index + 1;
			var $this = $("#left_nav").find("li").eq(_index);
			$(this).hide();
			$this.removeClass("lihover");
			$this.find(".i_more").text(">");
		}
	}, "li");
	/*left_nav hover*/
}
/*首页nav*/
/*loginvalidate*/
function loginValidator(){
	//登录
	var timer=null;
	$("#login_submit").click(function(){
		var name=$("#username").val();
		var loginPwd=$("#password").val();
		if(isEmpty(name)){
			$("#message").css({"borderColor":"#b61d1d","color":"#b61d1d"}).text("用户名不能为空！");
			$("#username").focus();
			return;
		}
		if(isEmpty(loginPwd)){
			$("#message").css({"borderColor":"#b61d1d","color":"#b61d1d"}).text("密码不能为空！");
			$("#password").focus();
			return;
		}
		var userType=$("#userType").find("input:checked").val();
		if(userType=="0"){
			var param={name:name,loginPwd:loginPwd};
			clearTimeout(timer);
			timer=setTimeout(function(){
				$.ajax({
					error:function(){
						alert("非常抱歉,服务器异常,请稍候再试！");
					},
					beforeSend:function(){
						$("#login_submit").text("请稍候...");
					},
					url:"LoginAction_login",
					type:"post",
					data:param,
					success:function(data){
						if(data=="0"){
							$("#message").css({"borderColor":"#b61d1d","color":"#b61d1d"}).text("用户名或密码不正确！");
							$("#password").val("");
							$("#password").focus();
							$("#login_submit").text("登录");
						}else{
							$("#login_page").hide();
							$("#yy").hide();
							var html="<div class='more iconfont'>&#xe60a;</div>"+
									"<div class='r_info'>"+name+"</div>"+
									"<div class='r_wel iconfont'>&#xe608;</div>"+
									"<div class='information_box'>"+
									"	<ul>"+
									"		<li><a href='"+basePath+"front/buyer.jsp?id="+data+"'><i class='iconfont'>&#xe612;</i>个人中心</a></li>"+
									"		<li><a href='LoginAction_exit'><i class='iconfont'>&#xe611;</i>退出</a></li>"+
									"	</ul>"+
									"</div>";
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
					error:function(){
						alert("非常抱歉,服务器异常,请稍候再试！");
					},
					beforeSend:function(){
						$("#login_submit").text("请稍候...");
					},
					url:"ProviderAction_login",
					type:"post",
					data:param,
					success:function(data){
						if(data=="0"){
							$("#message").css({"borderColor":"#b61d1d","color":"#b61d1d"}).text("用户名或密码不正确！");
							$("#password").val("");
							$("#password").focus();
							$("#login_submit").text("登录");
						}else if(data=="3"){
							$("#message").css({"borderColor":"#b61d1d","color":"#b61d1d"}).text("账号未通过,请重新注册！");
							$("#password").val("");
							$("#password").focus();
							$("#login_submit").text("登录");
						}else if(data=="2"){
							$("#message").css({"borderColor":"#b61d1d","color":"#b61d1d"}).text("账号审核中！");
							$("#password").val("");
							$("#password").focus();
							$("#login_submit").text("登录");
						}else if(data=="1"){
							window.location.href=""+basePath+"front/salor.jsp";
						}else{
							alert("未知错误");
						}
					}
				});
			},200);
		}
	});	
}
/*注册验证*/
function registerValidate(){
	//input focus
	$("#c_table").find("input").each(function(){
		var $this=$(this),$next=$this.next();
		if($this.parents(".placeholder").data("exist")=="1"){
			$next=$this.parent().next();
		}
		$this.focus(function(){
			var txt=$next.find(".info").data("content");
			$next.find(".info").text(txt);
			$next.find(".icon").css("color","#75b0e2").html("&#xe610;");
			$next.show();
		});
	});
	//input blur
	//name
	$("#userform").find("input[name=name]").blur(function(){
		var $this=$(this),$next=$this.next();
		if($this.parents(".placeholder").data("exist")=="1"){
			$next=$this.parent().next();
		}
		var content=$this.val();
		if(isEmpty(content)){
			$next.find(".info").text("不允许为空！");
			$next.find(".icon").css("color","#dc6666").html("&#xe602;");$this.attr("validate","0");
		}else if(content.length<2||content.length>20){
			$next.find(".info").text("字符数限制在2~20！");
			$next.find(".icon").css("color","#dc6666").html("&#xe602;");$this.attr("validate","0");
		}else{
			var params={name:content};
			$.ajax({
				url:"RegAction_validateName",
				data:params,
				success:function(data){
					if(data=="0"){
						$next.find(".info").text("账号已存在！");
						$next.find(".icon").css("color","#dc6666").html("&#xe602;");$this.attr("validate","0");
					}else if(data=="1"){
						$next.find(".info").text("");
						$next.find(".icon").css("color","#87d448").html("&#xe60c;");$this.attr("validate","1");
					}else{
						alert("后台异常");
					}
				},
				error:function(){
					alert("非常抱歉,服务器异常,请稍候再试！");
				}
			});
		}
	});
	
	//loginName
	$("#c_table").find("input[name=loginName]").blur(function(){
		var $this=$(this),$next=$this.next();
		if($this.parents(".placeholder").data("exist")=="1"){
			$next=$this.parent().next();
		}
		var content=$this.val();
		if(isEmpty(content)){
			$next.find(".info").text("不允许为空！");
			$next.find(".icon").css("color","#dc6666").html("&#xe602;");$this.attr("validate","0");
		}else if(content.length<2||content.length>20){
			$next.find(".info").text("字符数限制在2~20！");
			$next.find(".icon").css("color","#dc6666").html("&#xe602;");$this.attr("validate","0");
		}else{
			$.ajax({
				url:"ProviderAction_validateProvider",
				data:{name:content},
				success:function(data){
					if(data=="0"){
						$next.find(".info").text("账号已存在！");
						$next.find(".icon").css("color","#dc6666").html("&#xe602;");$this.attr("validate","0");
					}else if(data=="1"){
						$next.find(".info").text("");
						$next.find(".icon").css("color","#87d448").html("&#xe60c;");$this.attr("validate","1");
					}else{
						alert("后台异常");
					}
				},
				error:function(){
					alert("非常抱歉,服务器异常,请稍候再试！");
				}
			});
		}
	});
	//loginPwd
	$("#c_table").find("input[name=loginPwd]").blur(function(){
		var $this=$(this),$next=$this.next();
		if($this.parents(".placeholder").data("exist")=="1"){
			$next=$this.parent().next();
		}
		var content=$this.val();
		if(isEmpty(content)){
			$next.find(".info").text("不允许为空！");
			$next.find(".icon").css("color","#dc6666").html("&#xe602;");$this.attr("validate","0");
		}else if(content.length<2||content.length>16){
			$next.find(".info").text("字符数限制在2~16！");
			$next.find(".icon").css("color","#dc6666").html("&#xe602;");$this.attr("validate","0");
		}else{
			$next.find(".info").text("");
			$next.find(".icon").css("color","#87d448").html("&#xe60c;");$this.attr("validate","1");
		}
	});
	//confirmPwd
	$("#c_table").find("input[name=confirmPwd]").blur(function(){
		var $this=$(this),$next=$this.next();
		if($this.parents(".placeholder").data("exist")=="1"){
			$next=$this.parent().next();
		}
		var content=$this.val();
		var pwd=$this.parents("form").find("input[name=loginPwd]").val();
		if(isEmpty(content)){
			$next.find(".info").text("不允许为空！");
			$next.find(".icon").css("color","#dc6666").html("&#xe602;");$this.attr("validate","0");
		}else if(content!=pwd){
			$next.find(".info").text("两次输入密码不相符！");
			$next.find(".icon").css("color","#dc6666").html("&#xe602;");$this.attr("validate","0");
		}else{
			$next.find(".info").text("");
			$next.find(".icon").css("color","#87d448").html("&#xe60c;");$this.attr("validate","1");
		}
	});
	//phoneNumber
	$("#c_table").find("input[name=phoneNumber],input[name=cellphone]").blur(function(){
		var $this=$(this),$next=$this.next();
		if($this.parents(".placeholder").data("exist")=="1"){
			$next=$this.parent().next();
		}
		var content=$this.val();
		if(isEmpty(content)){
			$next.find(".info").text("不允许为空！");
			$next.find(".icon").css("color","#dc6666").html("&#xe602;");$this.attr("validate","0");
		}else if(!mobilephoneFormatCheck(content)){
			$next.find(".info").text("手机格式不正确！");
			$next.find(".icon").css("color","#dc6666").html("&#xe602;");$this.attr("validate","0");
		}else{
			$next.find(".info").text("");
			$next.find(".icon").css("color","#87d448").html("&#xe60c;");$this.attr("validate","1");
		}
	});
	//realName/industry/scale/address
	$("#c_table").find("input[name=realName],input[name=industryName],input[name=industry],input[name=scale],input[name=address]").blur(function(){
		var $this=$(this),$next=$this.next();
		if($this.parents(".placeholder").data("exist")=="1"){
			$next=$this.parent().next();
		}
		var content=$this.val();
		if(isEmpty(content)){
			$next.find(".info").text("不允许为空！");
			$next.find(".icon").css("color","#dc6666").html("&#xe602;");$this.attr("validate","0");
		}else{
			$next.find(".info").text("");
			$next.find(".icon").css("color","#87d448").html("&#xe60c;");$this.attr("validate","1");
		}
	});
	//industry_name(别名name);
	$("#providerform").find("input[name=name]").blur(function(){
		var $this=$(this),$next=$this.next();
		if($this.parents(".placeholder").data("exist")=="1"){
			$next=$this.parent().next();
		}
		var content=$this.val();
		if(isEmpty(content)){
			$next.find(".info").text("不允许为空！");
			$next.find(".icon").css("color","#dc6666").html("&#xe602;");$this.attr("validate","0");
		}else{
			$next.find(".info").text("");
			$next.find(".icon").css("color","#87d448").html("&#xe60c;");$this.attr("validate","1");		
		}
	});
	//email
	$("#c_table").find("input[name=email]").blur(function(){
		var $this=$(this),$next=$this.next();
		if($this.parents(".placeholder").data("exist")=="1"){
			$next=$this.parent().next();
		}
		var content=$this.val();
		if(isEmpty(content)){
			$next.find(".info").text("不允许为空！");
			$next.find(".icon").css("color","#dc6666").html("&#xe602;");$this.attr("validate","0");
		}else if(!emailFormatCheck(content)){
			$next.find(".info").text("邮箱格式不正确！");
			$next.find(".icon").css("color","#dc6666").html("&#xe602;");$this.attr("validate","0");
		}else{
			$next.find(".info").text("");
			$next.find(".icon").css("color","#87d448").html("&#xe60c;");$this.attr("validate","1");
		}
	});
	//telephone
	$("#c_table").find("input[name=telephone],input[name=fax]").blur(function(){
		var $this=$(this),$next=$this.next();
		if($this.parents(".placeholder").data("exist")=="1"){
			$next=$this.parent().next();
		}
		var content=$this.val();
		if(isEmpty(content)){
			$next.find(".info").text("不允许为空！");
			$next.find(".icon").css("color","#dc6666").html("&#xe602;");$this.attr("validate","0");
		}else if(!fixphoneFormatCheck(content)){
			$next.find(".info").text("固话格式不正确！");
			$next.find(".icon").css("color","#dc6666").html("&#xe602;");$this.attr("validate","0");
		}else{
			$next.find(".info").text("");
			$next.find(".icon").css("color","#87d448").html("&#xe60c;");$this.attr("validate","1");
		}
	});
	//QQ
	$("#c_table").find("input[name=qq]").blur(function(){
		var $this=$(this),$next=$this.next();
		if($this.parents(".placeholder").data("exist")=="1"){
			$next=$this.parent().next();
		}
		var content=$this.val();
		if(isEmpty(content)){
			$next.find(".info").text("不允许为空！");
			$next.find(".icon").css("color","#dc6666").html("&#xe602;");$this.attr("validate","0");
		}else if(!qqFormatCheck(content)){
			$next.find(".info").text("qq格式不正确！");
			$next.find(".icon").css("color","#dc6666").html("&#xe602;");$this.attr("validate","0");
		}else{
			$next.find(".info").text("");
			$next.find(".icon").css("color","#87d448").html("&#xe60c;");$this.attr("validate","1");
		}
	});
	//post code
	$("#c_table").find("input[name=postcode]").blur(function(){
		var $this=$(this),$next=$this.next();
		if($this.parents(".placeholder").data("exist")=="1"){
			$next=$this.parent().next();
		}
		var content=$this.val();
		if(isEmpty(content)){
			$next.find(".info").text("不允许为空！");
			$next.find(".icon").css("color","#dc6666").html("&#xe602;");$this.attr("validate","0");
		}else if(!codeFormatCheck(content)){
			$next.find(".info").text("邮编格式不正确！");
			$next.find(".icon").css("color","#dc6666").html("&#xe602;");$this.attr("validate","0");
		}else{
			$next.find(".info").text("");
			$next.find(".icon").css("color","#87d448").html("&#xe60c;");$this.attr("validate","1");
		}
	});
	$("#submit").click(function(){
		var userType=$("#c_sel").find("input:checked").val();
		if(userType=="0"){
			//用户注册
			var n=0;
			$("#userform").find("input").each(function(){
				var $this=$(this),$next=$this.next();
				if($this.parents(".placeholder").data("exist")=="1"){
					$next=$this.parent().next();
				}
				var isValidate=$this.attr("validate");
				if(isValidate == undefined || isValidate == 'undefined'){
					$next.find(".info").text("不允许为空！");
					$next.find(".icon").css("color","#dc6666").html("&#xe602;");$this.attr("validate","0");
					$next.show();
				}else if(isValidate=="1"){
					n++;
				};
			});
			if(n==6){
				var params=$("#userform").serializeArray();
				$.ajax({
					beforeSend:function(){
						$("#submit").text("请稍候...");
					},
					url:"RegAction_doReg",
					data:params,
					success:function(data){
						if(data=="0"){
							alert("注册失败!");
						}else if(data=="1"){
							window.location.href=""+basePath+"front/index.jsp";
						}else{
							alert("后台异常");
						}
					},
					error:function(){
						alert("非常抱歉,服务器异常,请稍候再试！");
					}
				});
			}
		}else{
			//服务商注册
			var n=0;
			$("#providerform").find("input").each(function(){
				var $this=$(this),$next=$this.next();
				if($this.parents(".placeholder").data("exist")=="1"){
					$next=$this.parent().next();
				}
				var isValidate=$this.attr("validate");
				if(isValidate == undefined || isValidate == 'undefined'){
					$next.find(".info").text("不允许为空！");
					$next.find(".icon").css("color","#dc6666").html("&#xe602;");$this.attr("validate","0");
					$next.show();
				}else if(isValidate=="1"){
					n++;
				};
			});
			//到时候会变  加入图片路径
			if(n==13){
				var params=$("#providerform").serializeArray();
				$.ajax({
					beforeSend:function(){
						$("#submit").text("请稍候...");
					},
					url:"ProviderAction_reg",
					data:params,
					success:function(data){
						if(data=="0"){
							alert("注册失败！");
						}else if(data=="1"){
							window.location.href=""+basePath+"front/salor.jsp";
						}else{
							alert("后台异常");
						}
					},
					error:function(){
						alert("非常抱歉,服务器异常,请稍候再试！");
					}
				});
			}
		}
	});
}

/*loginshow*/
function loginBoxShow(){
	$("#s_right").on("click",".r_login",function(){
		//enter键
		$(document).keyup(function(e){
			if(e.keyCode==13){
				$("#login_submit").trigger("click");
			}
		});
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
			$(this).html("&#xe605;");
			$(this).data("sel","1");
		}else{
			$(this).html("");
			$(this).data("sel","0");
		}
	});
}

/*服务商、用户注册切换*/
function changeUsertype(){
	$("#c_sel").find("input").click(function(){
		var value=$("#c_sel").find("input:checked").val();
		if(value=="0"){
			$("#t_buyer").show();
			$("#t_salor").hide();
		}else{
			$("#t_buyer").hide();
			$("#t_salor").show();
		}
	});
}
/*初始化 totop*/
function init(){
	//个人中心
	$("#s_right").on("mouseleave",".information_box",function(){
		$(this).hide();
	});
	$("#s_right").on("mouseenter",".more",function(){
		$(this).siblings(".information_box").show();
	});
	//搜索
	$("#search_all").click(function() {
		$(this).closest("form")[0].submit();
	});
	/*初始化placeholder*/
	$("input[placeholder]").each(function(){
		if(isEmpty($(this).val())){
			$("input[placeholder]").placeholder();
		}
	});
	
	$("#totop").click(function(){
		$("html,body").animate({
			scrollTop:0
		},600);
	});
	$(window).scroll(function(){
		if($(window).scrollTop()>=200)
		{
			$("#totop").fadeIn(1000);
		}else
		{
			$("#totop").stop(true,true).fadeOut(1000);
		}
	});
}
/*登录验证*/
function loginValidate(){
	//enter键
	$(document).keyup(function(e){
		if(e.keyCode==13){
			$("#submit").trigger("click");
		}
	});
	//登录
	var timer=null;
	$("#submit").click(function(){
		var name=$("#username").val();
		var loginPwd=$("#password").val();
		if(isEmpty(name)){
			$("#message").text("用户名不能为空！").show();
			$("#username").focus();
			return;
		}
		if(isEmpty(loginPwd)){
			$("#message").text("密码不能为空！").show();
			$("#password").focus();
			return;
		}
		var userType=$("#userType").find("input:checked").val();
		if(userType=="0"){
			var param={name:name,loginPwd:loginPwd};
			clearTimeout(timer);
			timer=setTimeout(function(){
				$.ajax({
					beforeSend:function(){
						$("#submit").text("请  稍  候 . . .");
					},
					url:"LoginAction_login",
					type:"post",
					error:function(){
						alert("非常抱歉,服务器出错,请稍候再试！");
					},
					data:param,
					success:function(data){
						if(data=="0"){
							$("#message").text("用户名或密码不正确！").show();
							$("#submit").text("登 录");
							$("#password").val("");
							$("#password").focus();
						}else{
							window.location.href=""+basePath+"front/index.jsp";
						}
					}
				});
			},200);
		}else{
			var param={loginName:name,loginPwd:loginPwd};
			clearTimeout(timer);
			timer=setTimeout(function(){
				$.ajax({
					error:function(){
						alert("非常抱歉,服务器出错,请稍候再试！");
					},
					beforeSend:function(){
						$("#submit").text("请  稍  候 . . .");
					},
					url:"ProviderAction_login",
					type:"post",
					data:param,
					success:function(data){
						if(data=="0"){
							$("#message").text("用户名或密码不正确！").show();
							$("#submit").text("登 录");
							$("#password").val("");
							$("#password").focus();
						}else if(data=="3"){
							$("#message").text("账号未通过,请重新注册！").show();
							$("#submit").text("登 录");
							$("#password").val("");
							$("#password").focus();
						}else if(data=="2"){
							$("#message").text("账号审核中！").show();
							$("#submit").text("登 录");
							$("#password").val("");
							$("#password").focus();
						}else if(data=="1"){
							window.location.href=""+basePath+"front/salor.jsp";
						}else{
							alert("未知错误");
						}
					}
				});
			},200);
		}
	});	
}
/*下次自动登陆*/
function loginSelf(){
	$("#sel").on("click",function(){
		var sel=$(this).data("sel");
		if(sel==0){
			$(this).html("&#xe605;");
			$(this).data("sel","1");
		}else{
			$(this).data("sel","0");
			$(this).html("");
		}
	});
}

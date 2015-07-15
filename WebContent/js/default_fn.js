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
	$("#left_nav").on(
			{
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
									"		<li><a href='font/buyer.jsp?id="+data+"'><i class='iconfont'>&#xe612;</i>个人中心</a></li>"+
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
						alert(data);
						if(data=="0"){
							$("#message").css({"borderColor":"#b61d1d","color":"#b61d1d"}).text("用户名或密码不正确！");
							$("#password").val("");
							$("#password").focus();
							$("#login_submit").text("登录");
						}else{
							window.location.href="font/salor.jsp";
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
		var $this=$(this);
		$this.focus(function(){
			var txt=$this.next().find(".info").data("content");
			$this.next().find(".info").text(txt);
			$this.next().find(".icon").css("color","#75b0e2").html("&#xe610;");
			$this.next().show();
		});
	});
	//input blur
	//name
	$("#userform").find("input[name=name]").blur(function(){
		var $this=$(this);
		var content=$this.val();
		if(isEmpty(content)){
			$this.next().find(".info").text("不允许为空！");
			$this.next().find(".icon").css("color","#dc6666").html("&#xe602;");$this.attr("validate","0");
		}else if(content.length<2||content.length>20){
			$this.next().find(".info").text("字符数限制在2~20！");
			$this.next().find(".icon").css("color","#dc6666").html("&#xe602;");$this.attr("validate","0");
		}else{
			var params={name:content};
			$.ajax({
				url:"RegAction_validateName",
				data:params,
				success:function(data){
					if(data=="0"){
						$this.next().find(".info").text("账号已存在！");
						$this.next().find(".icon").css("color","#dc6666").html("&#xe602;");$this.attr("validate","0");
					}else if(data=="1"){
						$this.next().find(".info").text("");
						$this.next().find(".icon").css("color","#87d448").html("&#xe60c;");$this.attr("validate","1");
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
		var $this=$(this);
		var content=$this.val();
		if(isEmpty(content)){
			$this.next().find(".info").text("不允许为空！");
			$this.next().find(".icon").css("color","#dc6666").html("&#xe602;");$this.attr("validate","0");
		}else if(content.length<2||content.length>20){
			$this.next().find(".info").text("字符数限制在2~20！");
			$this.next().find(".icon").css("color","#dc6666").html("&#xe602;");$this.attr("validate","0");
		}else{
			$.ajax({
				url:"ProviderAction_validateProvider",
				data:{name:content},
				success:function(data){
					if(data=="0"){
						$this.next().find(".info").text("账号已存在！");
						$this.next().find(".icon").css("color","#dc6666").html("&#xe602;");$this.attr("validate","0");
					}else if(data=="1"){
						$this.next().find(".info").text("");
						$this.next().find(".icon").css("color","#87d448").html("&#xe60c;");$this.attr("validate","1");
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
		var $this=$(this);
		var content=$this.val();
		if(isEmpty(content)){
			$this.next().find(".info").text("不允许为空！");
			$this.next().find(".icon").css("color","#dc6666").html("&#xe602;");$this.attr("validate","0");
		}else if(content.length<2||content.length>16){
			$this.next().find(".info").text("字符数限制在2~16！");
			$this.next().find(".icon").css("color","#dc6666").html("&#xe602;");$this.attr("validate","0");
		}else{
			$this.next().find(".info").text("");
			$this.next().find(".icon").css("color","#87d448").html("&#xe60c;");$this.attr("validate","1");
		}
	});
	//confirmPwd
	$("#c_table").find("input[name=confirmPwd]").blur(function(){
		var $this=$(this);
		var content=$this.val();
		var pwd=$this.parents("form").find("input[name=loginPwd]").val();
		if(isEmpty(content)){
			$this.next().find(".info").text("不允许为空！");
			$this.next().find(".icon").css("color","#dc6666").html("&#xe602;");$this.attr("validate","0");
		}else if(content!=pwd){
			$this.next().find(".info").text("两次输入密码不相符！");
			$this.next().find(".icon").css("color","#dc6666").html("&#xe602;");$this.attr("validate","0");
		}else{
			$this.next().find(".info").text("");
			$this.next().find(".icon").css("color","#87d448").html("&#xe60c;");$this.attr("validate","1");
		}
	});
	//phoneNumber
	$("#c_table").find("input[name=phoneNumber],input[name=cellphone]").blur(function(){
		var $this=$(this);
		var content=$this.val();
		if(isEmpty(content)){
			$this.next().find(".info").text("不允许为空！");
			$this.next().find(".icon").css("color","#dc6666").html("&#xe602;");$this.attr("validate","0");
		}else if(!mobilephoneFormatCheck(content)){
			$this.next().find(".info").text("手机格式不正确！");
			$this.next().find(".icon").css("color","#dc6666").html("&#xe602;");$this.attr("validate","0");
		}else{
			$this.next().find(".info").text("");
			$this.next().find(".icon").css("color","#87d448").html("&#xe60c;");$this.attr("validate","1");
		}
	});
	//realName/industry/scale/address
	$("#c_table").find("input[name=realName],input[name=industryName],input[name=industry],input[name=scale],input[name=address]").blur(function(){
		var $this=$(this);
		var content=$this.val();
		if(isEmpty(content)){
			$this.next().find(".info").text("不允许为空！");
			$this.next().find(".icon").css("color","#dc6666").html("&#xe602;");$this.attr("validate","0");
		}else{
			$this.next().find(".info").text("");
			$this.next().find(".icon").css("color","#87d448").html("&#xe60c;");$this.attr("validate","1");
		}
	});
	//industry_name(别名name);
	$("#providerform").find("input[name=name]").blur(function(){
		var $this=$(this);
		var content=$this.val();
		if(isEmpty(content)){
			$this.next().find(".info").text("不允许为空！");
			$this.next().find(".icon").css("color","#dc6666").html("&#xe602;");$this.attr("validate","0");
		}else{
			$this.next().find(".info").text("");
			$this.next().find(".icon").css("color","#87d448").html("&#xe60c;");$this.attr("validate","1");		
		}
	});
	//email
	$("#c_table").find("input[name=email]").blur(function(){
		var $this=$(this);
		var content=$this.val();
		if(isEmpty(content)){
			$this.next().find(".info").text("不允许为空！");
			$this.next().find(".icon").css("color","#dc6666").html("&#xe602;");$this.attr("validate","0");
		}else if(!emailFormatCheck(content)){
			$this.next().find(".info").text("邮箱格式不正确！");
			$this.next().find(".icon").css("color","#dc6666").html("&#xe602;");$this.attr("validate","0");
		}else{
			$this.next().find(".info").text("");
			$this.next().find(".icon").css("color","#87d448").html("&#xe60c;");$this.attr("validate","1");
		}
	});
	//telephone
	$("#c_table").find("input[name=telephone],input[name=fax]").blur(function(){
		var $this=$(this);
		var content=$this.val();
		if(isEmpty(content)){
			$this.next().find(".info").text("不允许为空！");
			$this.next().find(".icon").css("color","#dc6666").html("&#xe602;");$this.attr("validate","0");
		}else if(!fixphoneFormatCheck(content)){
			$this.next().find(".info").text("固话格式不正确！");
			$this.next().find(".icon").css("color","#dc6666").html("&#xe602;");$this.attr("validate","0");
		}else{
			$this.next().find(".info").text("");
			$this.next().find(".icon").css("color","#87d448").html("&#xe60c;");$this.attr("validate","1");
		}
	});
	//QQ
	$("#c_table").find("input[name=qq]").blur(function(){
		var $this=$(this);
		var content=$this.val();
		if(isEmpty(content)){
			$this.next().find(".info").text("不允许为空！");
			$this.next().find(".icon").css("color","#dc6666").html("&#xe602;");$this.attr("validate","0");
		}else if(!qqFormatCheck(content)){
			$this.next().find(".info").text("qq格式不正确！");
			$this.next().find(".icon").css("color","#dc6666").html("&#xe602;");$this.attr("validate","0");
		}else{
			$this.next().find(".info").text("");
			$this.next().find(".icon").css("color","#87d448").html("&#xe60c;");$this.attr("validate","1");
		}
	});
	//post code
	$("#c_table").find("input[name=postcode]").blur(function(){
		var $this=$(this);
		var content=$this.val();
		if(isEmpty(content)){
			$this.next().find(".info").text("不允许为空！");
			$this.next().find(".icon").css("color","#dc6666").html("&#xe602;");$this.attr("validate","0");
		}else if(!codeFormatCheck(content)){
			$this.next().find(".info").text("邮编格式不正确！");
			$this.next().find(".icon").css("color","#dc6666").html("&#xe602;");$this.attr("validate","0");
		}else{
			$this.next().find(".info").text("");
			$this.next().find(".icon").css("color","#87d448").html("&#xe60c;");$this.attr("validate","1");
		}
	});
	$("#submit").click(function(){
		
		var userType=$("#c_sel").find("input:checked").val();
		if(userType=="0"){
			//用户注册
			var n=0;
			$("#userform").find("input").each(function(){
				var $this=$(this);
				var isValidate=$this.attr("validate");
				if(isValidate == undefined || isValidate == 'undefined'){
					$this.next().find(".info").text("不允许为空！");
					$this.next().find(".icon").css("color","#dc6666").html("&#xe602;");$this.attr("validate","0");
					$this.next().show();
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
							window.location.href="font/index.jsp";
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
				var $this=$(this);
				var isValidate=$this.attr("validate");
				if(isValidate == undefined || isValidate == 'undefined'){
					$this.next().find(".info").text("不允许为空！");
					$this.next().find(".icon").css("color","#dc6666").html("&#xe602;");$this.attr("validate","0");
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
							window.location.href="font/salor.jsp";
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
	$("input[placeholder]").placeholder();
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
		var param={name:name,loginPwd:loginPwd};
		if(userType=="0"){
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
							window.location.href="font/index.jsp";
						}
					}
				});
			},200);
		}else{
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
						}else{
							window.location.href="font/salor.jsp";
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

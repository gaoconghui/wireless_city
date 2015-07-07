function register(){
	//input focus
	$("#c_table").find("input").each(function(){
		var $this=$(this);
		$this.focus(function(){
			var txt=$this.next().find(".info").data("content");
			$this.next().find(".info").text(txt);
			$this.next().find(".icon").css("backgroundPosition","-160px -390px");
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
			$this.next().find(".icon").css("backgroundPosition","-85px -390px");$this.attr("validate","0");
		}else if(content.length<2||content.length>20){
			$this.next().find(".info").text("字符数限制在2~20！");
			$this.next().find(".icon").css("backgroundPosition","-85px -390px");$this.attr("validate","0");
		}else{
			var params={name:content};
			$.ajax({
				url:"RegAction_validateName",
				data:params,
				success:function(data){
					if(data=="0"){
						$this.next().find(".info").text("账号已存在！");
						$this.next().find(".icon").css("backgroundPosition","-85px -390px");$this.attr("validate","0");
					}else if(data=="1"){
						$this.next().find(".info").text("");
						$this.next().find(".icon").css("backgroundPosition","-47px -390px");$this.attr("validate","1");
					}else{
						alert("exception");
					}
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
			$this.next().find(".icon").css("backgroundPosition","-85px -390px");$this.attr("validate","0");
		}else if(content.length<2||content.length>20){
			$this.next().find(".info").text("字符数限制在2~20！");
			$this.next().find(".icon").css("backgroundPosition","-85px -390px");$this.attr("validate","0");
		}else{
			$.ajax({
				url:"ProviderAction_validateProvider",
				data:{name:content},
				success:function(data){
					if(data=="0"){
						$this.next().find(".info").text("账号已存在！");
						$this.next().find(".icon").css("backgroundPosition","-85px -390px");$this.attr("validate","0");
					}else if(data=="1"){
						$this.next().find(".info").text("");
						$this.next().find(".icon").css("backgroundPosition","-47px -390px");$this.attr("validate","1");
					}else{
						alert("exception");
					}
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
			$this.next().find(".icon").css("backgroundPosition","-85px -390px");$this.attr("validate","0");
		}else if(content.length<2||content.length>16){
			$this.next().find(".info").text("字符数限制在2~16！");
			$this.next().find(".icon").css("backgroundPosition","-85px -390px");$this.attr("validate","0");
		}else{
			$this.next().find(".info").text("");
			$this.next().find(".icon").css("backgroundPosition","-47px -390px");$this.attr("validate","1");
		}
	});
	//confirmPwd
	$("#c_table").find("input[name=confirmPwd]").blur(function(){
		var $this=$(this);
		var content=$this.val();
		var pwd=$this.parents("form").find("input[name=loginPwd]").val();
		if(isEmpty(content)){
			$this.next().find(".info").text("不允许为空！");
			$this.next().find(".icon").css("backgroundPosition","-85px -390px");$this.attr("validate","0");
		}else if(content!=pwd){
			$this.next().find(".info").text("两次输入密码不相符！");
			$this.next().find(".icon").css("backgroundPosition","-85px -390px");$this.attr("validate","0");
		}else{
			$this.next().find(".info").text("");
			$this.next().find(".icon").css("backgroundPosition","-47px -390px");$this.attr("validate","1");
		}
	});
	//phoneNumber
	$("#c_table").find("input[name=phoneNumber],input[name=cellphone]").blur(function(){
		var $this=$(this);
		var content=$this.val();
		if(isEmpty(content)){
			$this.next().find(".info").text("不允许为空！");
			$this.next().find(".icon").css("backgroundPosition","-85px -390px");$this.attr("validate","0");
		}else if(!mobilephoneFormatCheck(content)){
			$this.next().find(".info").text("手机格式不正确！");
			$this.next().find(".icon").css("backgroundPosition","-85px -390px");$this.attr("validate","0");
		}else{
			$this.next().find(".info").text("");
			$this.next().find(".icon").css("backgroundPosition","-47px -390px");$this.attr("validate","1");
		}
	});
	//realName/industry/scale/address
	$("#c_table").find("input[name=realName],input[name=industryName],input[name=industry],input[name=scale],input[name=address]").blur(function(){
		var $this=$(this);
		var content=$this.val();
		if(isEmpty(content)){
			$this.next().find(".info").text("不允许为空！");
			$this.next().find(".icon").css("backgroundPosition","-85px -390px");$this.attr("validate","0");
		}else{
			$this.next().find(".info").text("");
			$this.next().find(".icon").css("backgroundPosition","-47px -390px");$this.attr("validate","1");
		}
	});
	//industry_name(别名name);
	$("#providerform").find("input[name=name]").blur(function(){
		var $this=$(this);
		var content=$this.val();
		if(isEmpty(content)){
			$this.next().find(".info").text("不允许为空！");
			$this.next().find(".icon").css("backgroundPosition","-85px -390px");$this.attr("validate","0");
		}else{
			$this.next().find(".info").text("");
			$this.next().find(".icon").css("backgroundPosition","-47px -390px");$this.attr("validate","1");		
		}
	});
	//email
	$("#c_table").find("input[name=email]").blur(function(){
		var $this=$(this);
		var content=$this.val();
		if(isEmpty(content)){
			$this.next().find(".info").text("不允许为空！");
			$this.next().find(".icon").css("backgroundPosition","-85px -390px");$this.attr("validate","0");
		}else if(!emailFormatCheck(content)){
			$this.next().find(".info").text("邮箱格式不正确！");
			$this.next().find(".icon").css("backgroundPosition","-85px -390px");$this.attr("validate","0");
		}else{
			$this.next().find(".info").text("");
			$this.next().find(".icon").css("backgroundPosition","-47px -390px");$this.attr("validate","1");
		}
	});
	//telephone
	$("#c_table").find("input[name=telephone],input[name=fax]").blur(function(){
		var $this=$(this);
		var content=$this.val();
		if(isEmpty(content)){
			$this.next().find(".info").text("不允许为空！");
			$this.next().find(".icon").css("backgroundPosition","-85px -390px");$this.attr("validate","0");
		}else if(!fixphoneFormatCheck(content)){
			$this.next().find(".info").text("固话格式不正确！");
			$this.next().find(".icon").css("backgroundPosition","-85px -390px");$this.attr("validate","0");
		}else{
			$this.next().find(".info").text("");
			$this.next().find(".icon").css("backgroundPosition","-47px -390px");$this.attr("validate","1");
		}
	});
	//QQ
	$("#c_table").find("input[name=qq]").blur(function(){
		var $this=$(this);
		var content=$this.val();
		if(isEmpty(content)){
			$this.next().find(".info").text("不允许为空！");
			$this.next().find(".icon").css("backgroundPosition","-85px -390px");$this.attr("validate","0");
		}else if(!qqFormatCheck(content)){
			$this.next().find(".info").text("qq格式不正确！");
			$this.next().find(".icon").css("backgroundPosition","-85px -390px");$this.attr("validate","0");
		}else{
			$this.next().find(".info").text("");
			$this.next().find(".icon").css("backgroundPosition","-47px -390px");$this.attr("validate","1");
		}
	});
	//post code
	$("#c_table").find("input[name=postcode]").blur(function(){
		var $this=$(this);
		var content=$this.val();
		if(isEmpty(content)){
			$this.next().find(".info").text("不允许为空！");
			$this.next().find(".icon").css("backgroundPosition","-85px -390px");$this.attr("validate","0");
		}else if(!codeFormatCheck(content)){
			$this.next().find(".info").text("邮编格式不正确！");
			$this.next().find(".icon").css("backgroundPosition","-85px -390px");$this.attr("validate","0");
		}else{
			$this.next().find(".info").text("");
			$this.next().find(".icon").css("backgroundPosition","-47px -390px");$this.attr("validate","1");
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
					$this.next().find(".icon").css("backgroundPosition","-85px -390px");$this.attr("validate","0");
					$this.next().show();
				}else if(isValidate=="1"){
					n++;
				};
			});
			if(n==6){
				var params=$("#userform").serializeArray();
				console.log("----------"+params);
				console.log("----------"+eval(params));
				
				$.ajax({
					url:"RegAction_doReg",
					data:params,
					success:function(data){
						alert(data);
						if(data=="0"){
							alert("register failed!");
						}else if(data=="1"){
							alert("register successed!");
						}else{
							alert("exception");
						}
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
					$this.next().find(".icon").css("backgroundPosition","-85px -390px");$this.attr("validate","0");
				}else if(isValidate=="1"){
					n++;
				};
			});
			//到时候会变  加入图片路径
			if(n==13){
				var params=$("#providerform").serializeArray();
				$.ajax({
					url:"ProviderAction_reg",
					data:params,
					success:function(data){
						alert(data);
						if(data=="0"){
							alert("注册失败！");
						}else if(data=="1"){
							alert("注册成功！");
						}else{
							alert("exception");
						}
					}
				});
			}
		}
	});
}
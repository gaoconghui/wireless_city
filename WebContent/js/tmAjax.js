(function($){
	$.tmUtil={
			infoShow:function(options){
				var opts = $.extend({},{message:"加载中...",picUrl:"images/ht/loader5.gif"},options);
				$(".info").find(".i_content").text(opts.message);
				$(".info").find(".i_icon").css({"background-image":"url("+opts.picUrl+")"});
				center_dialog(".info");
				resize(".info");
				$("#yy").show();
				$(".info").show();
				return $(".info");
			},
			infoHide:function(){
				$(".info").fadeOut(500);
				$("#yy").fadeOut(500);
			}
	};
	/*tmAjax*/
	var ajaxTimeout = null;
	$.tmAjax = {
		request : function(options,dataJson){
			var opts = $.extend({},{async:true,limit:true,beforeSend:function(){
				
			},error:function(){
				$.tmUtil.infoShow({"message":"服务器出错,请尝试刷新！"}).stop(true,true).fadeOut(1000);
				$("#yy").hide();
			},callback:function(data){
				
			}},options);
			var _url = opts.url;
			if(isEmpty(_url)){
				$.tmUtil.infoShow({"message":"请求地址为空"}).fadeOut(2000);
			}
			if(isNotEmpty(opts.params)){
				_url+="&"+opts.params;
			}
			if(opts.limit){
				clearTimeout(ajaxTimeout);
				ajaxTimeout = setTimeout(function(){
					$.tmAjax.ajaxMain(opts,_url,dataJson);
				},200);
			}else{
				$.tmAjax.ajaxMain(opts,_url, dataJson);
			}
		},
		ajaxMain:function(opts,_url,dataJson){
			$.ajax({
				type:"post",
				data:dataJson,
				url : _url,
				async:opts.async,
				beforeSend:function(){opts.beforeSend();},
				error:function(){opts.error();clearTimeout(ajaxTimeout);},
				success:function(data){
					if(data.result=="logout"){
						$.tmLogin._dialogLogin();
					}else if(data.result=="noPermission"){
						tm_showDialog({content:"非常抱歉您没有权限!"});
					}else if(data.result=="frontLogout"){
						//tmLoading("请登录!");
						tm_login_dialog();
					}else{
						if(opts.callback)opts.callback(data);
					}
					clearTimeout(ajaxTimeout);
				}
			});
		}
	};
})(jQuery);
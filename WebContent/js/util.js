/*获取浏览器高度*/
function getHeight() {
	return window.innerHeight || document.documentElement && document.documentElement.clientHeight || document.body.clientHeight;
}
/*获取浏览器宽度*/
function getWidth() {
	return window.innerWidth || document.documentElement && document.documentElement.clientWidth || document.body.clientWidth;
}
/*弹出窗居中*/
function center_dialog(name){
	var top=(getHeight()-$(name).height())/2;
	var left=(getWidth()-$(name).width())/2;
	$(name).css({"top":top,"left":left});
}
/*浏览器缩放--弹出窗居中*/
function resize(name){
	$(window).resize(function(){
		center_dialog(name);
	});
}
/*检查是否为空*/
function isEmpty(val) {
	val = $.trim(val);
	if (val == null)
		return true;
	if (val == undefined || val == 'undefined')
		return true;
	if (val == "")
		return true;
	if (val.length == 0)
		return true;
	if (!/[^(^\s*)|(\s*$)]/.test(val))
		return true;
	return false;
}
function isNotEmpty(val) {
	return !isEmpty(val);
}
/*ajax封装*/
function findCategory(opts){
	var asynctype;
	if(opts.async==false){
		asynctype=opts.async;
	}else{
		asynctype=true;
	}
	var _url="CatalogueAction_getChildCatalogueByAJAX";
	if(isNotEmpty(opts.url)){
		_url=opts.url;
	}
	$.ajax({
		type:"post",
		url:_url,
		async:asynctype,
		data:opts.params,
		beforeSend:function(){
			if(opts.beforeSend){
				opts.beforeSend();
			}else{
				$.tmUtil.infoShow({"message":"请稍后..."}).stop(true,true).fadeOut(1000);
				$("#yy").hide();
			}
		},
		error:function(){
			if(opts.error){
				opts.beforeSend();
			}else{
				$.tmUtil.infoShow({"message":"服务器请求失败"}).fadeOut(1000);
				$("#yy").hide();
			}
		},
		success:function(data){
			if(data=="0"){
				alert("异常错误！");
			}else{
				if(opts.callback){
					opts.callback(data);
				}
			}
		}
	});
}
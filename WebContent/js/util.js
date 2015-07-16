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
/*验证身份证*/
function idCardFormatCheck(idCard){
    var format = /^(\d{6})(18|19|20)?(\d{2})([01]\d)([0123]\d)(\d{3})(\d|X)?$/;
    if (!idCard.match(format)) {
    	return false;
    }
    return true;
}
/*验证邮箱*/
function emailFormatCheck(email){
    if ((email.length > 128) || (email.length < 6)) {
    	return false;
    }
    var format = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;
    if (!email.match(format)) {
    	return false;
    }
    return true;
}
/*验证手机号*/
function mobilephoneFormatCheck(mobilephone){
    var format = /^0?(13[0-9]|15[012356789]|18[0236789]|14[57])[0-9]{8}$/;
    if (!mobilephone.match(format)) {
    	return false;
    }
    return true;
}
/*验证固话*/
function fixphoneFormatCheck(fixphone){
	var format = /^((0\d{2,3})-)?(\d{7,8})(-(\d{3,}))?$/;
	if (!fixphone.match(format)) {
		return false;
	}
	return true;
}
/*验证QQ*/
function qqFormatCheck(qq){
	var format=/^[1-9][0-9]{4,}$/;
	if(!qq.match(format)){
		return false;
	}
	return true;
}
/*验证邮编*/
function codeFormatCheck(code){
	var format=/^[0-9][0-9]{5}$/;
	if(!code.match(format)){
		return false;
	}
	return true;
}
/*验证网址*/
function urlFormatCheck(url){
	var format=/^(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?$/;
	if(!url.match(format)){
		return false;
	}
	return true;
}
/*获取几天前*/
function getTimeFormat(startTime) {
	var startTimeMills = startTime.getTime();
	var endTimeMills = new Date().getTime();
	var diff = parseInt((endTimeMills - startTimeMills) / 1000);//秒
	var day_diff = parseInt(Math.floor(diff / 86400));//天
	var buffer = Array();
	if (day_diff < 0) {
		return "[error],时间越界...";
	} else {
		if (day_diff == 0 && diff < 60) {
			if (diff <= 0)
				diff = 1;
			buffer.push(diff + "秒前");
		} else if (day_diff == 0 && diff < 120) {
			buffer.push("1 分钟前");
		} else if (day_diff == 0 && diff < 3600) {
			buffer.push(Math.round(Math.floor(diff / 60)) + "分钟前");
		} else if (day_diff == 0 && diff < 7200) {
			buffer.push("1小时前");
		} else if (day_diff == 0 && diff < 86400) {
			buffer.push(Math.round(Math.floor(diff / 3600)) + "小时前");
		} else if (day_diff == 1) {
			buffer.push("1天前");
		} else if (day_diff < 7) {
			buffer.push(day_diff + "天前");
		} else if (day_diff < 30) {
			buffer.push(Math.round(Math.floor(day_diff / 7)) + " 星期前");
		} else if (day_diff >= 30 && day_diff <= 179) {
			buffer.push(Math.round(Math.floor(day_diff / 30)) + "月前");
		} else if (day_diff >= 180 && day_diff < 365) {
			buffer.push("半年前");
		} else if (day_diff >= 365) {
			buffer.push(Math.round(Math.floor(day_diff / 30 / 12)) + "年前");
		}
	}
	return buffer.toString();
}
/*date format*/
Date.prototype.format = function(fmt) {
	var o = {
		"M+" : this.getMonth() + 1,
		// 月份
		"d+" : this.getDate(),
		// 日
		"h+" : this.getHours() % 12 == 0 ? 12 : this.getHours() % 12,
		// 小时
		"H+" : this.getHours(),
		// 小时
		"m+" : this.getMinutes(),
		// 分
		"s+" : this.getSeconds(),
		// 秒
		"q+" : Math.floor((this.getMonth() + 3) / 3),
		// 季度
		"S" : this.getMilliseconds()
	// 毫秒
	};
	var week = {
		"0" : "/u65e5",
		"1" : "/u4e00",
		"2" : "/u4e8c",
		"3" : "/u4e09",
		"4" : "/u56db",
		"5" : "/u4e94",
		"6" : "/u516d"
	};
	if (/(y+)/.test(fmt)) {
		fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "")
				.substr(4 - RegExp.$1.length));
	}
	if (/(E+)/.test(fmt)) {
		fmt = fmt
				.replace(
						RegExp.$1,
						((RegExp.$1.length > 1) ? (RegExp.$1.length > 2 ? "/u661f/u671f"
								: "/u5468")
								: "")
								+ week[this.getDay() + ""]);
	}
	for ( var k in o) {
		if (new RegExp("(" + k + ")").test(fmt)) {
			fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k])
					: (("00" + o[k]).substr(("" + o[k]).length)));
		}
	}
	return fmt;
};


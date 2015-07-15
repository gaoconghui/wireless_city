/*main begin*/
$(function(){
	initialize();
});
function initialize(){
	$("#paging_center").css({"marginLeft":-$("#paging").width()/2});
	/* 选择开始 */
	$("#l_form").find(".choose").each(function(){
		var n=0;
		$(this).on("click",function(){
			n++;
			if(n%2==1){
				$(this).css({"background-position":"-7px -148px"});
			}else{
				$(this).css({"background-position":"-31px -148px"});
			}
		});
	});
	/* 选择结束 */
	/* 单个删除开始 */
	$("#l_form").find(".delete").each(function(){
		$(this).click(function(){
			$("#yy").show();
			dialogShow($(this));
		});
	});
	/* 单个删除结束 */
	
}
/*dialog show*/
function dialogShow(obj){
	var $dialog=$("#yp_dialog");
	var dW=$dialog.width();
	var dH=$dialog.height();
	//var cW=getWidth();
	//var cH=getHeight();
	var newTop=-dH/2;
	var newLeft=-dW/2;
	$dialog.css({"marginLeft":newLeft,"marginTop":newTop,"top":"50%","left":"50%"}).slideDown("slow");
	$dialog.find(".close").click(function(){
		$dialog.slideUp("slow");
		$("#yy").hide();
	});
	$dialog.find(".sure").off("click").on("click",function(){
		$(obj).each(function(){
			$(this).parents(".l_tr").slideUp("slow",function(){
				$(this).remove();
			});
		});
		$dialog.slideUp("slow");
		$("#yy").hide();
	});
}
/*dialog show*/
/*main end*/
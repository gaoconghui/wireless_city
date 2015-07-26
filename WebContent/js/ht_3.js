/*main begin*/
$(function(){
	initialize();
});
function initialize(){
	$("#search_self").click(function(){
		$(this).closest("form").submit();
	});
	$("#paging_center").css({"marginLeft":-$("#paging_center").width()/2});
	/* 选择开始 */
	$("#l_form").find(".choose").each(function(){
		var n=0;
		$(this).off("click").on("click",function(){
			n++;
			if(n%2==1){
				$(this).css({"background-position":"-7px -148px"});
				$(this).attr("sel","1");
			}else{
				$(this).css({"background-position":"-31px -148px"});
				$(this).attr("sel","0");
			}
			var count=$("#l_form").find(".choose[sel=1]").length;
			if(count==0){
				$("#r_t_action").hide();
			}else{
				if($("#r_t_action").css("display")=="none"){
					$("#r_t_action").show();
				}	
			}
		});
	});
	var sel_count=0;
	$("#sel_all").off("click").on("click",function(){
		sel_count++;
		if(sel_count%2==1){
			$(this).css({"background-position":"-7px -148px"});
			$(this).attr("sel","1");
			$("#l_form").find(".choose").each(function(){
				if($(this).attr("sel")!="1"){
					$(this).trigger("click");
				}
			});
		}else{
			$(this).css({"background-position":"-31px -148px"});
			$(this).attr("sel","0");
			$("#l_form").find(".choose").each(function(){
				if($(this).attr("sel")=="1"){
					$(this).trigger("click");
				}
			});
		}
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

	function getSelNum(){
		var str="?ids=";
		$("#l_form").find(".choose").each(function(){
			if($(this).attr("sel")==1){
				var rid=$(this).closest(".l_tr").data("id");
				str+= rid+",";
			}
		});
		var str_length=str.length;
		str=str.substr(0,str_length-1);
		return str;
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
	$dialog.css({"marginLeft":newLeft,"marginTop":newTop,"top":"50%","left":"50%"}).show();
	$dialog.find(".close").click(function(){
		$dialog.hide();
		$("#yy").hide();
	});
	$dialog.find(".sure").off("click").on("click",function(){
		$(obj).each(function(){
			$(this).parents(".l_tr").slideUp("slow",function(){
				$(this).remove();
			});
		});
		$dialog.hide();
		$("#yy").hide();
			});
}
/*dialog show*/
/*main end*/
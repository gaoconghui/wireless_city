<%@ page language="java" pageEncoding="UTF-8"%>
<!-- t_left start -->
<div class="t_left" id="t_left">
	<div class="l_img">Wireless City</div>
	<div class="l_content">
		<ul id="choices">
			<li><a href="CatalogueAction_toCatalogueManagerPage"><i class="l_icon1"></i><span>服务类目管理</span></a></li>
			<li><a href="TemplateAction_toTemplateManagerPage"><i class="l_icon2"></i><span>资源模板管理</span></a></li>
			<li><a href="SearchProviderAction_getAllProviders"><i class="l_icon3"></i><span>服务商管理</span></a></li>
			<li><a href="admin/ht_4.jsp"><i class="l_icon4"></i><span>服务资源管理</span></a></li>
		</ul>
	</div>
</div>
<!-- end t_left -->
<!-- t_header start -->
<div class="t_header">
	<div class="fixbox">
		<div class="h_nav">
			<ul>
				<li><a href="javascript:void(0)" class="h_sel"><i class="h_icon1"></i><span>首页</span></a></li>
				<li><a href="javascript:void(0)"><i class="h_icon2"></i><span>公告</span></a></li>
				<li><a href="javascript:void(0)"><i class="h_icon3"></i><span>回收站</span></a></li>
				<li><a href="javascript:void(0)"><i class="h_icon8"></i><span>设置</span></a></li>
			</ul>
		</div>
		<div class="h_info">
			<div class="h_mess">管理员 : 武汉理工大学教务处</div>
			<div class="h_exit"><a href="admin/ht_login.jsp"><span>注销</span><i></i></a></div>
		</div>
	</div>
</div>
<!-- end t_header -->
<script type="text/javascript">
	$(function(){
		var a=$("#choose").text();
		$("#choices").find("li").each(function(){
			var b=$(this).find("span").text();
			if(b==a){
				$(this).css({"backgroundColor":"#000"});
				$(this).find("span").css({"color":"#28b779"});
			}
		});
	});
</script>

<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!-- bottom begin -->
<div class="bottom">
	<div class="about_us">
		<ul>
			<li>
				<h3>关于我们</h3>
				<p>了解我们</p>
				<p>关注我们</p>
				<p>加入我们</p>
			</li>
			<li>
				<h3>关于我们</h3>
				<p>了解我们</p>
				<p>关注我们</p>
				<p>加入我们</p>
			</li>
			<li>
				<h3>关于我们</h3>
				<p>了解我们</p>
				<p>关注我们</p>
				<p>加入我们</p>
			</li>
		</ul>
		<div class="b_contact">
			<span class="c_icon"></span>
			<div class="c_tel">
				<p class="tel">027-01293604</p>
				<p class="time">服务时间 9:00-17:00</p>
			</div>
		</div>
		<div id="clear"></div>
	</div>
	<div class="friend_link">
		<div class="before"></div>
		<h3>友情链接</h3>
		<a href="javascript:void(0)">武汉天喻信息产业股份有限公司</a>
		<a href="javascript:void(0)">武汉天喻信息产业股份有限公司</a>
		<a href="javascript:void(0)">武汉天喻信息产业股份有限公司</a>
		<a href="javascript:void(0)">武汉天喻信息产业股份有限公司</a>
		<a href="javascript:void(0)">武汉天喻信息产业股份有限公司</a>
		<a href="javascript:void(0)">武汉天喻信息产业股份有限公司</a>
	</div>
	<div class="copyright">
		<div class="before"></div>
		<p>Copyright &copy; 2015 All Rights Reserved 版权所有：武汉理工大学 备案ID:xxxxxxx</p>
	</div>
</div>
<div id="feedback-link">
	<a href="javascript:void(0);" title="意见反馈">意见反馈</a>
</div>
<div id="totop">
	<a href="javascript:void(0);" title="返回顶部"></a>
</div>
<!-- bottom end -->
<script type="text/javascript">
	function init(){
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
</script>
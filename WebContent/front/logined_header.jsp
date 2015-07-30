<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<div class="title_fixed">
	<div class="s_right" id="s_right">
		<s:if test="#session.provider!=null&&#session.user==null">
			<div class="more iconfont">&#xe60a;</div>
			<div class="r_info">
				<s:property value="#session.provider.name" />
			</div>
			<div class="r_wel iconfont">&#xe608;</div>
			<div class="information_box">
				<ul>
					<li><a href="front/salor.jsp"> <i class="iconfont">&#xe612;</i>
							管理中心
					</a></li>
					<li><a href="ProviderAction_exit"> <i class="iconfont">&#xe611;</i>
							退出
					</a></li>
				</ul>
			</div>
		</s:if>
		<s:elseif test="#session.provider==null&&#session.user!=null">
			<div class="more iconfont">&#xe60a;</div>
			<div class="r_info">
				<s:property value="#session.user.name" />
			</div>
			<div class="r_wel iconfont">&#xe608;</div>
			<div class="information_box">
				<ul>
					<li><a href="front/buyer.jsp"> <i class="iconfont">&#xe612;</i>
							个人中心
					</a></li>
					<li><a href="LoginAction_exit"> <i class="iconfont">&#xe611;</i>
							退出
					</a></li>
				</ul>
			</div>
		</s:elseif>
	</div>
</div>
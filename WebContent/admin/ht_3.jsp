<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!doctype html>
<html>
	<head>
		<base href="<%=basePath%>">
		<meta charset="utf-8">
		<title>无线城市-后台-服务商管理</title>
		<link href="css/reset.css" rel="stylesheet">
		<link href="css/ht_default_style.css" rel="stylesheet">
		<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
		<script type="text/javascript" src="js/util.js"></script>
	</head>
<body>
	<div class="tzht">
		<!-- header begin -->
		<s:include value="ht_header.jsp"></s:include>
		<!-- end header -->
		<!-- t_right start -->
		<div class="t_right">
			<!-- r_location start -->
			<div class="r_location" id="location">
				<i></i><span>您当前所在位置：<a href="javascript:void(0)" id="choose">服务商管理</a></span>
			</div>
			<!-- end r_location -->
			<div class="r_table">
				<div class="r_title">
					<i></i><span class="span">服务商管理</span>
					<div class="r_t_action">
						<span class="r_t_a2 ra" title="通过" id="submit_btn"></span>
						<span class="r_t_a3 ra" title="下架" id="offsheet_btn"></span>
						<span class="r_t_a4 ra" title="删除" id="delete_btn"></span>
						<!-- TODO 加一个关键词搜索 像下面这个这样的
						
						<s:form action="SearchProviderAction_inFindByKeyWord">
							<s:textfield name="keyWord" placeholder="关键词搜索"></s:textfield>
							<div class="s_btn" id="search_self">关键词搜索</div>
							<s:hidden name="psid"></s:hidden>
						</s:form>
						
						 -->
					</div>	
				</div>
				<div class="r_label">
					<div class="l_label">
						<div class="l_form" id="l_form">
							<div class="l_tr">

								<!-- TODO 在span里面的a标签显示问题，改下 -->
								<span class="first_span"> <a href="javascript:void(0)"
									style="background: none;"></a>
								</span> <span class="span"><s:a
										href="SearchProviderAction_changeOrder?psid=%{psid}&orderName=2">服务商<s:if
											test="orderName == 2">
											<s:if test="orderSequence == 0">⬆</s:if>
											<s:if test="orderSequence == 1">⬇</s:if>
										</s:if>
									</s:a></span> <span class="span"><s:a
										href="SearchProviderAction_changeOrder?psid=%{psid}&orderName=3">星级<s:if
											test="orderName == 3">
											<s:if test="orderSequence == 0">⬆</s:if>
											<s:if test="orderSequence == 1">⬇</s:if>
										</s:if>
									</s:a></span> <span class="span">操作</span> <span class="span"><s:a
										href="SearchProviderAction_changeOrder?psid=%{psid}&orderName=0">审核<s:if
											test="orderName == 0">
											<s:if test="orderSequence == 0">⬆</s:if>
											<s:if test="orderSequence == 1">⬇</s:if>
										</s:if>
									</s:a></span> <span class="span"><s:a
										href="SearchProviderAction_changeOrder?psid=%{psid}&orderName=1">请求时间<s:if
											test="orderName == 1">
											<s:if test="orderSequence == 0">⬆</s:if>
											<s:if test="orderSequence == 1">⬇</s:if>
										</s:if>
									</s:a></span>
							</div>


							<s:iterator value="page.list">
								<div class="l_tr">
									<span class="first_span"> <!-- TODO 这个地方有点问题，a标签不知道怎么选中传到后台去，不么改成select 标签，不么加上js，在执行操作时将参数传到后台去 -->
										<s:a href="javascript:void(0)" cssClass="choose"></s:a>

									</span> <span><s:property value="name" /></span> <span><s:property
											value="grade" /></span> <span> <s:a
											href="javascript:void(0)" cssClass="ra detail" title="详情"></s:a>
										<s:a href="javascript:void(0)" cssClass="ra info" title="通知修改"></s:a>
										<s:a href="ProviderAction_passCheck?id=%{id}&psid=%{psid}"
											cssClass="ra submit" title="通过"></s:a> <s:a
											href="ProviderAction_offCheck?id=%{id}&psid=%{psid}"
											cssClass="ra offsheet" title="下架"></s:a> <s:a
											href="javascript:void(0)" cssClass="ra delete" title="删除"></s:a>
									</span> <span> <s:if test="checkState == 0">
											未通过
										</s:if> <s:elseif test="checkState == 1">
											审核通过
										</s:elseif> <s:elseif test="checkState == 2">
											正在审核中
										</s:elseif>
									</span> <span> <s:property value="registerTime" />
									</span>
								</div>
							</s:iterator>





						</div>
					</div>
				</div>
				<!-- 	<div class="paging">
					<a href="javascript:void(0)" class="sel">1</a> <a
						href="javascript:void(0)">2</a> <a href="javascript:void(0)">3</a>
					<a href="javascript:void(0)">4</a> <a href="javascript:void(0)"
						class="next">下一页&gt;</a>
				</div> -->


				<!-- TODO 去掉固定宽度 -->
				<div class="paging">
					<s:a
						href="SearchProviderAction_changePageNo?psid=%{psid}&pageNum=1"
						class="next">首页</s:a>
					<s:if test="pageNum -3 >0">
						<span>. . .</span>
					</s:if>
					<s:if test="pageNum-2 >0">
						<s:a
							href="SearchProviderAction_changePageNo?psid=%{psid}&pageNum=%{pageNum -2}">
							<s:property value="pageNum -2" />
						</s:a>
					</s:if>
					<s:if test="pageNum-1 >0">
						<s:a
							href="SearchProviderAction_changePageNo?psid=%{psid}&pageNum=%{pageNum -1}">
							<s:property value="pageNum -1" />
						</s:a>
					</s:if>
					<s:a
						href="SearchProviderAction_changePageNo?psid=%{psid}&pageNum=%{pageNum}"
						cssClass="sel">
						<s:property value="pageNum" />
					</s:a>
					<s:if test="pageNum+1 <= page.totalPageNumber">
						<s:a
							href="SearchProviderAction_changePageNo?psid=%{psid}&pageNum=%{pageNum + 1 }">
							<s:property value="pageNum +1" />
						</s:a>
					</s:if>
					<s:if test="pageNum+2 <= page.totalPageNumber">
						<s:a
							href="SearchProviderAction_changePageNo?psid=%{psid}&pageNum=%{pageNum +2}">
							<s:property value="pageNum +2" />
						</s:a>
					</s:if>
					<s:if test="pageNum+3 <= page.totalPageNumber">
						<span>. . .</span>
					</s:if>

					<s:a
						href="SearchProviderAction_changePageNo?psid=%{psid}&pageNum=%{page.totalPageNumber}"
						cssClass="next">尾页</s:a>
				</div>



			</div>
		</div>
		<!-- end t_right -->
	</div>

	<!-- dailog begin  -->
	<div id="yp_dialog" class="yp_dialog">
		<p class="dialog_title">确定删除吗？<span class="close">X</span></p>
		<div class="dialog_content">
			<a href="javascript:void(0)" class="sure">确定</a> <a
				href="javascript:void(0)" class="close">取消</a>
		</div>
	</div>
	<!-- end dialog  -->
	<script type="text/javascript" src="js/ht_3.js"></script>
</body>
</html>
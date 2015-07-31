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
		<link rel="shortcut icon" href="favicon.ico"  type="image/x-icon" />
		<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
		<script type="text/javascript" src="js/util.js"></script>
		<script type="text/javascript" src="js/tmAjax.js"></script>
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
					<div class="r_t_action dis_none" id="r_t_action">
						<span class="r_t_a2 ra" title="通过" id="submit_btn"></span> <span
							class="r_t_a3 ra" title="下架" id="offsheet_btn"></span> <span
							class="r_t_a4 ra" title="通知" id="delete_btn"></span>
					</div>
					<div class="s_input">
						<s:form action="SearchProviderAction_inFindByKeyWord">
							<s:textfield name="keyWord" placeholder="搜索服务商" cssClass="input"></s:textfield>
							<div class="s_btn i_btn" id="search_self">搜索</div>
							<s:hidden name="psid"></s:hidden>
						</s:form>
					</div>
				</div>
				<div class="r_label">
					<div class="l_label">
						<div class="l_form" id="l_form">
							<div class="l_tr first_tr">
								<span class="first_span"> <a href="javascript:void(0)"
									id="sel_all"></a>
								</span> <span class="span"> <s:a
										href="SearchProviderAction_changeOrder?psid=%{psid}&orderName=2">服务商
										<i class="iconfont"> <s:if test="orderName == 2">
												<s:if test="orderSequence == 0">&#xe600;</s:if>
												<s:if test="orderSequence == 1">&#xe601;</s:if>
											</s:if>
										</i>
									</s:a>
								</span> <span class="span"> <s:a
										href="SearchProviderAction_changeOrder?psid=%{psid}&orderName=3">星级
										<i class="iconfont"> <s:if test="orderName == 3">
												<s:if test="orderSequence == 0">&#xe600;</s:if>
												<s:if test="orderSequence == 1">&#xe601;</s:if>
											</s:if>
										</i>
									</s:a>
								</span> <span class="span">操作</span> <span class="span"> <s:a
										href="SearchProviderAction_changeOrder?psid=%{psid}&orderName=0">审核
										<i class="iconfont"> <s:if test="orderName == 0">
												<s:if test="orderSequence == 0">&#xe600;</s:if>
												<s:if test="orderSequence == 1">&#xe601;</s:if>
											</s:if>
										</i>
									</s:a>
								</span> <span class="span"> <s:a
										href="SearchProviderAction_changeOrder?psid=%{psid}&orderName=1">请求时间
										<i class="iconfont"> <s:if test="orderName == 1">
												<s:if test="orderSequence == 0">&#xe600;</s:if>
												<s:if test="orderSequence == 1">&#xe601;</s:if>
											</s:if>
										</i>
									</s:a>
								</span>
							</div>
							<s:iterator value="page.list">
								<div class="l_tr" data-id='<s:property value="id"/>'>
									<span class="first_span"> <s:a href="javascript:void(0)"
											cssClass="choose"></s:a>
									</span> <span title='<s:property value="name" />'><s:property
											value="@com.whut.wxcs.resmanager.util.DataUtils@formatStringByLength(name,13)" /></span>
									<span><s:property value="grade" /></span> <span> <small
										class="operation"> <s:a href="javascript:void(0)"
												cssClass="ra detail" title="详情"></s:a> <s:a
												href="javascript:void(0)" cssClass="ra info" title="通知修改"></s:a>
											<s:a href="ProviderAction_passCheck?id=%{id}&psid=%{psid}"
												cssClass="ra submit" title="通过"></s:a> <s:a
												href="ProviderAction_offCheck?id=%{id}&psid=%{psid}"
												cssClass="ra offsheet" title="下架"></s:a> <s:a
												href="javascript:void(0)" cssClass="ra delete" title="通知"></s:a>
									</small>
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

				<div class="paging" id="paging">
					<div id="paging_center">
						<s:a
							href="SearchProviderAction_changePageNo?psid=%{psid}&pageNum=1"
							class="next">首页</s:a>
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

						<s:a
							href="SearchProviderAction_changePageNo?psid=%{psid}&pageNum=%{page.totalPageNumber}"
							cssClass="next">尾页</s:a>
					</div>
				</div>
			</div>
		</div>
		<!-- end t_right -->
	</div>

	<!-- dailog begin  -->
	<div id="yy"></div>
	<div class="info">
		<span class="i_icon"></span>
		<span class="i_content"></span>
	</div>
	<!-- end dialog  -->
	<script type="text/javascript" src="js/ht_3.js"></script>
	<script>
		/*批量操作*/
		//批量通过
		$("#submit_btn").off("click").on("click",function(){
			$.tmUtil.infoShow({message:"请稍候..."});
			location.href="ProviderAction_passListCheck"+getSelNum();
		});
		//批量下架
		$("#offsheet_btn").off("click").on("click",function(){
			$.tmUtil.infoShow({message:"请稍候..."});
			location.href="ProviderAction_offListCheck"+getSelNum();
		});
		//批量通知
		$("#delete_btn").off("click").on("click",function(){
			$.tmUtil.infoShow({message:"请稍候..."});
			location.href="javascript:void(0)"+getSelNum();//TODO
		});
		/*批量操作*/
	</script>
</body>
</html>
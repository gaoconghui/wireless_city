<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="operatortop.jsp"></jsp:include>

	<center>
		<h1>catalogue manager page</h1>
		<br>
		<s:a href="CatalogueAction_toDesginCataloguePage">增加类目</s:a>
		<br>
		<table>
			<tr>
				<td>编号</td>
				<td>一级类目</td>
				<td>二级类目</td>
				<td>三级类目</td>
				<td>四级类目</td>
				<td>五级类目</td>
				<td>增加子类</td>
				<td>删除</td>
				<td>查看</td>
			</tr>
			<s:iterator value="root.child" var="c2">
				<!-- 一级类目 -->
				<tr>
					<td><s:property value="id" /></td>
					<td><s:property value="name" /></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>

					<td><s:a
							href='CatalogueAction_toDesginCataloguePage?parentid=%{id}'>增加子目录</s:a></td>
					<td><s:a href='CatalogueAction_deleteCatalogue?id=%{id}'>删除</s:a></td>
					<td><s:a href='TemplateAction_toTemplateDetailPage?id=%{id}'>查看</s:a></td>
				</tr>
				<s:iterator value="child" var="c3">
					<!-- 二级类目 -->
					<tr>
						<td><s:property value="id" /></td>
						<td></td>
						<td><s:property value="name" /></td>
						<td></td>
						<td></td>
						<td></td>
						<td><s:a
								href='CatalogueAction_toDesginCataloguePage?parentid=%{id}'>增加子目录</s:a></td>
						<td><s:a href='CatalogueAction_deleteCatalogue?id=%{id}'>删除</s:a></td>
						<td><s:a href='TemplateAction_toTemplateDetailPage?id=%{id}'>查看</s:a></td>
					</tr>
					<s:iterator value="child" var="c4">
						<!-- 三级类目 -->
						<tr>
							<td><s:property value="id" /></td>
							<td></td>
							<td></td>
							<td><s:property value="name" /></td>
							<td></td>
							<td></td>
							<td><s:a
									href='CatalogueAction_toDesginCataloguePage?parentid=%{id}'>增加子目录</s:a></td>
							<td><s:a href='CatalogueAction_deleteCatalogue?id=%{id}'>删除</s:a></td>
							<td><s:a href='TemplateAction_toTemplateDetailPage?id=%{id}'>查看</s:a></td>
						</tr>
						<s:iterator value="child" var="c4">
							<!-- 四级类目 -->
							<tr>
								<td><s:property value="id" /></td>
								<td></td>
								<td></td>
								<td></td>
								<td><s:property value="name" /></td>
								<td></td>
								<td><s:a
										href='CatalogueAction_toDesginCataloguePage?parentid=%{id}'>增加子目录</s:a></td>
								<td><s:a href='CatalogueAction_deleteCatalogue?id=%{id}'>删除</s:a></td>
								<td><s:a
										href='TemplateAction_toTemplateDetailPage?id=%{id}'>查看</s:a></td>
							</tr>
							<s:iterator value="child" var="c4">
								<!-- 五级类目 -->
								<tr>
									<td><s:property value="id" /></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td><s:property value="name" /></td>
									<td></td>
									<td><s:a
											href='CatalogueAction_toDesginCataloguePage?parentid=%{id}'>增加子目录</s:a></td>
									<td><s:a href='CatalogueAction_deleteCatalogue?id=%{id}'>删除</s:a></td>
									<td><s:a
											href='TemplateAction_toTemplateDetailPage?id=%{id}'>查看</s:a></td>
								</tr>
							</s:iterator>
						</s:iterator>
					</s:iterator>
				</s:iterator>
			</s:iterator>
		</table>
	</center>
</body>
</html>
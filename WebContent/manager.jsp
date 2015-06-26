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
	<center>
		<s:include value="manager_header.jsp"></s:include>

		<s:if test="%{#session.providers!=null}">
			<table cellpadding="10" cellspacing="0">
				<tr>
					<th>服务商名称</th>
					<th>注册日期</th>
					<th>邮箱</th>
					<th>联系电话</th>
					<th>审核</th>
					<th>删除</th>
				</tr>
				<s:iterator var="s" value="#session.providers">
					<tr>
						<th><s:property value="#s.name" /></th>
						<th><s:property value="#s.registerTime" /></th>
						<th><s:property value="#s.email" /></th>
						<th><s:property value="#s.telephone" /></th>
						<th><a
							href='ProviderAction_passCheck?id=<s:property value="#s.id"/>'>通过审核</a></th>
						<th><a href="">删除</a></th>
					</tr>
				</s:iterator>
			</table>
		</s:if>
		<s:else>
		   没有服务商入驻~！
		</s:else>
	</center>
</body>
</html>
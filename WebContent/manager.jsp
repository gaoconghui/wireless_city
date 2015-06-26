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
		<s:if test="#session.providers!=empty">
			<table>
				<tr>
					<th>服务商名称</th>
					<th>注册日期</th>
					<th>邮箱</th>
					<th>联系电话</th>
				</tr>
				<s:iterator var="s" value="#session.providers">
					<tr>
						<s:property value="%{s.name}" />
					</tr>
					<tr>
						<s:property value="%{s.registerTime}" />
					</tr>
					<tr>
						<s:property value="%{s.email}" />
					</tr>
					<tr>
						<s:property value="%{s.telephone}" />
					</tr>
				</s:iterator>
			</table>
		</s:if>
	</center>
</body>
</html>
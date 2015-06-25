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
		<h1>addtemplate page1</h1>
		<br> <br>
		<s:form action="TemplateAction_newTemplate">
			<s:hidden name="cid"></s:hidden>

			<td>属性名</td>
			<br>
			<td><s:textfield name="templateName"></s:textfield></td>
			<br>
			<td>模板描述信息</td>
			<br>
			<td><s:textfield name="description"></s:textfield></td>
			<br>
			<br>
			<!-- 单击增加属性按钮，增加一个table，每个的name属性如下
				显示的内容还有删除按钮，删除增加的这个属性 -->
			<table>
				<tr>
					<td>属性名称</td>
					<td><s:textfield name="attr[0].templateName"></s:textfield></td>
				</tr>
				<tr>
					<td>属性描述</td>
					<td><s:textfield name="attr[0].description"></s:textfield></td>
				</tr>
				<tr>
					<td>属性类型</td>
					<td><s:radio
							list="#{'0':'文本型','1':'小数型','2':'整数型','3':'时间型','4':'枚举型'}"
							name="attr[0].type"></s:radio></td>
				</tr>
				<tr>
					<td>枚举内容</td>
					<td><s:textfield name="attr[0].value"></s:textfield></td>
				</tr>
			</table>
			<br>
			<br>
			<table>
				<tr>
					<td>属性名称</td>
					<td><s:textfield name="attr[1].templateName"></s:textfield></td>
				</tr>
				<tr>
					<td>属性描述</td>
					<td><s:textfield name="attr[1].description"></s:textfield></td>
				</tr>
				<tr>
					<td>属性类型</td>
					<td><s:radio
							list="#{'0':'文本型','1':'小数型','2':'整数型','3':'时间型','4':'枚举型'}"
							name="attr[1].type"></s:radio></td>
				</tr>
				<tr>
					<td>枚举内容</td>
					<td><s:textfield name="attr[1].value"></s:textfield></td>
				</tr>
			</table>

			<s:submit></s:submit>
		</s:form>
		<br>
	</center>
</body>
</html>
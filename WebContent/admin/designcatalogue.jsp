<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="scripts/jquery-2.1.3.min.js"></script>
<script type="text/javascript">
	
	
</script>
</head>
<body>
	<jsp:include page="operatortop.jsp"></jsp:include>

	<center>
		<h1>catalogue page1</h1>
		<br>
		<s:form action="CatalogueAction_dddCatalogue">
			<s:hidden name="id"></s:hidden>
			<table>
				<tr>
					<td>父节点</td>
					<td><s:select list="rootCatalogues" name="parentid"
							listKey="id" listValue="name"></s:select><br></td>
				</tr>
				<tr>
					<td>名称：</td>
					<td><s:textfield name="name"></s:textfield></td>
				</tr>
				<tr>
					<td>描述：</td>
					<td><s:textfield name="description"></s:textfield></td>
				</tr>
				<tr>
					<td><s:submit></s:submit></td>
				</tr>
			</table>
		</s:form>
	</center>
</body>
</html>
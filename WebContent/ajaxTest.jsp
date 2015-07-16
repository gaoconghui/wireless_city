<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'ajaxTest.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" src="js/util.js"></script>
	<script type="text/javascript" src="js/tmAjax.js"></script>
	
  </head>
  
  <body>
    <script type="text/javascript">
    	$(function(){
    		
    		var resourceAttrs=[];
    		var json={};
    		json.value="AVce";
    		json.Attribute=[];
    		json.Attribute[0]={id:1};
    		resourceAttrs.push(json);
			alert(jsonToString(resourceAttrs));
			/* var args={};
			args.tid = "102";
					args.attributes["id"] = "0";
					args["attributes[0].name"] = "txt_name";
			        args["attributes[1].id"] = "1";
			        args["attributes[1].name"] = "txt_type";
			alert(jsonToString(args)); */
    	});
    	

    </script>
  </body>
</html>

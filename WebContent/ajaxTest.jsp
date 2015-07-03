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
    		//增加属性
    		//更改属性
    		 var args = {};
    		 /* args["attributes[0].id"] = "0";
    	        args["attributes[0].name"] = "gchtest3";
    	        args["attributes[0].description"] = "desc";
    	        args["attributes[0].type"] = "1";
    	        args["attributes[0].value"] = "1,2,3";
    	        args["attributes[1].id"] = "0";
    	        args["attributes[1].name"] = "gchtest1";
    	        args["attributes[1].description"] = "desc1";
    	        args["attributes[1].type"] = "11";
    	        args["attributes[1].value"] = "1,2,311"; */
    	        
    	    /*  args["attributes[2].id"] = 101;
    	        args["attributes[2].name"] = "newName";
    	        args["attributes[2].description"] = "desc";
    	        args["attributes[2].type"] = 2;
    	        args["attributes[2].value"] = "1,2,3";*/ 
    	       
    	     args["attributes[3].id"] = "-67"; 
    	        args["tid"] = "106";
    		$.ajax({
    			url:"AttributeAction_doAttributesByAJAX",
    			data:args,
    			success:function(data){
    				alert(data);
    			}
    		});
    		/* $.tmAjax.request({url:"AttributeAction_doAttributesByAJAX",callback:function(data){
    			alert(data);
    		}},args);  */
    	});
    </script>
  </body>
</html>

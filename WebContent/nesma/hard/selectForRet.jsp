<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<%@ page import="bean.Project" %>
<%@ include file="/nesma/checkUser.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'selectForFm.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="/nesma/images/screen.css">

  </head>
  
  <body>
  	<form  action="/nesma/nesma/hard/RetH!list.action"  method="post"  target="dfFrame">
  	<table>
  		<tr>
  			<td width="25%">请选择数据文件<br></td>
  			<td>
  				<s:select name="dataFunction.id" list="dataFunctions" listKey="id" listValue="name" theme="simple" style="width:220px"></s:select>
  			</td>
  			<td>
  				<input type="submit" name="submit" value=" 选 定 "/>
  			</td>		     
  		</tr>
  	</table>
  	
	</form>
	 <iFrame name="dfFrame" frameborder="0" height="800px" width="100%" scrolling="auto"></iFrame>
  </body>
</html>

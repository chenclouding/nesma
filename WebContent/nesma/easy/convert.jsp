<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/nesma/checkUser.jsp"%>
<%@ taglib prefix="s" uri="/struts-tags" %> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  	<base href="<%=basePath%>">
    
    <title>My JSP 'convert.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">	
	<link rel="stylesheet" type="text/css" href="/nesma/nesma/images/report.css">  
  </head>
  <body>
   <div id="itsthetable">
		<table>
			<caption><s:property value="project.name"/>功能点转换</caption>	
			<tr>
				<th title="只需识别数据功能个数，最简单" scope="col">预估功能点计数结果</th>
				<th title="传统的功能点估算方法，与NESMA中详细型估算方法类似" scope="col">转换为IFPUG估算结果后功能点数</th>
				<th title="识别数据功能和事务功能过程复杂，最完整" scope="col">详细功能点计数结果</th>
				<th scope="col">转换偏差率</th>
			</tr>
			<tbody>
				<tr>
					<td><s:property value="countSession.getName()"/> <s:property value="countSession.getUfpc()"/></td>
					<td>
						IFPUG功能点数：<s:property value="convertFpcStr"/>
					</td>
					<td>
						<s:iterator value="countSessions">
							<s:if test='methodType=="详细型功能点计数"'><s:property value="name"/> <s:property value="ufpc"/><br></s:if>
						</s:iterator>
					</td>
					<td>
						<s:iterator value="deviation" id='d'>
							<s:property value="d"/><br>
						</s:iterator>
					</td>
				</tr>
				<tr></tr>
			</tbody>
		</table>
	  </div> 
  </body>
</html>

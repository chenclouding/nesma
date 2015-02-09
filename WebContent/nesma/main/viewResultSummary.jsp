<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ include file="/nesma/checkUser.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
        
    <title>My JSP 'viewSizeEstimateResult.jsp' starting page</title>    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="/nesma/nesma/images/report.css">  
  </head>
    
  <body>
    <div id="itsthetable">
  		<table width="1200px">
			<caption><s:property value="project.name"/>功能点规模估算结果比对</caption>			
			<thead>
				<tr>
					<th scope="col">估算场景名称</th>
					<th scope="col">功能模块</th>
					<th scope="col">数据功能</th>
					<th scope="col">事务功能</th>
					<th scope="col">总功能点数（FP）</th>
				</tr>
			</thead>
			<tbody>	
				<s:iterator value="project.countSessions" var="cs">
				<tr>
					<td><s:property value="name"/></td>
					<td>
						<s:iterator value="project.functionModules">
							<s:property value="name"/>
							<br>
						</s:iterator>					
					</td>
					<td>
						<s:iterator value="project.functionModules">
							<s:iterator value="dataFunctions" var="df">
								<s:if test="#df.countSession == #cs"><s:property value="name"/><br></s:if>
							</s:iterator>	
						</s:iterator>												
					</td>
					<td>
						<s:iterator value="project.functionModules">
							<s:iterator value="transFunctions" var="tf">
								<s:if test="#tf.countSession == #cs"><s:property value="name"/><br></s:if>
							</s:iterator>	
						</s:iterator>												
					</td>
					<td>
						<s:property value="ufpc"/>
					</td>	
				</tr>
				</s:iterator>				
			</tbody>
		</table>
		<a href="Javascript:parent.parent.location='/nesma/nesma/user/index.jsp'">返回</a>
	 </div>
	 
  </body>
</html>

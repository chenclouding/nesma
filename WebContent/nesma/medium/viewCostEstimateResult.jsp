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
		<table>
			<caption><s:property value="project.name"/>功能点规模估算结果</caption>			
			<thead>
				<tr>
					<th colspan="5">估算项目基本信息：</th>
				</tr>
			</thead>
			<tr>
				<td colspan="5">项目名称：<s:property value="project.name"/></td>				
			</tr>
			<tr>
				<td colspan="5">估算应用场景名称：<s:property value="countSession.name"/></td>
			</tr>
			<tr>
				<td title=
"预估型：只需识别数据功能个数，最简单;
估计型：需识别数据功能和事务功能个数，次简单;
详细型：识别数据功能和事务功能过程复杂，最完整" colspan="5">采用的估算方法：<s:property value="countSession.methodType"/></td>
			</tr>
			<tr>
				<td colspan="5">估算人员： <%= session.getAttribute("userName") %></td>
			</tr>
			
			<thead>
				<tr>
					<th colspan="5">估算项目文件信息：</th>
				</tr>
			</thead>
					
			<tr>
				<th scope="col">功能模块</th>
				<th title="提供给用户以满足内部和外部数据需求的功能" scope="col">数据功能</th>
				<th title="应用程序提供给用户用于数据处理的功能" scope="col">事务功能</th>
				<th scope="col">功能点数</th>
			</tr>
			<tfoot><tr><th scope="row">功能点总数</th><td colspan="4"><s:property value="countSession.ufpc"/>FP</td></tr></tfoot>
			<tbody>
				<tr>
					<s:iterator value="atomFunctionModules"><!-- 原子模块 -->
							
					<th  scope="row" rowspan=<s:property value="2"/>> <br><s:property value="name"/>(<s:property value="fitfpc"/> FP)</th>			
					<tr>
						<td>
							<s:iterator value="dataFunctions">
							<p title=
"ILF:一组逻辑上相关联的、被持久保存的数据，由待估算系统使用和维护。
EIF:一组逻辑上相关联的、被持久保存的数据，由其他系统维护，但被当前待估算系统使用。">
								<s:property value="name"/> （<s:property value="type"/>，<s:property value="isCounted"/>）<br>
							</p>
							</s:iterator>
						</td>
						<td>
							<s:iterator value="transFunctions">
							<p title=
"EI:数据或者控制信息从应用边界外部进入应用内部的基本过程。
EO:输出的数据穿过系统应用边界，并且大小确定或者需要进一步的数据处理。
EQ:用户可识别的输入、输出组合，输出的大小确定不需要进一步的数据处理。">
								<s:property value="name"/> （<s:property value="type"/>，<s:property value="isCounted"/>）<br>
							</p>
							</s:iterator>
						</td>
						<td><s:property value="fitfpc"/>FP</td>
					</tr>
					</s:iterator>
				</tr>
			</tbody>
		</table>
	  </div> 
	  
	   <div id="itsthetable">
		<table>
			<thead>
			<tr>
				<th scope="col"></th>
				<th scope="col">下限</th>
				<th scope="col">标准</th>
				<th scope="col">上限</th>				
			</tr>
			</thead>
			<tbody>
				<tr>
					<th scope="row">功能点耗时率（人时/功能点）</th>					
					<td><s:property value="adjustParam.fpCostOptimistic"></s:property></td>
					<td><s:property value="adjustParam.fpCostStandard"></s:property></td>	
					<td><s:property value="adjustParam.fpCostPessimistic"></s:property></td>				
				</tr>
				<tr>
					<th scope="row">工作量估算（人月）</th>					
					<td><s:property value="costEstimate.effortOptimistic"></s:property></td>
					<td><s:property value="costEstimate.effortStandard"></s:property></td>	
					<td><s:property value="costEstimate.effortPessimistic"></s:property></td>	
				</tr>
					<tr>
					<th scope="row">工期估算（月）</th>					
					<td><s:property value="costEstimate.durationOptimistic"></s:property></td>
					<td><s:property value="costEstimate.durationStandard"></s:property></td>	
					<td><s:property value="costEstimate.durantionPessimistic"></s:property></td>			
				</tr>
					<tr>
					<th scope="row">成本估算（万元）</th>					
					<td><s:property value="costEstimate.budgetOptimistic"></s:property></td>
					<td><s:property value="costEstimate.budgetStandard"></s:property></td>	
					<td><s:property value="costEstimate.budgetPessimistic"></s:property></td>			
				</tr>
			</tbody>
		</table>
	  </div>
  </body>
</html>

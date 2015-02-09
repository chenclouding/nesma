<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %> 
<%@ page import="bean.CountSession"%>
<%@ include file="/nesma/checkUser.jsp"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>编辑场景</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="/nesma/images/screen.css">
	<script language="JavaScript" src="/nesma/javascript/verify.js"></script>
    <script type="text/javascript" src="/nesma/javascript/calenderJS.js"></script>
	<script language="JavaScript">  
    function verifyInput()
	{	
		if(isEmpty(document.getElementById("name").value)) 
		{	
		    alert("请填写估算场景名称！");
		    document.getElementById("name").focus();
			return false;
		}						
	}
    </script> 
  </head>
  
  <body>
     <s:form action="CountSession!edited.action" name="sessionForm" id="sessionForm" method="post" onsubmit="return verifyInput();" > 
  	<table> 
  		 <s:if test="message"><h1 style="color:red">修改成功！</h1></s:if>
  		<tr> 
  			<td width="15%">估算场景名称</td> 
  			<td> 
  			    <input type="text" id="name" name="countSession.name" style="width: 160px;" value="<s:property value='countSession.name'/>"> 
  			    <b style="font-family: verdana; color: red;">*</b> 
            </td> 
  		</tr>   		
  		<tr> 
  			<td width="10%">估算开始时间</td> 
  			<td> 
           		<input type="text" name="countSession.startTime" style="width: 160px;" value="<s:property value='countSession.startTime'/>" onfocus="HS_setDate(this)"> 
            </td> 
  		</tr> 
  		<tr> 
  			<td>  
  				 <s:select label="软件生命周期阶段" id="lifecyclePhase" list="{
  			 	'项目定义阶段',
  			 	'需求分析阶段',
  			 	'设计阶段',
  			 	'编码阶段',
  			 	'测试阶段',
  			 	'维护阶段'
  			 	}" 
  			 	value="countSession.lifecyclePhase" headerValue="--请选择--" name="countSession.lifecyclePhase" style="width:220px"/>		
            </td> 
  		</tr> 
  	    <tr>
  	    <!--   	    	
  	    	<td> 
  	    	<s:radio name="countSession.methodType" value="countSession.methodType" list="#{'预估型功能点计数':'预估型功能点计数(估算过程最简单)','估计型功能点计数':'估计型功能点计数','详细型功能点计数':'详细型功能点计数（估算过程最复杂）'}" label="估算方法类型"></s:radio>
  		   </td> 
  		</tr>
  		 --> 
  		<td width="10%">估算方法类型</td>
  	    	<td> 
				<input title="只需识别数据功能个数，最简单" name="countSession.methodType" type="radio" value="预估型功能点计数"  ${countSession.methodType=="预估型功能点计数" ? "checked='checked'" : ""}/>预估型功能点计数
  				<input title="需识别数据功能和事务功能个数，次简单" name="countSession.methodType" type="radio" value="估计型功能点计数" ${countSession.methodType=="估计型功能点计数" ? "checked='checked'" : ""}/>估计型功能点计数
  				<input title="识别数据功能和事务功能过程复杂，最完整" name="countSession.methodType" type="radio" value="详细型功能点计数" ${countSession.methodType=="详细型功能点计数" ? "checked='checked'" : ""}/>详细型功能点计数
  			</td> 	
  		</tr> 
  		<tr> 
  			<td width="10%">备注</td> 
  			<td> 
  			    <textarea name="countSession.description"><s:property value='countSession.description'/></textarea> 
            </td> 
  		</tr> 
  		
  	</table> 
  		<input type="submit" name="submit" value=" 保 存 "/>
  		<input type=button value="返 回"   onclick=window.history.go(-1)>
  		<input type="hidden" name="countSession.id" value="<s:property value="countSession.id"/>"/>
  	</s:form>
  </body>
</html>

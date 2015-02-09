<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="bean.FunctionModule"  %>
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
    
    <title>My JSP 'editFunction.jsp' starting page</title>
    
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
			    alert("请填写功能模块名称！");
			    document.getElementById("name").focus();
				return false;
			}
			
	}
	</script>
  </head>
  
  <body>
      
  <s:form  action="FunctionModule!edited.action" name="functionForm" method="post" onsubmit="return verifyInput()">
     <table>
      <s:if test="message"><h1 style="color:red">修改成功！</h1></s:if>
     <tr>
  			<td width="15%">模块名称<br></td>
  			<td >
  			    <input type="text" id="name" name="functionModule.name" style="width:160px" value="<s:property value='functionModule.name'/>"/ >
  			    <b style="font-family:verdana;color:red">*</b>
            <br></td>
  		</tr>
  		<tr>
  			<td width="10%">模块描述<br></td>
  			<td >
  			    <textarea name="functionModule.description"><s:property value="functionModule.description"/></textarea>
            <br></td>
  		</tr>
  	
  		<tr>
  			<td width="15%">模块类型<br></td>
  			<td >
  			 	<s:select name="functionModule.type" value="functionModule.type" list="{'组合模块','原子模块'}" theme="simple" style="width:160px" >
  				</s:select>
            <br></td>
  		</tr>
  	</table>
  	<input type="submit" name="submit" value=" 保 存 "/>
    <input type=button value="返 回"   onclick=window.history.go(-1)>
  	<input type="hidden" name="functionModule.id" value="<s:property value='functionModule.id'/>"/> 
	</s:form>
  </body>
</html>

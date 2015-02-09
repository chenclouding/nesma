<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="bean.DataFunction"%>
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
    
    <title>添加数据功能</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="/nesma/images/screen.css">
	<script language="JavaScript" src="/nesma/javascript/verify.js"></script>
	<script language="JavaScript">  
	 function confirmdel(){
    	return confirm("确定删除？");
    }
     function verifyInput(){
    	if(isEmpty(document.getElementById("fileName").value)) 
		{
			alert("请填写数据功能的名称！");
			document.getElementById("fileName").focus();
			return false;
		}
    }
    </script>

  </head>
  
  <body>
  
    
    
    <s:form  action="DataFunctionE!edited.action" name="dfForm" method="post" onsubmit="return verifyInput();" >
  	<table>
  	 	<s:if test="message"><h1 style="color:red">修改成功！</h1></s:if>
  		<tr>
  			<td width="15%">数据文件名</td>
  			<td >
  			    <input type="text" id="fileName" name="dataFunction.name" style="width:160px" value="<s:property value='dataFunction.name'/>"> 
  			    <b style="font-family:verdana;color:red">*</b>
            </td>
  		</tr>
  		<tr>
  			<td width="10%">数据文件描述</td>
  			<td >
  			    <textarea name="dataFunction.description"><s:property value='dataFunction.description'/></textarea>
            </td>
  		</tr>
  		<tr>
  		<td width="10%">数据文件类型</td>
  	    	<td> 
  	    	<!-- <s:radio  label="数据文件类型" name="dataFunction.type" value="dataFunction.type" list="#{'ILF':'内部逻辑文件（ILF）','EIF':'外部接口文件（EIF）','未定文件类型':'未定文件类型'}"></s:radio>-->	
				<input title="一组逻辑上相关联的、被持久保存的数据，由待估算系统使用和维护。" name="dataFunction.type" type="radio" value="ILF"  ${dataFunction.type=="ILF" ? "checked='checked'" : ""}/>内部逻辑文件（ILF）
  				<input title="一组逻辑上相关联的、被持久保存的数据，由其他系统维护，但被当前待估算系统使用。" name="dataFunction.type" type="radio" value="EIF" ${dataFunction.type=="EIF" ? "checked='checked'" : ""}/>外部接口文件（EIF）
  				<input title="文件类型无法界定" name="dataFunction.type" type="radio" value="未定文件类型" ${dataFunction.type=="未定文件类型" ? "checked='checked'" : ""}/>未定文件类型
  		</tr>
  		<tr>
  			<td> 
  	    		<s:radio  label="是否参与功能点计数" name="dataFunction.isCounted" value="dataFunction.isCounted" list="#{'计入':'计入','未定':'未定','不计入':'不计入'}"></s:radio>
  		   </td> 
  		</tr>
  		<tr>
  			<td width="10%">不计入原因</td>
  			<td >
  			    <textarea name="dataFunction.ignoreReason"><s:property value='dataFunction.ignoreReason'/></textarea>
            </td>
  		</tr>  		
  		<tr>
  		<td width="10%">吻合度</td>
  			<td> 
  	    		<!--<s:radio  label="吻合度" name="dataFunction.fitType" value="dataFunction.fitType" list="#{'高':'高','中':'中','低':'低'}"></s:radio>-->
  		  		<input title="项目组有此类数据文件开发经验" name="dataFunction.fitType" type="radio" value="高" ${dataFunction.fitType=="高" ? "checked='checked'" : ""}/>高
  				<input title="项目组有此类数据文件的部分开发经验" name="dataFunction.fitType" type="radio" value="中" ${dataFunction.fitType=="中" ? "checked='checked'" : ""}/>中
  				<input title="项目组没有此类数据文件开发经验" name="dataFunction.fitType" type="radio" value="低" ${dataFunction.fitType=="低" ? "checked='checked'" : ""}/>低
  		   </td> 
  		</tr>
  	</table>
    <input type="hidden" name="dataFunction.id" value="<s:property value="dataFunction.id"/>"/>
  	<input type="submit" name="submit" value=" 保 存 "/>
  	<input type="button" value="返 回"   onclick=window.history.go(-1)>
  	</s:form> 		
  </body>
</html>

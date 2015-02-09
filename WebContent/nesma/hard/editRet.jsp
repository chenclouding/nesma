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
    	var frm = document.dfForm; 
    	if(isEmpty(frm.fileName.value)) 
		{
			alert("请填写数据功能的名称！");
			frm.fileName.focus();
			return false;
		}
    }
    </script>

  </head>
  
  <body>
    
    
    <s:form  action="RetH!edited.action" name="dfForm" method="post" onsubmit="return verifyInput();" validate="true">
  	<table>
  	 	<s:if test="message"><h1 style="color:red">修改成功！</h1></s:if>
  		<tr>
  			<td title="RET:记录元素类型。一组逻辑上相关联的DET的集合" width="15%">RET的名称</td>
  			<td >
  			    <input type="text" name="ret.name" style="width:160px" value="<s:property value='ret.name'/>"/ >
  			    <b style="font-family:verdana;color:red">*</b>
            </td>
  		</tr>
  		<tr>
  			<td width="10%">RET的描述</td>
  			<td >
  			    <textarea name="ret.description"><s:property value='ret.description'/></textarea>
            </td>
  		</tr>
  		<tr>
  			<td title=
"RET:记录元素类型。一组逻辑上相关联的DET的集合
DET:数据元素类型。在系统内被使用或者维护的属性" width="10%">RET包含的DET个数</td>
  			<td >
  			   <input type="text" name="ret.det" style="width:160px" value="<s:property value='ret.det'/>"/ >
  			    <b style="font-family:verdana;color:red">*</b>
            </td>
  		</tr>
  	</table>
  	<input type="submit" name="submit" value=" 保 存 "/>
  	<input type=button value="返 回"   onclick=window.history.go(-1)>
    <input type="hidden" name="ret.id" value="<s:property value="ret.id"/>"/>
  	</s:form> 		
  </body>
</html>

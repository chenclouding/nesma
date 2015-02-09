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
    
    <title>添加事务功能</title>
    
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
 		if(isEmpty(document.getElementById("name").value)) 
		{
			alert("请填写基本处理名称！");
			document.getElementById("name").focus();
			return false;
		}
    }
    </script>

  </head>
  
  <body>
   <h1>新增事务功能（基本处理）</h1>    
    <s:form  action="TransFunctionH!edited.action" name="dfForm" method="post" onsubmit="return verifyInput();" >
  	<table>
  	 	<s:if test="message"><h1 style="color:red">修改成功！</h1></s:if>
  		<tr>
  			<td width="15%">基本处理名称</td>
  			<td >
  			    <input type="text" id="name" name="transFunction.name" style="width:160px" value="<s:property value='transFunction.name'/>"/>
           		<b style="font-family:verdana;color:red">*</b>
            </td>
  		</tr>
  		<tr>
  			<td width="10%">基本处理类型</td>
  			<!-- 
  	    		<s:radio  label="基本处理类型" name="transFunction.type" value="'EI'" list="#{
  	    		'EI':'EI(外部输入)','EO':'EO(外部输出)','EQ':'EQ(外部查询)'
  	    		}" value="transFunction.type"></s:radio>
  		    		 <td width="10%">基本处理类型</td>
  		     -->
  	    	<td>  	    		
  				<input title="数据或者控制信息从应用边界外部进入应用内部的基本过程。" name="transFunction.type" type="radio" value="EI" ${transFunction.type=="EI" ? "checked='checked'" : ""}/>EI(外部输入)
  				<input title="输出的数据穿过系统应用边界，并且大小确定或者需要进一步的数据处理。" name="transFunction.type" type="radio" value="EO" ${transFunction.type=="EO" ? "checked='checked'" : ""}/>EO(外部输出)
  				<input title="用户可识别的输入、输出组合，输出的大小确定不需要进一步的数据处理。" name="transFunction.type" type="radio" value="EQ" ${transFunction.type=="EQ" ? "checked='checked'" : ""}/>EQ(外部查询)
  		   </td> 
  		</tr>
  		<tr>
  			<td title="FTR:引用文件类型。事务处理过程中引用的文件 " width="15%">FTR的个数</td>
  			<td >
  			    <input type="text" name="transFunction.ftr" style="width:160px" value="<s:property value='transFunction.ftr'/>"/>
            </td>
  		</tr>
  		<tr>
  			<td title="DET:数据元素类型。在系统内被使用或者维护的属性。" width="15%">DET的个数</td>
  			<td >
  			    <input type="text" name="transFunction.det" style="width:160px" value="<s:property value='transFunction.det'/>"/>
            </td>
  		</tr>
  		<tr>
  			<td width="10%">基本处理描述</td>
  			<td >
  			    <textarea name="transFunction.description"><s:property value='transFunction.description'/></textarea>
            </td>
  		</tr>
  	</table>
  	<input type="submit" name="submit" value=" 保 存 "/>
  	<input type="button" value="返 回"   onclick=window.history.go(-1)>
    <input type="hidden" name="transFunction.id" value="<s:property value="transFunction.id"/>"/>
   </s:form> 
    
  </body>
</html>

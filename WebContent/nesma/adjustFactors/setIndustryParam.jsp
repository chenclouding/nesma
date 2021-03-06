<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/nesma/checkUser.jsp"%>
<%@ taglib prefix="s" uri="/struts-tags"%> 

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'setIndustryParam.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="/nesma/images/screen.css">
  	<script language="JavaScript" src="/nesma/javascript/verify.js"></script>
	<script language="JavaScript"> 	
	function verifyInput(){
		var sizeChangedFactorObj=document.getElementById("sizeChangedFactor");
		var sizeChangedFactor=new String(sizeChangedFactorObj.value);
		var fpCostPessimisticObj=document.getElementById("fpCostPessimistic");
		var fpCostPessimistic=new String(fpCostPessimisticObj.value);
		var fpCostStandardObj=document.getElementById("fpCostStandard");
		var fpCostStandard=new String(fpCostStandardObj.value);
		var fpCostOptimisticObj=document.getElementById("fpCostOptimistic");
		var fpCostOptimistic=new String(fpCostOptimisticObj.value);
		var pmRateObj=document.getElementById("pmRate");
		var pmRate=new String(pmRateObj.value);
		var grossMarginObj=document.getElementById("grossMargin");
		var grossMargin=new String(grossMarginObj.value);
		
		/*判断规模变更因子合法性*/
		if(isEmpty(sizeChangedFactor)) 
		{	
		    alert("请填写规模变更因子！");
		    sizeChangedFactorObj.focus();
			return false;
		}
		if(sizeChangedFactor<0 || isNaN(sizeChangedFactor)) 
		{	
		    alert("规模变更因子的值必须为数字且大于等于零！");
		    sizeChangedFactor="";
		    sizeChangedFactorObj.focus();
			return false;
		}
		
		/*判断功能点耗时率上限值合法性*/
		if(isEmpty(fpCostOptimistic)) 
		{	
		    alert("请填写功能点耗时率上限值！");
		    fpCostOptimisticObj.focus();
			return false;
		}
		if(fpCostOptimistic<0 || isNaN(fpCostOptimistic)) 
		{	
		    alert("功能点耗时率上限值必须为数字且大于等于零！");
		    fpCostOptimistic="";
		    fpCostOptimisticObj.focus();
			return false;
		}
		
		/*判断功能点耗时率标准值合法性*/
		if(isEmpty(fpCostStandard)) 
		{	
		    alert("请填写功能点耗时率标准值！");
		    fpCostStandardObj.focus();
			return false;
		}
		if(fpCostStandard<0 || isNaN(fpCostStandard)) 
		{	
		    alert("功能点耗时率标准值必须为数字且大于等于零！");
		    fpCostStandard="";
		    fpCostStandardObj.focus();
			return false;
		}
		
		/*判断功能点耗时率下限值合法性*/
		if(isEmpty(fpCostPessimistic)) 
		{	
		    alert("请填写功能点耗时率下限值！");
		    fpCostPessimisticObj.focus();
			return false;
		}
		if(fpCostPessimistic<0 || isNaN(fpCostPessimistic)) 
		{	
		    alert("功能点耗时率下限值必须为数字且大于等于零！");
		    fpCostPessimistic="";
		    fpCostPessimisticObj.focus();
			return false;
		}
		
		/*判断功能点耗时率上限值是否大于标准值*/
		if(fpCostOptimistic-fpCostStandard<0)
		{
		    alert("功能点耗时率上限值必须大于等于功能点耗时率标准值！");	    
		    fpCostOptimisticObj.focus();
			return false;
		}
		
		/*判断功能点耗时率标准值是否大于下限值*/
		if(fpCostStandard-fpCostPessimistic<0)
		{
		    alert("功能点耗时率下限值必须小于等于功能点耗时率标准值！");
		    fpCostStandardObj.focus();
			return false;
		}
		
		/*判断人月费率合法性*/
		if(isEmpty(pmRate)) 
		{	
		    alert("请填写人月费率！");
		    pmRateObj.focus();
			return false;
		}
		if(pmRate<0 || isNaN(pmRate)) 
		{	
		    alert("人月费率必须为数字且大于等于零！");
		    pmRate="";
		    pmRateObj.focus();
			return false;
		}
		
		/*判断毛利润率合法性*/
		if(isEmpty(grossMargin)) 
		{	
		    alert("请填写毛利润率！");
		    grossMarginObj.focus();
			return false;
		}
		if(grossMargin<0 || isNaN(grossMargin)) 
		{	
		    alert("毛利润率必须为数字且大于等于零！");
		    grossMargin="";
		    grossMarginObj.focus();
			return false;
		}
	}
	</script>
  </head>
  
  <body>    
    <s:form action="AdjustParam!edited" name="industryForm" method="post" onsubmit="return verifyInput()" validate="true">
    <table>
    	<s:if test="message"><h1 style="color:red">设置成功！</h1></s:if>
  	  	<tr>
  			<td width="15%">规模变更因子<br></td>
  			<td >
  			    <input type="text" id="sizeChangedFactor" name="adjustParam.sizeChangedFactor" style="width:160px" value="<s:property value='adjustParam.sizeChangedFactor'/>"/ >
  			    <b style="font-family:verdana;color:red">*</b>
            <br></td>
  	 	 </tr>
  		<tr>
  			<td width="15%" rowspan="3">功能点耗时率<br></td>
  			<td width="15%">功能点耗时率上限值<br></td>
  			<td >
  			    <input type="text" id="fpCostOptimistic" name="adjustParam.fpCostOptimistic" style="width:160px" value="<s:property value='adjustParam.fpCostOptimistic'/>"/ >
  			    <b style="font-family:verdana;color:red">*</b>人时/功能点
            <br></td>
  	  	</tr>
  	    <tr>
  			<td width="15%">功能点耗时率标准值<br></td>
  			<td >
  			    <input type="text" id="fpCostStandard" name="adjustParam.fpCostStandard" style="width:160px" value="<s:property value='adjustParam.fpCostStandard'/>"/ >
  			    <b style="font-family:verdana;color:red">*</b>人时/功能点
            <br></td>
  	  	</tr>
  	    <tr>
  			<td width="15%">功能点耗时率下限值<br></td>  			
            <td >
  			    <input type="text" id="fpCostPessimistic" name="adjustParam.fpCostPessimistic" style="width:160px" value="<s:property value='adjustParam.fpCostPessimistic'/>"/ >
  			    <b style="font-family:verdana;color:red">*</b>人时/功能点
            <br></td>
  	  	</tr>
  	</table>
  	
  	<table>
  		<tr>
  			<td width="15%">人月费率<br></td>
  			<td >
  			    <input type="text" id="pmRate" name="adjustParam.pmRate" style="width:160px" value="<s:property value='adjustParam.pmRate'/>"/ >
  			    <b style="font-family:verdana;color:red">*</b> 万RMB/人月
            <br></td>
  	  	</tr>
  	  	
  	    <tr>
  			<td width="15%">毛利润率<br></td>
  			<td >
  			    <input type="text" id="grossMargin" name="adjustParam.grossMargin" style="width:160px" value="<s:property value='adjustParam.grossMargin'/>"/ >
  			    <b style="font-family:verdana;color:red">*</b> %
            <br></td>
  	  	</tr>
  	</table>
  	<input type="hidden" name="adjustParam.id" value="<s:property value="adjustParam.id"/>" />
  	<input type="submit" name="submit" value=" 保 存 "/>
  	</s:form>
  </body>
</html>

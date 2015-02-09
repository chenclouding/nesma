<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %> 
<%@ page import="business.OrganizationBusiness" %>
<%@ page import="business.UserBusiness" %>
<%@ page import="bean.Organization" %>
<%@ page import="bean.User" %>
<%@ include file="/nesma/checkUser.jsp"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>修改组织信息</title>
    
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
		if(isEmpty(document.getElementById("Name").value)) 
		{	
		    alert("请填写组织名称！");
		    document.getElementById("Name").focus();
			return false;
		}
		if(isEmpty(document.getElementById("Address").value)) 
		{	
		    alert("请填写组织所在地址！");
		    document.getElementById("Address").focus();
			return false;
		}
		if(isEmpty(document.getElementById("Province").value)) 
		{	
		    alert("请填写组织所在省份！");
		    document.getElementById("Province").focus();
			return false;
		}
		if(isEmpty(document.getElementById("City").value)) 
		{	
		    alert("请填写组织所在城市！");
		    document.getElementById("City").focus();
			return false;
		}
		if(isEmpty(document.getElementById("Nation").value)) 
		{	
		    alert("请填写组织所在国家！");
		    document.getElementById("Nation").focus();
			return false;
		}
		if(isEmpty(document.getElementById("Postcode").value)) 
		{	
		    alert("请填写组织邮编！");
		    document.getElementById("Postcode").focus();
			return false;
		}
		if(!isEmpty(document.getElementById("Postcode").value)&&!IsPostId(trim(document.getElementById("Postcode").value)))
		{
			alert("邮编应为6位数字！");
			document.getElementById("Postcode").focus();
			return false;
		}
		if(isEmpty(document.getElementById("Contact").value)) 
		{	
		    alert("请填写组织联系人！");
		    document.getElementById("Contact").focus();
			return false;
		}
		
		if(isEmpty(document.getElementById("Phone").value)) 
		{	
		    alert("请填写联系人电话！");
		    document.getElementById("Phone").focus();
			return false;
		}
		if(!isEmpty(document.getElementById("Phone").value)&&!IsTelphone(trim(document.getElementById("Phone").value))){
			alert("固定电话号码区号3到4位，号码7到8位！");
			document.getElementById("Phone").focus();
			return false;
		}
		
		if(!isEmpty(trim(document.getElementById("MailAddress1").value))&&!IsEmail(trim(document.getElementById("MailAddress1").value))){
			alert("电子邮件格式不正确！");
			document.getElementById("MailAddress1").focus();
			return false;
		}	
	}	
	</script>
  </head>
  
  <body>
   <h1>修改组织信息</h1> 
   <s:form  action="Organization!edited.action" name="orgForm" id ="function" method="post"  onsubmit="return verifyInput();"  validate="true">
   <table>
     <s:if test="message"><h1 style="color:red">修改成功！</h1></s:if>
  		<tr>
  			<td width="15%">组织名称<br></td>
  			<td >
  			    <input type="text" id="Name" name="organization.name" style="width:220px" value="<s:property value="organization.name"/>"/>
  			    <b style="font-family:verdana;color:red">*</b>
            <br></td>
  		</tr>
  		<tr><td>
  				<s:select label="组织类型" id="organization.type"  list="{
  				'A.农、林、牧、渔业',
  				'B.采矿业',
  				'C.制造业',
  				'D.电力、热力、燃气及水生产和供应业',
  				'E.建筑业',
  				'F.批发和零售业',
  				'G.交通运输、仓储和邮政业',
  				'H.住宿和餐饮业',
  				'I.信息传输、软件和信息技术服务业',
  				'J.金融业',
  				'K.房地产业',
  				'L.租赁和商务服务业',
  				'M.科学研究和技术服务业',
  				'N.水利、环境和公共设施管理业',
  				'O.居民服务、修理和其他服务业',
  				'P.教育',
  				'Q.卫生和社会工作',
  				'R.文化、体育和娱乐业',
  				'S.公共管理、社会保障和社会组织',
  				'T.国际组织'}" 
  				value="organization.type" headerValue="--请选择--" id="Type" name="organization.type" style="width:220px"/>  			   		
            <br></td>
  		</tr>
  		<tr>
  			<td width="15%">组织简介</td>
  			<td >
  			    <textarea name="organization.description"><s:property value='organization.description'/></textarea>
            </td>
  		</tr>
  		<tr>
  			<td width="15%">组织地址<br></td>
  			<td >
  			    <input type="text" id="Address" name="organization.address" style="width:220px" value="<s:property value="organization.address"/>" />
  			    <b style="font-family:verdana;color:red">*</b>
            <br></td>
  		</tr>
  		<tr>
  			<td width="15%">省<br></td>
  			<td >
  			    <input type="text" id="Province" name="organization.province" style="width:220px" value="<s:property value="organization.province"/>"/>
  			    <b style="font-family:verdana;color:red">*</b>
            <br></td>
  		</tr>
  		<tr>
  			<td width="15%">城市<br></td>
  			<td >
  			    <input type="text" id="City" name="organization.city" style="width:220px" value="<s:property value="organization.city"/>"/>
  			    <b style="font-family:verdana;color:red">*</b>
            <br></td>
  		</tr>
  	
  		<tr>
  			<td width="15%">国家<br></td>
  			<td >
  			    <input type="text" id="Nation" name="organization.nation" style="width:220px" value="<s:property value="organization.nation"/>"/>
  			    <b style="font-family:verdana;color:red">*</b>
            <br></td>
  		</tr>
  		<tr>
  			<td width="15%">邮编<br></td>
  			<td >
  			    <input type="text" id="Postcode" name="organization.postcode" style="width:220px" value="<s:property value="organization.postcode"/>"/>
  			    <b style="font-family:verdana;color:red">*</b> 如：100001
            <br></td>
  		</tr>
  		<tr>
  			<td width="15%">联系人<br></td>
  			<td >
  			    <input type="text" id="Contact" name="organization.contact" style="width:220px" value="<s:property value="organization.contact"/>"/>
  			    <b style="font-family:verdana;color:red">*</b>
            <br></td>
  		</tr>
  		<tr>
  			<td width="15%">固定电话<br></td>
  			<td >
  			    <input type="text" id="Phone" name="organization.phone" style="width:220px" value="<s:property value="organization.phone"/>"/>
  			    <b style="font-family:verdana;color:red">*</b> 如： 010-68941577
            <br></td>
  		</tr>
  		<tr>
  			<td width="15%">电子邮件<br></td>
  			<td >
  			    <input type="text" id="MailAddress1" name="organization.mail" style="width:220px" value="<s:property value="organization.mail"/>"/>
            <br></td>
  		</tr>
  		<tr>
  			<td width="15%">传真<br></td>
  			<td >
  			    <input type="text" name="organization.fax" style="width:220px" value="<s:property value="organization.fax"/>"/>
            <br></td>
  		</tr>
  		<tr>
  		    <td>
  				<input type="submit" name="submit" value=" 保 存 "/>
  			</td>
  			<td>
  				<input type="button" name="goback" id="goback" value="返  回"  onclick="javascript:window.location='/nesma/nesma/user/Organization!list.action'" /> 
  			</td>
  		</tr>
  	</table>
  	<input type="hidden" name="organization.id" value="<s:property value="organization.id"/>"/>
  	</s:form> 		
  </body>
</html>

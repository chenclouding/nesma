<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %> 
<%@ include file="/nesma/checkUser.jsp"%>
<%@ page import="business.UserBusiness" %>
<%@ page import="bean.User" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>修改用户信息</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="/nesma/images/screen.css">
	<script language="JavaScript" src="/nesma/javascript/verify.js"></script>
	<script language="JavaScript"> 	
  	 function verifyInput()
	{	
			var frm = document.userForm;
			if(isEmpty(frm.userName.value)) 
			{	
		    	alert("请填写用户名！");
				frm.userName.focus();
				return false;
			}
			if(isEmpty(frm.userRealName.value)) 
			{	
		    	alert("请填写用户真实姓名！");
				frm.userRealName.focus();
				return false;
			}
			if(!isEmpty(trim(frm.mailAddress.value))&&!IsEmail(trim(frm.mailAddress.value))){
				alert("电子邮件格式不正确！");
				frm.mailAddress.focus();
				return false;
			}
			
			if(isEmpty(trim(frm.userPassword.value))) 
			{	
		    	alert("请设置用户密码！");
				frm.userPassword.focus();
				return false;
			}
			if(isEmpty(trim(frm.reUserPassword.value))) 
			{	
		    	alert("请重复输入用户密码！");
				frm.reUserPassword.focus();
				return false;
			}
			
			if(frm.reUserPassword.value !== frm.userPassword.value) 
			{	
		    	alert("您两次输入的密码不一致，请重新输入！");
				frm.reUserPassword.focus();
				return false;
			}
			if(!isEmpty(trim(frm.userPassword.value))&&!is_letter_num(trim(frm.userPassword.value)))
			{
				alert("密码需由6至12位的数字或字母组成！");
				frm.userPassword.focus();
				return false;
			}
	}
    </script> 
  </head>
  
  <body>
   <h1>修改用户信息</h1>
   <s:form  action="User!edited" name="userForm" id ="user" method="post" onsubmit="return verifyInput();">
  	<table>  
     <s:if test="message"><h1 style="color:red">修改成功！</h1></s:if>
     	<tr>
  			<td width="15%">用户名<br></td>
  			<td >
  			    <input type="text" id="userName" name="user.name" style="width:220px" value="<s:property value="user.name"/>"/>
  			    <b style="font-family:verdana;color:red">*</b>
            <br></td>
  		</tr>
  		<tr>
  			<td width="15%">用户姓名<br></td>
  			<td >
  			    <input type="text" id="userRealName" name="user.realName" style="width:220px" value="<s:property value="user.realName"/>"/>
  			    <b style="font-family:verdana;color:red">*</b>请填写用户真实姓名
            <br></td>
  		</tr>
  		<tr>
  			<td width="15%">用户邮箱<br></td>
  			<td >
  			    <input type="text" id="mailAddress" name="user.mail" style="width:220px" value="<s:property value="user.mail"/>"/>
            <br></td>
  		</tr>
  		<tr>
  			<td width="10%">修改用户密码<br></td>
  			<td >
  			    <input type="password" id="userPassword" name="user.password" style="width:220px" value="<s:property value="user.password"/>">
  			    <b style="font-family:verdana;color:red">*</b>密码必须由6~12位字母或数字组成
            <br></td>
  		</tr>
  		<tr>
  			<td width="10%">请重新输入密码<br></td>
  			<td >
  			    <input type="password" name="reUserPassword" style="width:220px" value="<s:property value="user.password"/>">
  			    <b style="font-family:verdana;color:red">*</b>
            <br></td>
  		</tr>
  		<tr>
  			<td width="10%">备注<br></td>
  			<td >
  				<textarea name="user.comment"><s:property value="user.comment"/></textarea>
            <br></td>
  		</tr>
  	</table>
  	
    <input type="hidden" name="user.id" value="<s:property value="user.id"/>">
  	<input type="submit" name="submit" value=" 保 存 "/>
    <input type='button' onclick="Javascript:window.location='/nesma/nesma/user/User!list.action'" value=" 返 回 ">
  	</s:form> 
  </body>
</html>

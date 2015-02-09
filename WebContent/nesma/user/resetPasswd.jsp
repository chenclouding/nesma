<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
    
    <title>My JSP 'resetPasswd.jsp' starting page</title>
    
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
		var frm = document.industryForm;
		if(isEmpty(frm.oldPassword.value)) 
		{	
		    alert("请填写当前密码！");
		    frm.oldPassword.focus();
			return false;
		}
		if(isEmpty(frm.userPassword.value)) 
		{	
		    alert("请填写新密码！");
		    frm.userPassword.focus();
			return false;
		}
		if(isEmpty(frm.reUserPassword.value)) 
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
		if(!is_letter_num(trim(frm.userPassword.value)))
		{
				alert("密码需由6至12位的数字或字母组成！");
				frm.userPassword.focus();
				return false;
		}
	}
	</script>
	
  </head>
  
  <body>
    <%
  		String userId = session.getAttribute("userId").toString();
   %>
  	<s:form  action="User!reset" name="industryForm" method="post" validate="true" onsubmit="return verifyInput();">
     <table>
      <b style="font-family:verdana;color:red"><s:actionerror/> </b>
      <tr>
      		<td width="15%">当前密码<br></td>
  			<td >
  			    <input type="password" name="oldPassword" style="width:160px" value=""/ >
  			    <b style="font-family:verdana;color:red">*</b>
            <br></td>
      </tr>
         <tr>
      		<td width="15%">新密码<br></td>
  			<td >
  			    <input type="password" name="userPassword" style="width:160px" value=""/ >
  			    <b style="font-family:verdana;color:red">*</b> 密码必须由6~12位字母或数字组成
            <br></td>
      </tr>
      <tr>
      		<td width="15%">确认密码<br></td>
  			<td >
  			    <input type="password" name="reUserPassword" style="width:160px" value="<%=request.getParameter("reUserPassword")==null?"":request.getParameter("reUserPassword")%>"/ >
  			    <b style="font-family:verdana;color:red">*</b>
            <br></td>
      </tr>
    </table>
    <input type="submit" name="submit" value=" 保 存 "/>
    <input type="hidden" name="userId" value="<%=userId %>">
   </s:form>
  </body>
</html>

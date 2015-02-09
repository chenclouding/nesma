<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="business.UserBusiness" %>
<%@taglib uri="/struts-tags" prefix="s" %>
<%@ page import="bean.User" %>
<%@ include file="/nesma/checkUser.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>组织列表</title>
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

			if(isEmpty(document.getElementById("userName").value)) 
			{	
		    	alert("请填写用户名！");
		    	document.getElementById("userName").focus();
				return false;
			}
			if(isEmpty(document.getElementById("userRealName").value)) 
			{	
		    	alert("请填写用户真实姓名！");
		    	document.getElementById("userRealName").focus();
				return false;
			}
			if(!isEmpty(trim(document.getElementById("mailAddress").value))&&!IsEmail(trim(document.getElementById("mailAddress").value))){
				alert("电子邮件格式不正确！");
				document.getElementById("mailAddress").focus();
				return false;
			}
			
			if(isEmpty(trim(document.getElementById("userPassword").value))) 
			{	
		    	alert("请设置用户密码！");
		    	document.getElementById("userPassword").focus();
				return false;
			}
			if(isEmpty(trim(document.getElementById("reUserPassword").value))) 
			{	
		    	alert("请重复输入用户密码！");
		    	document.getElementById("reUserPassword").focus();
				return false;
			}
			
			if(document.getElementById("reUserPassword").reUserPassword.value !== document.getElementById("userPassword").value) 
			{	
		    	alert("您两次输入的密码不一致，请重新输入！");
		    	document.getElementById("reUserPassword").focus();
				return false;
			}
			if(!isEmpty(trim(document.getElementById("userPassword").value))&&!is_letter_num(trim(document.getElementById("userPassword").value)))
			{
				alert("密码需由6至12位的数字或字母组成！");
				document.getElementById("userPassword").focus();
				return false;
			}
	}
    function confirmdel(num){
    	return confirm("确定删除该用户及其包含的"+num+"个项目吗？");
    }
    </script> 
  </head>
  
  <body>
    <h1>用户列表</h1>
   	<table>
       <tr>
         <td>序号</td> 
         <td>用户名</td>
         <td>修改</td>
<<<<<<< .mine
         <td>删除</td>        
=======
         <td>删除</td>      
>>>>>>> .r64
       </tr>
       <s:if test="message">
       <h1 style="color:red">目前尚无用户，请添加用户</h1>
       </s:if>
       <%
           int i = 1;
	       		  
	         %>
	         <s:iterator value="users">
	         <tr>
	          	<td><%= i ++%></td> 
	         	<td><s:property value="name"/></td>
		        <td class = editimg>
		          	  <a href="/nesma/nesma/user/User!edit.action?user.id=<s:property value="id"/>">
		          	  	<IMG src="/nesma/images/btnedit.gif" alt="点击修改" border="0" />
		          	  </a>
		        </td>
		        <td class = delimg>
		              <a href="/nesma/nesma/user/User!del.action?user.id=<s:property value="id"/>" onclick="return confirmdel(<s:property value="projects.size"/>)">
		              	<img src="/nesma/images/btndel.gif" alt="点击删除" width="15" height="12" border="0" />
		              </a>
		        </td>
<<<<<<< .mine
=======
		       
>>>>>>> .r64
	         </tr>  
	         </s:iterator>
        
    </table>
     
   
    <form  action="User!add" name="userForm" id ="user" method="post" onsubmit="return verifyInput();">
    <h1>新增用户</h1>  
  	<table>
  		<tr>
  			<td width="15%">用户名<br></td>
  			<td >
  			    <input type="text" id="userName" name="user.name" style="width:220px" value=""/>
  			    <b style="font-family:verdana;color:red">*</b>
            <br></td>
  		</tr>
  		<tr>
  			<td width="15%">用户姓名<br></td>
  			<td >
  			    <input type="text" id="userRealName" name="user.realName" style="width:220px" value=""/>
  			    <b style="font-family:verdana;color:red">*</b>请填写用户真实姓名
            <br></td>
  		</tr>
  		<tr>
  			<td width="15%">用户邮箱<br></td>
  			<td >
  			    <input type="text" id="mailAddress" name="user.mail" style="width:220px" value=""/>
            <br></td>
  		</tr>
  		<tr>
  			<td width="10%">设置用户密码<br></td>
  			<td >
  			    <input type="password" id="userPassword" name="user.password" style="width:220px">
  			    <b style="font-family:verdana;color:red">*</b>密码必须由6~12位字母或数字组成
            <br></td>
  		</tr>
  		<tr>
  			<td width="10%">请重新输入密码<br></td>
  			<td >
  			    <input type="password" id="reUserPassword" name="reUserPassword" style="width:220px">
  			    <b style="font-family:verdana;color:red">*</b>
            <br></td>
  		</tr>
  		<tr>
  			<td width="10%">备注<br></td>
  			<td >
  				<textarea name="user.comment"></textarea>
            <br></td>
  		</tr>
  		<tr>
  		    <td>
  				<input type="submit" name="submit" value=" 新  增 "/>
  			</td>
  			<td>
  				<input type="reset" name="reset" value=" 清  除 "/>
  			</td>
  		</tr>
  	</table>
  	<input type="hidden" name="organization.id" value="<s:property value="organization.id"/>"/>
  	</form> 			
  </body>
</html>

<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="business.OrganizationBusiness" %>
<%@taglib uri="/struts-tags" prefix="s" %>
<%@ page import="bean.Organization" %>
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
	 		var frm = document.orgForm;  	  	   
			if(isEmpty(document.getElementById("Name").value)) 
			{	
			    alert("请填写组织名称！");
			    document.getElementById("Name").focus();
				return false;
			}
			if(document.getElementById("Type").value =="==请选择组织类型==") 
			{	
			    alert("请填写组织类型！");
			    document.getElementById("Type").focus();
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
		
			
			if(isEmpty(document.getElementById("UserName").value)) 
			{	
		    	alert("请填写管理员用户名！");
		    	document.getElementById("UserName").focus();
				return false;
			}
			if(!isEmpty(trim(document.getElementById("MailAddress2").value))&&!IsEmail(trim(document.getElementById("MailAddress2").value))){
				alert("电子邮件格式不正确！");
				document.getElementById("MailAddress2").focus();
				return false;
			}
			
			if(isEmpty(trim(document.getElementById("UserPassword").value))) 
			{	
		    	alert("请设置管理员密码！");
		    	document.getElementById("UserPassword").focus();
				return false;
			}
			if(isEmpty(trim(document.getElementById("reUserPassword").value))) 
			{	
		    	alert("请重复输入管理员密码！");
		    	document.getElementById("reUserPassword").focus();
				return false;
			}
			
			if(document.getElementById("reUserPassword").value !== document.getElementById("UserPassword").value) 
			{	
		    	alert("您两次输入的密码不一致，请重新输入！");
		    	document.getElementById("reUserPassword").focus();
				return false;
			}
			if(!isEmpty(trim(document.getElementById("reUserPassword").value))&&!is_letter_num(trim(document.getElementById("UserPassword").value)))
			{
				alert("密码需由6至12位的数字或字母组成！");
				document.getElementById("UserPassword").focus();
				return false;
			}
			
			
	}
	
    function confirmdel(num){
    	return confirm("确定删除该组织及其包含的"+num+"个用户吗？");
    }
    </script> 
  </head>
  
  <body>
    <h1>组织列表</h1>
   	<table>
       <tr>
         <td>序号</td> 
         <td>名称</td>
         <td>修改</td>
         <td>删除</td>         
       </tr>
       <s:if test="message">
       <h1 style="color:red">目前无组织信息，请添加组织</h1>
       </s:if>
       <%
           int i = 1;
	      
	         %>
	         <s:iterator value="organizations">
	         <tr>
	          	<td><%= i ++%></td> 
	         	<td><s:property value="name"/></td>
		        <td class = editimg>
		          	  <a href="/nesma/nesma/user/Organization!edit.action?organization.id=<s:property value="id"/>">
		          	  	<IMG src="/nesma/images/btnedit.gif" alt="点击修改" border="0" />
		          	  </a>
		        </td>
		        <td class = delimg>
		              <a href="/nesma/nesma/user/Organization!del.action?organization.id=<s:property value="id"/>" onclick="return confirmdel(<s:property value="users.size"/>)">
		              	<img src="/nesma/images/btndel.gif" alt="点击删除" width="15" height="12" border="0" />
		              </a>
		        </td>
	         </tr>  
	         </s:iterator>
        
    </table>
     
    <form  action="Organization!add" name="orgForm" id ="org" method="post" onsubmit="return verifyInput();">
    <h1>新增组织</h1>  
  	<table>
  		<tr>
  			<td width="15%">组织名称<br></td>
  			<td >
  			    <input id="Name" type="text" name="organization.name" style="width:220px" value=""/>
  			    <b style="font-family:verdana;color:red">*</b>
            <br></td>
  		</tr>
  		<tr>
  			<td width="15%">组织类型<br></td>
  			<td>
  			   <select id="Type" name="organization.type" style="width:220px">
  			   		<option value="==请选择组织类型==">==请选择组织类型==</option>
  					<option value="A.农、林、牧、渔业">A.农、林、牧、渔业</option>
  					<option value="B.采矿业">B.采矿业</option>
  					<option value="C.制造业">C.制造业</option>
  					<option value="D.电力、热力、燃气及水生产和供应业">D.电力、热力、燃气及水生产和供应业</option>
  					<option value="E.建筑业">E.建筑业</option>
  					<option value="F.批发和零售业">F.批发和零售业</option>
  					<option value="G.交通运输、仓储和邮政业">G.交通运输、仓储和邮政业</option>
  					<option value="H.住宿和餐饮业">H.住宿和餐饮业</option>
  					<option value="I.信息传输、软件和信息技术服务业">I.信息传输、软件和信息技术服务业</option>
  					<option value="J.金融业">J.金融业</option>
  					<option value="K.房地产业">K.房地产业</option>
  					<option value="L.租赁和商务服务业">L.租赁和商务服务业</option>
  					<option value="M.科学研究和技术服务业">M.科学研究和技术服务业</option>
  					<option value="N.水利、环境和公共设施管理业">N.水利、环境和公共设施管理业</option>
  					<option value="O.居民服务、修理和其他服务业">O.居民服务、修理和其他服务业</option>
  					<option value="P.教育">P.教育</option>
  					<option value="Q.卫生和社会工作">Q.卫生和社会工作</option>
  					<option value="R.文化、体育和娱乐业">R.文化、体育和娱乐业</option>
  					<option value="S.公共管理、社会保障和社会组织">S.公共管理、社会保障和社会组织</option>
  					<option value="T.国际组织">T.国际组织</option>
  				</select>
  				<b style="font-family:verdana;color:red">*</b>
            <br></td>
  		</tr>
  		<tr>
  			<td width="15%">组织简介</td>
  			<td >
  			    <textarea name="organization.description"></textarea>
            </td>
  		</tr>
  		<tr>
  			<td width="15%">组织地址<br></td>
  			<td >
  			    <input id="Address" type="text" name="organization.address" style="width:220px" value=""/>
  			    <b style="font-family:verdana;color:red">*</b>
            <br></td>
  		</tr>
  		<tr>
  			<td width="15%">省<br></td>
  			<td >
  			    <input id="Province" type="text" name="organization.province" style="width:220px" value=""/>
  			    <b style="font-family:verdana;color:red">*</b>
            <br></td>
  		</tr>
  		<tr>
  			<td width="15%">城市<br></td>
  			<td >
  			    <input id="City" type="text" name="organization.city" style="width:220px" value=""/>
  			    <b style="font-family:verdana;color:red">*</b>
            <br></td>
  		</tr>
  	
  		<tr>
  			<td width="15%">国家<br></td>
  			<td >
  			    <input id="Nation" type="text" name="organization.nation" style="width:220px" value=""/>
  			    <b style="font-family:verdana;color:red">*</b>
            <br></td>
  		</tr>
  		<tr>
  			<td width="15%">邮编<br></td>
  			<td >
  			    <input id="Postcode" type="text" name="organization.postcode" style="width:220px" value=""/>
  			    <b style="font-family:verdana;color:red">*</b> 如：100001
            <br></td>
  		</tr>
  		<tr>
  			<td width="15%">联系人<br></td>
  			<td >
  			    <input id="Contact" type="text" name="organization.contact" style="width:220px" value=""/>
  			    <b style="font-family:verdana;color:red">*</b>
            <br></td>
  		</tr>
  		<tr>
  			<td width="15%">固定电话<br></td>
  			<td >
  			    <input id="Phone" type="text" name="organization.phone" style="width:220px" value=""/>
  			    <b style="font-family:verdana;color:red">*</b> 如： 010-68941577
            <br></td>
  		</tr>
  		<tr>
  			<td width="15%">电子邮件<br></td>
  			<td >
  			    <input id="MailAddress1" type="text" name="organization.mail" style="width:220px" value=""/>
            <br></td>
  		</tr>
  		<tr>
  			<td width="15%">传真<br></td>
  			<td >
  			    <input id="Fax" type="text" name="organization.fax" style="width:220px" value=""/>
            <br></td>
  		</tr>
  		<tr>
  			<td width="15%">管理员用户名<br></td>
  			<td >
  			    <input id="UserName" type="text" name="user.name" style="width:220px" value=""/>
  			    <b style="font-family:verdana;color:red">*</b>
            <br></td>
  		</tr>
  		<tr>
  			<td width="15%">管理员姓名<br></td>
  			<td >
  			    <input id="RealName" type="text" name="user.realName" style="width:220px" value=""/>
  			    <b style="font-family:verdana;color:red"></b>请填写管理员真实姓名
            <br></td>
  		</tr>
  		<tr>
  			<td width="15%">管理员邮箱<br></td>
  			<td >
  			    <input id="MailAddress2" type="text" name="user.mail" style="width:220px" value=""/>
            <br></td>
  		</tr>
  		<tr>
  			<td width="10%">设置管理员密码<br></td>
  			<td >
  			    <input id="UserPassword" type="password" name="user.password" style="width:220px">
  			    <b style="font-family:verdana;color:red">*</b>密码必须由6~12位字母或数字组成
            <br></td>
  		</tr>
  		<tr>
  			<td width="10%">请重新输入密码<br></td>
  			<td >
  			    <input id="reUserPassword" type="password" name="reUserPassword" style="width:220px">
  			    <b style="font-family:verdana;color:red">*</b>
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
  	</form> 			
  </body>
</html>

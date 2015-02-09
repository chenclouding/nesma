<%@ page contentType="text/html; charset=gb2312" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %> 
<HTML>
<HEAD>
<TITLE>软件成本估算工具</TITLE>
<!--CharSet-->
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=gb2312">
<link rel="stylesheet" href="/nesma/images/CSS.CSS" type="text/css">
<style type="text/css">
<!--
.style1 {color: #006600}
.style2 {font-size: 16px}
.style3 {color: #CC3300}
.style4 {
	font-family: "华文隶书";
	font-size: 24px;
	color: #FF0000;
}
.style6 {
	font-size: 36px;
	font-family: "华文隶书";
}
.style8 {font-size: 24px; font-family: "华文隶书";}
-->
</style>
<script language="JavaScript" src="javascript/verify.js"></script>
<script language="JavaScript">
function check(){
	var nameObj=document.getElementById("userName");
	var passwordObj=document.getElementById("userPassword");
	if(nameObj.value==null||nameObj.value==""){
		alert("请输入用户名!");
		nameObj.focus();
		return false;
	}
	if(passwordObj.value==null||passwordObj.value==""){
		alert("请输入密码!");
		passwordObj.focus();
		return false;
	}
	form1.submit();
}

function register(){
	window.location.href="/ifpug/IFPUG/user/register.jsp";
}

function pressenter(frm,event){ 
    var event=window.event?window.event:event; if(event.keyCode==13){ 
        frm.submit(); 
    } 
} 
</script>
</HEAD>
<BODY background="/nesma/images/bline.gif" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" >
<!--Counter-->
<!--Something Here-->
<table width="778" border="0" cellspacing="0" cellpadding="0" align="center" height="130">
 <tr>
    <td background="/nesma/images/index1.png" valign="top">     
    </td>
  </tr>
</table>
<table width="778" border="0" cellspacing="0" cellpadding="0" align="center" background="/nesma/images/index_bg.gif">
  <tr>
    <td valign="top" width="215" rowspan="2">
      <table width="215" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td>
            <table width="215" border="0" cellspacing="0" cellpadding="0" height="20" background="/nesma/images/01.gif">
              <tr>
                <td> <img src="/nesma/images/index_pic.gif" width="215" height="155"></td>
              </tr>
            </table>
          </td>
        </tr>       
      </table>
    </td>
    <td valign="top" width="563"><img src="/nesma/images/index_top2.gif" width="563" height="70"></td>
  </tr>
  <tr>
    <td valign="top">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td>
           <!--IndexPage.Content.Begin-->
            <table width="90%" border="0" cellspacing="0" cellpadding="0" align="center">
            <tr>
              <td>
                  <div align="left" class="style2 style3">
                     <p class="style2 style4">欢迎登陆！</p>
                    </div> 
              </td>
             </tr>
             <tr>
                <td bgcolor="#000000"><img src="/nesma/images/Spacer.gif" width="1" height="1"></td>
             </tr>
             <tr>
                <td height="128">
<!--Page.Content.Begin-->
<!--Something Here-->

<s:form name="form1" id="_form" method="post" action="User!login"  validate="true">  
  <b><s:actionerror cssStyle="color:red"></s:actionerror></b>
  <table width="37%"  border="0" align="center" cellpadding="1" cellspacing="1">  
   <tr>
      <td> <p>&nbsp;</p></td>
    </tr> 
    <tr>     
      <td>用户名</td>
      <td><input type="text" id="userName" name="user.name" ></td>
    </tr>
    <tr>
      <td>密码        </td>
      <td><input type="password" id="userPassword" name="user.password"  onkeydown='pressenter(this.form,event)'></td>
    </tr>
    <tr>
      <td><div align="center">
      </div></td>
      <td><div align="center">
        <input type="submit" value="登 录" onClick="check()">
      </div></td>
    </tr>
  </table>
  <p>&nbsp;</p>
  </s:form>
<p>&nbsp; </p>

<!--Page.Content.End-->
       </td>
          </tr>
</table>
<!--IndexPage.Content.End-->


            <table width="90%" border="0" cellspacing="0" cellpadding="0" align="center" height="1">
              <tr>
                <td bgcolor="#000000"> </td>
              </tr>
            </table>
            <table width="90%" border="0" cellspacing="0" cellpadding="4" align="center">
              <tr>
                <td>
                  <p align="center">
<!--Your Company Name-->
北航软件所
<!--TCopyRight-->
 版权所有 @2005<br>
<!--TAddress-->
公司地址:北京市海淀区学院路37号
<!--Address-->
<br>
<!--TTelephone-->
电话:010－82316288
<!--Telephone-->
<br>
<!--TEMail-->

<!--EMail-->

<!--Email-->
</p>
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
<table width="778" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td><img src="/nesma/images/index_bottom.gif" width="778" height="50"></td>
  </tr>
</table>
</BODY>

 </HTML>

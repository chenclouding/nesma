<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
if(session.getAttribute("userName")==null)
    {
%>
   	<script language='javascript'>
			alert("ÇëÖØĞÂµÇÂ½!");
			parent.location.href = "/nesma/nesma/user/login.jsp";   
	</script>
 <%
  }
 %>
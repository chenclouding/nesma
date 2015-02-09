<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@ include file="/nesma/checkUser.jsp"%>
<%@ page import="java.util.*"%>

<HTML>
	<HEAD>
		<SCRIPT type="text/javascript">
function switchSysBar(){
expireDate=new Date;
expireDate.setYear(expireDate.getYear()+1);
if (document.all("switchPoint").innerText==3){
document.all("switchPoint").innerText=4;
document.cookie="switchPoint="+"4"+";expires="+expireDate.toGMTString()+";";
document.all("frmTitle").style.display="none";
}else{
document.all("switchPoint").innerText=3;
document.cookie="switchPoint="+"3"+";expires="+expireDate.toGMTString()+";";
document.all("frmTitle").style.display="";
}}
</SCRIPT>

<STYLE type=text/css>
.navPoint {
	COLOR: 5E95C3;
	CURSOR: hand;
	FONT-FAMILY: Webdings;
	FONT-SIZE: 9pt
}
</STYLE>

<style type="text/css">
#dropmenudiv {
	position: absolute;
	border: 1px solid black;
	border-bottom-width: 0;
	font: normal 12px Verdana;
	line-height: 18px;
	z-index: 100;
}

#dropmenudiv a {
	width: 100%;
	display: block;
	text-indent: 3px;
	border-bottom: 1px solid black;
	padding: 1px 0;
	text-decoration: none;
}

#dropmenudiv a:hover { /*hover background color*/
	background-color: yellow;
}
</style>
		<link href="/nesma/images/css0.css" rel="stylesheet" type="text/css">
	</head>



	<BODY scroll='no' style="MARGIN: 0px">
		<%
			String userName = (String) session.getAttribute("userName");
			String userRole = (String) session.getAttribute("userRole");
			String linkTreeUrl, linkContentUrl;
			System.out.println(userRole);
			if(userRole.equals("user")) {
				linkTreeUrl = "/nesma/nesma/tree.jsp";
				linkContentUrl = "/nesma/nesma/main/Project!list.action";
			}
			else if(userRole.equals("org")){
				linkTreeUrl = "/nesma/nesma/orgAdminTree.jsp";
				linkContentUrl = "/nesma/nesma/user/User!list.action";
			} 
			else {			
				linkTreeUrl = "/nesma/nesma/superAdminTree.jsp";
				linkContentUrl = "/nesma/nesma/user/Organization!list.action";
			}  
			//session.setAttribute("index",1);
		%>


		<TABLE height="10%" align="center"  width="100%">
			<TR align="center">
				<TD colspan="3">
						<img src="/nesma/images/index2.png" width="80%"/>
				</TD>				
			</TR>
			<TR align="center">	
				<TD colspan="3" background="images/bg8.gif" >									
					<FONT color="#006600"> 当前用户：<%=userName%></FONT> &nbsp;&nbsp;
					<a style="color: #006600;" href="/nesma/nesma/user/logout.jsp">退出</a>
				</TD>
			</TR>
		</TABLE>


		<TABLE align="center" cellSpacing=0 cellPadding=0 height="78%" width="80%" bgcolor="#33CC66">
			<TR valign="top">
				<TD height="100%" align='middle' vAlign=center noWrap id=frmTitle
					name="frmTitle">
					<IFRAME frameBorder='0' id='leftFrame' name='leftFrame'
						scrolling='yes' src="<%=linkTreeUrl %>"
						style="HEIGHT: 100%; VISIBILITY: inherit; WIDTH: 210px; Z-INDEX: 2"></IFRAME>

				</TD>
				<TD class="T2" style="WIDTH: 9pt">
					<TABLE border='0' cellPadding='0' cellSpacing='0' height="100%">
						<TBODY bgcolor="#56ad5d">
							<tr>
								<TD onclick='switchSysBar()' style="HEIGHT: 100%">
									<SPAN class='navPoint' id='switchPoint' title='收缩/弹出左栏'>3</SPAN>
								</TD>
							</tr>
						</TBODY>
					</TABLE>
				</TD>
				<SCRIPT>
var spoint = 3;
if (spoint==4){
document.all("switchPoint").innerText=4;
document.all("frmTitle").style.display="none";
}
</SCRIPT>
				<TD style="WIDTH: 100%"><IFRAME frameBorder='0' id='contentFrame' name='contentFrame'
						scrolling='yes' src="<%=linkContentUrl %>"
						style="HEIGHT: 100%; VISIBILITY: inherit; WIDTH: 100%; background-color: #E8FFF5; Z-INDEX: 1"></IFRAME>
				<br></TD>
			</TR>
		</TABLE>
	</body>
</html>

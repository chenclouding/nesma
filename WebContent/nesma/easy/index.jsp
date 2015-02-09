<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
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
document.all("frmTitle1").style.display="none";
}else{
document.all("switchPoint").innerText=3;
document.cookie="switchPoint="+"3"+";expires="+expireDate.toGMTString()+";";
document.all("frmTitle1").style.display="";
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
		
		<TABLE align="center" height="10%" width="100%">
			<TR align="center">
				<TD colspan="3">
					<div>
						<IMG src="/nesma/images/index2.png" width="80%" >
						<div>
				</TD>
			</TR>
			<TR align="center">
				<td width="40%" align="center">
				您当前所选估算方法：预估功能点计数				
				</td>
				<TD align="left" width="60%">
					<a href="/nesma/nesma/user/index.jsp"><FONT color="#006600"> 返回首页</FONT></a>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<FONT color="#006600"> 当前用户：<s:property value="#session.userName"/></FONT> &nbsp;&nbsp;
					<a style="color: #006600;" href="/nesma/nesma/user/logout.jsp">退出</a>
				</TD>
			</TR>
		</TABLE>


		<TABLE align="center" cellSpacing=0 cellPadding=0 height="78%"
			width="80%" bgcolor="#33CC66">
			<TR valign="top">
				<TD height="100%" align='middle' vAlign=center noWrap id=frmTitle1 name="frmTitle1">
					<IFRAME frameBorder='0' id='leftFrame1' name='leftFrame1'
						scrolling='yes' src="/nesma/nesma/Itree.jsp"
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
document.all("frmTitle1").style.display="none";
}
</SCRIPT>
				<TD style="WIDTH: 100%"><IFRAME frameBorder='0' id='contentFrame' name='contentFrame'
						 src="DataFunctionE!selectForDf.action"
						style="HEIGHT: 100%; VISIBILITY: inherit; WIDTH: 100%; Z-INDEX: 1"></IFRAME>
				<br></TD>
			</TR>
		</TABLE>
	</body>
</html>

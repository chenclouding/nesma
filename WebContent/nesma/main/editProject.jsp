<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ page import="bean.Project" %>
<%@ include file="/nesma/checkUser.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'editProject.jsp' starting page</title>
    
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
			if(isEmpty(document.getElementById("name").value)) 
			{	
			    alert("请填写项目名称！");
			    document.getElementById("name").focus();
				return false;
			}		
			if(document.getElementById("startDate").value > document.getElementById("endDate").value) 
			{	
			    alert("开始时间必须小于结束时间！");
			    document.getElementById("endDate").focus();
				return false;
			}				
	}
	</script>

  </head>
  
  <body>      
  <s:form  action="Project!edited.action" name="projectForm" method="post" onsubmit="return verifyInput()">
     <table>
     <s:if test="message"><h1 style="color:red">修改成功！</h1></s:if>
		<tr>
  			<td width="15%">待估算项目名称<br></td>
  			<td >
  			    <input type="text" id="name" name="project.name" style="width:220px"  value="<s:property value='project.name'/>"/>
  			    <b style="font-family:verdana;color:red">*</b>
            <br/></td>
  		</tr>
  		<tr>
  			<td width="10%">待估算项目描述<br></td>
            <td >
  			    <textarea name="project.description" style="width:360px"><s:property value="project.description"/></textarea>
            </td>
  		</tr>
  	
  		<tr>
  			<td>
  			 	<s:select label="项目开发类型" id="projectType" list="{'新增型','二次开发型','增强型'}" value="project.type" headerValue="--请选择--" name="project.type" style="width:220px"/>
  			<br></td>
  		</tr>
  		
  		<tr>
  			<td width="10%">项目来源<br></td>
  			<td >
  			    <input type="text" name="project.country" style="width:220px" value="<s:property value="project.country"/>"/>
            <br></td>
  		</tr>
  		<tr>
  			<td width="10%">开发地区<br></td>
  			<td >
  			    <input type="text" name="project.province" style="width:220px" value="<s:property value="project.province"/>"/>
            <br></td>
  		</tr>
  	    <tr>
  			<td width="10%">开发城市<br></td>
  			<td >
  			    <input type="text" name="project.city" style="width:220px" value="<s:property value="project.city"/>"/>
            <br></td>
  		</tr>
  		<tr>
  			<td>
  				<s:select label="用户组织类型" id="projectIndustry" list="{
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
  				value="project.industry" headerValue="--请选择--" name="project.industry" style="width:220px"/>  			   		
            <br></td>
  		</tr>
  		
  	    <tr>
  			<td width="10%">开发平台<br></td>
  			<td >
  			    <input type="text" name="project.devPlatform" style="width:220px" value="<s:property value="project.devPlatform"/>"/>
            <br></td>
  		</tr>
  		<tr>
  			<td width="10%">集成开发环境<br></td>
  			<td >
  			    <input type="text" name="project.ide" style="width:220px"  value="<s:property value="project.ide"/>"/>
            <br></td>
  		</tr>
  		<tr>
  			<td>
  			 	<s:select label="主要编程语言" id="devLang" list="{
  			 	'C及其他同级别语言/平台',
  			 	'COBOL及其他同级别语言/平台',
  			 	'JAVA，C++，C#及其他同级别语言/平台'}" 
  			 	value="project.devLang" headerValue="--请选择--" name="project.devLang" style="width:220px"/>  			
            <br></td>
  		</tr>
  		<tr>
  			<td width="10%">主要操作系统<br></td>
  			<td >
  			    <input type="text" name="project.os" style="width:220px" value="<s:property value="project.os"/>"/>
            <br></td>
  		</tr>
  		<tr>
  			<td width="10%">主要数据库<br></td>
  			<td >
  			    <input type="text" name="project.database2" style="width:220px" value="<s:property value="project.database2"/>"/>
            <br></td>
  		</tr>
  		<tr>
  			<td width="10%">业务网点<br></td>
  			<td >
  			    <input type="text" name="project.businessOutlet" style="width:220px" value="<s:property value="project.businessOutlet"/>"/>
  			    业务网点数目是指最终系统部署的地区数量。
            <br></td>
  		</tr>
  		<tr>
  			<td width="10%">业务单元<br></td>
  			<td >
  			    <input type="text" name="project.businessUnit" style="width:220px" value="<s:property value="project.businessUnit"/>"/>
  			    业务单元数目即典型用户类型数目或业务部门数目。
            <br></td>
  		</tr>
  		<tr>
  			<td>
  			 	<s:select label="生命周期模型类型" id="projectSLCModel" list="{
  			 	'瀑布模型',
  			 	'迭代模型',
  			 	'增量模型'}" 
  			 	value="project.projectSLCModel" headerValue="--请选择--" name="project.projectSLCModel" style="width:220px"/>  			
            <br></td>
  		</tr>
  		<tr>
  			<td width="10%">选用估算方法<br></td>
  			<td>
  			<!--
  			 	<s:select label="选用估算方法" id="methodType" list="{
  			 	'预估功能点计数',
  			 	'估计功能点计数',
  			 	'详细功能点计数'}" 
  			 	value="project.methodType" headerValue="--请选择--" name="project.methodType" style="width:220px"/>  
  			 -->	
  			 	<select id="methodType" name="project.methodType" style="width:220px" >
  					<option title="只需识别数据功能个数，最简单" value="预估功能点计数" ${project.methodType=="预估功能点计数" ? "selected='selected'" : ""}>预估功能点计数</option>
  					<option title="需识别数据功能和事务功能个数，次简单" value="估计功能点计数" ${project.methodType=="估计功能点计数" ? "selected='selected'" : ""}>估计功能点计数</option>
  					<option title="识别数据功能和事务功能过程复杂，最完整" value="详细功能点计数" ${project.methodType=="详细功能点计数" ? "selected='selected'" : ""}>详细功能点计数</option>
  				</select>	
            <br></td>
  		</tr>
  	    <tr>
  			<td>开发开始时间<br></td>
  			<td>
           		<input id="startDate" type="text" name="project.startDate" style="width:220px" value='' onfocus="HS_setDate(this)"/>
            <br></td>
  		</tr>
  		<tr>
  			<td>开发结束时间<br></td>
  			<td>
  				<input id="endDate" type="text" name="project.endDate" style="width:220px" value=''  onfocus="HS_setDate(this)"/>
  			<br></td>
  	    </tr>
  	</table>
  	<input type="submit" name="submit" value=" 保 存 "/>
    <input type='button' onclick="Javascript:window.location='/nesma/nesma/main/Project!list.action'" value=" 返 回 ">
  	<input type="hidden" name="project.id" value="<s:property value='project.id'/>"/>  
	</s:form>
  </body>
</html>

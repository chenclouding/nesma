<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<%@ page import="bean.Project" %>
<%@ include file="/nesma/checkUser.jsp"%>

<%@ taglib uri="URIToTagLibrary" prefix="privilege"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 <head>
    <title>增加产品-显示项目列表</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  	<link rel="stylesheet" type="text/css" href="/nesma/images/screen.css">
  	<script language="JavaScript" src="/nesma/javascript/verify.js"></script>
  	<script type="text/javascript" src="/nesma/javascript/calenderJS.js"></script>
    <script language="JavaScript">  
	function expandIt(formId) {
		formObject =document.getElementById(formId);
		if (formObject.style.display == 'none') {
			formObject.style.display = '';
		}
		else {
			formObject.style.display = 'none';
		}
	}
	function confirmdel(){
    	return confirm("确定删除？");
    }
    function verifyInput()
	{			    	   
			if(isEmpty(document.getElementById("name").value)) 
			{	
			    alert("请填写项目名称！");
			    document.getElementById("name").focus();
				return false;
			}			
			if(document.getElementById("industry").value =="==请选择组织类型==") 
			{	
			    alert("请选择用户组织类型！");
			    document.getElementById("industry").focus();
				return false;
			}		
			if(document.getElementById("startDate").value > document.getElementById("endDate").value) 
			{	
			    alert("开始时间必须小于结束时间！");
			    document.getElementById("endDate").focus();
				return false;
			}	
			if(document.getElementById("methodType").value =="==请选择估算方法==") 
			{	
			    alert("请选择估算方法！");
			    document.getElementById("methodType").focus();
				return false;
			}	
	}	
    </script>
</head>
	
<body>  	
    <h1>我的估算项目|<a onclick="expandIt('project'); return false" href="#" style="color:green"><新增待估算项目></a></h1> 
   	<table>
       <tr>
         <td>序号</td> 
         <td>项目名称</td> 
         <td>功能点数目</td>
         <td>估算状态</td>
         <td>项目类型</td>
         <td>修改</td>
         <td>删除</td>
         <td>直接开始估算</td>
         <td>查看估算结果</td>
       </tr>
       <%
              int i = 1; 
              /*若无项目信息，提示添加；若有软件信息，列出估算软件列表*/
       %>  
       
	         <s:if test="message"><h1 style="color:red">目前无估算项目信息，请添加待估算的项目</h1></s:if>
	         <s:iterator value="projects">
	         <tr>
	          	<td><%= i ++ %></td>
	         	<td><s:property value="name"/></td>
	         	<td><s:property value="ufpc"/>FP</td> 
	         	<td><s:if test="estimateStatus==0" >未估算</s:if><s:else>已估算</s:else></td>
	          	<td><s:property value="type" /></td>        					
		          <td class = editimg>  
		          	  <a href="/nesma/nesma/main/Project!edit.action?project.id=<s:property value="id"/>">
		          	  	<IMG src="/nesma/images/btnedit.gif" alt="点击修改" border="0" />
		          	  </a>
		          </td>
		          <td class = delimg>
		              <a href="/nesma/nesma/main/Project!del.action?project.id=<s:property value="id"/>" onclick="return confirmdel()">
		              	<img src="/nesma/images/btndel.gif" alt="点击删除" width="15" height="12" border="0" />
		              </a>
		          </td>
		         
		         
		          <td class = delimg>	
		              <a title="按最近添加的估算场景进行估算" href="Javascript:parent.parent.location='/nesma/nesma/main/Project!getRecentCs.action?project.id=<s:property value="id"/>'" alt="请先分解系统功能！">开始估算</a>	  		  	
		          </td>
		          <td class = delimg>	
		               <a title="所有估算场景估算结果对比" href="/nesma/nesma/Project!getSumma.action?project.id=<s:property value="id"/>">估算结果比对</a>	  	
		          </td>
		         
	         </tr>
	         </s:iterator>       
    </table>
    
       
   <form  action="Project!add.action" name="projectForm" id ="project" method="post" style="display:none;" onsubmit="return verifyInput();">
  	<table>
  		<tr>
  			<td width="15%">待估算项目名称<br></td>
  			<td >
  			    <input type="text" id="name" name="project.name" style="width:220px" value=""/ >
  			    <b style="font-family:verdana;color:red">*</b>
            <br></td>
  		</tr>
  		<tr>
  			<td width="10%">待估算项目描述<br></td>
  			<td >
  			    <textarea name="project.description"></textarea>
            <br></td>
  		</tr>
  	
  		<tr>
  			<td width="15%">项目开发类型<br></td>
  			<td>
  			 	<select name="project.type" style="width:160px">
  			 	    <!--0代表newDevelop，1代表二次开发，2代表增强型 -->
  					<option value="新增型" selected>新增型</option>
  					<option value="二次开发型">二次开发型</option>
  					<option value="增强型">增强型</option>
  				</select>
            <br></td>
  		</tr>
        <tr>
  			<td width="10%">项目来源<br></td>
  			<td >
  			    <input type="text" name="project.country" style="width:220px" value="中国"/ >
            <br></td>
  		</tr>
  		<tr>
  			<td width="10%">开发地区<br></td>
  			<td >
  			    <input type="text" name="project.province" style="width:220px" value=""/ >
            <br></td>
  		</tr>
  	    <tr>
  			<td width="10%">开发城市<br></td>
  			<td >
  			    <input type="text" name="project.city" style="width:220px" value=""/ >
            <br></td>
  		</tr>
  		<tr>
  			<td width="15%">用户组织类型<br></td>
  			<td>
  			   <select id="industry" name="project.industry" style="width:220px">
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
  			<td width="10%">开发平台<br></td>
  			<td >
  			    <input type="text" name="project.devPlatform" style="width:220px" value=""/ >
            <br></td>
  		</tr>
  		<tr>
  			<td width="10%">集成开发环境<br></td>
  			<td >
  			    <input type="text" name="project.ide" style="width:220px" value=""/ >
            <br></td>
  		</tr>
  		<tr>
  			<td width="10%">主要编程语言<br></td>
  			<td >
  			 	<select name="project.devLang" style="width:220px">
  			 		<option value="==请选择编程语言类型==" selected>==请选择编程语言类型==</option>
  					<option value="C及其他同级别语言/平台">C及其他同级别语言/平台</option>
  					<option value="COBOL及其他同级别语言/平台">COBOL及其他同级别语言/平台</option>
  					<option value="JAVA，C++，C#及其他同级别语言/平台">JAVA，C++，C#及其他同级别语言/平台</option>
  				</select>
            <br></td>
  		</tr>
  		<tr>
  			<td width="10%">主要操作系统<br></td>
  			<td >
  			    <input type="text" name="project.os" style="width:220px" value=""/ >
            <br></td>
  		</tr>
  		<tr>
  			<td width="10%">主要数据库<br></td>
  			<td >
  			    <input type="text" name="project.database2" style="width:220px" value=""/ >
            <br></td>
  		</tr>
  		<tr>
  			<td width="10%">业务网点<br></td>
  			<td >
  			    <input type="text" name="project.businessOutlet" style="width:220px" value=""/ >
  			    业务网点数目是指最终系统部署的地区数量。
            <br></td>
  		</tr>
  		<tr>
  			<td width="10%">业务单元<br></td>
  			<td >
  			    <input type="text" name="project.businessUnit" style="width:220px" value=""/ >
  			    业务单元数目即典型用户类型数目或业务部门数目。
            <br></td>
  		</tr>
  		<tr>
  			<td width="15%">生命周期模型类型</td>
  			<td>
  				<select name="project.projectSLCModel" style="width:220px" >
  					<option value="==请选择生命周期模型类型==" selected>==请选择生命周期模型类型==</option>
  					<option value="瀑布模型">瀑布模型</option>
  					<option value="迭代模型">迭代模型</option>
  					<option value="增量模型">增量模型</option>
  				</select>  			
            </td>
  		</tr>
  		<tr>
  			<td width="15%">选用估算方法<br></td>
  			<td >
  			 	<select id="methodType" name="project.methodType" style="width:220px" >
  			 	    <option value="==请选择估算方法==" selected>==请选择估算方法==</option>
  					<option title="只需识别数据功能个数，最简单" value="预估功能点计数">预估功能点计数</option>
  					<option title="需识别数据功能和事务功能个数，次简单" value="估计功能点计数">估计功能点计数</option>
  					<option title="识别数据功能和事务功能过程复杂，最完整" value="详细功能点计数">详细功能点计数</option>
  				</select>
  				<b style="font-family:verdana;color:red">*</b>
            <br></td>
  		</tr>
  	    <tr>
  			<td>开发开始时间<br></td>
  			<td>
           		<input type="text" id="startDate" name="project.startDate" style="width:220px" onfocus="HS_setDate(this)"/>
            <br></td>
  		</tr>
  		<tr>
  			<td>开发结束时间<br></td>
  			<td>
  				<input type="text" id="endDate" name="project.endDate" style="width:220px" onfocus="HS_setDate(this)"/>
  			<br></td>
  	    </tr>
  		<tr>
  		    <td>
  				<input type="submit" name="submit" value=" 新  增 "/>
  			<br></td>
  			<td><input type="reset" name="reset" value=" 清  除 "/>
  			<br></td>
  		</tr>
  		</table>
  			<input type="hidden" name="userId" value="<s:property value="#session.userId"/>" />
  		</form>
  		<iframe name="countSessionFrame"  width="100%" height="800" frameborder="0" marginwidth="0" scrolling="no"></iframe>
</body>
</html>

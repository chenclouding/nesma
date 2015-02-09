<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<%@ page import="bean.FunctionModule" %>
<%@ include file="/nesma/checkUser.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>增加模块-显示功能模块列表</title>
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
		formObject =document.getElementById(formId)
		if (formObject.style.display == 'none') {
			formObject.style.display = '';
		}
		else {
			formObject.style.display = 'none';
		}
	}
	
    function verifyInput()
	{			    	   
			if(isEmpty(document.getElementById("name").value)) 
			{	
			    alert("请填写模块名称！");
			    document.getElementById("name").focus();
				return false;
			}	
			
	}
    function confirmdel(){
    	return confirm("确定删除？");
    }
    </script> 
  </head>
  <body> 	
  <h1>功能模块</h1>
   	<table id="functionTable">
       <tr>
         <td>序号</td> 
         <td>名称</td>
         <td>功能模块类型</td>
         <td>修改</td>
         <td>删除</td>
         <td>下一步</td>
       </tr>
       		<%    int i = 1;  %>
       
	         <s:if test="message"><h1 style="color:red">尚未进行系统分解！</h1></s:if>
	         <s:iterator value="functionModules">
	         <tr>
	          	<td><%= i ++ %></td>
	         	<td><s:property value="name"/></td>
	         	<td><s:property value="type"/></td>
		        <td class = editimg>
		          	  <a href="/nesma/nesma/FunctionModule!edit.action?functionModule.id=<s:property value="id"/>">
		          	  	<IMG src="/nesma/images/btnedit.gif" alt="点击修改" border="0" />
		          	  </a>
		          </td>
		          <td class = delimg>
		              <a href="/nesma/nesma/indicativeFPC/FunctionModule!del.action?functionModule.id=<s:property value="id"/>&project.id=<s:property value="project.id"/>" onclick="return confirmdel()">
		              	<img src="/nesma/images/btndel.gif" alt="点击删除" width="15" height="12" border="0" />
		              </a>
		          </td>	
		           <td class = delimg>
		           	<s:if test="%{type=='组合模块'}"> 	
		           		<a href="/nesma/nesma/FunctionModule!list.action?father.id=<s:property value="id"/> ">划分子功能模块</a>
		           	</s:if>
		           	<s:else>
		           		
		           	</s:else>
		           	
		             
		          </td>	          
	         </tr>  
	         </s:iterator>
    </table>
      
    <form  action="FunctionModule!add.action" name="functionForm" id ="function" method="post"  onsubmit="return verifyInput();">
  	<table>
  		<tr>
  			<td width="15%">模块名称<br></td>
  			<td >
  			    <input type="text" id="name" name="functionModule.name" style="width:160px" value=""/ >
  			    <b style="font-family:verdana;color:red">*</b>
            <br></td>
  		</tr>
  		<tr>
  			<td width="10%">模块描述<br></td>
  			<td >
  			    <textarea name="functionModule.description"></textarea>
            <br></td>
  		</tr>
  	
  		<tr>
  			<td width="15%">模块类型<br></td>
  			<td>
  			 	<select name="functionModule.type" style="width:160px">
  				  	<option title="子模块只能添加功能模块" value="组合模块">组合模块</option>
  					<option title="子模块只能添加基本流程" value="原子模块" selected>原子模块</option>
  				<select>
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
  	<input type="hidden" name="project.id" value="<s:property value="project.id"/>"/>
  	<input type="hidden" name="father.id" value="<s:property value="father.id"/>"/>
  	</form> 	
  	 </body>
</html>

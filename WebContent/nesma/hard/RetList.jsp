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
    
    <title>My JSP 'RetList.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="/nesma/images/screen.css">
	<script language="JavaScript" src="/nesma/javascript/verify.js"></script>
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
	
	function confirmdel(){
    	return confirm("确定删除？");
    }
    
    function verifyInput(){
    	var re = /^[0-9]+[0-9]*]*$/;
		if(isEmpty(document.getElementById("name").value)) 
		{
			alert("请填写记录元素类型（RET）的名称！");
			document.getElementById("name").focus();
			return false;
		}
		
		if(isEmpty(document.getElementById("det").value)) 
		{
			alert("请填写RET包含的数据元素类型（DET）个数！");
			document.getElementById("det").focus();
			return false;
		}	  
	    if (!re.test(document.getElementById("det").value))  
	   {  
        	alert("RET包含的数据元素类型（DET）个数必须为0或正整数！");  
        	document.getElementById("det").focus();  
	        return false;  
	   } 				
    }
    </script>
	

  </head>
  
  <body>
  <div>
    <a onclick="expandIt('help'); return false" href="#"><h1>什么是记录元素类型？</h1></a>
    <table id="help" style="display:none;">
    <tr>
    <td>
  	<p style="color:red">什么是记录元素类型（RET）？</p>
  <p>记录元素类型（Record Element Type, RET）,一组逻辑上相关联的DET的集合。</p>
  <p>数据元素类型（Data Element Type, DET）,在系统内被使用或者维护的属性。</p>
  <p style="color:red">如何识别记录元素类型（RET）？</p>
  <p><a href="/nesma/nesma/help/DET.jsp">(1)识别数据元素类型（DET）</a></p>
  <p>依次判断已识别的ILF/EIF中的每一个字段。</p> 
  <p>(2)识别记录元素类型（RET）</p>
   <p>依次判断已识别的ILF/EIF。</p> 
   <p>*若一个ILF/EIF可以分为若干个数据子集，每个子集识别为一个RET（比如员工管理系统中的员工信息（ILF）可分为三个数据子集：员工基本信息、受教育背景、工作经历，即3个RET）；</p> 
   <p>*若一个ILF/EIF不存在数据子集，则该ILF/EIF识别为一个RET（比如员工管理系统中的工资信息（EIF）不包含任何数据子集，即1个RET）。</p> 
    </td>
  	</tr>
  </table>
   </div>
   
    <div align="left"> 
    </div><h1 title="RET:记录元素类型。。一组逻辑上相关联的DET的集合"> RET（记录元素类型）列表</h1>
    <table>
       <tr>
         <td>序号</td> 
         <td>名称</td>
         <td title="DET:数据元素类型。在系统内被使用或者维护的属性">包含DET个数</td>
         <td>修改</td>
         <td>删除</td>
       </tr>
      		 <%
              int i = 1; 
              /*若无项目信息，提示添加；若有软件信息，列出估算软件列表*/
      		 %>  
       
	         <s:if test="message"><h1 style="color:red">请添加记录元素类型！</h1></s:if>
	         <s:iterator value="rets">
	         <tr>
	          	<td><%= i ++ %></td>
	         	<td><s:property value="name"/></td>
	         	<td><s:property value="det"/></td> 
	         
		      <td class = editimg>
		          <a href="/nesma/nesma/hard/RetH!edit.action?ret.id=<s:property value="id"/>">
		          	 <IMG src="/nesma/images/btnedit.gif" alt="点击修改" border="0" />
		          </a>
		      </td>
		      <td class = delimg>
		          <a href="/nesma/nesma/hard/RetH!del.action?ret.id=<s:property value="id"/>&dataFunction.id=<s:property value="dataFunction.id"/>" onclick="return confirmdel()">
		             <img src="/nesma/images/btndel.gif" alt="点击删除" width="15" height="12" border="0" />
		          </a>
		      </td>
	         </tr>  
	         </s:iterator>
    </table>
  
  
  
   <form  action="RetH!add.action" name="dfForm" id="dfForm" method="post" onSubmit="return verifyInput();">
  	<table>
  		<tr>
  			<td title="RET:记录元素类型。。一组逻辑上相关联的DET的集合" width="15%">RET的名称</td>
  			<td >
  			    <input type="text" id="name" name="ret.name" style="width:160px" value=""/ >
  			    <b style="font-family:verdana;color:red">*</b>
            </td>
  		</tr>
  		<tr>
  			<td width="10%">RET的描述</td>
  			<td >
  			    <textarea name="ret.description"></textarea>
            </td>
  		</tr>
  		<tr>
  			<td title=
"RET:记录元素类型。。一组逻辑上相关联的DET的集合
DET:数据元素类型。在系统内被使用或者维护的属性" width="10%">RET包含的DET个数</td>
  			<td >
  			   <input type="text" id="det" name="ret.det" style="width:160px" value=""/ >
  			    <b style="font-family:verdana;color:red">*</b>
            </td>
  		</tr>
  		<tr>
  		    <td>
  				<input type="submit" name="submit" value=" 增  加 "/>
  			</td>
  			<td>
  				<input type="reset" name="reset" value=" 清  除 "/>
  			</td>
  		</tr>
  	</table>
  	<input type="hidden" name="dataFunction.id" value="<s:property value="dataFunction.id"/>"/>
  	</form> 		
  </body>
</html>

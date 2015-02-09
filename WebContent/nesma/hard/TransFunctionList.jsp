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
    <title>增加基本流程</title>
    
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
    	if(isEmpty(document.getElementById("name").value)) 
		{
			alert("请填写基本处理名称！");
			document.getElementById("name").focus();
			return false;
		}
    }
	</script>
  </head>
  
  <body>   
<div>
    <a onclick="expandIt('help'); return false" href="#"><h1>什么是事务功能？</h1></a>
    <table id="help" style="display:none;">
    	<tr>
    	<td>
  	<p style="color:red">什么是事务功能？</p>
  	<p>事务功能分为三种：</p>
  	<p>外部输入（External Input, EI）：在这个基本处理中，数据或控制信息穿过系统边界输入系统。数据维护了至少一个ILF，控制信息触发或者禁用了系统中某个事务。</p>
  	<p>外部输出（External Output, EO）：输出的报表或者列表数据穿过系统边界，并且数据个数确定或者需要进一步的数据处理。</p>
  	<p>外部查询（External Inquiry, EQ）：用户可识别的输入、输出组合，输出的数据个数确定,并且不需要进一步的数据处理。</p>
  	<p style="color:red">如何识别事务功能？</p>
  	<p>1、候选事务功能来源？</p>
  	<p>所有对数据文件进行处理的过程</p>
  	<p>————————————请将识别结果填入系统中！命名规范：动词+名词————————————</p>
  	<p><a href="/nesma/nesma/help/step2.jsp">2、如何判定事务功能(EI/EO/EQ)？</a></p>
  	
  	<p>3、如何判定EI中包含的DET、FTR？</p>
  	
  	<p>
  	<a onclick="expandIt('help1'); return false" href="#">(1)如何判定EI中包含的DET？</a>
  	<table id="help1" style="display:none;">
  	<tr>
    	<td>
  	<p style="font-size:14px;">*EI操作中，用户识别的、通过应用系统边界输入的非重复每一个字段，各记为一个DET。</p>
  	<p style="font-size:14px;">*EI操作中，系统提示的每一个错误信息或完成的操作信息，各记为一个DET。</p>
  	  	</td>
  	</tr>
  	</table>
  	</p>
  	
  	<p>
  	<a onclick="expandIt('help2'); return false" href="#">(2)如何判定EI中包含的FTR？</a>
  	<table id="help2" style="display:none;">
  	<tr>
    	<td>
  	<p style="font-size:14px;">*在EI操作中，它所维护的每一个ILF算作一个FTR。</p>
	<p style="font-size:14px;">*在EI操作中，通过EI读取的每个ILF/EIF算作一个FTR。</p>
	<p style="font-size:14px;">*既被EI维护又被读取的ILF仅算作一个FTR。</p>
  	  	</td>
  	</tr>
	</table>
	</p>
	
  	<p>4、如何判定EQ/EO中包含的DET、FTR？</a></p>
  	<p>
  	<a onclick="expandIt('help3'); return false" href="#">(1)如何判定EQ/EO中包含的DET？</a>
  	<table id="help3" style="display:none;">
   	<tr>
    	<td>
  	<p style="font-size:14px;">*用户角度识别的、通过应用系统边界输入系统的非重复每一个字段，各记为一个DET。<p>
  	<p style="font-size:14px;">*用户角度识别的，进入应用边界并指明处理什么、何时处理或处理方式，由EO/EQ返回产生的每个字段算作一个DET。比如：备注、编号等。<p>
  	<p style="font-size:14px;">*在EQ/EO操作中，对系统进行输入或读取操作时，相同字段只计为一个DET。</p>
  	<p style="font-size:14px;">*在EQ/EO操作中，系统提示的每一个错误信息或完成的操作信息，各记为一个DET。</p>
  	<p style="font-size:14px;">*在EQ/EO操作中，未经过系统边界输入的字段、页面标题、系统字段生成的记号（如：页码）不记为一个DET。</p>
  	  	</td>
  	</tr>
  	</table>
  	</p>
  	
  	<p>
  	<a onclick="expandIt('help4'); return false" href="#">(2)如何判定EQ/EO中包含的FTR？</a>
  	<table id="help4" style="display:none;">
   	<tr>
    	<td> 	
  	<p style="font-size:14px;">*在EQ/EO操作中，读取的每一个ILF/EIF算作一个FTR。</p>
	<p style="font-size:14px;">*对于EO操作，它所维护的每一个ILF算作一个FTR。</p>
	<p style="font-size:14px;">*对于EO操作，既被EO维护又被读取的ILF仅算作一个FTR。</p>
	  	  	</td>
  	</tr>
	</table>
	</p>
	
  	</td>
  	</tr>
  	</table>
  </div>
       <h1> 事务功能列表</h1>
      <table>
       <tr>
         <td>序号</td> 
         <td>名称</td>
         <td>功能点个数</td>
         <td>事务功能类型</td>
         <td>修改</td>
         <td>删除</td>
       </tr>
       <%
              int i = 1; 
              /*若无项目信息，提示添加；若有软件信息，列出估算软件列表*/
      		 %>  
       
	    <s:if test="message"><h1 style="color:red">请添加事务功能！</h1></s:if>
	    <s:iterator value="transFunctions">
	      	 <tr>
	         <td><%= i ++ %></td>
	         <td><s:property value="name"/></td>
	         <td><s:property value="ufpc"/></td>
	          <td title=
"EI:数据或者控制信息从应用边界外部进入应用内部的基本过程。
EO:输出的数据穿过系统应用边界，并且大小确定或者需要进一步的数据处理。
EQ:用户可识别的输入、输出组合，输出的大小确定不需要进一步的数据处理。"><s:property value="type"/></td>
	         
		      <td class = editimg>
		          <a href="/nesma/nesma/hard/TransFunctionH!edit.action?transFunction.id=<s:property value="id"/>">
		          	 <IMG src="/nesma/images/btnedit.gif" alt="点击修改" border="0" />
		          </a>
		      </td>
		      <td class = delimg>
		          <a href="/nesma/nesma/hard/TransFunctionH!del.action?transFunction.id=<s:property value="id"/>&functionModule.id=<s:property value="functionModule.id"/>" onclick="return confirmdel()">
		             <img src="/nesma/images/btndel.gif" alt="点击删除" width="15" height="12" border="0" />
		          </a>
		      </td>
	         </tr>  
         </s:iterator>
       </table>
       
     <h1>新增事务功能（基本处理）</h1>    
     <form  action ="TransFunctionH!add.action" name="epForm" method="post" onSubmit="return verifyInput();">
  	 <table>
  		<tr>
  			<td width="15%">基本处理名称</td>
  			<td >
  			    <input type="text" id="name" name="transFunction.name" style="width:160px" value=""/>
  			    <b style="font-family:verdana;color:red">*</b> 
            </td>
  		</tr>
  		<tr>
  		<!--
  			<td> 
  	    		<s:radio  label="基本处理类型" name="transFunction.type" value="'EI'" list="#{
  	    		'EI':'EI(外部输入)','EO':'EO(外部输出)','EQ':'EQ(外部查询)'
  	    		}"></s:radio>
  		   </td> 
  		   -->
  		  	<td width="10%">基本处理类型</td>
  	    	<td>  	    		
  				<input title="数据或者控制信息从应用边界外部进入应用内部的基本过程。" name="transFunction.type" type="radio" value="EI" checked="checked"/>EI(外部输入)
  				<input title="输出的数据穿过系统应用边界，并且大小确定或者需要进一步的数据处理。" name="transFunction.type" type="radio" value="EO" />EO(外部输出)
  				<input title="用户可识别的输入、输出组合，输出的大小确定不需要进一步的数据处理。" name="transFunction.type" type="radio" value="EQ" />EQ(外部查询)
  		   </td> 
  		</tr>
  		<tr>
  			<td width="10%">基本处理描述</td>
  			<td >
  			    <textarea name="transFunction.description"></textarea>
            </td>
  		</tr>
  		<tr>
  			<td title="FTR:引用文件类型。事务处理过程中引用的文件。" width="15%">FTR的个数</td>
  			<td >
  			    <input type="text" name="transFunction.ftr" style="width:160px" value=""/>
            </td>
  		</tr>
  		<tr>
  			<td title="数据元素类型。在系统内被使用或者维护的属性。" width="15%">DET的个数</td>
  			<td >
  			    <input type="text" name="transFunction.det" style="width:160px" value=""/>
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
     <input type="hidden" name="countSession.id" value="<s:property value="#session.countSessionId"/>"/>
    <input type="hidden" name="functionModule.id" value="<s:property value="functionModule.id"/>"/>
   </form> 
  </body>
</html>

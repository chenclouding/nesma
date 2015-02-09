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
    
    <title>添加数据功能</title>
    
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
			alert("请填写数据文件名！");
			document.getElementById("name").focus();
			return false;
		}
    }
    </script>

  </head>
  
  <body>
  <div>
    <a onclick="expandIt('help'); return false" href="#"><h1>什么是数据功能？</h1></a>
    <table id="help" style="display:none;">
    	<tr>
    	<td>
  	<p style="color:red">什么是数据功能？</p>
  	<p>数据功能分为两类：</p>
  	<p>内部逻辑文件（Internal Logical File,ILF）：一组逻辑上相关联的、被持久保存的数据，由待估算系统使用和维护。</p>
  	<p>外部接口文件（External interface File,EIF）：一组逻辑上相关联的、被持久保存的数据，由其他系统维护，但被当前待估算系统使用。</p>
  	<p style="color:red">如何识别数据功能？</p>
  	<p>(1)候选数据功能来源</p>
  	<p>审查用户需求说明书，标出描述系统功能的对象类的名词或名词短语，如用户、订单等，即为用户信息文件、订单信息文件,
  	并且这些信息被永久存储。如用户、订单等，即为用户信息文件、订单信息文件。</p>
  	<p>注：数据功能与系统概念数据模型中的实体对应</p>  	
  	<p style="color:red">————————————请将识别结果填入系统中！命名规范：XXX文件————————————</p>
  	<p><a href="/nesma/nesma/help/step1.jsp">(2)判定数据功能</a></p>
  	<p>若候选数据功能的信息被系统维护或者引用，即系统中存在对该对象的数据处理操作且所有信息都作为一个整体被系统处理，则为数据功能。</p>
  	<p><a href="/nesma/nesma/help/step3.jsp">(3)区分ILF/EIF</a></p>
  	<p>若该对象由待估算系统维护，则为ILF；若仅由待估算系统引用而由其他系统维护，则为EIF。</p> 
  	<p>(4)判断是否重复识别</p>
  	<p>对于已经识别的ILF和EIF，查看是否与系统中已被识别出的文件重复。若已被识别的文件包含的信息与候选数据文件包含的信息相同，则说明两者重复。</p>
  	</td>
  	</tr>
  	</table>
  </div>
  
  <div align="left"> 
    </div><h1> 功能模块的数据功能列表</h1>
    <table>
       <tr>
         <td>序号</td> 
         <td>文件名</td>
         <td>功能点个数</td>
         <td>文件类型</td>
         <td>是否计入</td>
         <td>修改</td>
         <td>删除</td>
       </tr>
      		 <%
              int i = 1; 
              /*若无项目信息，提示添加；若有软件信息，列出估算软件列表*/
      		 %>  
       
	         <s:if test="message"><h1 style="color:red">请添加数据文件！</h1></s:if>
	         <s:iterator value="dataFunctions">
	         <tr>
	          	<td><%= i ++ %></td>
	         	<td><s:property value="name"/></td>
	         	<td><s:property value="ufpc"/></td> 
	         	<td ${type=="ILF" or type=="EIF" ? "title=
'ILF:一组逻辑上相关联的、被持久保存的数据，由待估算系统使用和维护。
EIF:一组逻辑上相关联的、被持久保存的数据，由其他系统维护，但被当前待估算系统使用。'" : ""}><s:property value="type"/></td> 
	         	<td><s:property value="isCounted"/></td> 
		      <td class = editimg>
		          <a href="/nesma/nesma/main/DataFunctionH!edit.action?dataFunction.id=<s:property value="id"/>">
		          	 <IMG src="/nesma/images/btnedit.gif" alt="点击修改" border="0" />
		          </a>
		      </td>
		      <td class = delimg>
		          <a href="/nesma/nesma/main/DataFunctionH!del.action?dataFunction.id=<s:property value="id"/>&functionModule.id=<s:property value="functionModule.id"/>" onclick="return confirmdel()">
		             <img src="/nesma/images/btndel.gif" alt="点击删除" width="15" height="12" border="0" />
		          </a>
		      </td>
	         </tr>  
	         </s:iterator>
    </table>
    
    
    <form  action="DataFunctionH!add.action" name="dfForm" id="dfForm" method="post" onSubmit="return verifyInput();">
  	<table>
  		<tr>
  			<td width="15%">数据文件名</td>
  			<td >
  			    <input type="text" id="name" name="dataFunction.name" style="width:160px" value=""/ >
  			    <b style="font-family:verdana;color:red">*</b>
            </td>
  		</tr>
  		<tr>
  			<td width="10%">数据文件描述</td>
  			<td >
  			    <textarea name="dataFunction.description"></textarea>
            </td>
  		</tr>
  		<tr>
  	    	<td width="10%">数据文件类型</td>
  	    	<td> 
  	    		<!--<s:radio label="数据文件类型" name="dataFunction.type" value="'ILF'" list="#{'ILF':'内部逻辑文件（ILF）','EIF':'外部接口文件（EIF）','未定文件类型':'未定文件类型'}"></s:radio>-->
  				<input title="一组逻辑上相关联的、被持久保存的数据，由待估算系统使用和维护。" name="dataFunction.type" type="radio" value="ILF" checked="checked"/>内部逻辑文件（ILF）
  				<input title="一组逻辑上相关联的、被持久保存的数据，由其他系统维护，但被当前待估算系统使用。" name="dataFunction.type" type="radio" value="EIF" />外部接口文件（EIF）
  				<input title="文件类型无法界定" name="dataFunction.type" type="radio" value="未定文件类型" />未定文件类型
  		   </td> 
  		</tr>
  		<tr>
  			<td> 
  	    		<s:radio  label="是否参与功能点计数" name="dataFunction.isCounted" value="'计入'" list="#{'计入':'计入','未定':'未定','不计入':'不计入'}"></s:radio>
  		   </td>  
  		</tr>
  		<tr>
  			<td width="10%">不计入原因</td>
  			<td >
  			    <textarea name="dataFunction.ignoreReason"></textarea>
            </td>
  		</tr>  		
  		<tr>
  			<td width="10%">吻合度</td>
  			<td> 
  	    		<!--<s:radio  label="吻合度" name="dataFunction.fitType" value="'高'" list="#{'高':'高','中':'中','低':'低'}"></s:radio>-->
				<input title="项目组有此类数据文件开发经验" name="dataFunction.fitType" type="radio" value="高" checked/>高
  				<input title="项目组有此类数据文件的部分开发经验" name="dataFunction.fitType" type="radio" value="中" />中
  				<input title="项目组没有此类数据文件开发经验" name="dataFunction.fitType" type="radio" value="低" />低		  
  		   </td> 
  		</tr>
  		
  		<tr>
  		    <td>
  				<input type="submit" name="submit" tip="这是一个按钮"  value=" 增  加 "/>
  			</td>
  			<td>
  				<input type="reset" name="reset" value=" 清  除 "/>
  			</td>
  		</tr>
  	</table>
  	<input type="hidden" name="countSession.id" value="<s:property value="#session.countSessionId"/>"/>
  	<input type="hidden" name="functionModule.id" value="<s:property value="functionModule.id"/>"/>
	<script language="JavaScript"> 	
	</script>
  	</form> 		
  </body>
</html>

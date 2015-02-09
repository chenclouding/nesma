<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<%@ include file="/nesma/checkUser.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>增加估算场景-显示场景列表</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  	<link rel="stylesheet" type="text/css" href="/nesma/images/screen.css">               
  	<script language="JavaScript" src="/nesma/javascript/verify.js"></script>
  	<script type="text/javascript" src="/nesma/javascript/calenderJS.js"></script>
	<script language="JavaScript"> 
	function expandIt(sessionForm) {
		formObject =document.getElementById(sessionForm)
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
			    alert("请填写估算场景名称！");
			    document.getElementById("name").focus();
				return false;
			}			
			var type = document.getElementsByName("copySession");  
			var copyValue;
            for(var i = 0; i < type.length; i ++){
            	if(type[i].checked == true) {
            		copyValue = i;
            		break;
            	}
            } 
			if(copyValue == 0&&frm.copySessionId.value==0)
			{
				alert("请选择复制源会话！")
				frm.copySessionId.focus();
				return false;
			}				
	}
    function confirmdel(){
    	return confirm("确定删除？");
    }
    </script> 
  </head>
  
  <body> 
    <h1>估算场景|<a onclick="expandIt('sessionForm'); return false" href="#" style="color:green"><新增估算场景></a></h1> 
   	<table> 
       <tr>
       	 <td>序号</td>
         <td>估算名称</td> 
         <td>未调整功能点个数</td> 
         <td>估算方法</td> 
         <td>修改</td> 
         <td>删除</td> 
         <td>下一步</td> 
       </tr> 
       	<%    int i = 1;  %>
       
	         <s:if test="message"><h1 style="color:red">尚未进行系统分解！</h1></s:if>
	         <s:iterator value="countSessions">
	         <tr>
	          	<td><%= i ++ %></td>
	         	<td><s:property value="name"/></td>
	         	<td><s:property value="ufpc"/></td>
	         	<td title=
"预估：只需识别数据功能个数，最简单；
估计：需识别数据功能和事务功能个数，次简单；
详细：识别数据功能和事务功能过程复杂，最完整"><s:property value="methodType"/></td>
	          	
		         <td class="editimg"> 
		          	  <a href="/nesma/nesma/main/CountSession!edit.action?countSession.id=<s:property value="id"/>"> 
		          	  	<img border="0" src="/nesma/images/btnedit.gif" alt="点击修改"> 
		          	  </a> 
		          </td> 
		          <td class="delimg"> 
		              <a href="/nesma/nesma/main/CountSession!del.action?countSession.id=<s:property value="id"/>&project.id=<s:property value="project.id"/>" onclick="return confirmdel()"> 
		              	<img height="12" border="0" width="15" src="/nesma/images/btndel.gif" alt="点击删除"> 
		              </a> 
		          </td> 
          
		           <td class = delimg>	
		               <a href="Javascript:parent.parent.location='CountSession!select.action?countSession.id=<s:property value="id"/>'">开始估算</a>	  	
		           </td>
	         </tr>   
	         </s:iterator>
    </table>
    
    <form action="CountSession!add.action" name="sessionForm" id="sessionForm" method="post" onsubmit="return verifyInput();" style="display:none;" > 
  	<table> 
  		<tr> 
  			<td width="15%">估算场景名称</td> 
  			<td> 
  			    <input type="text" id="name" name="countSession.name" style="width: 160px;" value=""> 
  			    <b style="font-family: verdana; color: red;">*</b> 
            </td> 
  		</tr>   		
  		<tr> 
  			<td width="10%">估算开始时间</td> 
  			<td> 
           		<input type="text" name="countSession.startTime" style="width: 160px;" onfocus="HS_setDate(this)"> 
            </td> 
  		</tr> 
  		<tr> 
  			<td>  
  				 <s:select label="软件生命周期阶段" id="lifecyclePhase" list="{
  			 	'项目定义阶段',
  			 	'需求分析阶段',
  			 	'设计阶段',
  			 	'编码阶段',
  			 	'测试阶段',
  			 	'维护阶段'
  			 	}" 
  			 	value="countSession.lifecyclePhase" headerValue="--请选择--" name="countSession.lifecyclePhase" style="width:220px"/>		
            
            </td> 
  		</tr> 
  	    <tr>
  	    <!-- 	    	
  	    	<td> 
  	    	<s:radio name="countSession.methodType" value="'预估型功能点计数'" list="#{'预估型功能点计数':'预估型功能点计数(估算过程最简单)','估计型功能点计数':'估计型功能点计数','详细型功能点计数':'详细型功能点计数（估算过程最复杂）'}" label="估算方法类型"></s:radio>
  		   </td> 
  		   -->
  		    <td width="10%">估算方法类型</td>
  	    	<td> 
  				<input title="只需识别数据功能个数，最简单" name="countSession.methodType" type="radio" value="预估型功能点计数" checked="checked"/>预估型功能点计数
  				<input title="需识别数据功能和事务功能个数，次简单" name="countSession.methodType" type="radio" value="估计型功能点计数" />估计型功能点计数
  				<input title="识别数据功能和事务功能过程复杂，最完整" name="countSession.methodType" type="radio" value="详细型功能点计数" />详细型功能点计数
  		   </td> 
  		</tr> 
  		<tr> 
  			<td width="10%">备注</td> 
  			<td> 
  			    <textarea name="countSession.description"></textarea> 
            </td> 
  		</tr> 
  		<tr> 
  		    <td> 
  				<input type="submit" name="submit" value=" 新  增 "> 
  			</td> 
  			<td> 
  				<input type="reset" name="reset" value=" 清  除 "> 
  			</td> 
  		</tr> 
  	</table> 
     <input type="hidden" name="project.id" value="<s:property value="project.id"/>"/>
  	</form>
  </body>
</html>

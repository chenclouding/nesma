<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %> 
<%@ include file="/nesma/checkUser.jsp"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'setIndustryValue.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="/nesma/images/screen.css">
  	<script language="JavaScript" src="/nesma/javascript/verify.js"></script>
  	<script language="JavaScript"> 	
	function verifyInput(){
		var applyAreaObj=document.getElementsByName("values1");
		var appTypeObj=document.getElementsByName("values2");
		var devLangObj=document.getElementsByName("values3");
		var teamExperienceObj=document.getElementsByName("values4");
		var i;

		/*判断业务领域调整因子合法性*/
		for(i=0;i<applyAreaObj.length;i++){
			if(isEmpty(applyAreaObj[i].value)) 
			{	
			    alert("请填写业务领域调整因子！");
			    applyAreaObj[i].focus();
				return false;
			}
			if(applyAreaObj[i].value<0 || isNaN(applyAreaObj[i].value)) 
			{	
			    alert("业务领域调整因子的值必须为数字且大于等于零！");
			    applyAreaObj[i].value="";
			    applyAreaObj[i].focus();
			}
		}
		
		/*判断应用类型调整因子合法性*/
		for(i=0;i<appTypeObj.length;i++){
			if(isEmpty(appTypeObj[i].value)) 
			{	
			    alert("请填写应用类型调整因子！");
			    appTypeObj[i].focus();
				return false;
			}
			if(appTypeObj[i].value<0 || isNaN(appTypeObj[i].value)) 
			{	
			    alert("应用类型调整因子的值必须为数字且大于等于零！");
			    appTypeObj[i].value="";
			    appTypeObj[i].focus();
				return false;
			}
		}
		
		/*判断开发语言调整因子合法性*/
		for(i=0;i<devLangObj.length;i++){
			if(isEmpty(devLangObj[i].value)) 
			{	
			    alert("请填写开发语言调整因子！");
			    devLangObj[i].focus();
				return false;
			}
			if(devLangObj[i].value<0 || isNaN(devLangObj[i].value)) 
			{	
			    alert("开发语言调整因子的值必须为数字且大于等于零！");
			    devLangObj[i].value="";
			    devLangObj[i].focus();
				return false;
			}
		}
		
		/*判断团队经验调整因子合法性*/
		for(i=0;i<teamExperienceObj.length;i++){
			if(isEmpty(teamExperienceObj[i].value)) 
			{	
			    alert("请填写团队经验调整因子！");
			    teamExperienceObj[i].focus();
				return false;
			}
			if(teamExperienceObj[i].value<0 || isNaN(teamExperienceObj[i].value)) 
			{	
			    alert("团队经验调整因子的值必须为数字且大于等于零！");
			    teamExperienceObj[i].value="";
			    teamExperienceObj[i].focus();
				return false;
			}
		}
	}
	</script>
  </head> 
  <body>
  	<s:form  action="AdjustFactor!edited" name="industryForm" method="post" onsubmit="return verifyInput()" validate="true">
     
      <table>
       <s:if test="message"><h1 style="color:red">设置成功！</h1></s:if>
        <tr>
          <td width="15%">调整因子名称</td>
          <td>
            <table>
              <tr>
                <td width="65%">因子类型</td>
                <td>调整因子</td>
              </tr>
            </table>
          </td>
        </tr>
        <tr>
   
          <td width="15%">业务领域调整因子</td>
          <td>
          	<table>
          	  <s:iterator value="applyAreaFactors">  			
  	  			<tr>
  				  <td width="65%"><s:property value="description"/></td>
  			      <td><input type="text" id="value1" name="values1" value="<s:property value="value"/>"/>
  			        <input type="hidden" name="applyAreaFactors.id" value="<s:property value="id"/>" />
  			      </td>
  			    </tr>
  	  		  </s:iterator>
          	</table>
          </td>
        </tr>
        <tr>
          <td width="15%">应用类型调整因子</td>
          <td>
          	<table>
          	  <s:iterator value="appTypeFactors">  	  			
  	  			<tr>
  				  <td width="65%"><s:property value="description"/></td>
  			      <td><input type="text" id="value2" name="values2" value="<s:property value="value"/>"/>
  			        <input type="hidden" name="appTypeFactors.id" value="<s:property value="id"/>" />
  			      </td>
  			    </tr>
  	  		  </s:iterator>
          	</table>
          </td>
        </tr>
        <tr>
          <td width="15%">开发语言调整因子</td>
          <td>
          	<table>
          	  <s:iterator value="devLangFactors">  	  			
  	  			<tr>
  				  <td width="65%"><s:property value="description"/></td>
  			      <td><input type="text" id="value3" name="values3" value="<s:property value="value"/>"/>
  			        <input type="hidden" name="devLangFactors.id" value="<s:property value="id"/>" />
  			      </td>
  			    </tr>
  	  		  </s:iterator>
          	</table>
          </td>
        </tr>
        <tr>
          <td width="15%">团队经验调整因子</td>
          <td>
          	<table>
          	  <s:iterator value="teamExperienceFactors">   			
  	  			<tr>
  				  <td width="65%"><s:property value="description"/></td>
  			      <td><input type="text" id="value4" name="values4" value="<s:property value="value"/>"/>
  			        <input type="hidden" name="teamExperienceFactors.id" value="<s:property value="id"/>" />
  			      </td>
  			    </tr>
  	  		  </s:iterator>
          	</table>
          </td>
        </tr>
      </table>
  	<input type="submit" name="submit" value=" 保 存 "/>
	</s:form>
  </body>
</html>

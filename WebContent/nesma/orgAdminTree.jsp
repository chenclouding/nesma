<%@ page contentType="text/html; charset=gb2312" language="java" %>
<html>
	<head>
		<title></title>
		<link rel="StyleSheet" href="../javascript/dtree.css" type="text/css" />
		<script type="text/javascript" src="../javascript/dtree.js"></script>
		<style>
body{
	font-family: "����"; 
	font-size: 12px; 
	font-weight: normal;}
a{
	font-family: "����"; 
	font-size: 12px; 
	color: #000000; 
	font-weight: normal; 
}
</style>
	</head>
	<body bgcolor="#e7f3f8">
	<%String projectId = "";
	projectId =  (String)session.getAttribute("projectId");
	
	String productId = (String)request.getAttribute("productId");  %>
		<div class="dtree">
			<script type="text/javascript">

		d = new dTree('d');
        d.add(0,-1,'��֯������Ա');
        
        d.add(10,0,'������֯���û�','/nesma/nesma/user/User!list.action');        
        d.add(20,0,'�޸���֯��Ϣ','/nesma/nesma/user/Organization!edit.action');  
              
	    d.add(30,0,'������֯��������','/nesma/nesma/user/AdjustFactor!list.action');
	    d.add(40,0,'������֯��������','/nesma/nesma/user/AdjustParam!list.action');
	   	   
        d.add(50,0,'��������','/nesma/nesma/user/resetPasswd.jsp');
	    
	    d.config.target = "contentFrame";
		document.write(d);		
	</script>
		</div>
		

	</body>

</html>

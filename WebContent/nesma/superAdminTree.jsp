<%@ page contentType="text/html; charset=gb2312" language="java" %>
<html>
	<head>
		<title></title>
		<link rel="StyleSheet" href="../javascript/dtree.css" type="text/css" />
		<script type="text/javascript" src="../javascript/dtree.js"></script>
		<style>
body{
	font-family: "宋体"; 
	font-size: 12px; 
	font-weight: normal;}
a{
	font-family: "宋体"; 
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
        d.add(0,-1,'系统管理员');
        
        d.add(10,0,'管理组织','/nesma/nesma/user/Organization!list.action');   
	    d.add(30,0,'设置调整因子','/nesma/nesma/user/AdjustFactor!list.action');
	    d.add(40,0,'设置行业参数','/nesma/nesma/user/AdjustParam!list.action');
       
	    d.config.target = "contentFrame";
		document.write(d);		
	</script>
		</div>
		

	</body>

</html>

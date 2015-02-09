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
	//Variables used for FSM
	String productId = (String)request.getAttribute("productId");  %>
		<div class="dtree">
			<script type="text/javascript">

		d = new dTree('d');
        d.add(0,-1,'基于快速功能点的成本估算工具');
	    d.add(1,0,'我的估算项目','main/Project!list.action');
	    d.add(2,0,'分解系统功能','main/Project!select1.action');
	    d.add(3,0,'设定估算场景','main/Project!select2.action');    
	    
	    d.config.target = "contentFrame";
		document.write(d);		
	</script>
		</div>
		

	</body>

</html>

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
		<div class="dtree">
			<script type="text/javascript">
		d = new dTree('d');
        d.add(0,-1,'软件成本估算');
		d.add(1,0,'功能点规模估算（预估）');			
			d.add(4,1,'记录数据功能','DataFunctionE!selectForDf.action');			
			
			d.add(6,1,'计算规模估算结果','easy/FpcE!input.action');	
			d.add(7,1,'功能点转换','easy/Convert!convert.action');	
	    d.add(20,0,'设置参数');
			d.add(21,20,'设置调整因子','easy/SetAdjust!list.action');	
		d.add(30,0,'软件成本估算');
			d.add(31,30,'软件成本估算结果','easy/FpcE!inputFit.action');	
	    
	    d.config.target = "contentFrame";
		document.write(d);		
	</script>
		</div>
		<p>
			<a href="javascript: d.openAll();">展开目录</a> | <a href="javascript: d.closeAll();">收起目录</a>
		</p>

	</body>

</html>

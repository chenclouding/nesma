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
	//Variables used for FSM
	String productId = (String)request.getAttribute("productId");  %>
		<div class="dtree">
			<script type="text/javascript">
		d = new dTree('d');
        d.add(0,-1,'����ɱ�����');
		d.add(1,0,'���ܵ��ģ���㣨���ƣ�','estimatedFPC/viewEstimateTree.jsp');
			d.add(3,1,'��¼���ݹ���','DataFunctionM!selectForDf.action');	
			d.add(4,1,'��¼������','TransFunctionM!selectForTf.action');		
			d.add(6,1,'�����ģ������','medium/FpcM!input.action');				
		d.add(20,0,'���ò���');
			d.add(21,20,'���õ�������','medium/SetAdjust!list.action');
		
		d.add(30,0,'����ɱ�����');
			d.add(31,30,'����ɱ�������','medium/FpcM!inputFit.action');
	    d.config.target = "contentFrame";
		document.write(d);		
	</script>    
		</div>
		<p>
			<a href="javascript: d.openAll();">չ��Ŀ¼</a> | <a href="javascript: d.closeAll();">����Ŀ¼</a>
		</p>

	</body>

</html>

<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'step1.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="/nesma/images/screen.css">
  	<script type="text/javascript" src="javascript/jquery-1.4.4.min.js" ></script>
	<script type="text/javascript" >
	
		var problems = new Array() ;
		var next_problem = new Array() ;
		var pre_problem = new Array() ;
		var problem_num = 2 ;
		var cur_problem ;
		
		$(document).ready(function() {
			problems[1] = {
				text : " 1、	需求说明书给出的数据模型的所有实体中，是否存在FPA表（包含数据均为常量或者解码信息等的实体型。如元素周期表、顾客（ID,顾客缩写名，全名））？ " ,
				a : "A、有，所有这类实体都在待估算系统中被维护。" ,
				b : "B、	有，所有这类实体都被待估算系统引用，但在其他系统中被维护。" ,
				c : "C、有，部分这类实体在待估算系统中被维护，部分在其它系统在被维护。" ,
				d : "D、无。" ,
				ans : "" ,
				judge : ""
			} ;
			problems[2] = {
				text : " 2、	对于已识别的逻辑文件，如何区分ILF和EIF？ " ,
				a : "A、在待估算系统内部被维护" ,
				b : "B、被待估算系统使用，但在其它系统内被维护" ,
				c : "" ,
				d : "" ,
				ans : "" ,
				judge : ""
			} ;
			cur_problem = 1 ;
			
			var i ;
			for ( i = 1 ; i <= problem_num ; i ++ ) {
				pre_problem[i] = -1 ;
				next_problem[i] = -1 ;
			}
			
			load_problem() ;
		}) ;
		
		function load_problem() {
		
			var list = $(".my_radio") , i ;
			list.show() ;
			for ( i = 0 ; i < list.length ; i ++ ) {
				list[i].checked = false ;
			}
			
			$("#problem_text").text(problems[cur_problem].text) ;
			// a 
			if ( problems[cur_problem].a == "" ) {
				$("#option_a").hide() ;
				$("#option_a_text").hide() ;
			} else {
				$("#option_a_text").text(problems[cur_problem].a) ;
			}
			// b
			if ( problems[cur_problem].b == "" ) {
				$("#option_b").hide() ;
				$("#option_b_text").hide() ;
			} else {
				$("#option_b_text").text(problems[cur_problem].b) ;
			}
			// c
			if ( problems[cur_problem].c == "" ) {
				$("#option_c").hide() ;
				$("#option_c_text").hide() ;
			} else {
				$("#option_c_text").text(problems[cur_problem].c) ;
			}
			// d
			if ( problems[cur_problem].d == "" ) {
				$("#option_d").hide() ;
				$("#option_d_text").hide() ;
			} else {
				$("#option_d_text").text(problems[cur_problem].d) ;
			}
			// for judge
			$("#problem_judge").text( problems[cur_problem].judge ) ;
			// for ans
			if ( problems[cur_problem].ans != "" ) {
				var select_str = "#option_" + problems[cur_problem].ans ;
				$(select_str)[0].checked = true ;
			}
		}
		
		function go_next_problem() {
			if ( next_problem[cur_problem] != -1 ) {
				cur_problem = next_problem[cur_problem] ;
				load_problem() ;
			}
			else{
				if(confirm("本数据功能判断结束，请将对应ILF/EIF记录到系统中。是否判断下一数据功能？")){
					cur_problem = 2;
					var j ;
					for(j = 1 ; j <= problem_num ; j ++ ){
						problems[j].ans="";
					}
					load_problem();
				}
				else
					alert("点击返回并进入判断是否重复识别步骤");
			}
		}
		
		function go_pre_problem() {
			if ( pre_problem[cur_problem] != -1 ) {
				cur_problem = pre_problem[cur_problem] ;
				load_problem() ;
			}
		}
		
		function go_back(){
		    history.back();
		}
		
		function submit_answer() {
			// common part
			if ( $("#option_a")[0].checked == true ) {
				problems[cur_problem].ans = "a" ;
			}
			if ( $("#option_b")[0].checked == true ) {
				problems[cur_problem].ans = "b" ;
			}
			if ( $("#option_c")[0].checked == true ) {
				problems[cur_problem].ans = "c" ;
			}
			if ( $("#option_d")[0].checked == true ) {
				problems[cur_problem].ans = "d" ;
			}
			// differene part
			if ( cur_problem == 1 ) {
				next_problem[1] = 2 ;
				pre_problem[2] = 1 ;
				if ( $("#option_a")[0].checked == true ) {
					problems[cur_problem].judge = "存在1个内部逻辑文件（ILF）。注意：请将结果记录到系统中！" ;
					load_problem() ;	
				} else if( $("#option_b")[0].checked == true ){
					problems[cur_problem].judge = "存在1个外部接口文件（EIF）。注意：请将结果记录到系统中！" ;
					load_problem() ;
				} else if( $("#option_c")[0].checked == true ){
					problems[cur_problem].judge = "存在1个内部逻辑文件（ILF）和外部接口文件（EIF）。注意：请将结果记录到系统中！" ;
					load_problem() ;
				} else if( $("#option_d")[0].checked == true ){
				    problems[cur_problem].judge = "不存在内部逻辑文件（ILF）或外部接口文件（EIF）";
				    load_problem() ;
				} else
					alert("您尚未选择任何选项！");
			}
			if ( cur_problem == 2 ){
				if ( $("#option_a")[0].checked == true ){
			        problems[cur_problem].judge = "本数据功能为内部逻辑文件（ILF），提示将结果填入系统中。";
					load_problem() ;
				} else if( $("#option_b")[0].checked == true ){
					problems[cur_problem].judge = "本数据功能为外部接口文件（EIF），提示将结果填入系统中。";	
					load_problem() ;
				} else
					alert("您尚未选择任何选项！");
			}
		}
		
		</script>
		
		<style type="text/css">
        p.one
		{
			border:thick solid #e7f3f8;
			outline-style:dotted;
			outline-color:#e7f3f8;
		}
		
		p.two
		{
		    /*background-color: #e7f3f8; padding: 10px;*/
		}
		</style>
  </head>
	
	<body >
	    <p class="one">
		<form name="problem" >
			<span id="problem_text"></span><br>
			<input type="radio" id="option_a" name="problem" class="my_radio"><span id="option_a_text" class="my_radio"></span><br>
			<input type="radio" id="option_b" name="problem" class="my_radio"><span id="option_b_text" class="my_radio"></span><br>
			<input type="radio" id="option_c" name="problem" class="my_radio"><span id="option_c_text" class="my_radio"></span><br>
			<input type="radio" id="option_d" name="problem" class="my_radio"><span id="option_d_text" class="my_radio"></span>
		</form>
	   </p>
		<br>
		<button onclick="submit_answer()" id="problem_submit">确定</button><br><br>
		<b><span id="problem_judge"></span></b><br><br>
		
	    <p class="two">
		<button onclick="go_next_problem()" id="next_button"> 下一题 </button>&nbsp&nbsp &nbsp&nbsp&nbsp&nbsp  &nbsp&nbsp&nbsp&nbsp
		<button onclick="go_pre_problem()" id="pre_problem"> 上一题 </button>&nbsp&nbsp  &nbsp&nbsp&nbsp&nbsp  &nbsp&nbsp&nbsp&nbsp
		<button onclick="go_back()"  id="back"> 返回 </button>
		</p>
	</body>
	
</html>

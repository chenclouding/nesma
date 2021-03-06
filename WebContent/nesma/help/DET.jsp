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
		var problem_num = 3 ;
		var cur_problem ;
		
		$(document).ready(function() {
			problems[1] = {
				text : " 1、	本字段是否通过基本流程处理ILF/EIF即可获得？ " ,
				a : "A、是" ,
				b : "B、否" ,
				c : "" ,
				d : "" ,
				ans : "" ,
				judge : ""
			} ;
			problems[2] = {
				text : " 2、	本字段是否已识别过 ？" ,
				a : "A、	是" ,
				b : "B、否" ,
				c : "",
				d : "" ,
				ans : "" ,
				judge : ""
			} ;
			problems[3] = {
				text : " 3、本字段是否作为对其他数据功能的联系而存在？ " ,
				a : "A、是" ,
				b : "B、否" ,
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
					if(confirm("本字段判断结束，是否判断下一字段？")){
						cur_problem = 1;
						var j ;
						for(j = 1 ; j <= problem_num ; j ++ ){
							problems[j].ans="";
						}
						load_problem();
					}
					else
						alert("请将判断结果记录到系统中,点击返回并进入判断记录元素步骤");
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
			    if ( $("#option_b")[0].checked == true ) {
					problems[cur_problem].judge = "本字段不是一个数据元素类型！" ;
					next_problem[1]=-1;
					load_problem() ;
				}
				else if( $("#option_a")[0].checked == true ){
				    problems[cur_problem].judge = "请回答下一题！" ;
				    next_problem[1]=2;
					pre_problem[2]=1;
					load_problem() ;
				}
				else
					alert("您尚未选择任何选项！");
				
			}
			if ( cur_problem == 2 ) {
				if ( $("#option_a")[0].checked == true ) {
					problems[cur_problem].judge = "请回答下一题" ;
					next_problem[2]=3;
					pre_problem[3]=2;	
					load_problem() ;
			   }
			   else if ( $("#option_b")[0].checked == true ){
				    problems[cur_problem].judge = "本字段计为一个数据元素类型" ;
				    next_problem[2]=-1;	
				    load_problem() ;
			   }else
				   alert("您尚未选择任何选项！");
			}
			if ( cur_problem == 3 ) {
				if ( $("#option_a")[0].checked == true ) {
				    problems[cur_problem].judge = "本字段计为一个数据元素类型";
				    load_problem() ;
				}
				else if( $("#option_b")[0].checked == true ){
				    problems[cur_problem].judge = "本字段不计为一个数据元素类型";
					load_problem() ;
				}
				else
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

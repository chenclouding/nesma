<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'step2.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="/nesma/images/screen.css">
	<script type="text/javascript" src="javascript/jquery-1.4.4.min.js" ></script>
	<script type="text/javascript" >
	
	    var problems = new Array();
	    var next_problem = new Array() ;
		var pre_problem = new Array() ;
		var problem_num = 9 ;
		var cur_problem ;		
	    $(document).ready(function(){
	        problems[1]={
	            text : "1、	该处理过程是否为一个原子事务？",
	            a : "A、是",
	            b : "B、否",
	            c : "" ,
			    d : "" ,
	            ans : "" ,
				judge : ""
			} ;
			problems[2] = {
				text : "2、	该处理过程是否属于用户提出的功能？ " ,
				a : "A、是",
	            b : "B、否",
	            c : "" ,
			    d : "" ,
	            ans : "" ,
				judge : ""
			} ;
			problems[3] = {
				text : "3、	该处理过程对内部逻辑文件执行了何种操作？ " ,
				a : "A、增加数据且需要用户输入数据到系统内",
	            b : "B、修改数据且需要用户输入数据到系统内",
	            c : "C、删除数据且需要用户输入数据到系统内" ,
			    d : "D、仅获取数据呈现给用户" ,
	            ans : "" ,
				judge : ""
			} ;
			problems[4] = {
				text : "4、	是否已存在一个EI，与当前EI所处理的数据和数据处理方式完全相同？ " ,
				a : "A、是",
	            b : "B、否",
	            c : "" ,
			    d : "" ,
	            ans : "" ,
				judge : ""
			} ;
			problems[5] = {
				text : "5、	输入屏幕是否包括多个功能（增、删、改）？ " ,
				a : "A、是",
	            b : "B、否",
	            c : "" ,
			    d : "" ,
	            ans : "" ,
				judge : ""
			} ;
			problems[6] = {
				text : "6、	这个EI是否维护了多个内部逻辑文件（ILF），并且系统未提供单独维护这些ILF的功能? " ,
				a : "A.是",
	            b : "B. 否",
	            c : "" ,
			    d : "" ,
	            ans : "" ,
				judge : ""
			} ;
			problems[7] = {
				text : "7、	处理过程是否引用了ILF或者EIF？ " ,
				a : "A、是",
	            b : "B、否",
	            c : "" ,
			    d : "" ,
	            ans : "" ,
				judge : ""
			} ;
			problems[8] = {
				text : "8、	报表显示的数据中，是否全部来自数据库中的原始数据？ " ,
				a : "A、是",
	            b : "B、否",
	            c : "" ,
			    d : "" ,
	            ans : "" ,
				judge : ""
			} ;
			problems[9] = {
				text : "9、	报表显示的数据中，是否有通过数学公式计算得来的或者是对原始数据的提取或者过滤？ " ,
				a : "A、是",
	            b : "B、否",
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
				if(confirm("本实体判断结束。是否继续判断下一实体？")){
					cur_problem = 1;
					var j ;
					for(j = 1 ; j <= problem_num ; j ++ ){
						problems[j].ans="";
					}
					load_problem();
				}
				else
					alert("请点击返回退出帮助！");
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
				if ( $("#option_a")[0].checked == true ) {
					problems[cur_problem].judge = "请回答下一题！" ;	
					next_problem[1] = 2 ;
					pre_problem[2] = 1 ;
					load_problem() ;
				}else if( $("#option_b")[0].checked == true ){
					problems[cur_problem].judge = "该处理过程不是基本处理！" ;
					next_problem[1]=-1;
					load_problem() ;
				}else
					alert("您尚未选择任何选项！");
		    }
		    
		    if ( cur_problem == 2 ) {
				if ( $("#option_a")[0].checked == true ) {
					problems[cur_problem].judge = "该处理过程是基本处理，请回答下一题！" ;	
					next_problem[2] = 3 ;
					pre_problem[3] = 2 ;
					load_problem() ;
				}else if( $("#option_b")[0].checked == true ){
					problems[cur_problem].judge = "该处理过程不是基本处理！" ;
					next_problem[2] = -1 ;	
					load_problem() ;
				}else
					alert("您尚未选择任何选项！");	
		    }
		    
		    if ( cur_problem == 3 ) {
		        if ( $("#option_d")[0].checked == true)
		        {
		            problems[cur_problem].judge = "即为EO（外部输出）或者EQ（外部查询） " ;
		            next_problem[3] = 7 ;
				    pre_problem[7] = 3 ;
				    load_problem() ;
		        }else if(($("#option_a")[0].checked == true || $("#option_b")[0].checked == true || $("#option_c")[0].checked == true)){
		            problems[cur_problem].judge = "即为EI（外部输入）" ;
		            next_problem[3] = 4 ;
				    pre_problem[4] = 3 ;
				    load_problem() ;
		        }else
		        	alert("您尚未选择任何选项！");	
		     }
		     
		     if ( cur_problem == 4 ) {
			        if ($("#option_a")[0].checked == true)
			        {
			            problems[cur_problem].judge = "此EI不计入功能点计数 " ;
			            next_problem[4] = -1 ;
			            load_problem() ;
			        }else if( $("#option_b")[0].checked == true){
			            problems[cur_problem].judge = "请回答下一题！" ;
			            next_problem[4] = 5 ;
					    pre_problem[5] = 4 ;
					    load_problem() ;
			        }else
			        	alert("您尚未选择任何选项！");	
		     }
		     
		     if ( cur_problem == 5 ) {
			        if ($("#option_a")[0].checked == true)
			        {
			            problems[cur_problem].judge = "为每个功能计入一个EI（外部输入），请将结果计入系统 ！" ;
			            next_problem[5] = 6 ;
					    pre_problem[6] = 5 ;
					    load_problem() ;
			        }else if( $("#option_b")[0].checked == true){
			            problems[cur_problem].judge = "只为当前功能计入一个EI（外部输入），请将结果计入系统！" ;
			            next_problem[5] = 6 ;
					    pre_problem[6] = 5 ;
					    load_problem() ;
			        }else
			        	alert("您尚未选择任何选项！");
		     }     
		     
		     if ( cur_problem == 6 ) {
			        if ($("#option_a")[0].checked == true)
			        {
			            problems[cur_problem].judge = "为每个ILF计入一个EI，请将结果计入系统 ！" ;
			            next_problem[6] = -1 ;
			            load_problem() ;
			        }else if( $("#option_b")[0].checked == true){
			            problems[cur_problem].judge = "只计入一个EI，请将结果计入系统！" ;
			            next_problem[6] = -1 ;
			            load_problem() ;
			        }else
			        	alert("您尚未选择任何选项！");
		     } 
		     
		     if ( cur_problem == 7 ) {
			        if ($("#option_a")[0].checked == true)
			        {
			            problems[cur_problem].judge = "请回答下一题 ！" ;
			            next_problem[7] = 8 ;
					    pre_problem[8] = 7 ;
					    load_problem() ;
			        }else if( $("#option_b")[0].checked == true){
			            problems[cur_problem].judge = "此处理过程忽略，不计入事务功能！" ;
			            next_problem[7] = -1 ;
			            load_problem() ;
			        }else
			        	alert("您尚未选择任何选项！");
		     }  
		     
		     if ( cur_problem == 8 ) {
		            if ( $("#option_a")[0].checked == true){
					      problems[cur_problem].judge = "即为EQ（外部查询），请将结果输入系统！ " ; 	
					      next_problem[8] = -1 ;
					      load_problem() ;
					}else if( $("#option_b")[0].checked == true){
					      problems[cur_problem].judge = "请回答下一题" ;	
					      next_problem[8] = 9 ;
				          pre_problem[9] = 8 ;
				          load_problem() ;
				    }else
			        	alert("您尚未选择任何选项！");
		     }    
		     
		     if ( cur_problem == 9 ) {
		            if ( $("#option_a")[0].checked == true){
					      problems[cur_problem].judge = "即为EO（外部输出），请将结果输入系统！" ; 
					      next_problem[8] = -1 ;
					      load_problem() ;	
					}else
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
	
	<body>
	 <p class="one">
		<form name="problem" >
			<span id="problem_text"></span></br>
			<input type="radio" id="option_a" name="problem" class="my_radio"><span id="option_a_text" class="my_radio"></span></br>
			<input type="radio" id="option_b" name="problem" class="my_radio"><span id="option_b_text" class="my_radio"></span></br>
			<input type="radio" id="option_c" name="problem" class="my_radio"><span id="option_c_text" class="my_radio"></span></br>
			<input type="radio" id="option_d" name="problem" class="my_radio"><span id="option_d_text" class="my_radio"></span></br>
		</form>
		</p>
		<button onclick="submit_answer()" id="problem_submit">确定</button></br></br>
		<b><span id="problem_judge"></span></b></br></br>
		 <p class="two">
		<button onclick="go_next_problem()" id="next_button"> 下一题 </button>&nbsp&nbsp
		<button onclick="go_pre_problem()" id="pre_problem"> 上一题 </button>&nbsp&nbsp
		<button onclick="go_back()"  id="back"> 返回 </button>
		</p>
	</body>
	
</html>
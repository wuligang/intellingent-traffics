<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@  taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
	#leftmodle {
	width: 100%;
	height: 100%;
}
body{
	background-color: #F8F8FF;
	}
	#lefth{
		border-bottom: 1px solid #00A2e8;
		position: relative;
		height:20%;
		width:100%
		top: 30px;
	}
	#lefth>a{
		position: relative;
		top:-12px;
	}
	#lefthead>span{
		position: relative;
		top:60px;
		left:20px;
		font-size: 16px;
		background-color: 
	}
	.redcoler {
	    background: #ff4848;
	   	display:inline-block;
	    width: 4px;
	    height: 4px;
	    position:relative;
	    top: -4px;
    }
    .bluecoler {
	    background: #1C86EE;
	   	display:inline-block;
	    width: 4px;
	    height: 4px;
	    position:relative;
	    top: -4px;
    }
    #lefthead>a{
    	position: relative;
    	float: right;
    	top: 60px;
    }
    #page{
    	
    	position: relative;
    	top:120px;
    	text-align: center;
    }
    #page a{
	    min-width: 20px;
	    height: 20px;
	    border: 1px solid #dce0e0!important;
	    text-align: center;
	    margin: 0 2px;
	    cursor: pointer;
	    line-height: 20px;
	    color: #0000FF;
	    display: inline-block;
	    border-radius: 50%;
	    font-size: 14px;
    }
</style>
</head>
<script type="text/javascript" src="../../jq/jquery-1.12.4.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
	fenye(1);
	});
	
	function fenye(pageNum){
		$.ajax({
			url:"/proplem/allProplemFeedback",
			method:"post",
			data:{
				"pageNum":pageNum,
				"pageSize":5,
			},
			success : function(data){
				var list = data.rows;//查询的结果
				var total = data.total;//总记录数
				var pages = data.pages;//总页数
				var pageNum = data.pageNum;//当前页
				$(".del").remove();
				for(var i=0;i<list.length;i++){
					$("#table").append(
					"<tr class='del'style='position: relative; bottom: 100px;'><td>.</td><td onclick='aa(" + list[i].feedbackId + ")' style='width: 80%;'>"
									+ list[i].feedbackInfo + "</td>" + "<td class='bbb' style='width: 80%;position: relative;left: 100px'>"
									+ list[i].feedbackTime + "</td></tr>");
				}
				var number = $("#pagenew").html(pageNum);
				//上一页
				
				$("#shang").click(function(){
					if(pageNum==1){
					alert("已经是第一天了");
					}else{
					pageNum=pageNum-1;
					fenye(pageNum);
					}
				});
				$("#xia").click(function(){
					if(pageNum==pages){
						alert("已经是最后一页了");
					}else{
						pageNum=pageNum+1;
						fenye(pageNum);
					}
				});
			}
		});
	}
	
</script>
<body>
	<div id="leftmodle">
	<table>
	<tr></tr>
	<tr></tr>
	<tr></tr>
	</table>
		<div id="lefth">
			<a onclick="history.go(-1)" style="cursor: pointer; margin-left: 10px;">
			<img src="../../images/problem/return.png" style="position: absolute;"/>
			</a>
		</div>
		<div id="lefthead">
			<span>
				反馈列表
			</span>
			<a>
			<span class="redcoler"></span>向自己反馈
			<span class="bluecoler"></span>向他人反馈
			</a>
		</div>
		<div id="neirong">
				
			<table id="table" style="margin-top: 200px;margin-left: 40px; height: 200px;">
			
			</table>
		</div>
		<div id="page">
			
			<a id="shang">上一页</a>
			<a id="pagenew"></a>
			<a id="xia">下一页</a>
		</div>
	</div>
</body>
</html>
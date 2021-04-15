<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@  taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="../../css/problem_left.css" type="text/css"></link>
<link rel="stylesheet" href="../../css/problem_rigth.css" type="text/css"></link>
</head>
<script type="text/javascript" src="../../jq/jquery-1.12.4.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
	fenye(1);
	});
	
	function fenye(pageNum){
		$.ajax({
			url:"/proplem/newsFeedback",
			method:"post",
			data:{
				"pageNum":pageNum,
				"pageSize":2,
			},
			success : function(data){
				var list = data.rows;//查询的结果
				console.log(list);
				var total = data.total;//总记录数
				var pages = data.pages;//总页数
				var pageNum = data.pageNum;//当前页
				$(".del").remove();
				for(var i=0;i<list.length;i++){
					$("#table").append(
					"<tr class='del'><td>.</td><td onclick='aa(" + list[i].feedbackId + ")'>"
									+ list[i].feedbackInfo + "</td>" + "<td class='bbb'>"
									+ list[i].feedbackTime + "</td></tr>");
				}
				var number = $("#pagenew").html(pageNum);
				var feedbackId=list[0].feedbackId;
				aa(feedbackId);
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
	function aa(feedbackId){
		
		$.ajax({
			url:"/proplem/selectPFByid",
			method:"post",
			data:{
				"feedbackId":feedbackId,	
			},
			success:function(data){
			console.log(data.feedbackId);
			$("#title").html(""+data.feedbackInfo);
			$("#auther").html("创建时间："+data.feedbackTime);
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
				提问列表
			</span>
			<a>
			<span class="redcoler"></span>向自己提问
			<span class="bluecoler"></span>向他人提问
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
	<div id="rightmodle">
		<div id="righthead">
			<div id="leixing">提问详情</div>
			<div id="information" style="width: 700px;">
				<h4 id="title"></h4>
				<p id="auther"></p>
			</div>
		</div>
	</div>
</body>
</html>
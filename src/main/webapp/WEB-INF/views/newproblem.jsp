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
			url:"/proplem/listN",
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
					"<tr class='del'><td>.</td><td onclick='aa(" + list[i].proplemId + ")'>"
									+ list[i].proplemTitle + "</td>" + "<td class='bbb'>"
									+ list[i].proplemTime + "</td></tr>");
				}
				var number = $("#pagenew").html(pageNum);
				var proplemId=list[0].proplemId;
				aa(proplemId);
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
				$("#updateproblem").click(function(){
					$.ajax({
						url:"/proplem/updateproblem",
						method:"post",
						data:{
							"proplemId":proplemId,	
						},
						success:function(data){
							var i=data;
							if(i==1){
								alert("审核成功");
							}else{
								alert("审核不通过");
							}
						}
						});	
				});
			}
		});
	}
	function aa(proplemId){
		$.ajax({
			url:"/proplem/tongyong",
			method:"post",
			data:{
				"proplemId":proplemId,	
			},
			success:function(data){
			console.log(data.proplemId);
			$("#title").html(""+data.proplemTitle);
			$("#auther").html("创建时间："+data.proplemTime);
			$("#rong").html(""+data.proplemInfo);
			}
		});
	}
	function backInfo1(){
		var feedbackInfo = $("#feedbackInfo").val();
		$.ajax({
			url:"/proplem/huifu",
			method:"post",
			data:{"feedbackInfo":feedbackInfo,},
			success:function(data){
				var i=data;
				if(i==1){
					alert("插入成功");
				}else{
					alert("插入失败");
				}
			}
		});
	}
	function updatano(){
		alert("审核不通过");
	}
	function updateproblem(proplemId){
		
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
				<p id="rong"></p>
			</div>
		</div>
		<div id="righttext">
			<a>信息输入</a>
			<textarea rows="" cols="" placeholder="请回复..." id="feedbackInfo" name="feedbackInfo"></textarea>
			<div id="sumbit" align="center" style="display: block;">
				<input type="button" value="审核不通过" onclick="updatano()">
				<input type="button" value="审核通过" id="updateproblem">
				<input type="button" value="审核通过并回复" onclick="backInfo1()">
			</div>
		</div>
	</div>
</body>
</html>
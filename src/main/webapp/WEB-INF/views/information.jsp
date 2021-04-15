<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@  taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<title>Insert title here</title>
<script type="text/javascript" src="../../jq/jquery-1.12.4.js"></script>
<style type="text/css">
body{
	height:100%;
	background-color: #EAEAEA;
}
.listBox{
	width:49%;
	height:500px;
	background-color: #ffffff;
	float:left;
}
.listBox>#pages{
	position: relative;
  	left: 80px;
}
.boxtitle{
	position: relative;
  	left: 30px;
}
#queBox{
	width: 49%;
	height:99%;
	position:fixed;
	right:0px;
	background-color: #ffffff;
}
td,.dle,button{
	cursor: pointer;
}
#queBox>h4,#queBox>p{
	text-align:center; 
}
#queBox>div{
	text-indent:30px;
	font-weight:bold;
	margin: 25px;
}
#table{
	line-height:40px;
}
.bbb{
	position: relative;
  	left: 91px;
}
.aaa{
	width: 550px;
	position: relative;
  	left: 30px;
}
.ccc{
	position: relative;
  	left: 30px;
  	top:-5px;
  	font-size:24px;
}
li{
	width: 90px;
	height:30px;
	float: right;		
}
 ul:after{
     content: "";
     display:block;
     clear: both;
}
.red{
	font-weight:bolder;
	color:red;
}
.blue{
	font-weight:bolder;
	color:blue;
}
#zt span:nth-of-type(1),#zt span:nth-of-type(3){
	position: relative;
  	left: 70%;
  	top:-5px;
}
#zt span:nth-of-type(2),#zt span:nth-of-type(4){
	position: relative;
  	left: 70%;
}
.dle{
	height: 10px;
	width: 10px;
	padding:0px 8px;
	border-radius: 3em;
	background-color: blue;
	color: #ffffff;
}
img{
	position: relative;
  	top:10px;
  	z-index: 10;
}
hr{
	width:100%;
	background-color:blue;
    height: 2px;
    position: relative;
  	top:-10px;
  	z-index: 1;
}
</style>

<script type="text/javascript">
var z=0;
	$(document).ready(function() {
		<%
		  String newsid = request.getParameter("id");
		  String newsAssortment=request.getParameter("newsAssortment");
		%>
		branch(1,<%=newsAssortment%>);
	});
	/* 分页查新闻 */
	function branch(page,newsAssortment) {
		$.ajax({
			url : "/news/paging",
			method : "post",
			data : {
				"page" : page,
				"rows" : 3,
				"newsAssortment" :newsAssortment},
			success : function(data) {
				var list = data.rows;
				var total = data.total;
				var number = data.number;
				$("tr").remove();
				for ( var i = 0; i < list.length; i++) {
					if(list[i].newsAssortment==0&&list[i].newsStatus==0){
					/* 失物招领且为官方发布 */
					$("#table").append(
					"<tr><td class='ccc red'>.</td><td class='aaa' onclick='aa(" + list[i].newsId + ")'>"
									+ list[i].newsTitle + "</td>" + "<td class='bbb'>"
									+ list[i].newsTime + "</td></tr>");
					}else if(list[i].newsAssortment==0&&list[i].newsStatus==1){
					/* 失物招领不为官方发布 */
					$("#table").append(
					"<tr><td class='ccc blue'>.</td><td class='aaa' onclick='aa(" + list[i].newsId + ")'>"
									+ list[i].newsTitle + "</td>" + "<td class='bbb'>"
									+ list[i].newsTime + "</td></tr>");
					}else{
					/* 非失物招领 */
					$("#table").append(
					"<tr><td class='aaa' onclick='aa(" + list[i].newsId + ")'>"
									+ list[i].newsTitle + "</td>" + "<td class='bbb'>"
									+ list[i].newsTime + "</td></tr>");
					}						
				}
				/* 清除原数据并赋新数据 */
				$(".dle").remove();
				z=0;
				for ( var i = 1; i <= number; i++) {
					$("#page2").append("<input class='hidden' type='hidden'value='"+data.rows[0].newsAssortment+"'/><span class='dle' onclick='branch(" +i+ ","+data.rows[0].newsAssortment+")'>" + i + "</span>");
				z++;
				}
				if(page==0||page==null){
				page=1;
				}			
				$("#page1").val(page-1);
				$("#page3").val(++page);
				/* 页面头部 */
				if(data.rows[0].newsAssortment==0){
				$(".boxtitle").html("失物招领");
				$("#zt").remove();
				$(".zt").append("<div id='zt'><span class='red'>.</span><span>官方发布</span><span class='blue'>.</span><span>用户发布</span></div>");
				}else if(data.rows[0].newsAssortment==2){
				$(".boxtitle").html("路况信息");
				}else{
				$(".boxtitle").html("交通新闻");
				}
				if(<%=newsid%>==null||<%=newsid%>==0){
				aa(data.rows[0].newsId);
				}else{
				aa(<%=newsid%>);
				}
			}
		})
	};
	/* 查新闻详情 */
	function aa(newsId) {
		$.ajax({
			url : "/news/checks",
			method : "post",
			data : {
				"newsId" : newsId
			},
			success : function(data) {
				$("#queBox>h4").html(data.newsTitle);
				$("#queBox>p").html(data.newsTime+" "+data.newsAuthor);
				$("#queBox>div").html(data.newsInfo);
			}
		});
	}
	/* 点击下/上一页 */
	function tiao(a){
	if(a==1&&$("#page1").val()>0){
		branch($("#page1").val(),$(".hidden").val());
	}else if(a==2&&$("#page3").val()<=z){
		branch($("#page3").val(),$(".hidden").val())
	}}
</script>


</head>
<body>
		<div class="listBox">
			<a onclick="history.go(-1)" title="返回"
				style="cursor: pointer;margin-left: 5px;" class="imgback">
				<img src="../../images/information/YR2UMNACHK_LBT`JD(13@AP.png"></img></a>
				<hr/>
			<div class="boxhead">
				<h4 class="boxtitle">失物招领</h4>
				<div class="zt">
				</div>
			</div>
			<table id="table">
			<!-- 插入新闻 -->
			</table>
			<div id="pages">
			<!-- 页码 -->
			<button id="page1" value="0" onclick="tiao(1)">上一页</button><span id="page2"></span><button id="page3" value="0" onclick="tiao(2)">下一页</button>
			</div>
		</div>
		<div id="queBox">
		<!-- 新闻详情 -->
			<h4></h4>
			<p></p>
			<div></div>
		</div>
</body>
</html>
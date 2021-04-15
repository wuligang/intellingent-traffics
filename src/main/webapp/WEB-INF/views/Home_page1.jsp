<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>My JSP 'Home_page.jsp' starting page</title>

<link rel="stylesheet" type="text/css"
	href="/js/jquery-easyui-1.4.1/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css"
	href="/js/jquery-easyui-1.4.1/themes/icon.css" />
<script type="text/javascript"
	src="/js/jquery-easyui-1.4.1/jquery.min.js"></script>
<script type="text/javascript"
	src="/js/jquery-easyui-1.4.1/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="/js/jquery-easyui-1.4.1/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="/js/common.js"></script>

<style type="text/css">
a{
	cursor: pointer;
	text-decoration: none;
	color: #000000;
}

.Frame {
	border-radius: 25px;
	position: relative;
	border: 1px solid #C7C7C7;
}

h1 {
	position: relative;
	left: 40px;
}

span {
	position: relative;
	font: normal bold 50px "楷体";
}
.date{
	position: relative;
	left:130px;
	list-style:none;
	display: inline-block;	
}
.Traffic,.Journalism,.Recruit{
	width:60%;
	list-style:none;
	cursor: pointer;
	display: inline-block;
}
.reds{
	height:20px;
	color:red;
	position: relative;
  	top:-5px;
  	font-size: 30px;
  	font-weight:bolder;
}
.blues{
	color:blue;
	position: relative;
  	top:-5px;
  	font-size: 30px;
  	font-weight:bolder;
}
</style>
<script type="text/javascript" src="../../jq/jquery-1.12.4.js"></script>
</head>

<body class="easyui-layout"
	style="width:100%;height:100%;overflow-y:auto;background-color:#D8E4FF;">
	<div class="easyui-layout" style="width:100%;height:900px" data-options="split:false">
		<div class="easyui-layout" data-options="fit:true,split:false">
			<div id="north" data-options="region:'north',split:false,resizable:true"
				style="height:160px;position: relative;right:10px;overflow-x:visible" >
				<h1 style="position: relative;left:30px;">订单信息</h1>
				<div style="position: absolute;top: 50%;left: 47%;">暂时没有新信息</div>
				<div style="position: absolute;left: 5%;"></div>
			</div>
			<div data-options="region:'center'"
				style="padding:5px;background:#eee;position: relative;magin:10px">
				<div class="easyui-layout" data-options="fit:false"
					style="height:360px;padding:5px 5px 5px 0px;">

					<div
						data-options="region:'east',iconCls:'icon-reload',split:false,url:'/user/list',method:'post'"
						style="width:49%;height:48%;border-radius:5px;">
						<div style="position: relative;right: 30px;">
							<h1 style="display: inline-block;">失物招领</h1>
							<a style="position:absolute;right:1px;top:30px;" href="/to/information?newsAssortment=0">查看更多>></a>
							<div id="Recruit"></div>
						</div>
					</div>
					<div data-options="region:'west',split:false"
						style="width:49%;border-radius:5px;">
						<div>
							<h1 style="display: inline-block;">有问必答</h1>
							<a style="position:relative;right:-70%;top:5%;" href="/to/all_problem">查看更多>></a>
						</div>
						<div>
							<span id="newproblem" style="left:24%;top:60px;color:#008B00"></span>
							<a style="left:19%;top:130px" class="Frame" href="/to/newproblem">新提问</a> 
							<span id="Unsolved" style="left:38%;top:60px;"></span>
							<a style="left:31%;top:130px" class="Frame" href="/to/weichuli_problem">未处理问题</a> 
							<span id="feedback" style="left:50%;top:60px;color:#008B00"></span> 
							<a style="left:45%;top:130px" class="Frame" href="/to/yichuli_problem">新反馈</a>
						</div>
					</div>
				</div>
				<div class="easyui-layout" data-options="fit:false"
					style="height:50%;padding:5px 5px 5px 15px;border-radius:5px;">
					<div data-options="region:'east',iconCls:'icon-reload',split:false"
						style="width:49%;height:300px;border-radius:5px;">
						<div  style="position:relative;right: 30px;">
							<h1 style="display: inline-block;">路况信息</h1>
							<a style="position:absolute;right:1px;top:30px;" href="/to/information?newsAssortment=2">查看更多>></a>
							<div id="Traffic"></div>
						</div>
					</div>
					<div data-options="region:'west',split:false"
						style="width:49%;border-radius:10px;">
						<div  style="position:relative;right: 30px;">
							<h1 style="display: inline-block;">交通新闻</h1>
							<a style="position:absolute;right:1px;top:30px;" href="/to/information?newsAssortment=1">查看更多>></a>
							<div id="Journalism"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(document).ready(function() {
			/* 新提问 */
			$.ajax({
				url : "/proplem/newp",
				method : "post",
				success : function(data) {
					$("#newproblem").html(data);
				}
			}),
			/* 未处理 */
			$.ajax({
				url : "/proplem/nocl",
				method : "post",
				success : function(data) {
					$("#Unsolved").html(data);
				}
			}),
			/* 新反馈 */
			$.ajax({
				url : "/proplem/newpf",
				method : "post",
				success : function(data) {
					$("#feedback").html(data);
				}
			}),
			/* 添加新闻 */
			$.ajax({
			url:"/news/all",
			method:"post",
			success:function(data){
			fill(data);
			}
			});	
		});
		function fill(date){
		var data=date.news;
		var x=0,y=0,z=0;
		for(var i=0;i<data.length;i++){	
		if(data[i].newsAssortment==0&&x<3){
		/* 插入失物招领 */
		if(data[i].newsStatus==0){
		/* 官方发布 */
		$("#Recruit").append(		
			"<ul class='Recruit'><li><em class='reds'>.</em><a href='/to/information?id="+data[i].newsId+"&newsAssortment="+data[i].newsAssortment+"'>"+data[i].newsTitle+"</a></li></ul>"+
			"<ul class='date'><li>"+data[i].newsTime+"</li></ul>"
			);
		}else if(data[i].newsStatus==1){
		/* 用户发布 */
		$("#Recruit").append(		
			"<ul class='Recruit'><li><em class='blues'>.</em><a href='/to/information?id="+data[i].newsId+"&newsAssortment="+data[i].newsAssortment+"'>"+data[i].newsTitle+"</a></li></ul>"+
			"<ul class='date'><li>"+data[i].newsTime+"</li></ul>"
			);
		}		
			x++;
			}else if(data[i].newsAssortment==1&&y<6){
			/* 插入路况信息 */
			$("#Traffic").append(
			"<ul class='Traffic'><li><a href='/to/information?id="+data[i].newsId+"&newsAssortment="+data[i].newsAssortment+"'>"+data[i].newsTitle+"</a></li></ul>"+
			"<ul class='date'><li>"+data[i].newsTime+"</li></ul>"
			);
			y++;
			}else if(data[i].newsAssortment==2&&z<6){
			/* 插入交通新闻 */
			$("#Journalism").append(
			"<ul class='Journalism'><li><a href='/to/information?id="+data[i].newsId+"&newsAssortment="+data[i].newsAssortment+"'>"+data[i].newsTitle+"</a></li></ul>"+
			"<ul class='date'><li>"+data[i].newsTime+"</li></ul>"
			);
			z++;
			}
			}
		}
		
	</script>
</body>
</html>

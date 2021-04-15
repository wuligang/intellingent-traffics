<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>信息管理</title>

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

<script type="text/javascript">
	window.onload = function() {
		addTab(null,'AllInformation');
	};
	function addTab(newsAssortment,url) {
		
		url=url+'?newsAssortment='+newsAssortment;
		console.log(url);
		var content = '<iframe src="http://localhost:8080/to/' + url
				+ '" id="iframe" width="100%" height="500px" style="border: 0px;position:absolute;right:7px;top:-7px;"></iframe>';
		$("#iframe").remove();
		$("#showMassage").append(content);
	}
</script>

<style type="text/css">
.tree-icon{
	background: url("../../images/operation_management/swzl.png") no-repeat scroll 0 0 transparent;
}

</style>
</head>

<body class="easyui-layout"
	style="width:100%;height:700px;overflow-y:auto;border: 0px;">

	<div class="easyui-layout" style="width:100%;height:700px;">
		<div id="west" region="west" split="true" title="信息发布"
			style="width:250px;font-size: 20px;background-color: #f2f5f7;">
			<ul id="ulli" class="easyui-tree"
				style="width:150px;font-size: 20px;padding: 10px;"
				data-options="lines:true">			
				<li class="li"><span><a onclick="addTab(0,'AllInformation')">失物招领</a></span></li>
				<li class="li"><span><a	onclick="addTab(1,'AllInformation')">交通新闻</a></span></li>
				<li class="li"><span><a	onclick="addTab(2,'AllInformation')">路况信息</a></span></li>
			</ul>
		</div>
		<div id="showMassage" region="center"
			style="background-color: #f2f5f7;border: 0px;">
			</div>
	</div>

</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>运营管理</title>

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
.li {
	list-style-type:none;
	background-color: #2A579A;
	width: 240px;
	height: 40px;
	float: right;
	cursor:pointer;
}
#span{
	vertical-align: middle;
}
.li:hover{
	background-color:#6600ff
}
.span {
	line-height:25px;
	font-size: 15px;
	color: white;
	margin-left: 20px;
}
#west{
	background-color:#0064B0;
}
img{
	margin-left: 16px;
}
#content{
	clear: float;
}
#ulli{
	margin-top: 0px;
}
.middle{
	margin-top: 8px;
}
</style>
<script type="text/javascript" src="../../jq/operation_managent.js"></script>
</head>

<body class="easyui-layout"
	style="width:100%;height:100%;overflow-y:auto;background-color:#D8E4FF;">
	
	<div class="easyui-layout" style="width:100%;height:700px;">
    	<div id = "west" region="west" split="true" title="运营管理" style="width:250px;font-size: 20px; color: white;">    		
    		<ul id="ulli">
    			<li class="li" onclick="addTab1('车辆管理','http://localhost:8080/to/operation_bus_management')"><div class="middle"><img src="../../images/operation_management/busmang.png"></img><span class="span">车辆管理</span></div></li></br>
    			<li class="li" onclick="addTab2('车队管理','http://localhost:8080/to/operation_busteam_management')"><div class="middle"><img src="../../images/operation_management/busteam.png"></img><span class="span">车队管理</span></div></li></br>
    			<li class="li" onclick="addTab3('站点管理','http://localhost:8080/to/Bus_site')"><div class="middle"><img src="../../images/operation_management/sitemang.png"></img><span class="span">站点管理</span></div></li></br>
    			<li class="li" onclick="addTab4('线路管理','http://localhost:8080/to/operation_line_management')"><div class="middle"><img src="../../images/operation_management/linemang.png"></img><span class="span">线路管理</span></div></li></br>
    			<li class="li" onclick="addTab5('订单管理','http://localhost:8080/to/operation_order_management')"><div class="middle"><img src="../../images/operation_management/ordermang.png"></img><span class="span">订单管理</span></div></li></br>
    			<li class="li" onclick="addTab6('意见反馈','http://localhost:8080/to/operation_feedback_management')"><div class="middle"><img src="../../images/operation_management/listView.png"></img><span class="span">意见反馈</span></div></li></br>
    			<li class="li" onclick="addTab7('有问必答','http://localhost:8080/to/operation_ywbd_management')"><div class="middle"><img src="../../images/operation_management/listQue.png"></img><span class="span">有问必答</span></div></li></br>
    			<li class="li" onclick="addTab8('失物招领','http://localhost:8080/to/Lost')"><div class="middle"><img src="../../images/operation_management/swzl.png"></img><span class="span">失物招领</span></div></li>
    		</ul>
    	</div>
    	<div id="content" region="center" >
    		<div id="ttt" class="easyui-tabs">

    		</div>
    	</div>
    </div>
	
</body>
</html>

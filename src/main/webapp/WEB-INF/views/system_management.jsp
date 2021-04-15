<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>系统管理</title>

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
<script type="text/javascript">
	function addTab(title,url){
    	var state = $("#showMassage").tabs("exists", title);
    	if (state){
    		$('#showMassage').tabs('select', title);
    	} else {
    		var content = '<iframe scrolling="auto" frameborder="0"  src="http://localhost:8080/to/'+url+'" style="width:100%;height:100%;"></iframe>';
    		$('#showMassage').tabs('add',{
    			title:title,
    			content:content,
    			closable:true
    		});
    	}
    }
</script>
</head>

<body class="easyui-layout"
	style="width:100%;height:100%;overflow-y:auto;background-color:#D8E4FF;">
	
	<div class="easyui-layout" style="width:100%;height:700px;">
    	<div id = "west" region="west" split="true" title="系统管理" style="width:250px;font-size: 20px; color: white;">    		
    		<ul id="ulli">
    			<li class="li" onclick="addTab('角色管理','role_management')"><div class="middle"><img src="../../images/system_management/rolemang.png"></img><span class="span">角色管理</span></div></li></br>
    			<li class="li" onclick=""><div class="middle"><img src="../../images/system_management/orgusermang.png"></img><span class="span">机构用户管理</span></div></li></br>
    			<li class="li" onclick=""><div class="middle"><img src="../../images/system_management/districtmang.png"></img><span class="span">行政区划管理</span></div></li></br>
    			<li class="li" onclick=""><div class="middle"><img src="../../images/system_management/dictmang.png"></img><span class="span">字典管理</span></div></li></br>
    			<li class="li" onclick=""><div class="middle"><img src="../../images/system_management/jmi.png"></img><span class="span">字符加密</span></div></li></br>
    		</ul>
    	</div>
    	<div id="showMassage" class="easyui-tabs" region="center" style="width:100%;height:600px;background-color: #f2f5f7;border: 0px;">
    		
    	</div>
    </div>
	
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>失物招领</title>
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

<script type="text/javascript" charset="utf-8"
	src="/ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8"
	src="/ueditor/ueditor.all.js"></script>
<script type="text/javascript" charset="utf-8"
	src="/ueditor/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript" charset="utf-8"
	src="/ueditor/lang/en/en.js"></script>
<script type="text/javascript">
/* 添加操作列 */
function formatOper(val,row,index){
		var a='<a href="javascript:void(0);" value="'+row.teamId+'" onclick="Administration()"> 编辑 </a>'+
			'<a href="javascript:void(0);" value="'+row.newsId+'" onclick="deletes('+row.newsId+')"> 删除 </a>';
		return a;
}
/* 编辑 */
function Administration(){
$('#bianji').window({
        	onLoad :function(){
        		//回显数据
        	var data = $("#userList").datagrid("getSelections")[0];
        	console.log(data);
        	$("#bianji").form("load",data);}}).window('open').dialog('setTitle','编辑页面');
}
/* 删除 */
function deletes(newsId){
    	$.messager.confirm('确认','确定删除新闻吗？',function(r){
    	    if (r){
            	$.post("/news/delect",{'newsId':newsId}, function(data){
            		$.messager.alert('data',data.status);
        			if(data.status == 200){
        				$.messager.alert('提示','删除会员成功!',undefined,function(){
        					$("#userList").datagrid('reload');
        				});
        			}else{
        				$.messager.alert('提示','删除会员失败!',undefined,function(){
        					$("#userList").datagrid('reload');
        				});
        			}
        		});
    	    }
    	});
}
/* 映射类型 */
function formatSet(val,row){
		if(val == 1){
			return "官方发布";
		}else if(val == 0){
			return "用户发布";
		}
}
/* 映射时间 */
function formatBirthday(val,row){
	var now = new Date(val);
	return now.format("yyyy-MM-dd");
}
/* 获取选中项的id */
function getSelectionsIds(){
	var userList = $("#userList");
	var sels = userList.datagrid("getSelections");
	var ids = [];
	for(var i in sels){
	console.log(sels);
		ids.push(sels[i].teamId);
	}
	ids = ids.join(",");
	return ids;
}
//将时间戳转换为正常的时间格式		
function timestampToTime(timestamp) {
    var date = new Date(timestamp);//时间戳为10位需*1000，时间戳为13位的话不需乘1000
    var Y = date.getFullYear() + '-';
    var M = (date.getMonth()+1 < 10 ? '0'+(date.getMonth()+1) : date.getMonth()+1) + '-';
    var D = date.getDate() + ' ';
    var h = date.getHours() + ':';
    var m = date.getMinutes() + ':';
    var s = date.getSeconds();
    return Y+M+D;
};
var toolbar = [{
    text:'信息名称：<input id = "serach1" class="search" style="width:60px;"/>',
},{
    text:'搜索',
    iconCls:'icon-search',
    handler:function(){
    	var serach1=$("#serach1").val();
    	$("#userList").datagrid("load",{
    	serach1:serach1
    	});
    }
},{
    text:'信息发布',
    iconCls:'icon-add',
    handler:function(){
    	$('#userAdd').window('open');
    }
}];
window.onload = function() {
		var strs=window.location.search;
		var str=strs.charAt(strs.length-1);
		str = str.replace("l","");
		$('#userList').datagrid({
		url:'/news/selectAllBusStop?newsAssortment='+str,
		});
	};
</script>
</head>
<body>
	<div>
		<table class="easyui-datagrid" id="userList"
			data-options="singleSelect:true,collapsible:true,pagination:true,url:'/news/lost',method:'post',pageSize:5,toolbar:toolbar,pageList:[2,5,10],striped:true,rownumbers:true">
			<thead>
				<tr style="height:100%;width: 100%">
					<th data-options="field:'ck',checkbox:true"></th>
					<th data-options="field:'newsId',width:60,hidden:true">ID</th>
					<th
						data-options="field:'_operate',width:100,align:'center',formatter:formatOper">操作</th>
					<th data-options="field:'newsTitle',width:100">信息名称</th>
					<th data-options="field:'newsAuthor',width:100">作者</th>
					<th
						data-options="field:'newsTime',width:100,formatter:formatBirthday">发布时间</th>
					<th data-options="field:'newsStatus',width:100,formatter:formatSet">信息类型</th>
				</tr>
			</thead>
		</table>
	</div>

	<!-- 添加新闻页面 -->
	<div id="userAdd" class="easyui-window" title="失物招领发布"
		data-options="collapsible:false,maximizable:false,minimizable:false,modal:true,closed:true,iconCls:'icon-save'"
		style="width:70%;height:400px;padding:10px;">
		<form id="content" name="form1" action="/news/photoUpload/aaa"
			method="post" enctype="multipart/form-data" style="width:90%;">
			<ul>
				<th>标&nbsp;&nbsp;&nbsp;&nbsp;题:<input id="newsTitle"
					class="easyui-textbox" type="text" name="newsTitle"
					data-options="required:true,editable:true,missingMessage:'必填',"
					style="width: 280px;"></input></th>
				<th>联系人:<input id="newsAuthor" class="easyui-textbox"
					type="text" name="newsAuthor"
					data-options="required:true,editable:true,missingMessage:'必填',"
					style="width: 280px;"></input></th>
			</ul>

			<ul>
				<th>标题图:<input id="newsPhoto" type="file" name="newsPhoto"
					accept="image/*" style="width: 280px;border:1px solid #d9d9d9;"></input>
				</th>
				<th>官方发布/用户发布<input type="radio" name="name" value="0" />官方发布<input
					type="radio" name="newsStatus" value="1" />用户发布</th>
			</ul>
			<th><script id="container" name="content" type="text/plain"></script>
				<div align="center">
			</th> <input type="submit" value="提交">
	</div>
	</form>
	<script type="text/javascript">
		var ue = UE.getEditor('container', {
				elementPathEnabled : false, //删除元素路径
			});
	</script>
	</div>

	<!-- 编辑界面 -->
	<div id="bianji" class="easyui-window"
		data-options="collapsible:false,maximizable:false,minimizable:false,modal:true,closed:true,iconCls:'icon-save',href:'/to/Lostedit'"
		style="width:1100px;height:400px;padding:10px;">The window
		content.</div>
</body>
</html>
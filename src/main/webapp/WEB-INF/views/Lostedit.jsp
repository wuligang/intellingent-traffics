<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
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
<style type="text/css">
tr td:nth-of-type(1) {
	width: 100px;
}
</style>
</head>

<body style="width: 500px">
	<div style="padding:10px 10px 10px 10px">
		<form id="contentss" method="post">
			<table cellpadding="5" id="userList2">
				<tr>
					<td>id:</td>
					<td><input id="id" class="easyui-textbox" type="text"
						name="newsId" data-options="required:true,editable : false"
						style="width: 280px;"></input>
					</td>
				</tr>
				<tr>
					<td>信息名称:</td>
					<td><input id="textdefaut1" class="easyui-textbox" type="text"
						name="newsTitle" data-options="required:true"
						style="width: 280px;"></input></td>
				</tr>
				<tr>
					<td>作者:</td>
					<td><input class="easyui-textbox" type="text"
						name="newsAuthor" data-options="required:true"
						style="width: 280px;"></input></td>
				</tr>
				<tr style="display:none">
					<td>内容:</td>
					<td><input id="infoContent" class="easyui-textbox" type="text"
						name="newsInfo" data-options="required:true,hideColumn:true"
						style="width: 280px;"></input>
					</td>
				</tr>
			</table>
			<script id="containers" name="newsInfos" type="text/plain"></script>
			<div style="padding:5px" align="center">
				<a href="javascript:void(0)" class="easyui-linkbutton"
					onclick="submitForms()">提交</a>
			</div>
		</form>
	</div>
	<script type="text/javascript">
		$(document).ready(function() {
			var de=UE.delEditor('containers');//先删除容器
			var ue = UE.getEditor('containers', {
				elementPathEnabled : false, //删除元素路径
			});
			var a = setTimeout(function() {//延时取值
				var proinfo = $("#infoContent").val();
				ue.ready(function() {//编辑器初始化完成再赋值
					ue.setContent(proinfo); //赋值给UEditor
				});
			}, 100);
		});
		function submitForms() {
		if (!$('#contentss').form('validate')) {
			$.messager.alert("提示", '表单还未填写完成!');
			return;
		}
		$.post("/news/bian",$("#contentss").serialize(), function(data){
			if(data.status == 200){
				$.messager.alert("提示","修改成功!");
				$("#bianji").window("close");
				$("#userList").datagrid("reload");
				clearForm();
			}else{
				$.messager.alert("提示","修改失败!");
			}
		});
	}
	function clearForm() {
		$("#contentss").form("reset");
	}
	</script>
</body>
</html>

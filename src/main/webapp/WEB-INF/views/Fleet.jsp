<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div style="padding:10px 10px 10px 10px">
	<form id="content" method="post">
		<table cellpadding="5">			
			<tr>
				<td>车队名称:</td>
				<td><input id="textdefaut1" name="teamName" class="easyui-textbox"
					data-options="method:'post',
                                  height:20"
					style="width: 200px"/></td>
			</tr>
			<tr>
				<td>所属公司:</td>
				<td><input id="textdefaut2" name="companyName"
					class="easyui-combobox"
					data-options="
                                     method:'post',
                                     height:20,
                                     required:true"
					style="width: 200px" /></td>
			</tr>
			<tr>
				<td>选择线路:</td>
				<td><input id="textdefaut3" name="lineName"
					class="easyui-combobox"
					data-options="
                                     method:'post',
                                     height:20,
                                     required:true"
					style="width: 200px" /></td>
			</tr>
		</table>
	</form>
	<div style="padding:5px">
		<a href="javascript:void(0)" class="easyui-linkbutton"
			onclick="submitForm()">提交</a> <a href="javascript:void(0)"
			class="easyui-linkbutton" onclick="clearForm()">重置</a>
	</div>
</div>
<script type="text/javascript">
	function submitForm() {
		if (!$('#content').form('validate')) {
			$.messager.alert('提示', '表单还未填写完成!');
			return;
		}
		$.post("/busTeam/add", $("#content").serialize(), function(data) {
			if (data.status == 200) {
				$.messager.alert('提示', '新增会员成功!');
				$('#userAdd').window('close');
				$("#userList").datagrid('reload');
				clearForm();
			} else {
				$.messager.alert('提示', '新增会员失败!');
			}
		});
	}
	function clearForm() {
		$('#content').form('reset');
	}
	$('#textdefaut2').combobox({
		url : '/busCompany/allBusCompany',
		valueField : 'companyId',
		textField : 'companyName',
		editable : false,
		onSelect : function(rec) {
			console.log(rec.companyName);
			$('#textdefaut3').combobox({
				url : '/busTeam/Sendbusline?companyId=' + rec.companyId,
				
				valueField : 'lineId',
				textField : 'lineName',
				editable : false,
			});

		}
	})
	
</script>
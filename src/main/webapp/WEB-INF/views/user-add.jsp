<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div style="padding:10px 10px 10px 10px">
	<form id="content" method="post">
		<table cellpadding="5">
			<tr>
				<td>车牌号:</td>
				<td><input class="easyui-textbox" type="text" name="busNumber"
					data-options="required:true" style="width: 280px;"></input>
				</td>
			</tr>
			<tr>
				<td>所属公司:</td>
				<td><input id="textdefaut1" name="companyName"
					class="easyui-combobox"
					data-options="
                                     method:'post',
                                     height:20,
                                     required:true"
					style="width: 200px" /></td>
			</tr>
			<tr>
				<td>所属车队:</td>
				<td><input id="textdefaut2" name="teamName"
					class="easyui-combobox"
					data-options="
                                     method:'post',
                                     height:20,
                                     required:true"
					style="width: 200px" /></td>
			</tr>
			<tr>
				<td>司机姓名:</td>
				<td><input class="easyui-textbox" type="text" name="driverName"
					data-options="min:1,max:100,precision:0,required:true" /></td>
			</tr>
			<tr>
				<td>性别:</td>
				<td><input class="easyui-radio" type="radio" name="sex"
					value="1" checked="checked" /> 男 <input class="easyui-radio"
					type="radio" name="sex" value="2" /> 女</td>
			</tr>
			<tr>
				<td>司机电话:</td>
				<td><input class="easyui-textbox" type="text"
					name="driverPhone"
					data-options="min:1,max:100,precision:0,required:true" /></td>
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
		$.post("/bus/add", $("#content").serialize(), function(data) {
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

	$('#textdefaut1').combobox({
		url : '/busCompany/allBusCompany',
		valueField : 'companyId',
		textField : 'companyName',
		editable : false,
		onSelect : function(rec) {
			console.log(rec.companyName);
			$('#textdefaut2').combobox({
				url : '/busTeam/BusTeamByCompanyId?companyId=' + rec.companyId,
				valueField : 'teamId',
				textField : 'teamName',
				editable : false
			});

		}
	});
</script>
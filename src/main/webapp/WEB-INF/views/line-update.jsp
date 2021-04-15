<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
	function submitForm() {
		if (!$("#content").form('validate')) {
			$.messager.alert('提示', '请把表单填写完整');
			return;
		}
		$.post("/line/update", $("#content").serialize(), function(data) {
			console.log(data.status);
			if (data.status == 200) {
				$.messager.alert('提示', '修改会员信息成功');
				$("#lineUpdate").window('close');
				$("#lineList").datagrid('reload');
				clearForm();
			} else {
				$.messager.alert('提示', '修改会员信息不成功');
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
		//再写一个onselect函数，在用户更改了大队的时候，动态赋值
		onSelect : function(rec) {
			console.log(rec.teamId);
			$('#teamId1').val(rec.teamId);
		}
	});
</script>
<div style="padding : 10px,10px,10px,10px">
	<form id="content">
		<table cellpadding="5">
			<tr>
				<td><input name="lineId" type="hidden" /></td>
			</tr>
			<tr>
				<td>线路名称:</td>
				<td><input class="easyui-textbox" type="text" name="lineName"
					data-options="required:true" style="width: 280px;"></input>
				</td>
			</tr>
			<tr>
				<td>所属公司:</td>
				<td><input id="textdefaut1" name="companyName" class="easyui-combobox" data-options="
                                     method:'post',
                                     height:20,
                                     required:true"	style="width: 200px" /> 
					<input id="companyName1" name="lineCompany" type="hidden" />
				</td>
			</tr>
			<tr>
				<td>线路状态:</td>
				<td><input class="easyui-radio" type="radio" name="lineStatus"
					value="1" checked="checked" /> 启用 <input class="easyui-radio"
					type="radio" name="lineStatus" value="0" /> 停用</td>
			</tr>
		</table>
	</form>
	<div style="padding:5px">
		<a href="javascript:void(0)" class="easyui-linkbutton"
			onclick="submitForm()">提交</a> <a href="javascript:void(0)"
			class="easyui-linkbutton" onclick="clearForm()">重置</a>
	</div>
</div>


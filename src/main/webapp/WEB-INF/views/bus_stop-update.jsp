<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div style="padding:10px 10px 10px 10px">
	<form id="content" method="post">
		<table cellpadding="5">
			<tr>
				<td>站点id:</td>
				<td><input class="easyui-textbox" type="text" name="stopId"
					data-options="required:true" style="width: 310px;"></input>
				</td>
			</tr>
			<tr>
				<td>站点名称:</td>
				<td><input class="easyui-textbox" type="text" name="stopName"
					data-options="required:true" style="width: 310px;"></input>
				</td>
			</tr>
			<tr>
				<td>所在地区:</td>
				<td><input id="textdefaut1" name="province"
					class="easyui-combobox"
					data-options="
                                     method:'post',
                                     height:20,
                                     required:true"
					style="width: 100px" />
					<input id="textdefaut2" name="city"
					class="easyui-combobox"
					data-options="
                                     method:'post',
                                     height:20,
                                     required:true"
					style="width: 100px" />
					<input id="textdefaut3" name="stopArea"
					class="easyui-combobox"
					data-options="
                                     method:'post',
                                     height:20,
                                     required:true"
					style="width: 100px" />
					<input id="aArea" name="aArea" type="hidden">
					</td>
			</tr>
			<tr>
				<td>站点状态:</td>
				<td><input class="easyui-radio" type="radio" name="stopStatus"
					value="0" /> 不可用 <input class="easyui-radio"
					type="radio" name="stopStatus" value="1"/> 可用</td>
			</tr>
		</table>
	</form>
	<div style="padding:5px">
		<a href="javascript:void(0)" class="easyui-linkbutton"
			onclick="submitForm()" style="text-align: center;">提交</a>
	</div>
</div>
<script type="text/javascript">
	function submitForm() {
		
		if (!$('#content').form('validate')) {
			$.messager.alert('提示', '表单还未填写完成!');
			
			return;
		}
		$.post("/BusSite/updateBusStop", $("#content").serialize(), function(data) {
			if (data.status == 200) {
				$.messager.alert('提示', '修改站点成功!');
				$('#userAdd').window('close');
				$("#userList").datagrid('reload');
				clearForm();
			} else {
				$.messager.alert('提示', '修改站点失败!');
			}
		});
	}
	function clearForm() {
		$('#content').form('reset');
	}

	$('#textdefaut1').combobox({
		url : '/hat/selectprovince',
		valueField : 'provinceID',
		textField : 'province',
		editable : false,
		onSelect : function(rec) {
			console.log(rec.province);
			$('#textdefaut2').combobox({
				url : '/hat/selectcity?provinceID=' + rec.provinceID,
				valueField : 'cityID',
				textField : 'city',
				editable : false,
				onSelect : function(res) {
					console.log(res.city);
					$('#textdefaut3').combobox({
					url : '/hat/selectarea?cityID=' + res.cityID,
					valueField : 'areaID',
					textField : 'area',
					editable : false
						});

					}
			});
		}
	});
</script>
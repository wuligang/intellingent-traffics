<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>站点管理</title>
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
	/* 添加操作列 */
	function formatOper(val, row, index) {
		var a = '<a href="javascript:void(0);" value="' + row.rId
				+ '" onclick="Administration(' + index + ',' + row.rId
				+ ')"> 编辑 </a>';
		console.log("rId:"+row.rId);
		return a;
	}
	/* 编辑 */
	function Administration(index, rId) {
		$("#userList").datagrid("selectRow", index);
		var data = $("#userList").datagrid("getSelected");
		/* 给新打开的编辑页面数据回显 */
		$("#rName").textbox('setValue',data.rName);
		$("#rNote").textbox('setValue',data.rNote);
		$("#Administration").window({			
			onLoad:function(){
			}
		}).window('open');
	}
	
	function getSelectionsIds() {
		var userList = $("#userList");
		var sels = userList.datagrid("getSelections");
		var ids = [];
		for ( var i in sels) {
			ids.push(sels[i].stopId);
		}
		console.log(userList);
		console.log(sels);
		console.log(ids);
		ids = ids.join(",");
		return ids;
	}

	var toolbar = [
			{
				text : '角色名：<input id = "serach1" class="search" style="width:60px;"/>',
			},
			{
				text : '搜索',
				iconCls : 'icon-search',
				handler : function() {
					var stopName = $("#serach1").val();
					$("#userList").datagrid("load", {
						rId : rId
					});
				}
			},
			{
				text : '新增',
				iconCls : 'icon-add',
				handler : function() {
					$("#Administration").window({
						onLoad : function() {
							
						}
					}).window('open');
				}
			},
			{
				text : '批量删除',
				iconCls : 'icon-cancel',
				handler : function() {
					var ids = getSelectionsIds();
					if (ids.length == 0) {
						$.messager.alert('提示', '未选中用户!');
						return;
					}
					$.messager
							.confirm(
									'确认',
									'确定删除ID为 ' + ids + ' 的会员吗？',
									function(r) {
										if (r) {
											$
													.post(
															"/BusSite/delBusStop?stopId="
																	+ ids,
															{
																'ids' : ids
															},
															function(data) {

																if (data.status == 200) {
																	$.messager
																			.alert(
																					'提示',
																					'删除会员成功!',
																					undefined,
																					function() {
																						$(
																								"#userList")
																								.datagrid(
																										'reload');
																					});
																} else {
																	$.messager
																			.alert(
																					'提示',
																					'删除会员失败!',
																					undefined,
																					function() {
																						$(
																								"#userList")
																								.datagrid(
																										'reload');
																					});
																}
															});
										}
									});
				}
			}, {
				text : '重置',
				handler : function() {
					var stopName = $("#serach1").val("");
				}
			} ];

	//编辑
	function submitForm() {
		if (!$('#content').form('validate')) {
			$.messager.alert('提示', '表单还未填写完成!');
			return;
		}
		$.post("", $("#content").serialize(), function(data) {
			if (data.status == 200) {
				$.messager.alert('提示', '更新角色成功!');
				$('#Administration').window('close');
				$("#userList").datagrid('reload');
				clearForm();
			} else {
				$.messager.alert('提示', '更新角色失败!');
			}
		});
	}
	function clearForm() {
		$('#content').form('reset');
	}
	//新增
	function submitForm() {
		if (!$('#Administration').form('validate')) {
			$.messager.alert('提示', '表单还未填写完成!');
			return;
		}
		$.post("", $("#Administration").serialize(), function(data) {
			if (data.status == 200) {
				$.messager.alert('提示', '添加角色成功!');
				$('#Administration').window('close');
				$("#userList").datagrid('reload');
				clearForm();
			} else {
				$.messager.alert('提示', '添加角色失败!');
			}
		});
	}
</script>
</head>
<body>
	<div>
		<table class="easyui-datagrid" id="userList" title=""
			data-options="singleSelect:false,collapsible:true,pagination:true,url:'/jsdc/fan',method:'post',pageSize:5,toolbar:toolbar,pageList:[2,5,10]
	       ,rownumbers:true
	       ">
			<thead>
				<tr>
					<th data-options="field:'ck',checkbox:true"></th>
					<th data-options="field:'rId',width:50,hidden:true">角色id</th>
					<th data-options="field:'cz',width:100,align:'center',formatter:formatOper">操作</th>
					<th data-options="field:'rName',width:200,align:'center'">角色名</th>
					<th data-options="field:'rNote',width:200,align:'center'">角色描述</th>
				</tr>
			</thead>
		</table>
	</div>
	<div id="Administration" class="easyui-window" title="角色"
		data-options="model:true,closed:true,iconCls:'icon-update',href:''"
		style="width:700px;height:400px;padding:10px;">
		<form id="content" method="post">
			<table cellpadding="5">
				<tr>
					<td>角色名称:</td>
					<td><input id="rName" name="rName" class="easyui-textbox"
						data-options="method:'post',
                                  height:20,
                                  required:true"
						style="width: 200px" />
					</td>
				</tr>
				<tr>
					<td>角色描述:</td>
					<td><input id="rNote" name="rNote" class="easyui-textbox"
						data-options="method:'post',
                                     height:20,
                                     required:true"
						style="width: 200px" />
					</td>
				</tr>
			</table>
			<table cellpadding="5" style="margin:0 auto;width: 98%;border-right:1px solid #B2B2B2;border-bottom:1px solid #B2B2B2">
				<tr style="text-align: center;background:#B2B2B2;">
					<td style="width: 220px;font-size: 12pt;">菜单</td>
					<td style="font-size: 12pt;">功能</td>
				</tr>
				<tr>
					<td style="text-align: left;background:#E3E5E6;font-weight:bold">
						<input type="checkbox" name="menu" id="all[1]" onclick="menuCheck(1,'')" value="1">
						首页
					</td>
					<td></td>
				</tr>
				<tr>
					<td style="text-align: left;background:#E3E5E6;font-weight:bold">
						<input type="checkbox" name="menu" id="all[1]" onclick="menuCheck(1,'')" value="1">
						位置定位
					</td>
					<td></td>
				</tr>
				<tr>
					<td style="text-align: left;background:#E3E5E6;font-weight:bold">
						<input type="checkbox" name="menu" id="all[2]" onclick="menuCheck(2,'')" value="1">
						线路监控
					</td>
					<td></td>
				</tr>
				<tr>
					<td style="text-align: left;background:#E3E5E6;font-weight:bold">         
						<input type="checkbox" name="allfor[4]" id="all[41-4]" onclick="menuCheck(41,4)" value="41">
						运营管理     
					</td>
					<td style="text-align: left;width: 1472px;">
						<div style="display: block;width: 160px;float: left;text-align: left;font-size: 14px;">
							<input type="checkbox" name="handle[41]" id="handle[40]" onclick="checkHandle(41,4)" value="40">
							<span>车辆管理</span>
						</div><div style="display: block;width: 160px;float: left;text-align: left;font-size: 14px;">
							<input type="checkbox" name="handle[41]" id="handle[39]" onclick="checkHandle(41,4)" value="39">
							<span>车队管理</span>
						</div>
						<div style="display: block;width: 160px;float: left;text-align: left;font-size: 14px;">
							<input type="checkbox" name="handle[41]" id="handle[42]" onclick="checkHandle(41,4)" value="42">
							<span>站点管理</span>
						</div>
						<div style="display: block;width: 160px;float: left;text-align: left;font-size: 14px;">
							<input type="checkbox" name="handle[41]" id="handle[44]" onclick="checkHandle(41,4)" value="44">
							<span>线路管理</span>
						</div>
						<div style="display: block;width: 160px;float: left;text-align: left;font-size: 14px;">
							<input type="checkbox" name="handle[41]" id="handle[44]" onclick="checkHandle(41,4)" value="44">
							<span>订单管理</span>
						</div>
						<div style="display: block;width: 160px;float: left;text-align: left;font-size: 14px;">
							<input type="checkbox" name="handle[41]" id="handle[44]" onclick="checkHandle(41,4)" value="44">
							<span>意见反馈</span>
						</div>
						<div style="display: block;width: 160px;float: left;text-align: left;font-size: 14px;">
							<input type="checkbox" name="handle[41]" id="handle[44]" onclick="checkHandle(41,4)" value="44">
							<span>有问必答</span>
						</div>
						<div style="display: block;width: 160px;float: left;text-align: left;font-size: 14px;">
							<input type="checkbox" name="handle[41]" id="handle[44]" onclick="checkHandle(41,4)" value="44">
							<span>失物招领</span>
						</div>
					</td>
				</tr>
				<tr>
					<td style="text-align: left;background:#E3E5E6;font-weight:bold">         
						<input type="checkbox" name="allfor[4]" id="all[41-4]" onclick="menuCheck(41,4)" value="41">
						信息发布     
					</td>
					<td style="text-align: left;width: 1472px;">
						<div style="display: block;width: 160px;float: left;text-align: left;font-size: 14px;">
							<input type="checkbox" name="handle[41]" id="handle[44]" onclick="checkHandle(41,4)" value="44">
							<span>失物招领</span>
						</div>
						<div style="display: block;width: 160px;float: left;text-align: left;font-size: 14px;">
							<input type="checkbox" name="handle[41]" id="handle[44]" onclick="checkHandle(41,4)" value="44">
							<span>交通新闻</span>
						</div>
						<div style="display: block;width: 160px;float: left;text-align: left;font-size: 14px;">
							<input type="checkbox" name="handle[41]" id="handle[44]" onclick="checkHandle(41,4)" value="44">
							<span>路况信息</span>
						</div>
					</td>
				</tr>
				<tr>
					<td style="text-align: left;background:#E3E5E6;font-weight:bold">         
						<input type="checkbox" name="allfor[4]" id="all[41-4]" onclick="menuCheck(41,4)" value="41">
						系统管理     
					</td>
					<td style="text-align: left;width: 1472px;">
						<div style="display: block;width: 160px;float: left;text-align: left;font-size: 14px;">
							<input type="checkbox" name="handle[41]" id="handle[44]" onclick="checkHandle(41,4)" value="44">
							<span>权限管理</span>
						</div>
						<div style="display: block;width: 160px;float: left;text-align: left;font-size: 14px;">
							<input type="checkbox" name="handle[41]" id="handle[44]" onclick="checkHandle(41,4)" value="44">
							<span>机构用户管理</span>
						</div>
						<div style="display: block;width: 160px;float: left;text-align: left;font-size: 14px;">
							<input type="checkbox" name="handle[41]" id="handle[44]" onclick="checkHandle(41,4)" value="44">
							<span>行政区域管理</span>
						</div>
						<div style="display: block;width: 160px;float: left;text-align: left;font-size: 14px;">
							<input type="checkbox" name="handle[41]" id="handle[44]" onclick="checkHandle(41,4)" value="44">
							<span>字典管理</span>
						</div>
						<div style="display: block;width: 160px;float: left;text-align: left;font-size: 14px;">
							<input type="checkbox" name="handle[41]" id="handle[44]" onclick="checkHandle(41,4)" value="44">
							<span>字符加密</span>
						</div>
					</td>
				</tr>
				
			</table>
		</form>
		<div style="padding:5px">
			<a href="javascript:void(0)" class="easyui-linkbutton"
				onclick="submitForm()">提交</a> <a href="javascript:void(0)"
				class="easyui-linkbutton" onclick="clearForm()">重置</a>
		</div>
	</div>

</body>
</html>
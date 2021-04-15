<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>车队管理</title>
<link rel="stylesheet" type="text/css" href="../js/jquery-easyui-1.4.1/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="../js/jquery-easyui-1.4.1/themes/icon.css" />
<script type="text/javascript" src="../js/jquery-easyui-1.4.1/jquery.min.js"></script>
<script type="text/javascript" src="../js/jquery-easyui-1.4.1/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../js/jquery-easyui-1.4.1/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="../js/common.js"></script>
</head>
<body>
<div id="tt" class="easyui-tabs" >
<input type="hidden" id="input" value="1"/>
	<div title="其他车辆" style="padding:20px;background-color: #EBEBEB">
		<form id="content" method="post">
			<table class="easyui-datagrid" id="userList1"
				data-options="singleSelect:false,collapsible:true,fitColumns:true,pagination:true,url:'/busTeam/noall',method:'post',pageSize:10,toolbar:toolbar1,pageList:[2,5,10],rownumbers:true">
				<thead>
					<tr>
						<th data-options="field:'ck',checkbox:true"></th>
						<th data-options="field:'busId',width:20,hidden:true">ID</th>
						<th data-options="field:'busNumber'">车牌号</th>
						<th
							data-options="field:'companyName',formatter:fmtCompanyName">所属公司</th>
						<th
							data-options="field:'teamName',formatter:fmtTeamName">所属车队</th>
						<th
							data-options="field:'driverName',align:'right',formatter:fmtDriverName">司机姓名</th>
						<th
							data-options="field:'driverPhone',align:'right',formatter:fmtDriverPhone">司机电话</th>
						<th
							data-options="field:'busStatus',align:'center',formatter:formatSet">运行状态</th>
					</tr>
				</thead>
			</table>
		</form>
	</div>
	<div title="本队车辆" style="padding:20px;background-color: #EBEBEB">
		<form id="content" method="post">
			<table class="easyui-datagrid" id="userList2"
				data-options="singleSelect:false,collapsible:true,pagination:true,url:'/busTeam/all',method:'post',pageSize:10,toolbar:toolbar2,pageList:[2,5,10]">
				<thead>
					<tr>
						<th data-options="field:'ck',checkbox:true"></th>
						<th data-options="field:'busId',width:20">ID</th>
						<th data-options="field:'busNumber'">车牌号</th>
						<th
							data-options="field:'companyName',formatter:fmtCompanyName">所属公司</th>
						<th
							data-options="field:'teamName',formatter:fmtTeamName">所属车队</th>
						<th
							data-options="field:'driverName',align:'right',formatter:fmtDriverName">司机姓名</th>
						<th
							data-options="field:'driverPhone',align:'right',formatter:fmtDriverPhone">司机电话</th>
						<th
							data-options="field:'busStatus',align:'center',formatter:formatSet">运行状态</th>
					</tr>
				</thead>
			</table>
		</form>
	</div>
</div>
<script type="text/javascript">
/* 映射公司名 */
function fmtCompanyName(val,row,index){
	var name = row.busTeams.busCompanys.companyName;
	return name;
}
/* 映射车队名称 */
function fmtTeamName(val,row){
	return row.busTeams.teamName;
}
/* 映射司机姓名 */
function fmtDriverName(val,row){
	return row.busDrivers.driverName;
}
/* 司机电话 */
function fmtDriverPhone(val,row){
	return row.busDrivers.driverPhone;
}


function formatSet(val,row){
	if(val == 1){
		return "运行";
	}else if(val == 0){
		return "停运";
	}
}
	/* 获取添加车辆中选中项的id */
	function getSelectionsIds1() {
		var userList = $("#userList1");
		var sels = userList.datagrid("getSelections");
		var ids = [];
		for ( var i in sels) {
			ids.push(sels[i].busId);
		}
		ids = ids.join(",");
		return ids;
	}
	/* 获取移除车辆中选中项的id */
	function getSelectionsIds2() {
		var userList = $("#userList2");
		var sels = userList.datagrid("getSelections");
		var ids = [];
		for ( var i in sels) {
			ids.push(sels[i].busId);
		}
		ids = ids.join(",");
		return ids;
	}
	var toolbar1 = 
	[{
		text : '车牌号：<input id = "aaa" class="easyui-textbox" style="width:60px;"/>',
	},{
		text : '车主：<input id = "bbb" class="easyui-textbox" style="width:80px;"/>',
	},{
		text : '车队名称：<input id = "ccc" class="easyui-textbox" style="width:60px;"/>',
	},{
		text : '所属公司：<input id = "ddd" class="easyui-textbox" style="width:80px;"/>',
	},{
		text : '搜索',
		iconCls : 'icon-search',
		handler : function() {
			debugger;
			var input=$("#input").val();
			var serach1=$("#aaa").val();
    		var serach2=$("#bbb").val();
    		var serach3=$("#ccc").val();
    		var serach4=$("#ddd").val();
	    	$("#userList1").datagrid("load",{
	    	teamId:input,
	    	serach1:serach1,
	    	serach2:serach2,
	    	serach3:serach3,
	    	serach4:serach4,
	    	})
		}
	}, {
		text : '重置',
		iconCls : 'icon-mini-refresh',
		handler : function() {
			var serach1=$("#aaa").val(" ");
    		var serach2=$("#bbb").val(" ");
    		var serach3=$("#ccc").val(" ");
    		var serach4=$("#ddd").val(" ");
		}
	}, {
		text : '加入车队',
		iconCls : 'icon-add',
		handler : function() {
			var ids = getSelectionsIds1();
			var input=$("#input").val();
			$.messager.confirm('确认','确定要添加ID为'+ids+'的车辆吗？',function(r){
    		if(r){
    		console.log(ids); 
    		console.log(input);  
    			$.post("/busTeam/updata",{'ids':ids,'teamId':input}, function(data){
        			if(data.status == 200){
        				$.messager.alert('提示','添加车辆成功!',undefined,function(){
        					$("#userList1").datagrid('reload');
        					$("#userList2").datagrid('reload');
        				});
        			}else{
        				$.messager.alert('提示','添加车辆失败!',undefined,function(){
        					$("#userList1").datagrid('reload');
        					$("#userList2").datagrid('reload');
        				});
        			}
        		});
    		}
    	});
		}
	} ];
	var toolbar2 = 
	[{
		text : '车牌号：<input id = "aaaa" class="easyui-textbox" style="width:60px;"/>',
	},{
		text : '车主：<input id = "bbbb" class="easyui-textbox" style="width:80px;"/>',
	},{
		text : '搜索',
		iconCls : 'icon-search',
		handler : function() {
			debugger;
			var input=$("#input").val();
			var serach1=$("#aaaa").val();
    		var serach2=$("#bbbb").val();
    		$("#userList2").datagrid("load",{
    		teamId:input,
	    	serach1:serach1,
	    	serach2:serach2,
	    	})
		}
	}, {
		text : '重置',
		iconCls : 'icon-mini-refresh',
		handler : function() {
			var serach1=$("#aaaa").val(" ");
    		var serach2=$("#bbbb").val(" ");
		}
	}, {
		text : '移除车队',
		iconCls : 'icon-add',
		handler : function() {
			var ids = getSelectionsIds2();
			$.messager.confirm('确认','确定要移除ID为'+ids+'的车辆吗？',function(r){
    		if(r){
    		console.log(ids); 
    			$.post("/busTeam/updatato",{'ids':ids}, function(data){
        			if(data.status == 200){
        				$.messager.alert('提示','移除车辆成功!',undefined,function(){
        					$("#userList2").datagrid('reload');
        					$("#userList1").datagrid('reload');
        				});
        			}else{
        				$.messager.alert('提示','移除车辆失败!',undefined,function(){
        					$("#userList2").datagrid('reload');
        					$("#userList1").datagrid('reload');
        				});
        			}
        		});
    		}
    	});
		}
	} ];
</script>
</body>

</html>	


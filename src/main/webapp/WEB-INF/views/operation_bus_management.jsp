<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>车辆管理</title>
<link rel="stylesheet" type="text/css" href="/js/jquery-easyui-1.4.1/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="/js/jquery-easyui-1.4.1/themes/icon.css" />
<script type="text/javascript" src="/js/jquery-easyui-1.4.1/jquery.min.js"></script>
<script type="text/javascript" src="/js/jquery-easyui-1.4.1/jquery.easyui.min.js"></script>
<script type="text/javascript" src="/js/jquery-easyui-1.4.1/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="/js/common.js"></script>
<script type="text/javascript">
	/* 映射公司名称 */
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
	function getSelectionsIds(){
		var userList = $("#userList");
		var sels = userList.datagrid("getSelections");
		var ids = [];
		for(var i in sels){
			ids.push(sels[i].busId);
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
	    text:'车主姓名：<input id = "serach1" class="search" style="width:60px;"/>',
	},{
	    text:'车牌号：<input id = "serach2" class="search" style="width:80px;"/>',
	},{
	    text:'搜索',
	    iconCls:'icon-search',
	    handler:function (){
	    	var driverName = $("#serach1").val();
    		var busNumber = $("#serach2").val();
	    	$("#userList").datagrid("load",{
	    		driverName : driverName,
	    		busNumber : busNumber
	    	});
	    }
	},{
	    text:'新增',
	    iconCls:'icon-add',
	    handler:function(){
	    	$('#userAdd').window('open');
	    }
	},{
	    text:'编辑',
	    iconCls:'icon-edit',
	    handler:function(){
	    	var ids = getSelectionsIds();
	    	
	    	if(ids.length == 0){
	    		$.messager.alert('提示','还未选中要修改的用户');
	    		return;
	    	}else if(ids.indexOf(',')>0){
	    		$.messager.alert('提示','选中多个修改的用户');
	    		return;
	    	}
	    	$.messager.confirm('确认','确定要修改ID为'+ids+'的用户吗？',function(r){
	    		if(r){
	    			$('#userUpdate').window({
	    				onLoad:function(){
	    					var userList = $("#userList");
	    					/* 由于获取到的user是一个数组，这里必须加上【0】 */
	    			 		var user = userList.datagrid("getSelections")[0];
	    					$("#content").form("load" , {
	    						busId:user.busId,
	    						busNumber:user.busNumber,
	    						companyName:user.busTeams.busCompanys.companyName,
	    						teamName:user.busTeams.teamName,
	    						driverName:user.busDrivers.driverName,
	    						driverPhone:user.busDrivers.driverPhone,
	    						driverId:user.busDrivers.driverId,
	    						teamId1:user.busTeams.teamId
	    					});
	    					/* 给隐藏标签，设置id,问题就是只在页面加载的时候赋值一次，不能每次选择后都重新赋值 */	    					
	    					$('#companyName1').val(user.busTeams.busCompanys.companyId);
	    					$('#teamName1').val(user.busTeams.teamId);
	    				}
	    			}).window('open');
	    		}
	    	});
	    }
	},{
	    text:'删除',
	    iconCls:'icon-cancel',
	    handler:function(){
	    	var busIds = getSelectionsIds();
	    	if(busIds.length == 0){
	    		$.messager.alert('提示','未选中用户!');
	    		return ;
	    	}
	    	$.messager.confirm('确认','确定删除ID为 '+busIds+' 的会员吗？',function(r){
	    	    if (r){
	            	$.post("/bus/delete",{'busIds':busIds}, function(data){
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
	},'-',{
	    text:'导出',
	    iconCls:'icon-remove',
	    handler:function(){
	    	var optins = $("#userList").datagrid("getPager").data("pagination").options;
	    	var page = optins.pageNumber;
	    	var rows = optins.pageSize;
	    	$("<form>").attr({
	    		"action":"/bus/export/excel",
	    		"method":"POST"
	    	}).append("<input type='text' name='page' value='"+page+"'/>")
	    	.append("<input type='text' name='rows' value='"+rows+"'/>").appendTo("body").submit();
	    }
	}];
</script>
</head>
<body>
    <table class="easyui-datagrid" id="userList" 
	       data-options="singleSelect:false,collapsible:true,pagination:true,url:'/bus/all',method:'post',pageSize:10,toolbar:toolbar,pageList:[2,5,10],rownumbers:true">
	    <thead>
	        <tr>
	        	<th data-options="field:'ck',checkbox:true"></th>
	        	<th data-options="field:'busId',width:20" hidden="true">ID</th>
	            <th data-options="field:'busNumber',width:100">车牌号</th>
	         	<th data-options="field:'companyName',width:200,formatter:fmtCompanyName">所属公司</th>
	            <th data-options="field:'teamName',width:200,formatter:fmtTeamName">所属车队</th>
	            <th data-options="field:'driverName',width:90,align:'right',formatter:fmtDriverName">司机姓名</th>
	            <th data-options="field:'driverPhone',width:120,align:'right',formatter:fmtDriverPhone">司机电话</th>
	            <th data-options="field:'busStatus',width:80,align:'center',formatter:formatSet">运行状态</th>
	        </tr>
	    </thead>
	</table>
<div id="userAdd" class="easyui-window" title="新增车辆信息" data-options="modal:true,closed:true,iconCls:'icon-save',href:'/to/user-add'" style="width:550px;height:350px;padding:10px;">
        The window content.
</div>
<div id="userUpdate" class="easyui-window" title="修改车辆信息" data-options="model:true,closed:true,iconCls:'icon-update',href:'/to/user-update'" style="width:700px;height:400px;padding:10px;">
		The window context.
</div>

</body>
</html>
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
</head>
<body>
	<div>
    <table class="easyui-datagrid" id="userList" title="车辆管理" 
	       data-options="singleSelect:false,collapsible:true,pagination:true,url:'/bus/all',method:'post',pageSize:5,toolbar:toolbar,pageList:[2,5,10]">
	    <thead>
	        <tr>
	        	<th data-options="field:'busId',width:60">ID</th>
	            <th data-options="field:'busNumber',width:200">车牌号</th>
	         	<!-- <th data-options="field:'companyName',width:100,formatter:fmtCompanyName">所属公司</th>
	            <th data-options="field:'teamName',width:100,formatter:fmtTeamName">所属车队</th> -->
	             <!-- <th data-options="field:'busLine',width:100">所属线路</th> -->
	            <th data-options="field:'driverName',width:80,align:'right',formatter:fmtDriverName">司机姓名</th>
	            <!--<th data-options="field:'driverPhone',width:80,align:'right',formatter:fmtDriverPhone">司机电话</th>
	            <th data-options="field:'busStatus',width:130,align:'center',formatter:formatSet">运行状态</th> -->
	        </tr>
	    </thead>
	</table>
	</div>
<div id="userAdd" class="easyui-window" title="新增会员" data-options="modal:true,closed:true,iconCls:'icon-save',href:'${pageContext.request.contextPath}/user/toadduser'" style="width:700px;height:400px;padding:10px;">
        The window content.
</div>
<div id="userUpdate" class="easyui-window" title="修改会员" data-options="model:true,closed:true,iconCls:'icon-update',href:'${pageContext.request.contextPath }/user/user-update'" style="width:700px;height:400px;padding:10px;">
		The window context.
</div>
<script type="text/javascript">
/* 映射公司名称 */
function fmtCompanyName(val,row,index){
    console.log(val);
    console.log(row);
    console.log(index);
	var name = row.busTeams.busCompanys.companyName;
	console.log(name);
	return name;
}
/* 映射车队名称 */
function fmtTeamName(val,row){
	return row.busTeam.teamName;
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
		ids.push(sels[i].id);
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
    handler:function(){
    	$('#userAdd').window('open');
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
    	if(ids.length == 0 || ids.length > 1){
    		$.messager.alert('提示','还未选中要修改的用户,或者选择了多个用户');
    		return;
    	}
    	$.messager.confirm('确认','确定要修改ID为'+ids+'的用户吗？',function(r){
    		if(r){    			
    			$('#userUpdate').window({
    				onLoad:function(){
    					var userList = $("#userList");
    					/* 由于获取到的user是一个数组，这里必须加上【0】 */
    					var user = userList.datagrid("getSelections")[0];
    					user.birthday = timestampToTime(user.birthday);
    					$("#userUpdate").form("load" , user);
    				}
    			}).window('open');
    		}
    	});
    }
},{
    text:'删除',
    iconCls:'icon-cancel',
    handler:function(){
    	var ids = getSelectionsIds();
    	if(ids.length == 0){
    		$.messager.alert('提示','未选中用户!');
    		return ;
    	}
    	$.messager.confirm('确认','确定删除ID为 '+ids+' 的会员吗？',function(r){
    	    if (r){
            	$.post("/user/delete",{'ids':ids}, function(data){
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
    		"action":"/user/export/excel",
    		"method":"POST"
    	}).append("<input type='text' name='page' value='"+page+"'/>")
    	.append("<input type='text' name='rows' value='"+rows+"'/>").appendTo("body").submit();
    }
}];
</script>
</body>
</html>
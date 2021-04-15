<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>车队管理</title>
<link rel="stylesheet" type="text/css" href="/js/jquery-easyui-1.4.1/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="/js/jquery-easyui-1.4.1/themes/icon.css" />
<script type="text/javascript" src="/js/jquery-easyui-1.4.1/jquery.min.js"></script>
<script type="text/javascript" src="/js/jquery-easyui-1.4.1/jquery.easyui.min.js"></script>
<script type="text/javascript" src="/js/jquery-easyui-1.4.1/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="/js/common.js"></script>
<script type="text/javascript">
/* 添加操作列 */
function formatOper(val,row,index){
		var a='<a href="javascript:void(0);" value="'+row.teamId+'" onclick="Administration('+index+','+row.teamId+')"> 管理 </a>';
		return a;
}
/* 管理 */
function Administration(index,teamId){
	
	$("#userList").datagrid("selectRow",index);
	var data = $("#userList").datagrid("getSelected");
	$("#Administration").window({
		onLoad:function(){
			$("#input").val(teamId);
			$("#userList2").datagrid("load",{
				"teamId":data.teamId
			});
			$("#userList1").datagrid("load",{
				"teamId":data.teamId
			});
		}
		
	}).window('open').dialog('setTitle','管理'+teamId+'车队');
}	
/* 映射公司名称 */
function fmtCompanyName(val,row,index){
	return row.busCompanys.companyName;
}
/* 获取选中项的id */
function getSelectionsIds(){
	var userList = $("#userList");
	var sels = userList.datagrid("getSelections");
	var ids = [];
	for(var i in sels){
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
    text:'车队名称：<input id = "serach1" class="search" style="width:60px;"/>',
},{
    text:'所属公司：<input id = "serach2" class="search" style="width:80px;"/>',
},{
    text:'搜索',
    iconCls:'icon-search',
    handler:function(){
    	var serach1=$("#serach1").val();
    	var serach2=$("#serach2").val();
    	console.log(serach1+","+serach2);
    	$("#userList").datagrid("load",{
    	serach1:serach1,
    	serach2:serach2,
    	})
    }
},{
    text:'重置',
    iconCls:'icon-mini-refresh',
    handler:function(){
    	var serach1=$("#serach1").val(" ");
    	var serach2=$("#serach2").val(" ");
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
        		$.messager.alert('提示','必须选择一个商品才能编辑!');
        		return ;
        	}
        	if(ids.indexOf(',') > 0){
        		$.messager.alert('提示','只能选择一个商品!');
        		return ;
        	}
    	$.messager.confirm('确认','确定要修改ID为'+ids+'的用户吗？',function(r){
    		if(r){   
    			$('#userUpdate').window({
    				onLoad:function(){
    					/* 由于获取到的user是一个数组，这里必须加上【0】 */
    					var user = $("#userList").datagrid("getSelections")[0];
    					$("#userUpdate").form("load" , {
    						teamId:user.teamId,
    						teamName:user.teamName,
    						companyName:user.busCompanys.companyName    						
    					});
    				}
    			}).window('open');
    		}
    	});
    }
},{
    text:'批量删除',
    iconCls:'icon-cancel',
    handler:function(){
    	var ids = getSelectionsIds();
    	if(ids.length <1){
        		$.messager.alert('提示','必须选择商品才能删除!');
        		return ;
        	}
    	$.messager.confirm('确认','确定删除ID为 '+ids+' 的会员吗？',function(r){
    	    if (r){
            	$.post("/busTeam/delect",{'ids':ids}, function(data){
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
},{
    text:'导入',
    iconCls:'icon-remove',
    handler:function(){
    	$('#upload').window('open');
    }
},{
    text:'导出',
    iconCls:'icon-remove',
    handler:function(){
    	var optins = $("#userList").datagrid("getPager").data("pagination").options;
    	$("<form>").attr({
    		"action":"/busTeam/chu/excel",
    		"method":"POST"
    	}).appendTo("body").submit();
    }
}];
</script>

</head>
<body>
	<div>
    <table class="easyui-datagrid" id="userList" title="车队管理" 
	       data-options="singleSelect:false,collapsible:true,pagination:true,url:'/busTeam/serach',method:'post',pageSize:5,toolbar:toolbar,pageList:[2,5,10],striped:true,rownumbers:true">
	    <thead>
	        <tr>
	        	<th data-options="field:'ck',checkbox:true"></th>
	        	<th data-options="field:'teamId',width:60,hidden:true">ID</th>
	        	<th data-options="field:'_operate',width:100,align:'center',formatter:formatOper">操作</th>
	            <th data-options="field:'teamName',width:100">所属车队</th>
	         	<th data-options="field:'companyName',width:100,formatter:fmtCompanyName">所属公司</th>
	        </tr>
	    </thead>
	</table>
	</div>
<div id="userAdd" class="easyui-window" title="新增车队" data-options="modal:true,closed:true,iconCls:'icon-save',href:'${pageContext.request.contextPath}/to/Fleet'" style="width:700px;height:400px;padding:10px;">
        The window content.
</div>
<div id="userUpdate" class="easyui-window" title="修改车队" data-options="model:true,closed:true,iconCls:'icon-update',href:'${pageContext.request.contextPath }/to/edit'" style="width:700px;height:400px;padding:10px;">
		The window context.
</div>
<div id="Administration" class="easyui-window" data-options="collapsible:false,maximizable:false,minimizable:false,model:true,closed:true,iconCls:'icon-update',href:'${pageContext.request.contextPath }/to/Administration'" style="width:900px;height:500px;padding:10px;">   
</div>
<div id="upload" class="easyui-dialog" title="上传车队信息" style="width:400px;height:200px;"   
        data-options="closed:true,iconCls:'icon-save',resizable:true,modal:true,href:'${pageContext.request.contextPath }/to/upload'">   
    Dialog Content.    
</div>  
</div>
</body>
</html>
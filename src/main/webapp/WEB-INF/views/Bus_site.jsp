<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>站点管理</title>
<link rel="stylesheet" type="text/css" href="/js/jquery-easyui-1.4.1/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="/js/jquery-easyui-1.4.1/themes/icon.css" />
<script type="text/javascript" src="../../jq/jquery-1.12.4.js"></script>
<script type="text/javascript" src="/js/jquery-easyui-1.4.1/jquery.min.js"></script>
<script type="text/javascript" src="../../js/jquery.form.js"></script>
<script type="text/javascript" src="/js/jquery-easyui-1.4.1/jquery.easyui.min.js"></script>
<script type="text/javascript" src="/js/jquery-easyui-1.4.1/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="/js/common.js"></script>

</head>
<body>
	<div>
    <table class="easyui-datagrid" id="userList" title="" 
	       data-options="singleSelect:false,collapsible:true,pagination:true,url:'/BusSite/allBusStop',method:'post',pageSize:5,toolbar:toolbar,pageList:[2,5,10]
	       ,rownumbers:true
	       ">
	    <thead>
	        <tr>
	        	<th data-options="field:'ck',checkbox:true"></th>
	        	<th data-options="field:'stopId',width:50,hidden:true">站点id</th>
	            <th data-options="field:'stopName',width:200,align:'center'">站点名称</th>
	            <th data-options="field:'province',width:100,align:'center',formatter:fmtProvince">所属区划-省</th>
	            <th data-options="field:'city',width:100,align:'center',formatter:fmtCity">所属区划-市</th>
	            <th data-options="field:'stopArea',width:100,align:'center',formatter:fmtArea">所属区划-县/区</th>
	            <th data-options="field:'stopStatus',width:100,align:'center',formatter:fmtStatus">状态</th>
	        </tr>
	    </thead>
	</table>
	</div>
<div id="addBusSite" class="easyui-window" title="新增站点" data-options="modal:true,closed:true,iconCls:'icon-save',href:'${pageContext.request.contextPath}/to/bus_stop-add'" style="width:700px;height:400px;padding:10px;">
      
</div>
<div id="updateBusSite" class="easyui-window" title="修改站点" data-options="model:true,closed:true,iconCls:'icon-update',href:'${pageContext.request.contextPath }/to/bus_stop-update'" style="width:700px;height:400px;padding:10px;">
		
</div>
<div id="ImportExecl" class="easyui-window" title="Execl导入" data-options="model:true,closed:true,iconCls:'icon-update'" style="width:700px;height:400px;padding:10px;">
		<form method="POST"  enctype="multipart/form-data" id="form1" action="BusSite/ajaxUpload">  
        <table>  
         <tr>  
            <td>上传文件: </td>  
            <td> <input id="upfile" type="file" name="upfile"></td>  
         </tr>  
        <tr>  
            <td><input type="button" value="提交" id="btn" name="btn" ></td>  
         </tr>  
        </table>    
    </form>  
</div>
<script type="text/javascript">
  //ajax 方式上传文件操作  
           
             $(document).ready(function(){ 
             
                $('#btn').click(function(){  
                    if(checkData()){
                        $('#form1').ajaxSubmit({
                            url:'/BusSite/ajaxUpload',  
                            dataType: 'text',  
                            success: resutlMsg,  
                            error: errorMsg  
                        });
                        alert("1");
                        function resutlMsg(msg){  
                            alert(msg);     
                            $("#upfile").val("");  
                        }  
                        function errorMsg(){   
                            alert("导入excel出错！");      
                        }  
                    }  
                }); 
                  //JS校验form表单信息  
             function checkData(){  
                var fileDir = $("#upfile").val();  
                var suffix = fileDir.substr(fileDir.lastIndexOf("."));  
                if("" == fileDir){  
                    alert("选择需要导入的Excel文件！");  
                    return false;  
                }  
                if(".xls" != suffix && ".xlsx" != suffix ){  
                    alert("选择Excel格式的文件导入！");  
                    return false;  
                }  
                return true;  
             } 
             }); 
/* 映射省名称 */
function fmtProvince(val,row,index){
	var name = row.area.city.province.province;
	return name;
}
/* 映射市名称 */
function fmtCity(val,row){
	return row.area.city.city;
}
/* 映射区/县姓名 */
function fmtArea(val,row){
	var stopArea = row.area.area;
	return stopArea;
}
/* 状态 */
function fmtStatus(val,row){
	if(val == 1){
		return "未停用";
	}else if(val == 0){
		return "已停用";
	}
}

function getSelectionsIds(){
	var userList = $("#userList");
	var sels = userList.datagrid("getSelections");
	var ids = [];
	for(var i in sels){
		ids.push(sels[i].stopId);
	}
	
	ids = ids.join(",");
	return ids;
}

var toolbar = [{
    text:'站点名称：<input id = "serach1" class="search" style="width:60px;"/>',
},{
    text:'搜索',
    iconCls:'icon-search',
    handler:function(){
    	var stopName = $("#serach1").val();
	    	$("#userList").datagrid("load",{
	    		stopName :stopName
	    	});
    }
},{
    text:'新增',
    iconCls:'icon-add',
    handler:function(){
    	$('#addBusSite').window('open');
    }
},{
    text:'编辑',
	    iconCls:'icon-edit',
	    handler:function(){
	    	var ids = getSelectionsIds();
	    	console.log(ids.length);
	    	if(ids.length == 0){
	    		$.messager.alert('提示','还未选中要修改的用户');
	    		return;
	    	}else if(ids.indexOf(',')>0){
	    		$.messager.alert('提示','选中多个修改的用户');
	    		return;
	    	}
	    	$.messager.confirm('确认','确定要修改ID为'+ids+'的用户吗？',function(r){
	    		if(r){
	    			$('#updateBusSite').window({
	    				onLoad:function(){
	    					var userList = $("#userList");
	    					/* 由于获取到的user是一个数组，这里必须加上【0】 */
	    			 		var user = userList.datagrid("getSelections")[0];
	    			 		console.log(user);
	    					$("#content").form("load" , {
	    						stopId:user.stopId,
	    						stopName:user.stopName,
	    						province:user.area.city.province.province,
	    						city:user.area.city.city,
	    						stopArea:user.area.area,
	    						stopID:user.area.areaID,
	    						stopStatus:user.stopStatus
	    					});
	    					/* 给隐藏标签，设置id,问题就是只在页面加载的时候赋值一次，不能每次选择后都重新赋值 */					
	    					$('#aArea').val(user.area.areaID);
	    					
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
            	$.post("/BusSite/delBusStop?stopId="+ids,{'ids':ids}, function(data){
            		
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
    text:'导入',
    iconCls:'icon-remove',
    handler:function(){
    	$('#ImportExecl').window('open');
    }
    },'-',{
    text:'导出',
    iconCls:'icon-remove',
    handler:function(){
    	var optins = $("#userList").datagrid("getPager").data("pagination").options;
    	$("<form>").attr({
    		"action":"/BusSite/exportBusStop",
    		"method":"POST"
    	}).appendTo("body").submit();
    }
}];
</script>
</body>
</html>
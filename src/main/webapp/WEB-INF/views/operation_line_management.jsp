<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>车辆管理</title>
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
/* 添加管理列 */

//当前线路id
var lineIds=0;

//映射 管理按钮
function fmtmake(val,row,index){
	var make = '<a href="javascript:void(0);" onclick="manage('+row.lineId+')" >管理</a>';
	make += ' '+'<a href="javascript:void(0);" onclick="lanemanagebus('+row.lineId+')" >分配车辆</a>';
	return make;
}

/* 映射省市区 */
function fmtarea(val,row,index){
	var b = row.area.city.province.province;
	b += row.area.city.city;
	b += row.area.area;
	return b;
}

/* 打开分配车辆页面 */
function lanemanagebus(lineId){
	$('#lineManageBus').window('open').dialog('setTitle','管理'+lineId+'路线的公交车');
	$('#busList').datagrid({
		url:'/bus/all'
	});
	lineIds=lineId;
}

/* 映射车队名称 */
function fmtTeamName(val,row){
	return row.busTeams.teamName;
}

/* 映射车队Id */
function fmtTeamId(val,row){
	return row.busTeams.teamId;
}

/* 默认选中本车队Id */
/* function defaultchoase(){
	var row = $("#busList").datagrid('getRows');
	console.log(row);
	for (var i = 0; i < row.length; i++) {
	console.log(i);
 	      if(row[i]['lineId']==lineIds){
 	      	$('#busList').datagrid('selectRow',1);
 	      } 	      
 	 }
} */

//车辆管理搜索
function quarybusline(){
	var busNumber = $('#selectbus').val();
	$('#busList').datagrid({
		url:'/bus/all',
		queryParams: {
			busNumber:busNumber
		}
	});
}


/* 车辆保存按钮 */
function saveline(){
	var v = getSelectionsIds3();
	$.post("/line/updateBus",{'lineId':lineIds,'busIds':v}, function(data){
        if(data.status == 200){
        	$.messager.alert('提示','修改站点车辆成功!',undefined,function(){
        	$("#busList").datagrid('reload');
        });
        }else{
        	$.messager.alert('提示','修改站点车辆失败!',undefined,function(){
        	$("#busList").datagrid('reload');
        	});
        }
        });	
}

//获取选中管理路线公交车的id
function getSelectionsIds3(){
	var lineList = $("#busList");
	var sels = lineList.datagrid("getSelections");
	console.log(sels);
	var ids = [];
	for(var i in sels){
		ids.push(sels[i].busId);
	}
	ids = ids.join(",");
	return ids;
}

/* 打开line管理页面 */
function manage(lineId){
	$('#lineManage').window('open').dialog('setTitle','管理'+lineId+'路线');
	$('#stopList').datagrid({
		url:'/line/querysingleline',
		queryParams: {
			lineId: lineId
		}
	});
	lineIds=lineId;
}
//上行  下行  显示
function toplow(panduan){
	$('#stopList').datagrid({
		url:'/line/querysingleline',
		queryParams: {
			lineId: lineIds,
			shangxia:panduan
		}
	});
}

//映射上移 下移按钮
 function fmtmake2(val, row, index) {
            var str = "";
            str += '<a href="javascript:void(0);" onclick="moveup(' + index + ')">上行</a>';
            str += ' ';
            str += '<a href="javascript:void(0);" onclick="movedown(' + index + ')">下行</a>';
            str += ' ';
            str += '<a href="javascript:void(0);" onclick="lll(' + row.lineId + ')">详情</a>';
            str += ' ';
            return str;
        }
//下移
function movedown(index){
	var row = $("#stopList").datagrid('getSelected');
	mysort(index,"down","stopList");
}

//上移
function moveup(index){
	var row = $("#stopList").datagrid("getSelected");
	mysort(index,"up","stopList");
}

function mysort(index,type,gridname){
	$("#moveshow").show();
	if("up"==type){
		if(index != 0){
			var toup = $("#"+gridname).datagrid('getData').rows[index];
			var todown = $("#"+gridname).datagrid('getData').rows[index-1];
			$("#"+gridname).datagrid('getData').rows[index] = todown;
			$("#"+gridname).datagrid('getData').rows[index-1] = toup;
			$("#"+gridname).datagrid('refreshRow',index);
			$("#"+gridname).datagrid('refreshRow',index - 1);
			$("#"+gridname).datagrid('selectRow',index - 1);
		}		
	} else if ("down"==type){
		var rows = $("#"+gridname).datagrid("getRows").length;
		if(index != rows-1){
			var todown = $("#"+gridname).datagrid("getData").rows[index];
			var toup = $("#"+gridname).datagrid("getData").rows[index+1];		
			$("#"+gridname).datagrid("getData").rows[index+1] = todown;
			$("#"+gridname).datagrid("getData").rows[index] = toup;
			$("#"+gridname).datagrid("refreshRow",index);
			$("#"+gridname).datagrid("refreshRow",index + 1);
			$("#"+gridname).datagrid("selectRow",index + 1);
		}
		
	}
}

/* 保存按钮 */
function save(){
  	 var rows = $("#stopList").datagrid('getRows')//获取当前页的数据行  
  	 var total = "";
  	 for (var i = 0; i < rows.length; i++) {  
 	      total += rows[i]['stopId']; //获取指定列  
 	      if(i!=rows.length-1){
 	      	total += ",";
 	      } 	      
 	 }
 	 console.log(total);
	$.post("/line/updateshangxia",{'stopIds':total,'lineId':lineIds}, function(data){
        if(data.status == 200){
        	$.messager.alert('提示','修改站点顺序成功!',undefined,function(){
        	$("#stopList").datagrid('reload');
        });
        }else{
        	$.messager.alert('提示','修改站点顺序失败!',undefined,function(){
        	$("#stopList").datagrid('reload');
        	});
        }
        $("#moveshow").hide();
        });	
}



//删除线路上的站点
function deletestop(){
var stopids = getSelectionsIds2();
$.messager.confirm('确认','确定从本路线上移除id为 '+stopids+' 的站点吗？',function(r){
   	if (r){	
	console.log(stopids);
	$.post("/line/deletestop",{'stopIds':stopids,'lineId':lineIds}, function(data){
        if(data.status == 200){
        	$.messager.alert('提示','删除站点顺序成功!',undefined,function(){
        	$("#stopList").datagrid('reload');
        });
        }else{
        	$.messager.alert('提示','删除站点顺序失败!',undefined,function(){
        	$("#stopList").datagrid('reload');
        	});
        }
        });
        
 	}
})	
}
//获取管理路线的id
function getSelectionsIds2(){
	var lineList = $("#stopList");
	var sels = lineList.datagrid("getSelections");
	var ids = [];
	for(var i in sels){
		ids.push(sels[i].stopId);
	}
	ids = ids.join(",");
	return ids;
}

/* 映射公司名称 */
function fmtCompanyName(val,row,index){
	var name = row.busCompany.companyName;
	return name;
}

function formatSet(val,row){
	if(val == 1){
		return "运行";
	}else if(val == 0){
		return "停运";
	}
}
//获取路线的id
function getSelectionsIds(){
	var lineList = $("#lineList");
	var sels = lineList.datagrid("getSelections");
	var ids = [];
	for(var i in sels){
		ids.push(sels[i].lineId);
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
    text:'线路明称：<input id = "serach1" class="search" style="width:60px;"/>',
},{
    text:'所属公司：<input id = "serach2" class="search" style="width:80px;"/>',
},{
    text:'搜索',
    iconCls:'icon-search',
    handler:function(){
    	var lineName = $("#serach1").val();
    	var companyName = $("#serach2").val();
	    $("#lineList").datagrid("load",{
	    	lineName : lineName,
	    	companyName : companyName
	    });
    }
},{
    text:'新增',
    iconCls:'icon-add',
    handler:function(){
    	$('#lineAdd').window('open');
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
    			$('#lineUpdate').window({
	    				onLoad:function(){
	    					var lineList = $("#lineList");
	    					/* 由于获取到的user是一个数组，这里必须加上【0】 */
	    			 		var line = lineList.datagrid("getSelections")[0];
	    					$("#content").form("load" , {
	    						lineId:line.lineId,
	    						lineName:line.lineName,
	    						companyName:line.busCompany.companyName
	    					});
	    					/* 给隐藏标签，设置id,问题就是只在页面加载的时候赋值一次，不能每次选择后都重新赋值 */	    					
	    					$('#companyName1').val(line.busCompany.companyId);
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
            	$.post("/line/delete",{'lineIds':ids}, function(data){
        			if(data.status == 200){
        				$.messager.alert('提示','删除会员成功!',undefined,function(){
        					$("#lineList").datagrid('reload');
        				});
        			}else{
        				$.messager.alert('提示','删除会员失败!',undefined,function(){
        					$("#lineList").datagrid('reload');
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
    	var optins = $("#lineList").datagrid("getPager").data("pagination").options;
    	var page = optins.pageNumber;
    	var rows = optins.pageSize;
    	$("<form>").attr({
    		"action":"/line/export/lineexcel",
    		"method":"POST"
    	}).append("<input type='hidden' name='page' value='"+page+"' />")
    	.append("<input type='hidden' name='rows' value='"+rows+"' />").appendTo("body").submit();
    }
}];

//上行 下行  按钮 css样式
$(document).ready(function(){
	$("#left a").click(function() {
	  $(this).css("background-color","blue");
	  $(this).siblings().css("background-color","#C0C0C0"); 
	});	
})

</script>
</head>
<body>
	<div>
		<table class="easyui-datagrid" id="lineList"
			data-options="singleSelect:false,collapsible:true,pagination:true,url:'/line/all',method:'post',pageSize:5,toolbar:toolbar,pageList:[2,5,10],rownumbers:true">

			<thead>
				<tr>
					<th data-options="field:'ck',checkbox:true"></th>
					<th data-options="field:'lineId',align:'center',width:20,hidden:true">ID</th>
					<th data-options="field:'linemade',align:'center',width:100,formatter:fmtmake">操作</th>
					<th data-options="field:'lineName',align:'center',width:200">线路名称</th>
					<th
						data-options="field:'companyName',align:'center',width:100,formatter:fmtCompanyName">所属公司</th>
					<th
						data-options="field:'lineStatus',width:130,align:'center',formatter:formatSet">运行状态</th>
				</tr>
			</thead>
		</table>
	</div>
	<div id="lineAdd" class="easyui-window" title="新增线路"
		data-options="modal:true,closed:true,iconCls:'icon-save',href:'/to/line-add'"
		style="width:700px;height:400px;padding:10px;"></div>
	<div id="lineUpdate" class="easyui-window" title="修改路线"
		data-options="model:true,closed:true,iconCls:'icon-update',href:'/to/line-update'"
		style="width:700px;height:400px;padding:10px;"></div>
	
	<!-- 管理路线弹出框 -->
	<div id="lineManage" class="easyui-window"
		data-options="model:true,closed:true,iconCls:'icon-update',modal:true"
		style="width:800px;height:400px;padding:10px;">
		<div id="" class="easyui-layout" style="width:100%;height:100%;"
			data-options="border:false">
			<div data-options="region:'west',border:false"
				style="width:50px;font-size: 20px; color: white;" id="left">
				<a href="javascript:void(0);" onclick="toplow(0)"
					class="easyui-linkbutton" data-options="plain:true"
					style="background-color: blue;color: white;width:50px;">上行</a> <a
					href="javascript:void(0);" onclick="toplow(1)"
					class="easyui-linkbutton" data-options="plain:true"
					style="background-color: #C0C0C0;color: white;width:50px;">下行</a>
			</div>
			<div data-options="region:'center'">
				<table class="easyui-datagrid" id="stopList"
					data-options="method:'post',striped:true,fitColumns:true,rownumbers:true,toolbar:'#stopline'">
					<thead>
						<tr>
						<th data-options="field:'ck',checkbox:true"></th>
							<th data-options="field:'linemade',width:120,formatter:fmtmake2">操作</th>
							<th data-options="field:'stopId',width:200,hidden:true">站点Id</th>
							<th data-options="field:'stopName',width:200">站点名称</th>
							<th data-options="field:'stopInfo',width:200">站点详情</th>
							<th data-options="field:'stop',width:200,formatter:fmtarea">站点地址</th>
							
						</tr>
					</thead>
				</table>
			</div>
			
			<div data-options="border:false" id="stopline">
				<input type="button" value="批量删除" onclick="deletestop()" id="delete"> <input
					type="button" value="保存" id="moveshow" onclick="save()"
					style="display: none;">
			</div>
		</div>
	</div>	
	
	<!-- 分配车辆弹出框 -->
	<div id="lineManageBus" class="easyui-window" data-options="model:true,closed:true,iconCls:'icon-update',modal:true"
		style="width:700px;height:400px;padding:10px;">
			<div data-options="region:'center'">
				<table class="easyui-datagrid" id="busList"
					data-options="pagination:true,method:'post',striped:true,fitColumns:true,rownumbers:true,toolbar:'#bustop',pageSize:10,pageList:[2,5,10]">
					<thead>
						<tr>
							<th data-options="field:'ck',checkbox:true"></th>
							<th data-options="field:'busId',width:200,hidden:true">公交车Id</th>
							<th data-options="field:'busNumber',width:200">车牌号</th>
							<th data-options="field:'teamId',width:200,hidden:true,formatter:fmtTeamId">所属车队id</th>
							<th data-options="field:'teamName',width:200,formatter:fmtTeamName">所属车队</th>
						</tr>
					</thead>
				</table>
			</div>
			<div data-options="border:false" id="bustop">
				<input type="text" id="selectbus">
				<input type="button" onclick="quarybusline()" value="搜索车辆"></input> 
				<input type="button" value="保存" onclick="saveline()">
			</div>
	</div>
</body>
</html>
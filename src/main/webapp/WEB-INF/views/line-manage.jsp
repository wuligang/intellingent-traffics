<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">

$('#stopList').combobox({
    	url:'/busTeam/BusTeamByCompanyId'
});


</script>
<div class="easyui-layout" style="width:70%;height:700px;">
	<table class="easyui-datagrid" id="stopList"
	       data-options="method:'post'" >
	    <thead>
	        <tr>
	        	<th data-options="width:60">操作</th>
	            <th data-options="field:'stopName',width:200">站点名称</th>
	        </tr>
	    </thead>
	</table>
</div>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <div style="padding : 10px,10px,10px,10px">
  	<form id="content">
  		 <table cellpadding="5">
  		 	<tr>
  		 		<td>
  		 			<input name="busId" type="hidden"/>
  		 			<input name="driverId" type="hidden">
  		 		</td>
  		 	</tr>
	        <tr>
	            <td>车牌号:</td>
	            <td><input class="easyui-textbox" type="text" name="busNumber" data-options="required:true" style="width: 280px;"></input></td>
	        </tr>
	        <tr>
	            <td>所属公司:</td>
	            <td>
	            	<input id="textdefaut1" name="companyName" class="easyui-combobox"  data-options="
                                     method:'post',
                                     height:20,
                                     required:true" style="width: 200px"/>
                    <input id="companyName1" name="companyName1" type="hidden"/>
	            </td>
	        </tr>
	        <tr>
	            <td>所属车队:</td>
				<td>
                    <input id="textdefaut2" name="teamName" class="easyui-combobox"  data-options="
                                     method:'post',
                                     height:20,
                                     required:true" style="width: 200px"/>
                    <input id="teamId1" name="teamId1" type="hidden"/>
               </td>
            </tr>
	        <tr>
	            <td>司机姓名:</td>
	            <td><input class="easyui-textbox" type="text" name="driverName" data-options="min:1,max:100,precision:0,required:true" />
	            </td>
	        </tr>
	        <tr>
	            <td>司机电话:</td>
	            <td><input class="easyui-textbox" type="text" name="driverPhone" data-options="min:1,max:100,precision:0,required:true" />
	            </td>
	        </tr>
	    </table>
  	</form>
  	<div style="padding:5px">
	    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()">提交</a>
	    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()">重置</a>
	</div>
  </div>
  <script type="text/javascript">
  	/* 映射司机姓名 */
	function fmtDriverName(val,row){
		return row.busDrivers.driverName;
	}
		function submitForm(){
			if(!$("#content").form('validate')){
				$.messager.alert('提示','请把表单填写完整');
				return;
			}
			$.post("/bus/update" , $("#content").serialize() , function (data){
			console.log(data.status);
				if(data.status == 200){
					$.messager.alert('提示','修改会员信息成功');
					$("#userUpdate").window('close');
					$("#userList").datagrid('reload');
					clearForm();
				}else{
					$.messager.alert('提示','修改会员信息不成功');
				}			
			});
		}
		
		function clearForm(){
		    $('#content').form('reset');
		}
		
		$('#textdefaut1').combobox({
    			 url:'/busCompany/allBusCompany',
                 valueField:'companyId',
                 textField:'companyName',
                 editable:false,
    			onSelect:function(rec){
    			    console.log(rec.companyName);
    				$('#textdefaut2').combobox({
    					url:'/busTeam/BusTeamByCompanyId?companyId='+rec.companyId,
    					valueField:'teamId',
    					textField:'teamName',
    					editable:false,
    					//再写一个onselect函数，在用户更改了大队的时候，动态赋值
    					onSelect:function(rec){
    						console.log(rec.teamId);
    						$('#teamId1').val(rec.teamId);
    					}
    				});
    			}
    	});
		
		
		
	</script>

<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>  
<%  
String path = request.getContextPath();  
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%>  
<html>  
  <head>  
    <base href="<%=basePath%>">  
    <script type="text/javascript" src="../../jq/jquery-1.12.4.js"></script>
    <script type="text/javascript" src="/js/jquery-easyui-1.4.1/jquery.easyui.min.js"></script>
  <script type="text/javascript" src="../../js/jquery.form.js"></script></head>  
     <script type="text/javascript">  
            //ajax 方式上传文件操作  
            alert("1");
             $(document).ready(function(){ 
             alert("1"); 
                $('#btn').click(function(){  
                    if(checkData()){
                        $('#form1').ajaxSubmit({
                            url:'BusSite/ajaxUpload',  
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
    </script>   
  <body>    
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
      
  </body>  

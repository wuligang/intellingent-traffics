<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<style>
body{
	background-image:url(../images/ditu_1.jpg);
	z-index:1;
	}
input{
	width:145px;
	margin-top:8px;
	margin-bottom:8px;
	border-radius:10px;
	box-shadow:6px,8px,3px,0px moccasin;
	}
#parent{
	background-image:url(../images/diceng_2.png);
	background-size: 100% auto;
	background-repeat:no-repeat;
	height:500px;
	
	width:1500px;
	z-index:2;
	position:absolute;
	left:35%;
	margin-left:-550px;
	top:40%;
	margin-top:-50px;
	}
#shui{
	background-image:url(../images/shuidi.png);
	height:600px;
	width:600px;
	background-repeat:no-repeat;
	z-index:3;
	position:absolute;
	left:60%;
	margin-left:-340px;
	top:75%;
	margin-top:-500px;
	background-size:60%;
	}
#form1{
	position:absolute;
	left:15%;
	top:10%;
	}
#name{
	left:30px;
	}
#login_in{
	background-color:#06F;
	border-style:none;
	width:150px;
	margin-left:22px;
	}
#reset{
	background-color:#06F;
	border-style:none;
	width:150px;
	margin-left:22px;
	}
</style>

<script type="text/javascript" src="jq/jquery-1.12.4.js"></script>
<script type="text/javascript">
	function denglu(){
		var name = $("#name").val();
		var pwd = $("#pwd").val();
		if((name == null || name == '')||(pwd == null || pwd == '')){
			alert("账户名和密码不能为空！");
			return;
		}else{
			$.ajax({
				url:"/user/login",
				type:"post",
				data:{'name':name,'pwd':pwd},
// 				dataType:"json",
				success:function(data){
					if(data.status == 500){
						alert("名称或者密码出错");						
					}else{
						window.location.href="to/top";
					}
				}
			});
		}
	}
	
	function qingkong(){
		document.getElementById("name").value="";
		document.getElementById("pwd").value="";
	}
</script>
<title>智慧出行登录页面</title>
</head>

<body>

	<div id="parent">
    <div id="shui">
    	<div id="form1">
    	<form>
        <div><img src="../images/logo.png" width="169" height="32" /></div>
        	<table>
            	<tr id="user_tr">
                    <td id="user_img"><img src="../images/user.png" width="15" height="18" /></td>
                    <td id="user_text">
                    <input type="text" id="name" class="name" name="name" placeholder="用户名"/>
                    </td>
                </tr>
                <tr id="pwd_tr">
                    <td id="pwd_img"><img src="../images/pwd.png" width="19" height="21" /></td>
                    <td id="pwd_text">
                    <input type="password" id="pwd" class="pwd" name="pwd" placeholder="密码"/>
                    </td>
                </tr>
            	<tr>
                    <td colspan="2">
                    <input type="button" id="login_in" class="login_in" name="login_in" value="登录" onclick="denglu()"/>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                    <input type="button" id="reset" class="reset" name="reset" value="重置" onclick="qingkong()"/>
                    </td>
                </tr>
            
            </table>
        
        </form>
        </div>
    </div>
    </div>

</body>
</html>
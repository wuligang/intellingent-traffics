<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

</head>
<body>
	<div id="">
		<form id="importForm" enctype="multipart/form-data" method="post"
			action="/busTeam/LeadInUser">
			<input type="file" name="file" id="file" multiple="false"
				style="border:1px solid #d9d9d9;"
				accept="application/vnd.ms-excel,application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" />
		</form>
		<div align="center">
			<input type="submit" value="提交">
		</div>
	</div>
</body>

</html>

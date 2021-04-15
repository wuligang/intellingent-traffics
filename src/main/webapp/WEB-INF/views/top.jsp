<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>智慧出行</title>

<script type="text/javascript" src="../../jq/jquery-1.12.4.js"></script>
<script type="text/javascript" src="../../jq/top.js"></script>
<link rel="stylesheet" href="../../css/top.css" type="text/css"></link>
<style type="text/css">
	iframe {
	    border: 0px;
	}
</style>
</head>
<body>
	<div id="top" style="width: 99.8%;left: 0px;top: 0px;">
			<div id="showtop" class="navTable">
				<div class="nav1">
					<img src="../../images/top/nav1.png"></img>
				</div>
				<div>
					<div class="nav2" style="cursor: pointer;height: 90px;" onclick="addTab('Home_page1')">
						<div class="navson"><img src="../../images/top/nav2.png"/></div>
						<div class="navson1">首页</div>
					</div>
					<div class="nav2" style="cursor: pointer;height: 90px;">
						<div class="navson"><img src="../../images/top/nav3.png"/></div>
						<div class="navson2">位置定位</div>
					</div>
					<div class="nav2" style="cursor: pointer;height: 90px;">
						<div class="navson"><img src="../../images/top/nav4.png"/></div>
						<div class="navson2">路线监控</div>
					</div>
					<div class="nav2" style="cursor: pointer;height: 82px;" onclick="addTab('operation_management')">
						<div class="navson"><img src="../../images/top/nav5.png"/></div>
						<div class="navson2">运营管理</div>
					</div>
					<div class="nav2" style="cursor: pointer;height: 82px;" onclick="addTab('news_management')">
						<div class="navson"><img src="../../images/top/nav6.png"/></div>
						<div class="navson2">信息发布</div>
					</div>
					<div class="nav2" style="cursor: pointer;height: 82px;" onclick="addTab('system_management')">
						<div class="navson"><img src="../../images/top/nav8.png"/></div>
						<div class="navson2">系统管理</div>
					</div>
				</div>
				<div class="rightnav">
					<div class="showtime">
					<!-- 时间 -->
					<span id="time"></span>
					
					</div>
					<div>
						<div class="nav4" style="cursor: pointer;">
							<div><img src="../../images/top/nav11.png"/></div>
							<div class="name" id="name">${nameasd}</div>
						</div>
						<div class="nav4" style="cursor: pointer;"><img src="../../images/top/nav10.png"/></div>
						<div class="nav4" style="cursor: pointer;"><img src="../../images/top/nav9.png"/></div>
					</div>
				</div>
				<div class="table"></div>
			</div>
			<div class="la">
				<!-- 上拉 -->
				<img src="../../images/top/up.png" id="img" style="cursor: pointer;"></img>
			</div>
		<!-- 引入运营管理的子页面 -->
		<div id="showMassage" style="border: 0px;">
			
		</div>
		
	</div>
</body>
</html>
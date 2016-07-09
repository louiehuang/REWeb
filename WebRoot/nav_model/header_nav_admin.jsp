<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>

<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">

<link href="../css/index_nav_style.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="../css/jquery.mmenu.all.css" type="text/css"
	rel="stylesheet" />

<script src="js/jquery.min.js" type="text/javascript"></script>
<script type="text/javascript" src="js/jquery.mmenu.js"></script>

<!-- start top_js_button -->
<script type="text/javascript" src="js/easing.js"></script>
<script type="text/javascript" src="js/move-top.js"></script>

</head>

<body>

	<!-- start header -->
	<div class="top_bg">
		<div class="wrap">
			<div class="header">
				<!--<div class="logo">
						<a href="index.html"><img src="../images/logo.png" alt="" /></a>
					</div>-->
				<div class="log_reg">
					<ul>
						<li><a id="header_a_log" href="../falseIndex.jsp"
							target="_parent">首页</a></li>
						<span class="log"> </span>
						<li><a id="header_a_reg" href="<%=basePath %>am!signOut"
							" target="_parent">退出登陆</a></li>
						<div class="clear"></div>
					</ul>
				</div>
				<div class="web_search">
					<form>
						<input type="text" value="" onfocus="this.value = '';"
							onblur="if (this.value == '') {this.value = '';}"> <input
							type="submit" value=" " />
					</form>
				</div>
				<div class="clear"></div>
			</div>
		</div>
	</div>
	<hr width="100%" />
	<div class="clear"></div>
</body>
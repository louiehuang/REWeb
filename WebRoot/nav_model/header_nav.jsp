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
<script type="text/javascript">
	//	The menu on the left
	$(function() {
		$('nav#menu-left').mmenu();
	});
</script>

<!-- start top_js_button -->
<script type="text/javascript" src="js/easing.js"></script>
<script type="text/javascript" src="js/move-top.js"></script>

<script type="text/javascript">
	jQuery(document).ready(function($) {
		$(".scroll").click(function(event) {
			event.preventDefault();
			$('html,body').animate({
				scrollTop : $(this.hash).offset().top
			}, 1200);
		});
	});
</script>
</head>

<body>

	<!-- start header -->
	<div class="top_bg" >
		<div class="wrap">
			<div class="header">
				<!--<div class="logo">
						<a href="index.html"><img src="../images/logo.png" alt="" /></a>
					</div>-->
				<div class="log_reg">
					<ul>
						<li><a id="header_a_log" href="../admin.jsp" target="_parent">登陆</a></li>
						<span class="log"> </span>
						<li><a id="header_a_reg" href="../register.jsp"" target="_parent">注册</a></li>
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

	<!-- start header_btm -->
	<div class="wrap">
		<div class="header_btm">
			<div class="menu">
				<ul>
					<li class="active"><a href="../im!LoadInfo" target="_parent">首页</a></li>
					<li><a href="../secondhouse.jsp" target="_parent">租房</a></li>
					<li><a href="../secondhouse.jsp" target="_parent">二手房</a></li>
					<li><a href="../newhouse.jsp" target="_parent">新房</a></li>
					<li><a href="../buyer.jsp" target="_parent">求租/购</a></li>
					<li><a href="../seller.jsp" target="_parent">出租/售</a></li>
					<li><a href="../falseIndex.jsp" target="_parent">成交行情</a></li>
					<li><a href="../falseIndex.jsp" target="_parent">资讯</a></li>
					<div class="clear"></div>
				</ul>
			</div>

			<div class="header_right">
				<ul>
					<!--<li><a href="#"><i  class="art"></i><span class="color1">30</span></a></li>
						<li><a href="#"><i  class="cart"></i><span>0</span></a></li>-->
					<li><a href="#"><i class="art"></i><span
							style="padding: 10px">假装我们有移动版</span></a></li>
				</ul>
			</div>
		</div>
	</div>
	<hr width="100%" />
	<div class="clear"></div>
</body>
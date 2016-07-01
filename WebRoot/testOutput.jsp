<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>testOutput</title>

<!--<link href='http://fonts.useso.com/css?family=Maven+Pro:400,900,700,500' rel='stylesheet' type='text/css'>-->
<link href="css/index_nav_style.css" rel="stylesheet" type="text/css"
	media="all" />

<!--- start-mmmenu-script---->
<link href="css/jquery.mmenu.all.css" type="text/css" rel="stylesheet" />
<link href="css/house_style.css" type="text/css" rel="stylesheet" />

<script src="js/jquery.min.js" type="text/javascript"></script>
<script type="text/javascript" src="js/jquery.mmenu.js"></script>
<script type="text/javascript">
	//	The menu on the left
	$(function() {
		$('nav#menu-left').mmenu();
	});
</script>

<!-- start slider -->
<link href="css/slider.css" rel="stylesheet" type="text/css" media="all" />

</head>

<body>

	<!-- 	<c:forEach var="house" items="${list}"> -->
	<!-- 		<div>${house.community}</div> -->
	<!-- 		<div>${house.houseType.name}</div> -->
	<!-- 	</c:forEach> -->

	<div class="grids_of_4">
		<!-- 				循环c:foreach输出 -->

		<c:forEach var="house" items="${houseSellRentList}">
			<div class="grid1_of_4">
				<a href="details.jsp"> <img src=${house.pics } alt="" />
					<div style="height: 30px; padding-left: 2%; text-align: left;">
						<h3>${house.community }</h3>
					</div>
				</a>
				<div class="grid1_of_4_houseTypeWrap">
					<div class="grid1_of_4_houseType">${house.houseType.name }</div>
					<div class="grid1_of_4_houseArea">${house.size }㎡</div>
				</div>

				<div style="height: 40px;">
					<span class="grid1_of_4_priceCell">${house.price }元/月</span> <span
						class="grid1_of_4_commentCell">房评3条</span>
				</div>
			</div>
		</c:forEach>
	</div>
	<div class="clear"></div>

	<div class="grids_of_4">
		<!-- 循环c:foreach输出 -->

		<c:forEach var="house" items="${houseSellEnterpriseList}">
			<div class="grid1_of_4">
				<a href="details.jsp"> <img src=${house.pics } alt="" />
					<div style="height: 30px; padding-left: 2%; text-align: left;">
						<h3>${house.title }</h3>
					</div>
				</a>
				<div class="grid1_of_4_houseTypeWrap">
					<div class="grid1_of_4_houseType">${house.houseType.name }</div>
					<div class="grid1_of_4_houseArea">已售${house.selledNum }套</div>
				</div>

				<div style="height: 40px;">
					<!--split切分，取第一个价格 -->
					<span class="grid1_of_4_priceCell">${fn:split(house.price,";")[0] }元/㎡</span> <span
						class="grid1_of_4_commentCell">房评3条</span>
				</div>
			</div>
		</c:forEach>
	</div>
	<div class="clear"></div>






</body>
</html>

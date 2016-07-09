<%@page import="com.chinasoft.pojo.Users"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
	+ request.getServerName() + ":" + request.getServerPort()
	+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>主页</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">

<link href="css/index_nav_style.css" rel="stylesheet" type="text/css"
	media="all" />
<!--- start-mmmenu-script---->
<link href="css/jquery.mmenu.all.css" type="text/css" rel="stylesheet" />
<link href="css/house_style.css" type="text/css" rel="stylesheet" />

<script src="layer/layer.js"></script>

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

<script type="text/javascript" src="js/jquery.eislideshow.js"></script>
<script type="text/javascript" src="js/easing.js"></script>
<script type="text/javascript">
	$(function() {
		$('#ei-slider').eislideshow({
			animation : 'center',
			autoplay : true,
			slideshow_interval : 3000,
			titlesFactor : 0
		});
	});
</script>

<!-- start top_js_button -->
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
	<%
		if (session.getAttribute("users") != null) {
			System.out.println("普通用户导航");
			Users u = (Users) session.getAttribute("users");
	%>
	<iframe id="header_nav" src="nav_model/header_nav_after.jsp"
		width="100%" height="120px" style="border: 0px;" scrolling="no"></iframe>
	<%
		} else if (session.getAttribute("enterpriseUsers") != null){
			System.out.println("企业用户导航");
	%>
	<iframe id="header_nav" src="nav_model/header_nav_enterprise.jsp"
		width="100%" height="120px" style="border: 0px;" scrolling="no"></iframe>
	<%
		} else if (session.getAttribute("adminUsers") != null){
			System.out.println("管理员导航");
			%>
	<iframe id="header_nav" src="nav_model/header_nav_admin.jsp"
		width="100%" height="45px" style="border: 0px;" scrolling="no"></iframe>
	<%
		} else{
	%>
	<iframe id="header_nav" src="nav_model/header_nav.jsp" width="100%"
		height="120px" style="border: 0px;" scrolling="no"></iframe>
	<% }%>



	<!-- start slider -->
	<div class="slider">
		<!---start-image-slider---->
		<div class="image-slider">
			<div class="wrapper">
				<div id="ei-slider" class="ei-slider">
					<ul class="ei-slider-large">
						<li><img src="images/slider-image1.jpg" alt="image06" />
							<div class="ei-title">
								<h3 class="btn">3000元/月</h3>
								<h2>
									骏景湾豪庭[北新区] <br> 2016 collections
								</h2>
								<h3 class="active">
									地处繁华地段，周边设施完善，邻近汇悦城、<br /> 万达广场银行、超市分布四周，享受优质生活
								</h3>
								<h3>
									<a class="ei_icons" href="details.jsp"><img
										src="images/icon_1.png" alt=""></a> <a class="ei_icons"
										href="details.jsp"><img src="images/icon_2.png" alt=""></a>
									<a class="ei_icons" href="details.jsp"><img
										src="images/icon_3.png" alt=""></a> <a class="ei_icons"
										href="details.jsp"><img src="images/icon_4.png" alt=""></a>
								</h3>
							</div></li>
						<li><img src="images/slider-image2.jpg" alt="image01" />
							<div class="ei-title">
								<h3 class="btn">2800元/月</h3>
								<h2>
									文景阁公寓[华景新城] <br> 2016 collections
								</h2>
								<h3 class="active">
									电梯楼，出入方便、户型方正，使用率高、<br /> 交通便利，附近有BRT，方便出行
								</h3>
								<h3>
									<a class="ei_icons" href="details.jsp"><img
										src="images/icon_1.png" alt=""></a> <a class="ei_icons"
										href="details.jsp"><img src="images/icon_2.png" alt=""></a>
									<a class="ei_icons" href="details.jsp"><img
										src="images/icon_3.png" alt=""></a> <a class="ei_icons"
										href="details.jsp"><img src="images/icon_4.png" alt=""></a>
								</h3>
							</div></li>
						<li><img src="images/slider-image3.jpg" alt="image02" />
							<div class="ei-title">
								<h3 class="btn">300万</h3>
								<h2>
									珠江帝景苑倚泓轩[赤岗] <br> 2016 collections
								</h2>
								<h3 class="active">
									通风采光好。朝向北，房子十分通风透气、<br /> 安静舒适。位于小区中心，安静无嘈杂，非常适合居住
								</h3>
								<h3>
									<a class="ei_icons" href="details.jsp"><img
										src="images/icon_1.png" alt=""></a> <a class="ei_icons"
										href="details.jsp"><img src="images/icon_2.png" alt=""></a>
									<a class="ei_icons" href="details.jsp"><img
										src="images/icon_3.png" alt=""></a> <a class="ei_icons"
										href="details.jsp"><img src="images/icon_4.png" alt=""></a>
								</h3>
							</div></li>
						<li><img src="images/slider-image4.jpg" alt="image03" />
							<div class="ei-title">
								<h3 class="btn">290万</h3>
								<h2>
									侨林苑[天河北] <br> 2016 collections
								</h2>
								<h3 class="active">
									位于天河北CBD中心地段，周边设施齐全，交通便利、<br> 装修质量好，干净整洁，楼层适中，通风采光好
								</h3>
								<h3>
									<a class="ei_icons" href="details.jsp"><img
										src="images/icon_1.png" alt=""></a> <a class="ei_icons"
										href="details.jsp"><img src="images/icon_2.png" alt=""></a>
									<a class="ei_icons" href="details.jsp"><img
										src="images/icon_3.png" alt=""></a> <a class="ei_icons"
										href="details.jsp"><img src="images/icon_4.png" alt=""></a>
								</h3>
							</div></li>
						<li><img src="images/slider-image1.jpg" alt="image04" />
							<div class="ei-title">
								<h3 class="btn">3500元/月</h3>
								<h2>
									广园东东方名都[广园东] <br> 2016 collections
								</h2>
								<h3 class="active">
									客厅宽敞，格局好，明亮通风、<br> 楼层好，安静适宜居住 ，阳台宽阔，视野广
								</h3>
								<h3>
									<a class="ei_icons" href="details.jsp"><img
										src="images/icon_1.png" alt=""></a> <a class="ei_icons"
										href="details.jsp"><img src="images/icon_2.png" alt=""></a>
									<a class="ei_icons" href="details.jsp"><img
										src="images/icon_3.png" alt=""></a> <a class="ei_icons"
										href="details.jsp"><img src="images/icon_4.png" alt=""></a>
								</h3>
							</div></li>
						<li><img src="images/slider-image3.jpg" alt="image05" />
							<div class="ei-title">
								<h3 class="btn">420万</h3>
								<h2>
									英豪花园[南洲] <br> 2016 collections
								</h2>
								<h3 class="active">
									小区拥有专业物业管理，时刻维护好业主生活、<br> 出小区正门不远处就有公交站和地铁站，上班族福音
								</h3>
								<h3>
									<a class="ei_icons" href="details.jsp"><img
										src="images/icon_1.png" alt=""></a> <a class="ei_icons"
										href="details.jsp"><img src="images/icon_2.png" alt=""></a>
									<a class="ei_icons" href="details.jsp"><img
										src="images/icon_3.png" alt=""></a> <a class="ei_icons"
										href="details.jsp"><img src="images/icon_4.png" alt=""></a>
								</h3>
							</div></li>
					</ul>
					<!-- ei-slider-large -->
					<ul class="ei-slider-thumbs">
						<li class="ei-slider-element">Current</li>
						<li><a href="#"> <span class="active">骏景湾豪庭 </span>
								<p>[北新区]</p>
						</a> <img src="images/thumbs/1.jpg" alt="thumb01" /></li>
						<li class="hide"><a href="#"><span>文景阁公寓</span>
								<p>[华景新城]</p> </a><img src="images/thumbs/2.jpg" alt="thumb01" /></li>
						<li class="hide1"><a href="#"><span>帝景苑倚泓轩</span>
								<p>[赤岗]</p></a><img src="images/thumbs/3.jpg" alt="thumb02" /></li>
						<li class="hide1"><a href="#"><span>侨林苑</span>
								<p>[天河北]</p> </a><img src="images/thumbs/4.jpg" alt="thumb03" /></li>
						<li><a href="#"><span>广园东东方名都<br /></span>
								<p>[广园东]</p> </a><img src="images/thumbs/1.jpg" alt="thumb04" /></li>
						<li><a href="#"><span>英豪花园<br /></span>
								<p>[南洲]</p> </a><img src="images/thumbs/5.jpg" alt="thumb05" /></li>
					</ul>
					<!-- ei-slider-thumbs -->
				</div>
				<!-- ei-slider -->
			</div>
			<!-- wrapper -->
		</div>
		<!---End-image-slider---->
	</div>


	<!-- start main -->
	<!--显示求租、求购、出租、出售信息-->
	<div class="main_bg">
		<div class="wrap">
			<div class="main">

				<!--出租房屋信息-->
				<div class="top_main">
					<h2>正在招租的房屋</h2>
					<a href="#">show all</a>
					<div class="clear"></div>
				</div>
				<!-- start grids_of_4 -->
				<div class="grids_of_4">
					<c:forEach var="house" items="${houseSellRentList}">
						<div class="grid1_of_4">
							<a href="<%=basePath %>HouseAction!Info?HId=${house.HId }&&CType=3"> <img
								src=${house.pics.split(";")[0] } alt="" />
								<div style="height: 30px; padding-left: 2%; text-align: left;">
									<h3>${house.community }</h3>
								</div>
							</a>
							<div class="grid1_of_4_houseTypeWrap">
								<div class="grid1_of_4_houseType">${house.houseType.name }</div>
								<div class="grid1_of_4_houseArea">${house.size }m2</div>
							</div>

							<div style="height: 40px;">
								<span class="grid1_of_4_priceCell">${house.price }元/月</span> <span
									class="grid1_of_4_commentCell">房评0条</span>
							</div>
						</div>
					</c:forEach>
					<div class="clear"></div>
				</div>


				<!--企业新房信息-->
				<div class="top_main">
					<h2>正在出售的新房</h2>
					<a href="#">show all</a>
					<div class="clear"></div>
				</div>

				<!-- start grids_of_4 -->
				<div class="grids_of_4">
					<c:forEach var="house" items="${houseSellEnterpriseList}">
						<div class="grid1_of_4">
							<a href="HouseAction!Info?HId=${house.HId }&&CType=1"> <img
								src=${house.pics.split(";")[0] } alt="" />
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
								<span class="grid1_of_4_priceCell">${fn:split(house.price,";")[0] }元/㎡</span>
								<span class="grid1_of_4_commentCell">房评0条</span>
							</div>
						</div>
					</c:forEach>

					<div class="clear"></div>
				</div>

				<!--二手房信息-->
				<div class="top_main">
					<h2>正在出售的二手房</h2>
					<a href="#">show all</a>
					<div class="clear"></div>
				</div>

				<!-- start grids_of_4 -->
				<div class="grids_of_4">
					<c:forEach var="house" items="${houseSellSecondhandList}">
						<div class="grid1_of_4">
							<a href="<%=basePath %>HouseAction!Info?HId=${house.HId}&&CType=2"> <img
								src=${house.pics.split(";")[0] } alt="" />
								<div style="height: 30px; padding-left: 2%; text-align: left;">
									<h3>${house.title }</h3>
								</div>
							</a>
							<div class="grid1_of_4_houseTypeWrap">
								<div class="grid1_of_4_houseType">${house.houseType.name }</div>
								<div class="grid1_of_4_houseArea">${house.size }㎡</div>
							</div>

							<div style="height: 40px;">
								<span class="grid1_of_4_priceCell">${house.price }万</span> <span
									class="grid1_of_4_commentCell">房评0条</span>
							</div>
						</div>
					</c:forEach>
					<div class="clear"></div>
				</div>

				<div class="clear"></div>

			</div>
		</div>
	</div>

	<!--底部导航-->
	<iframe src="nav_model/footer_nav.jsp" width="100%" height="325px"
		style="border: 0px;" scrolling="no"></iframe>


</body>

</html>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>

<head>
<title>主页</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">

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
	<!--iframe导航页面中跳转加上 target="_parent"，使父页面刷新-->
	<iframe src="nav_model/header_nav.html" width="100%" height="120px"
		style="border: 0px;" scrolling="no"></iframe>


	<!-- start slider -->
	<div class="slider">
		<!---start-image-slider---->
		<div class="image-slider">
			<div class="wrapper">
				<div id="ei-slider" class="ei-slider">
					<ul class="ei-slider-large">
						<li><img src="images/slider-image1.jpg" alt="image06" />
							<div class="ei-title">
								<h3 class="btn">2300/month</h3>
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
								<h3 class="btn">19999</h3>
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
						<li><img src="images/slider-image3.jpg" alt="image02" />
							<div class="ei-title">
								<h3 class="btn">19999</h3>
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
						<li><img src="images/slider-image1.jpg" alt="image03" />
							<div class="ei-title">
								<h3 class="btn">19999</h3>
								<h2>
									骏景湾豪庭[北新区] <br> 2016 collections
								</h2>
								<h3 class="active">
									It is a long established fact that a reader<br> Lorem
									Ipsum is that it has a more-or-less
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
						<li><img src="images/slider-image2.jpg" alt="image04" />
							<div class="ei-title">
								<h3 class="btn">19999</h3>
								<h2>
									骏景湾豪庭[北新区] <br> 2016 collections
								</h2>
								<h3 class="active">
									It is a long established fact that a reader<br> Lorem
									Ipsum is that it has a more-or-less
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
								<h3 class="btn">19999</h3>
								<h2>
									骏景湾豪庭[北新区] <br> 2016 collections
								</h2>
								<h3 class="active">
									It is a long established fact that a reader<br> Lorem
									Ipsum is that it has a more-or-less
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
						<li><a href="#"> <span class="active">骏景湾豪庭<br />
									[北新区]
							</span>
								<p>现价2300/月</p>
						</a> <img src="images/thumbs/1.jpg" alt="thumb01" /></li>
						<li class="hide"><a href="#"><span>骏景豪庭</span>
								<p>limited edition</p> </a><img src="images/thumbs/2.jpg"
							alt="thumb01" /></li>
						<li class="hide1"><a href="#"><span>景湾豪庭</span>
								<p>summer is coming</p></a><img src="images/thumbs/3.jpg"
							alt="thumb02" /></li>
						<li class="hide1"><a href="#"><span>骏湾豪庭</span>
								<p>all colors available</p> </a><img src="images/thumbs/4.jpg"
							alt="thumb03" /></li>
						<li><a href="#"><span>骏景湾庭</span>
								<p>free delivery</p> </a><img src="images/thumbs/1.jpg"
							alt="thumb04" /></li>
						<li><a href="#"><span>骏景湾豪</span>
								<p>limited edition</p> </a><img src="images/thumbs/5.jpg"
							alt="thumb05" /></li>
					</ul>
					<!-- ei-slider-thumbs -->
				</div>
				<!-- ei-slider -->
			</div>
			<!-- wrapper -->
		</div>
		<!---End-image-slider---->
	</div>

	<!-- start image1_of_3 -->
	<!--<div class="top_bg">
			<div class="wrap">
				<div class="main1">
					<div class="image1_of_3">
						<img src="images/img1.jpg" alt="" />
						<a href="details.jsp"><span class="tag">on sale</span></a>
					</div>
					<div class="image1_of_3">
						<img src="images/img2.jpg" alt="" />
						<a href="details.jsp"><span class="tag">special offers</span></a>
					</div>
					<div class="image1_of_3">
						<img src="images/img3.jpg" alt="" />
						<a href="details.jsp"><span class="tag">must have</span></a>
					</div>
					<div class="clear"></div>
				</div>
			</div>
		</div>-->

	<!-- start main -->
	<!--显示求租、求购、出租、出售信息-->
	<div class="main_bg">
		<div class="wrap">
			<div class="main">

				<!--Part1-->
				<div class="top_main">
					<h2>正在招租的房屋</h2>
					<a href="#">show all</a>
					<div class="clear"></div>
				</div>
				<!-- start grids_of_4 -->
				<div class="grids_of_4">
				
<!-- 				循环c:foreach输出 -->
					
					<div class="grid1_of_4">
						<a href="details.jsp"> <img src="images/lease_1.jpg" alt="" />
							<div style="height: 30px; padding-left: 2%; text-align: left;">
								<h3>even & odd</h3>
							</div>
						</a>
						<div class="grid1_of_4_houseTypeWrap">
							<div class="grid1_of_4_houseType">2室2厅</div>
							<div class="grid1_of_4_houseArea">180m2</div>

						</div>

						<div style="height: 40px;">
							<span class="grid1_of_4_priceCell">2800元/月</span> <span
								class="grid1_of_4_commentCell">房评3条</span>
						</div>
						</a>
					</div>




					<div class="grid1_of_4">
						<a href="details.jsp"> <img src="images/lease_2.jpg" alt="" />
							<div style="height: 30px; padding-left: 2%; text-align: left;">
								<h3>even & odd</h3>
							</div>
						</a>
						<div class="grid1_of_4_houseTypeWrap">
							<div class="grid1_of_4_houseType">2室2厅</div>
							<div class="grid1_of_4_houseArea">180m2</div>

						</div>

						<div style="height: 40px;">
							<span class="grid1_of_4_priceCell">2500元/月</span> <span
								class="grid1_of_4_commentCell">房评3条</span>
						</div>
						</a>
					</div>
					<div class="grid1_of_4">
						<a href="details.jsp"> <img src="images/lease_3.jpg" alt="" />
							<div style="height: 30px; padding-left: 2%; text-align: left;">
								<h3>even & odd</h3>
							</div>
						</a>
						<div class="grid1_of_4_houseTypeWrap">
							<div class="grid1_of_4_houseType">2室2厅</div>
							<div class="grid1_of_4_houseArea">180m2</div>

						</div>

						<div style="height: 40px;">
							<span class="grid1_of_4_priceCell">3000元/月</span> <span
								class="grid1_of_4_commentCell">房评3条</span>
						</div>
						</a>
					</div>
					<div class="grid1_of_4">
						<a href="details.jsp"> <img src="images/lease_4.jpg" alt="" />
							<div style="height: 30px; padding-left: 2%; text-align: left;">
								<h3>even & odd</h3>
							</div>
						</a>
						<div class="grid1_of_4_houseTypeWrap">
							<div class="grid1_of_4_houseType">2室2厅</div>
							<div class="grid1_of_4_houseArea">180m2</div>

						</div>

						<div style="height: 40px;">
							<span class="grid1_of_4_priceCell">2600元/月</span> <span
								class="grid1_of_4_commentCell">房评3条</span>
						</div>
						</a>
					</div>
					<div class="clear"></div>
				</div>

				<!--Part2-->
				<div class="top_main">
					<h2>正在出售的新房</h2>
					<a href="#">show all</a>
					<div class="clear"></div>
				</div>

				<!-- start grids_of_4 -->
				<div class="grids_of_4">

					<div class="grid1_of_4">
						<a href="details.jsp"> <img src="images/sell1.png" alt="" />
							<div style="height: 30px; padding-left: 2%; text-align: left;">
								<h3>山海四季花园[盐田]</h3>
							</div>
						</a>
						<div class="grid1_of_4_houseTypeWrap">
							<div class="grid1_of_4_houseType">3室1厅</div>
							<div class="grid1_of_4_houseArea">已售100套</div>

						</div>

						<div style="height: 40px;">
							<span class="grid1_of_4_priceCell">80000元/㎡</span> <span
								class="grid1_of_4_commentCell">房评33条</span>
						</div>
						</a>
					</div>

					<div class="grid1_of_4">
						<a href="details.jsp"> <img src="images/sell2.jpg" alt="" />
							<div style="height: 30px; padding-left: 2%; text-align: left;">
								<h3>桂碧园森林城市[罗湖]</h3>
							</div>
						</a>
						<div class="grid1_of_4_houseTypeWrap">
							<div class="grid1_of_4_houseType">2室1厅</div>
							<div class="grid1_of_4_houseArea">已售80套</div>

						</div>

						<div style="height: 40px;">
							<span class="grid1_of_4_priceCell">55000元/㎡</span> <span
								class="grid1_of_4_commentCell">房评22条</span>
						</div>
						</a>
					</div>
					<div class="grid1_of_4">
						<a href="details.jsp"> <img src="images/sell3.jpg" alt="" />
							<div style="height: 30px; padding-left: 2%; text-align: left;">
								<h3>嘉霖悦禧园[龙岗]</h3>
							</div>
						</a>
						<div class="grid1_of_4_houseTypeWrap">
							<div class="grid1_of_4_houseType">3室2厅</div>
							<div class="grid1_of_4_houseArea">已售20套</div>

						</div>

						<div style="height: 40px;">
							<span class="grid1_of_4_priceCell">45000元/㎡</span> <span
								class="grid1_of_4_commentCell">房评19条</span>
						</div>
						</a>
					</div>
					<div class="grid1_of_4">
						<a href="details.jsp"> <img src="images/sell4.jpg" alt="" />
							<div style="height: 35px; padding-left: 2%; text-align: left;">
								<h3>凯旋湾[大鹏新]</h3>
							</div>
						</a>
						<div class="grid1_of_4_houseTypeWrap">
							<div class="grid1_of_4_houseType">2室1厅</div>
							<div class="grid1_of_4_houseArea">已售50套</div>

						</div>

						<div style="height: 40px;">
							<span class="grid1_of_4_priceCell">80000元/㎡</span> <span
								class="grid1_of_4_commentCell">房评13条</span>
						</div>
						</a>
					</div>

					<div class="clear"></div>
				</div>

				<!--Part3-->
				<div class="top_main">
					<h2>正在出售的二手房</h2>
					<a href="#">show all</a>
					<div class="clear"></div>
				</div>

				<!-- start grids_of_4 -->
				<div class="grids_of_4">

					<div class="grid1_of_4">
						<a href="details.jsp"> <img
							src="images/secondhand_sell_1.png" alt="" />
							<div style="height: 30px; padding-left: 2%; text-align: left;">
								<h3>山海四季花园[盐田]</h3>
							</div>
						</a>
						<div class="grid1_of_4_houseTypeWrap">
							<div class="grid1_of_4_houseType">3室2厅</div>
							<div class="grid1_of_4_houseArea">180㎡</div>

						</div>

						<div style="height: 40px;">
							<span class="grid1_of_4_priceCell">360万</span> <span
								class="grid1_of_4_commentCell">房评18条</span>
						</div>
						</a>
					</div>

					<div class="grid1_of_4">
						<a href="details.jsp"> <img
							src="images/secondhand_sell_2.png" alt="" />
							<div style="height: 30px; padding-left: 2%; text-align: left;">
								<h3>桂碧园森林城市[罗湖]</h3>
							</div>
						</a>
						<div class="grid1_of_4_houseTypeWrap">
							<div class="grid1_of_4_houseType">3室1厅</div>
							<div class="grid1_of_4_houseArea">120㎡</div>

						</div>

						<div style="height: 40px;">
							<span class="grid1_of_4_priceCell">310万</span> <span
								class="grid1_of_4_commentCell">房评21条</span>
						</div>
						</a>
					</div>
					<div class="grid1_of_4">
						<a href="details.jsp"> <img
							src="images/secondhand_sell_3.jpg" alt="" />
							<div style="height: 30px; padding-left: 2%; text-align: left;">
								<h3>嘉霖悦禧园[龙岗]</h3>
							</div>
						</a>
						<div class="grid1_of_4_houseTypeWrap">
							<div class="grid1_of_4_houseType">3室1厅</div>
							<div class="grid1_of_4_houseArea">130㎡</div>

						</div>

						<div style="height: 40px;">
							<span class="grid1_of_4_priceCell">210万</span> <span
								class="grid1_of_4_commentCell">房评11条</span>
						</div>
						</a>
					</div>
					<div class="grid1_of_4">
						<a href="details.jsp"> <img
							src="images/secondhand_sell_4.jpg" alt="" />
							<div style="height: 35px; padding-left: 2%; text-align: left;">
								<h3>凯旋湾[大鹏新]</h3>
							</div>
						</a>
						<div class="grid1_of_4_houseTypeWrap">
							<div class="grid1_of_4_houseType">3室1厅</div>
							<div class="grid1_of_4_houseArea">145㎡</div>

						</div>

						<div style="height: 40px;">
							<span class="grid1_of_4_priceCell">150万</span> <span
								class="grid1_of_4_commentCell">房评5条</span>
						</div>
						</a>
					</div>

					<div class="clear"></div>
				</div>

				<div class="clear"></div>

			</div>
		</div>
	</div>
	<!-- start footer -->
	<!--<div class="footer_top">
			<div class="wrap">
				<div class="footer">
					
				</div>
			</div>
		</div>-->

	<!--底部导航-->
	<iframe src="nav_model/footer_nav.html" width="100%" height="325px"
		style="border: 0px;" scrolling="no"></iframe>


</body>

</html>
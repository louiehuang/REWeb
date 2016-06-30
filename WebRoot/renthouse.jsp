<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<title>租房</title>
<meta http-equiv="content-type" content="text/html" charset="UTF-8">
<meta name="description" content="">
<meta name="author" content="WebThemez">

<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="css/isotope.css"
	media="screen" />
<link href="css/animate.css" rel="stylesheet" media="screen">
<!-- Owl Carousel Assets -->
<link href="js/owl-carousel/owl.carousel.css" rel="stylesheet">
<link rel="stylesheet" href="css/styles.css" />


<style>
ul,p {
	margin: 0;
	padding: 0;
}

li {
	list-style: none;
}

.box {
	width: 1000px;
	margin: 40px auto;
}

.box .img {
	float: left;
}

.box .img img {
	width: 160px;
	height: 160px;
}

.box .list {
	float: left;
	width: 500px;
	margin-left: 20px;
	display: inline;
}

.box .list li {
	line-height: 24px;
	font-size: 14px;
}

.list li span {
	font-weight: bold;
}

.font_bk {
	height: 5px;
	width: 100px;
	border: 1px solid lightgray;
}
</style>

<style type="text/css">
#contain {
	width: 100px;
	height: 100px;
	border: 1px solid #13B4BE;
}
</style>


</head>
<body>

	<!--iframe导航页面中跳转加上 target="_parent"，使父页面刷新-->
	<iframe src="nav_model/header_nav.html" width="100%" height="123px"
		style="border: 0px;" scrolling="no"></iframe>


	<div class="container">
		<div style="width:100% height:auto;">
			<div style="float:left;">
				<img src="images/houselist/logo.png"> <a><font size="4"
					face="微软雅黑" color="red">租房</font></a> <a
					style="color: gray;margin-left:25px;">深圳[切换城市]</a>
			</div>
			<div style="float:right;width:360px;height:35px;">
				<span><input id="search_list"
					style="float:left;height:35px ;width:300px;margin-bottom:10px;padding:4px 2px 4px 2px;"
					maxlength="50" type="text" value='' placeholder="请输入房源特征、地址、小区名称…" />
				</span><input name="submit" type="image"
					src="images/houselist/house_search.png"
					style="float:left;height:35px; width:35px;margin-left:20px;" /></span>
			</div>
		</div>
		<br />
		<div style="float:left;width:100%;height:auto;margin-top:35px;">
			<span><img src="images/houselist/area.png" align="middle"><font
				size="4"><b>按区域</b></font></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<span><img src="images/houselist/locate_grey.png"
				align="middle"><font size="4"><b>地图查找</b></font></span>
		</div>
		<div
			style="border: solid 1px;color:gray;float:left;width:100%;height:auto;padding:10px 4px 10px 4px;">
			<div align="left" class="container ">
				<span><font size="4" color="black"><b> 区域：</b> </fon></span> <a><span
					style="font-size:14px;font-family: '微软雅黑';color:dodgerblue;">
						不限</span></a>&nbsp;&nbsp; <a><span
					style="font-size:14px;font-family: '微软雅黑';color:black;"> 福田</span></a>&nbsp;&nbsp;
				<a><span style="font-size:14px;font-family: '微软雅黑';color:black;">
						罗湖</span></a>&nbsp;&nbsp; <a><span
					style="font-size:14px;font-family: '微软雅黑';color:black;"> 南山</span></a>&nbsp;&nbsp;
				<a><span style="font-size:14px;font-family: '微软雅黑';color:black;">
						盐田</span></a>&nbsp;&nbsp; <a><span
					style="font-size:14px;font-family: '微软雅黑';color:black;"> 宝安</span></a>&nbsp;&nbsp;
				<a><span style="font-size:14px;font-family: '微软雅黑';color:black;">
						龙岗</span></a>&nbsp;&nbsp; <a><span
					style="font-size:14px;font-family: '微软雅黑';color:black;">
						龙华新区</span></a>&nbsp;&nbsp; <a><span
					style="font-size:14px;font-family: '微软雅黑';color:black;">
						光明新区</span></a>&nbsp;&nbsp; <a><span
					style="font-size:14px;font-family: '微软雅黑';color:black;">
						坪山新区</span></a>&nbsp;&nbsp; <a><span
					style="font-size:14px;font-family: '微软雅黑';color:black;">
						大鹏新区</span></a>&nbsp;&nbsp; <select
					style="font-size:14px;font-family: '微软雅黑';color:black;" name="more"><option
						selected="selected">更多</option></select>
			</div>
			<div align="left" class="container">
				<span><font size="4" color="black"><b> 均价：</b></font></span> <a><span
					style="font-size:14px;font-family: '微软雅黑';color:dodgerblue;">不限</span></a>&nbsp;&nbsp;
				<a><span style="font-size:14px;font-family: '微软雅黑';color:black;">
						1元/m²以下</span></a>&nbsp;&nbsp; <a><span
					style="font-size:14px;font-family: '微软雅黑';color:black;">
						1-1.5元/m²</span></a>&nbsp;&nbsp; <a><span
					style="font-size:14px;font-family: '微软雅黑';color:black;">
						1.5-2元/m²</span></a>&nbsp;&nbsp; <a><span
					style="font-size:14px;font-family: '微软雅黑';color:black;">
						2-3元/m²</span></a>&nbsp;&nbsp; <a><span
					style="font-size:14px;font-family: '微软雅黑';color:black;">
						3元/m²以上</span></a>&nbsp;&nbsp;

			</div>
			<div align="left" class="container">
				<span><font size="4" color="black"><b> 户型：</b></font></span> <a><span
					style="font-size:14px;font-family: '微软雅黑';color:dodgerblue;">不限</span></a>&nbsp;&nbsp;
				<a><span style="font-size:14px;font-family: '微软雅黑';color:black;">
						一房</span></a>&nbsp;&nbsp; <a><span
					style="font-size:14px;font-family: '微软雅黑';color:black;"> 二房</span></a>&nbsp;&nbsp;
				<a><span style="font-size:14px;font-family: '微软雅黑';color:black;">
						三房</span></a>&nbsp;&nbsp; <a><span
					style="font-size:14px;font-family: '微软雅黑';color:black;"> 四房</span></a>&nbsp;&nbsp;
				<a><span style="font-size:14px;font-family: '微软雅黑';color:black;">
						五房</span></a>&nbsp;&nbsp; <a><span
					style="font-size:14px;font-family: '微软雅黑';color:black;">
						五房以上</span></a>&nbsp;&nbsp;
			</div>
			<div align="left" class="container">
				<span> <font size="4" color="black"><b>类型：</b></font></span> <a><span
					style="font-size:14px;font-family: '微软雅黑';color:dodgerblue;">不限</span></a>&nbsp;&nbsp;
				<a><span style="font-size:14px;font-family: '微软雅黑';color:black;">
						普通住宅</span></a>&nbsp;&nbsp; <a><span
					style="font-size:14px;font-family: '微软雅黑';color:black;">
						复式住宅</span></a>&nbsp;&nbsp; <a><span
					style="font-size:14px;font-family: '微软雅黑';color:black;">
						商住两用</span></a>&nbsp;&nbsp; <a><span
					style="font-size:14px;font-family: '微软雅黑';color:black;"> 别墅</span></a>&nbsp;&nbsp;
				<a><span style="font-size:14px;font-family: '微软雅黑';color:black;">
						商铺</span></a>&nbsp;&nbsp; <a><span
					style="font-size:14px;font-family: '微软雅黑';color:black;"> 写字楼</span></a>&nbsp;&nbsp;
				<a><span style="font-size:14px;font-family: '微软雅黑';color:black;">
						厂房</span></a>&nbsp;&nbsp; <select
					style="font-size:14px;font-family: '微软雅黑';color:black;" name="more"><option
						selected="selected">更多</option></select>
			</div>
		</div>
		<div class="my-area">
			<span style="width:140px;height:20px;float:left;"><img
				src="images/houselist/area.png"><span
				style="font-family: '微软雅黑';font-size:16px;">全部楼盘</span></span></span>
			<div class="my-sort">
				<span style="font-size: 14px;font-family:'微软雅黑';">排序</span> <span
					style="margin-left:15px;font-size: 14px;font-family:'微软雅黑';">默认</span>
				<span style="margin-left:15px;font-size: 14px;font-family:'微软雅黑';">最新</span><img
					src="images/houselist/arrow_down.png" /> <span
					style="margin-left:10px;font-size: 14px;font-family:'微软雅黑';">价格</span><img
					src="images/houselist/arrow_up.png" /> <span
					style="margin-left:10px;font-size: 14px;font-family:'微软雅黑';">面积</span><img
					src="images/houselist/arrow_down.png" />
			</div>
			<span style="float: right;"><span
				style="margin-left:15px;font-size: 16px;font-family:'微软雅黑';">共有<span>_</span>
					个符合要求的楼盘
			</span></span>
		</div>
		<span
			style="float:left;width:100%; background-color:#89d6bc;height:2px;border:none;margin:5px 0px 20px 0px;"></span>
	</div>
	<div class="container">
		<div class="box">
			<div class="img">
				<img src="images/houselist/f3.png" align="middle">
			</div>
			<ul class="list">
				<li style="margin-top:12px;"><span
					style="font-size: 24px;font-family:'微软雅黑';">金地凯旋广场</span><span
					style="font-size: 20px;font-family:'微软雅黑';">（金地龙城中央）</span></li>
				<li style="margin-top:10px;"><span
					style="font-size: 15px;font-family:'微软雅黑';color:gray;"><img
						src="images/houselist/locate_grey.png">广东省深圳市龙岗龙城南路与龙岗大道交界处</span></li>
				<li style="margin-top:10px;"><span
					style="font-size: 15px;font-family:'微软雅黑';">主力户型：<a
						href="/ysl/1565#houseImg-a" target="_blank">&nbsp;3室2厅89㎡</a><span>&nbsp;|</span>
						<a href="/ysl/1565#houseImg-a" target="_blank">&nbsp;3室2厅89㎡</a><span>&nbsp;|</span>
						<a href="/ysl/1565#houseImg-a" target="_blank">&nbsp;全部户型</a><span>&nbsp;|</span>
				</span></li>
				<li style="margin-top:10px;"><span><img
						src="images/houselist/看.png" align="middle">报名看房，免费车接送</span></li>
			</ul>
			<div>
				<div align="right">
					<span><font size="8" color="89d6bc"><b>2000</b></font></span><font
						color="gray">元/月</font>
				</div>
				<div align="right">
					<span style="font-size: 15px;font-family:'微软雅黑';margin-top:60px;">押金：<span
						style="font-size: 15px;font-family:'微软雅黑';">1500</span>元
					</span></span> &nbsp;<span style="font-size: 15px;font-family:'微软雅黑';">最低租期：<span
						style="font-size: 15px;font-family:'微软雅黑';">6</span>个月
					</span></span>
				</div>
				<div align="right">
					<img src="images/houselist/phone.png"> <span
						style="font-size: 16px;font-family:'微软雅黑';">400-8869-200</span>
				</div>
			</div>
		</div>
	</div>
	</div>
	<div class="container">
		<div class="box">
			<div class="img">
				<img src="images/houselist/f3.png" align="middle">
			</div>
			<ul class="list">
				<li style="margin-top:12px;"><span
					style="font-size: 24px;font-family:'微软雅黑';">金地凯旋广场</span><span
					style="font-size: 20px;font-family:'微软雅黑';">（金地龙城中央）</span></li>
				<li style="margin-top:10px;"><span
					style="font-size: 15px;font-family:'微软雅黑';color:gray;"><img
						src="images/houselist/locate_grey.png">广东省深圳市龙岗龙城南路与龙岗大道交界处</span></li>
				<li style="margin-top:10px;"><span
					style="font-size: 15px;font-family:'微软雅黑';">主力户型：<a
						href="/ysl/1565#houseImg-a" target="_blank">&nbsp;3室2厅89㎡</a><span>&nbsp;|</span>
						<a href="/ysl/1565#houseImg-a" target="_blank">&nbsp;3室2厅89㎡</a><span>&nbsp;|</span>
						<a href="/ysl/1565#houseImg-a" target="_blank">&nbsp;全部户型</a><span>&nbsp;|</span>
				</span></li>
				<li style="margin-top:10px;"><span><img
						src="images/houselist/看.png" align="middle">报名看房，免费车接送</span></li>
			</ul>
			<div>
				<div align="right">
					<span><font size="8" color="89d6bc"><b>2000</b></font></span><font
						color="gray">元/月</font>
				</div>
				<div align="right">
					<span style="font-size: 15px;font-family:'微软雅黑';margin-top:60px;">押金：<span
						style="font-size: 15px;font-family:'微软雅黑';">1500</span>元
					</span></span> &nbsp;<span style="font-size: 15px;font-family:'微软雅黑';">最低租期：<span
						style="font-size: 15px;font-family:'微软雅黑';">6</span>个月
					</span></span>
				</div>
				<div align="right">
					<img src="images/houselist/phone.png"> <span
						style="font-size: 16px;font-family:'微软雅黑';">400-8869-200</span>
				</div>
			</div>
		</div>
	</div>
	</div>
	<div class="container">
		<div class="box">
			<div class="img">
				<img src="images/houselist/f3.png" align="middle">
			</div>
			<ul class="list">
				<li style="margin-top:12px;"><span
					style="font-size: 24px;font-family:'微软雅黑';">金地凯旋广场</span><span
					style="font-size: 20px;font-family:'微软雅黑';">（金地龙城中央）</span></li>
				<li style="margin-top:10px;"><span
					style="font-size: 15px;font-family:'微软雅黑';color:gray;"><img
						src="images/houselist/locate_grey.png">广东省深圳市龙岗龙城南路与龙岗大道交界处</span></li>
				<li style="margin-top:10px;"><span
					style="font-size: 15px;font-family:'微软雅黑';">主力户型：<a
						href="/ysl/1565#houseImg-a" target="_blank">&nbsp;3室2厅89㎡</a><span>&nbsp;|</span>
						<a href="/ysl/1565#houseImg-a" target="_blank">&nbsp;3室2厅89㎡</a><span>&nbsp;|</span>
						<a href="/ysl/1565#houseImg-a" target="_blank">&nbsp;全部户型</a><span>&nbsp;|</span>
				</span></li>
				<li style="margin-top:10px;"><span><img
						src="images/houselist/看.png" align="middle">报名看房，免费车接送</span></li>
			</ul>
			<div>
				<div align="right">
					<span><font size="8" color="89d6bc"><b>2000</b></font></span><font
						color="gray">元/月</font>
				</div>
				<div align="right">
					<span style="font-size: 15px;font-family:'微软雅黑';margin-top:60px;">押金：<span
						style="font-size: 15px;font-family:'微软雅黑';">1500</span>元
					</span></span> &nbsp;<span style="font-size: 15px;font-family:'微软雅黑';">最低租期：<span
						style="font-size: 15px;font-family:'微软雅黑';">6</span>个月
					</span></span>
				</div>
				<div align="right">
					<img src="images/houselist/phone.png"> <span
						style="font-size: 16px;font-family:'微软雅黑';">400-8869-200</span>
				</div>
			</div>
		</div>
	</div>
	</div>
	<div class="container">
		<div class="box">
			<div class="img">
				<img src="images/houselist/f3.png" align="middle">
			</div>
			<ul class="list">
				<li style="margin-top:12px;"><span
					style="font-size: 24px;font-family:'微软雅黑';">金地凯旋广场</span><span
					style="font-size: 20px;font-family:'微软雅黑';">（金地龙城中央）</span></li>
				<li style="margin-top:10px;"><span
					style="font-size: 15px;font-family:'微软雅黑';color:gray;"><img
						src="images/houselist/locate_grey.png">广东省深圳市龙岗龙城南路与龙岗大道交界处</span></li>
				<li style="margin-top:10px;"><span
					style="font-size: 15px;font-family:'微软雅黑';">主力户型：<a
						href="/ysl/1565#houseImg-a" target="_blank">&nbsp;3室2厅89㎡</a><span>&nbsp;|</span>
						<a href="/ysl/1565#houseImg-a" target="_blank">&nbsp;3室2厅89㎡</a><span>&nbsp;|</span>
						<a href="/ysl/1565#houseImg-a" target="_blank">&nbsp;全部户型</a><span>&nbsp;|</span>
				</span></li>
				<li style="margin-top:10px;"><span><img
						src="images/houselist/看.png" align="middle">报名看房，免费车接送</span></li>
			</ul>
			<div>
				<div align="right">
					<span><font size="8" color="89d6bc"><b>2000</b></font></span><font
						color="gray">元/月</font>
				</div>
				<div align="right">
					<span style="font-size: 15px;font-family:'微软雅黑';margin-top:60px;">押金：<span
						style="font-size: 15px;font-family:'微软雅黑';">1500</span>元
					</span></span> &nbsp;<span style="font-size: 15px;font-family:'微软雅黑';">最低租期：<span
						style="font-size: 15px;font-family:'微软雅黑';">6</span>个月
					</span></span>
				</div>
				<div align="right">
					<img src="images/houselist/phone.png"> <span
						style="font-size: 16px;font-family:'微软雅黑';">400-8869-200</span>
				</div>
			</div>
		</div>
	</div>
	</div>

	<!--底部导航-->
	<iframe src="nav_model/footer_nav.html" width="100%" height="325px"
		style="border: 0px;" scrolling="no"></iframe>

</body>
</html>
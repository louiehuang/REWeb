<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title></title>
		
		<!--index_nav_style包括首页和导航的样式-->
		<link href="../css/index_nav_style.css" rel="stylesheet" type="text/css" media="all" />
		<link href="../css/jquery.mmenu.all.css" type="text/css" rel="stylesheet" />
		
	</head>

	<body>
		<!-- start footer -->
		<div class="footer_mid">
			<div class="wrap">
				<div class="footer">
					<div class="f_search">
						<form>
							<input type="text" value="" placeholder="Enter email for newsletter" />
							<input type="submit" value="" />
						</form>
					</div>
					<div class="soc_icons">
						<ul>
							<li>
								<a class="icon1" href="#"></a>
							</li>
							<li>
								<a class="icon2" href="#"></a>
							</li>
							<li>
								<a class="icon3" href="#"></a>
							</li>
							<li>
								<a class="icon4" href="#"></a>
							</li>
							<li>
								<a class="icon5" href="#"></a>
							</li>
						</ul>
					</div>
					<div class="clear"></div>
				</div>
			</div>
		</div>

		<!-- start footer -->
		<div class="footer_bg">
			<div class="wrap">
				<div class="footer">
					<div class="footer_link">
						<ul>
							<li><a href="#">友情链接：</a></li>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<li><a href="#">新浪乐居 /</a></li>
							<li><a href="http://www.hlyin.space" target="_blank">黄刘胤主页 /</a></li>
							<li><a href="#">百度地产 /</a></li>
							<li><a href="#">守望先锋 /</a></li>
							<li><a href="#">魔兽世界 /</a></li>
							<li><a href="#">炉石传说 </a></li>
						</ul>
					</div>

					<hr style="FILTER: progid:DXImageTransform.Microsoft.Shadow(color:#FFFFFF,direction:145,strength:15)" width="100%" color=#99998F SIZE=1>

					<div style="clear: both; margin-top: 20px;">

						<div class="f_nav1">
							<ul>
								<li><a href="../index.html" target="_parent">主页 /</a></li>
								<li><a href="#" target="_parent">关于我们 /</a></li>
								<li><a href="#" target="_parent">资瓷我们/</a></li>
								<li><a href="#" target="_parent">联系我们 /</a></li>
								<li><a href="#" target="_parent">站点地图</a></li>
								<li><a href="#" target="_parent">用户协议</a></li>
							</ul>
						</div>

						<div class="copy">
							<p class="link"><span>Copyright &copy; 2016.&nbsp;
							干一票就跑有限公司 All rights reserved.
						</p>
						</div>
					</div>
					
					<div class="clear"></div>
				</div>
			</div>
		</div>
		
	</body>
</html>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>

<head>
<title>企业用户登陆</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">

<!--<link href='http://fonts.useso.com/css?family=Maven+Pro:400,900,700,500' rel='stylesheet' type='text/css'>-->
<link href="css/index_nav_style.css" rel="stylesheet" type="text/css"
	media="all" />

<!--- start-mmmenu-script---->
<link href="css/jquery.mmenu.all.css" type="text/css" rel="stylesheet" />
<link href="css/house_style.css" type="text/css" rel="stylesheet" />
<link href="css/bootstrap-combined.min.css" rel="stylesheet"
	media="screen">

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






<script type="text/javascript">

	/*用户登录，JsonAction中处理*/
	function EnterUserLogin() {
		var UAccount = $("#login_UAccount").val();
		var UPwd = $("#login_UPwd").val();

		//alert(UAccount + ", " + UPwd);

		var span = document.getElementById("EnterUserLoginResSpan");

		if (UAccount == "") {
			span.innerHTML = "<font color='red'>请输入账号</font>";
		} else if (UPwd == "") {
			span.innerHTML = "<font color='red'>请输入密码</font>";
		} else {
			//均输入
			$
					.ajax({
						url : 'json_loginEnterUser.action',
						type : 'post',
						dataType : "json",
						data : {
							"enterUsers.UAccount" : UAccount,
							"enterUsers.UPwd" : UPwd,
						},
						//async : false, //默认为true 异步   
						error : function() {
							alert('error');
						},
						success : function(data) {
							if (data.euserLoginFlag == "1") {
								document
										.getElementById("EnterUserLoginResSpan").innerHTML = "<font color='red'>"
										+ UAccount + "账号或密码错误</font>";
							} else if (data.euserLoginFlag == "0") {
								window.location.href = 'im!LoadInfo';
							}
						}
					});
		}

	}
</script>



</head>

<body>
	<!--iframe导航页面中跳转加上 target="_parent"，使父页面刷新-->
	<%
		if (session.getAttribute("users") == null) {
	%>
	<iframe id="header_nav" src="nav_model/header_nav.jsp" width="100%"
		height="123px" style="border: 0px;" scrolling="no"></iframe>
	<%
		} else {
	%>
	<iframe id="header_nav" src="nav_model/header_nav_after.jsp"
		width="100%" height="120px" style="border: 0px;" scrolling="no"></iframe>
	<%
		}
	%>

	<!--<hr width="100%"/>-->

	<!-- start main -->
	<div class="main_bg">
		<div class="wrap">
			<div class="main">

				<div class="login_center" style="margin: 50px auto; border:1px solid #89d6bc">
					<div class="registration_left">
						<h3>登陆企业账号</h3>
						<!-- start registration -->
						<div class="registration">
							<script>
								(function() {

									// Create input element for testing
									var inputs = document
											.createElement('input');

									// Create the supports object
									var supports = {};

									supports.autofocus = 'autofocus' in inputs;
									supports.required = 'required' in inputs;
									supports.placeholder = 'placeholder' in inputs;

									// Fallback for autofocus attribute
									if (!supports.autofocus) {

									}

									// Fallback for required attribute
									if (!supports.required) {

									}

									// Fallback for placeholder attribute
									if (!supports.placeholder) {

									}

									// Change text inside send button on submit
									var send = document
											.getElementById('register-submit');
									if (send) {
										send.onclick = function() {
											this.innerHTML = '...Sending';
										}
									}

								})();
							</script>

							<div class="registration_left">
								<div class="registration_form">
									<!--隐藏域 -->
									<input type="hidden" name="request_type" value="Login_Request" />

									<div>
										<label> <input placeholder="用户名:" type="text"
											id="login_UAccount" name="enterUsers.Uname" tabindex="3"
											required="">
										</label>
									</div>
									<div>
										<label> <input placeholder="密码" type="password"
											id="login_UPwd" name="enterUsers.UPwd" tabindex="4"
											required="">
										</label>
									</div>


									<p>
										<span id="EnterUserLoginResSpan"></span>
									</p>


									<div>
										<input type="submit" style="width: 200px" value="登陆"
											id="login-submit" onclick="EnterUserLogin()"> <span
											style="float:right;padding-right:50px;"> <img
											src="images/enterprise1.jpg" align="middle"> <a
											style="font-size:14px; color:#89d6bc;" href="register.jsp">个人用户登陆</a>
										</span>
									</div>
									
									<div class="forget">
										<a href="#">忘记密码</a>
									</div>

								</div>
							</div>
						</div>
						<!-- end registration -->
					</div>
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

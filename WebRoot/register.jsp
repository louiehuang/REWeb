<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<title>用户注册</title>
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
	function UserAccountCheck() {
		var UAccount = $("#inputUserAccount").attr("value");
		if (UAccount == "") {
			document.getElementById("UserAccountCheckSpan").innerHTML = "";
			document.getElementById("register-submit").disabled = true;
		} else {
			$
					.ajax({
						url : 'json_queryUser.action',
						type : 'post',
						dataType : "json",
						data : {
							"user.UAccount" : UAccount
						},
						//async : false, //默认为true 异步   
						error : function() {
							alert('error');
						},
						success : function(data) {
							if (data.userAccount == "1") {
								document.getElementById("UserAccountCheckSpan").innerHTML = "<font color='red'>"
										+ UAccount + "已被注册</font>";
								//document.getElementById("register-submit").disabled = true;

							} else if (data.userAccount == "0") {
								document.getElementById("UserAccountCheckSpan").innerHTML = "<font color='green'>"
										+ UAccount + "可以注册</font>";
								document.getElementById("register-submit").disabled = false;
							}
						}
					});
		}
	}

	function UserPwdCheck() {
		var pwd1 = document.getElementById("pwd1").value;
		var pwd2 = document.getElementById("pwd2").value;
		if (pwd1 == pwd2) {
			document.getElementById("UserPwdCheckSpan").innerHTML = "<font color='green'>两次密码一致</font>";
			document.getElementById("register-submit").disabled = false;
		} else {
			document.getElementById("UserPwdCheckSpan").innerHTML = "<font color='red'>两次密码输入不一致</font>";
			document.getElementById("register-submit").disabled = true;
		}
	}

	function UserEmailCheck() {
		var UEmail = $("#inputUserEmail").attr("value");

		var re = /^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;
		if (re.test(UEmail)) {
			document.getElementById("UserEmailCheckSpan").innerHTML = "";
			document.getElementById("register-submit").disabled = false;
		} else {
			document.getElementById("UserEmailCheckSpan").innerHTML = "<font color='red'>请输入正确的邮箱地址</font>";
			document.getElementById("register-submit").disabled = true;
		}

	}

	function UserTeleCheck() {
		var UTele = $("#inputUserTele").attr("value");

		var re = /^1[3|4|5|7|8]\d{9}$/;
		if (re.test(UTele)) {
			document.getElementById("UserTeleCheckSpan").innerHTML = "";
			document.getElementById("register-submit").disabled = false;
		} else {
			document.getElementById("UserTeleCheckSpan").innerHTML = "<font color='red'>请输入正确的手机号码</font>";
			document.getElementById("register-submit").disabled = true;
		}
	}

	
	/*用户登录，JsonAction中处理*/
	function UserLogin() {
		var UAccount = $("#login_UAccount").val();
		var UPwd = $("#login_UPwd").val();
		var span = document.getElementById("UserLoginResSpan");

		if (UAccount == "") {
			span.innerHTML = "<font color='red'>请输入账号</font>";
		} else if (UPwd == "") {
			span.innerHTML = "<font color='red'>请输入密码</font>";
		} else {
			//均输入
			$
					.ajax({
						url : 'json_loginUser.action',
						type : 'post',
						dataType : "json",
						data : {
							"user.UAccount" : UAccount,
							"user.UPwd" : UPwd,
						},
						//async : false, //默认为true 异步   
						error : function() {
							alert('error');
						},
						success : function(data) {
							if (data.userLoginFlag == "1") {
								document.getElementById("UserLoginResSpan").innerHTML = "<font color='red'>"
										+ UAccount + "账号或密码错误</font>";

							} else if (data.userLoginFlag == "0") {
								window.location.href = 'im!LoadInfo';
							}
						}
					});

		}

	}

	$(document).ready(function() {

		//UserLogin

	});
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

				<div class="login_left">
					<h3>创建新账号</h3>
					<p>通过创建账号，您可以通过邮件更快地查询处理.</p>
					<div class="registration_left">
						<a href="#">
							<div class="reg_fb">
								<img style="width: 30px;" src="images/qq.png" alt=""><i>使用QQ账号注册</i>
								<div class="clear"></div>
							</div>
						</a>
						<!--注册表单 -->
						<div class="registration_form">
							<!-- Form -->
							<form id="registration_form" action="um!register" method="post">


								<div>
									<label> <input id="inputUserAccount" placeholder="账号:"
										type="text" onBlur="UserAccountCheck()" value=""
										name="users.UAccount" tabindex="1" required="" autofocus="">
									</label>

									<p>
										<span id="UserAccountCheckSpan"></span>
									</p>


								</div>

								<div>
									<label> <input placeholder="用户名:" type="text"
										value="testUser" name="users.UName" tabindex="1" required=""
										autofocus="">
									</label>
								</div>

								<div>
									<label> <input placeholder="密码：" id="pwd1"
										onkeyup="passwordCheck()" name="users.UPwd" type="password"
										tabindex="4" required="">
									</label>
								</div>
								<div>
									<label> <input placeholder="再次输入密码：" id="pwd2"
										onkeyup="UserPwdCheck()" type="password" tabindex="4"
										required="">
									</label>

									<p>
										<span id="UserPwdCheckSpan"></span>
									</p>


								</div>
								<div class="sky_form">
									<ul>
										<li><label class="radio left"><input type="radio"
												name="radio" checked=""><i>男</i></label></li>
										<li><label class="radio"><input type="radio"
												name="radio"><i>女</i></label></li>
									</ul>
								</div>
								<div>
									<label> <input placeholder="邮箱地址:" name="users.UEmail"
										id="inputUserEmail" onblur="UserEmailCheck()"
										value="1015110020@qq.com" style="text-transform: none;"
										type="email" tabindex="3" required="">
									</label>


									<p>
										<span id="UserEmailCheckSpan"></span>
									</p>

								</div>
								<div>
									<label> <input placeholder="手机号码:" type="text"
										id="inputUserTele" onblur="UserTeleCheck()"
										value="15920000000" name="users.UTele" tabindex="5"
										required="">
									</label>


									<p>
										<span id="UserTeleCheckSpan"></span>
									</p>

								</div>

								<!--UCredit默认值 -->
								<input type="hidden" value="1" name="users.UCredit">

								<div></div>
								<div>
									<input type="submit" style="width: 200px;" value="注册"
										id="register-submit">
								</div>
								<div class="sky_form">
									<label class="checkbox"> <input type="checkbox"
										name="checkbox" required=""> <i>我同意<a
											class="terms" href="#"> 服务条款</a>
									</i></label>
								</div>
							</form>
							<!-- /Form -->
						</div>
					</div>
				</div>



				<div class="login_left">
					<h3>登陆账号</h3>
					<p>您也可以使用QQ账号进行登陆.</p>
					<!-- start registration -->
					<div class="registration">
						<!-- [if IE] 
		    < link rel='stylesheet' type='text/css' href='ie.css'/>  
		 [endif] -->

						<!-- [if lt IE 7]>  
		    < link rel='stylesheet' type='text/css' href='ie6.css'/>  
		<! [endif] -->
						<script>
							(function() {

								// Create input element for testing
								var inputs = document.createElement('input');

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
							<a href="#">
								<div class="reg_fb">
									<img style="width: 30px;" src="images/qq.png" alt=""><i>使用QQ账号登陆</i>
									<div class="clear"></div>
								</div>
							</a>
							<div class="registration_form">
								<div>
									<label> <input placeholder="账号:" type="text"
										value="test" id="login_UAccount" name="users.UAccount"
										tabindex="3" required="">
									</label>
								</div>
								<div>
									<label> <input placeholder="密码" type="password"
										id="login_UPwd" name="users.UPwd" tabindex="4" required="">
									</label>
								</div>


								<p>
									<span id="UserLoginResSpan"></span>
								</p>

								<div>
									<input type="submit" style="width: 200px" value="登陆"
										id="login-submit" onclick="UserLogin()">

								</div>

								<div class="forget">
									<a href="#">忘记密码</a>
								</div>
							</div>
						</div>
					</div>
					<!-- end registration -->

					<div>
						<span style="float:left;"> 
							<a style="font-size:14px; color:#43CD80;"
							href="login_admin.jsp">管理员登陆</a>
						</span> 
						<span style="float:right;"> 
							<img src="images/enterprise1.jpg" align="middle"> 
								<a style="font-size:14px; color:#43CD80;"
								href="register_enterprise.jsp">企业用户登陆</a>
						</span>

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
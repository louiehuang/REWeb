<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!DOCTYPE html>
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
</head>

<body>

		<div class="wrap ">
			<div class="main">
            	<div class="login_left ">
					<p>您也可以使用QQ账号进行登陆.</p>
					<!-- start registration -->
					<div class="registration container">
						
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
								<!-- Form -->
								<form id="registration_form" action="enterUserManage!json_loginEnterUser" method="post">

									<!--隐藏域 -->
									<input type="hidden" name="request_type" value="Login_Request" />

									<div>
										<label> <input placeholder="账号:" type="text"
											name="enterUsers.UAccount" tabindex="1" required="">
										</label>
									</div>
									<div>
										<label> <input placeholder="密码" type="password"
											name="enterUsers.UPwd" tabindex="2" required="">
										</label>
									</div>
									<div>
										<input type="submit"  style="width: 200px" value="登陆"
											id="register-submit">
									</div>
									<div class="forget">
										<a href="#">忘记密码</a>
									</div>
								</form>
								<!-- /Form -->
							</div>
						</div>
					</div>
					<!-- end registration -->
				</div>

				<div class="clear"></div>
			</div>
		</div>
	
</body>
</html>
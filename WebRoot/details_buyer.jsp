<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="com.chinasoft.pojo.Users"%>
<style>
body{ margin:auto; height:100%}
html{ height:100%} /*兼容firefox的div高度100%*/
#left{ position:absolute; top:250; left:400; width:400px; height:50%; background-color:ffffff}
#right{ position:absolute; top:250; left:800; width:400px; height:50%; background-color:ffffff}
</style>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>求购详细信息</title>
<link href="css/bootstrap-combined.min.css" rel="stylesheet"
	media="screen">
<link href="css/detail_style.css" rel="stylesheet" media="screen">

<script type="text/javascript" src="js/common/jquery-2.0.0.min.js"></script>
<!-- 		<script type="text/javascript" src="js/common/jquery-ui"></script> -->
<script type="text/javascript" src="js/common/bootstrap.min.js"></script>


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

<div class="container-fluid mt back" align="center">
	<h1 style="text-decoration: none;font-weight:bold;color:#000000;font-size: 30px;">求购南山周边的学区房</h1>
    <div class="other">
        	发布时间：${param.hDate}
        <span id="edit"></span>
    </div>
</div>
 <div id="left" >
	      <div style="padding-left:60px;border-right:gray solid;">
	            <div style="padding-top:80px;padding-bottom:30px;">
				    <strong>户型:</strong>${param.houseType}
                </div>
                <div style="padding-bottom:30px;">
				    <strong>建筑面积:</strong>${param.size} 
				</div>
				<div style="padding-bottom:30px">
					<strong>价格</strong>${param.price} 万元
				</div>
				<div style="padding-bottom:30px">
					<strong>入住:</strong>${param.hDate} 之前
				</div>
			</div>
	 </div>
<div id="right">
	       <div style="padding-left:60px;">
			    <div style="fl;padding-top:60px;">
					<img src="images/details/details1.jpg" />
			    </div>
				<div>
					<p style="padding-top:0px;padding-bottom:15px"><strong>联系人:</strong> <span style="color:#1CA261">${param.username}</span></p>
					<p style="padding-bottom:15px"><strong>信用等级:</strong><span style="color:#1CA261">${param.credit}</span></p>
					<p style="padding-bottom:15px"><strong>用户认证:</strong><span style="color:#1CA261">已认证</span></p>
					<p style="padding-bottom:15px"><strong>联系电话:</strong><span style="color:#1CA261">${param.phone}</span>
				</div>
	      </div>						
    </div>
 
<div style="margin-left:300px;margin-right:300px;border-top:gray solid;border-width:2px;padding-top:410px;">
	<div class="conleft">
    	<div style="maincon;border-top:gray solid;border-width:2px;padding-top:30px;" name="data_2">
    	${param.remark}</div>
	</div>
	<div>
	</br></br></br></br></br></br></br></br></br>
	</div>
</div>
<iframe src = "nav_model/footer_nav.jsp" width="100%" height="325px" style="border: 0px;" scrolling="no"></iframe>			
  </body>
</html>

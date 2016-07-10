<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.chinasoft.pojo.Users"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="content-type" content="text/html" charset="UTF-8">
<meta name="description" content="">
<meta name="author" content="WebThemez">
<title>求租</title>

<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="css/isotope.css" media="screen" />
<link href="css/animate.css" rel="stylesheet" media="screen">
<!-- Owl Carousel Assets -->
<link href="js/owl-carousel/owl.carousel.css" rel="stylesheet">
<link rel="stylesheet" href="css/styles.css" />
<!-- Font Awesome -->
<link href="font/css/font-awesome.min.css" rel="stylesheet">

<script src="js/common/jquery-2.0.0.min.js"></script>
<script type="text/javascript"  src="js/layer/layer.js"></script>
<script type="text/javascript">
function getLayer() {
   var user='<%=session.getAttribute("users")%>';
    var enterUser = '<%=session.getAttribute("enterpriseUsers")%>';
    if(user!="null"){
	   if(type=="1"){
	      alert('请使用个人账号登录！');
	   }else{
	      alert(type);
	      layer.open({
			  type: 2,
		      shadeClose: true,
		      title:'发布求租房源信息',
		      shade: false,
		      maxmin: true, //开启最大化最小化按钮
		      area: ['893px', '600px'],
		      content: 'houseBuyRent.jsp', 
		     });
	     }
	   }else{
	      layer.open({
			 type: 2,
		      shadeClose: true,
		      title:'个人用户登陆',
		      shade: false,
		      maxmin: true, //开启最大化最小化按钮
		      area: ['840px', '600px'],
		      content: 'log_prompt.jsp', 
		      
		 });
	   }
	}
</script>
<script type="text/javascript">
  function promptRegion(){
     var prompt = document.getElementById("promptLayer");
     if(prompt.style.display == 'none')
       prompt.style.display = 'block';
     else
       prompt.style.display = 'none';
  }
  
  function getList(){
	  if(${houseBuyRentList == null})
        document.getElementById("initSubmit").click();
      
	}
  
	
</script>
</head>
<body  onload="setup();getList();init();">
<form action="rm!getBuyRentInfo">
   <input type="submit" id="initSubmit" style="display:none;"/>
</form>
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
<div class="container">
   
	<form action="buyerRentAct" > 
		<div style="width:100% height:auto;float:left;">
			<img style="float:left;"src="images/houselist/logo.png"> <a style="float:left;"><font size="4" face="微软雅黑" color="red">求租</font></a>
				<span style="float:left;margin-left:30px;"id="cur_city_select">武汉市</span>
				<a href="javascript:void(0)" onclick="promptRegion()" type="text" style="float:left;color: gray;width:80px;margin-left:40px;border-style:none;" >切换城市</a>
                <div style="float:left">
				   <div id="promptLayer" style="display:none;">
                      <select id="province-select" name="province" ></select>
		              <select id="city-select" name="city"></select>
		              <select id="county-select" style="display:none;" ></select>
		              <input type="submit" id="cityChangeSubmit" value="确认" style="background-color: white;" />
		            </div>
		        </div>
		      </div>
		  </form>
  
    <div style="float:right;">
        <input  type="button" value="免费发布信息" onclick="getLayer()" style="float:left;padding:8px 16px;background-color:#89d6bc;border-style:none;color:#fdfdfd" />
    </div>

		<div style="float:left;width:100%;height:auto;margin-top:35px;">
			<span><img src="images/houselist/area.png" align="middle"><font
				size="4"><b>按区域</b></font></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<span><img src="images/houselist/locate_grey.png"
				align="middle"><a href="#" onclick="MM_openBrWindow('gps.jsp','','width=550,height=380')" ><font size="4" color="gray"><b>按地图</b></font></a></span>
		</div>
		<div style=" border: solid 2px;color:#89d6bc;margin-top:10px;float:left;width:100%;height:auto;padding:10px 4px 10px 4px;">
			<div align="left" class="container ">
			<span><font size="4" color="black"><b>区域：</b></font></span>
			<a href="buyerRentAct!noLimit" style="font-size:14px;font-family: '微软雅黑';color:dodgerblue;"> 不限</a>&nbsp;&nbsp;
			<c:forEach var="region" items="${getCounty}">
			<a href="buyerRentAct?county=${region.county}"  style="font-size:14px;font-family: '微软雅黑';color:black;">${region.county}</a>&nbsp;&nbsp;
			</c:forEach>
		</div>
		<div align="left" class="container">
			<span><font size="4" color="black"><b>月租：</b></font></span> 
			    <a href="buyerRentAct?price=0" style="font-size:14px;font-family: '微软雅黑';color:dodgerblue;">不限</a>&nbsp;&nbsp; 
				<a href="buyerRentAct?price=1" style="font-size:14px;font-family: '微软雅黑';color:black;">1000元以下</a>&nbsp;&nbsp;  
				<a href="buyerRentAct?price=2" style="font-size:14px;font-family: '微软雅黑';color:black;">1000~2000元</a>&nbsp;&nbsp; 
		        <a href="buyerRentAct?price=3" style="font-size:14px;font-family: '微软雅黑';color:black;">2000~3000元</a>&nbsp;&nbsp; 
				<a href="buyerRentAct?price=4" style="font-size:14px;font-family: '微软雅黑';color:black;">3000~4000元</a>&nbsp;&nbsp; 
			    <a href="buyerRentAct?price=5" style="font-size:14px;font-family: '微软雅黑';color:black;">4000~5000元</a>&nbsp;&nbsp;
			    <a href="buyerRentAct?price=6" style="font-size:14px;font-family: '微软雅黑';color:black;">5000元以上</a>&nbsp;&nbsp; 
		</div>
			
			<div align="left" class="container">
				<span><font size="4" color="black"><b> 面积：</b></font></span> 
				 <a href="buyerRentAct?size=0" style="font-size:14px;font-family: '微软雅黑';color:dodgerblue;">不限</a>&nbsp;&nbsp;
				 <a href="buyerRentAct?size=1" style="font-size:14px;font-family: '微软雅黑';color:black;">50㎡</a>&nbsp;&nbsp;
				 <a href="buyerRentAct?size=2" style="font-size:14px;font-family: '微软雅黑';color:black;">50~100㎡</a>&nbsp;&nbsp;
				 <a href="buyerRentAct?size=3" style="font-size:14px;font-family: '微软雅黑';color:black;">100~150㎡</a>&nbsp;&nbsp;
				 <a href="buyerRentAct?size=4" style="font-size:14px;font-family: '微软雅黑';color:black;">150~200㎡</a>&nbsp;&nbsp;
				 <a href="buyerRentAct?size=5" style="font-size:14px;font-family: '微软雅黑';color:black;">200㎡以上</a>&nbsp;&nbsp;
			</div>
			
			<div align="left" class="container">
				<span><font size="4" color="black"><b> 楼层：</b></font></span>
			     <a href="buyerRentAct?floor=0" style="font-size:14px;font-family: '微软雅黑';color:dodgerblue;">不限</a>&nbsp;&nbsp; 
				 <a href="buyerRentAct?floor=1" style="font-size:14px;font-family: '微软雅黑';color:black;">一楼</a>&nbsp;&nbsp;  
		         <a href="buyerRentAct?floor=2" style="font-size:14px;font-family: '微软雅黑';color:black;">二楼</a>&nbsp;&nbsp; 
				 <a href="buyerRentAct?floor=3" style="font-size:14px;font-family: '微软雅黑';color:black;">三楼</a>&nbsp;&nbsp; 
			     <a href="buyerRentAct?floor=4" style="font-size:14px;font-family: '微软雅黑';color:black;">四楼</a>&nbsp;&nbsp; 
				 <a href="buyerRentAct?floor=5" style="font-size:14px;font-family: '微软雅黑';color:black;">五楼</a>&nbsp;&nbsp; 
				 <a href="buyerRentAct?floor=6" style="font-size:14px;font-family: '微软雅黑';color:black;">六楼</a>&nbsp;&nbsp; 
				 <a href="buyerRentAct?floor=7" style="font-size:14px;font-family: '微软雅黑';color:black;">七楼</a>&nbsp;&nbsp; 
				 <a href="buyerRentAct?floor=8" style="font-size:14px;font-family: '微软雅黑';color:black;">八楼</a>&nbsp;&nbsp; 
				 <a href="buyerRentAct?floor=9" style="font-size:14px;font-family: '微软雅黑';color:black;">九楼</a>&nbsp;&nbsp; 
			     <a href="buyerRentAct?floor=10" style="font-size:14px;font-family: '微软雅黑';color:black;">十楼</a>&nbsp;&nbsp; 
			</div>
			
		</div>
		<div class="my-area">
			<span style="width:140px;height:20px;float:left;"><img
				src="images/houselist/area.png"><span
				style="font-family: '微软雅黑';font-size:16px;">全部楼盘</span></span>
			<div class="my-sort">
				<span style="font-size: 14px;font-family:'微软雅黑';">排序</span> 
				<a href="buyerRentAct!noLimit" style="font-size:14px;font-family: '微软雅黑';color:black;">默认</a>&nbsp;
				<a href="buyerRentAct!noLimit" style="font-size:14px;font-family: '微软雅黑';color:black;">最新<img src="images/houselist/arrow_down.png" /> </a>&nbsp;
				<a href="buyerRentAct!arrayPrice" style="font-size:14px;font-family: '微软雅黑';color:black;">价格<img	src="images/houselist/arrow_up.png" /> </a>&nbsp;
				<a href="buyerRentAct!arraySize" style="font-size:14px;font-family: '微软雅黑';color:black;">面积<img src="images/houselist/arrow_down.png" /></a>
			</div>
				 <form action="com.chinasoft.action.buyerRentAct">
			<span style="float: right;">
				<span style="margin-left:15px;font-size: 16px;font-family:'微软雅黑';">共有
					<font size="4" color="red"> <c:out value='${num}' escapeXml='false'/> </font>  个符合要求的楼盘
				</span>
			</span>
			</form>
		</div>
	 <span style="float:left;width:100%; background-color:#89d6bc;height:2px;border:none;margin:5px 0px 20px 0px;"></span>
      </div>
      <div class="container">
      <div style="width:70%;height:auto;float:left;">
             <li>
               <div style="display:inline;float:left; margin-left: 10px;font-size: 20px;font-family:'微软雅黑';"><strong>求房信息</strong> </div>
               <div style="float: right;">
                  <div style="display:inline;margin-right: 120px;"><strong>样式要求</strong></div>
                  <div style="display:inline;margin-right: 150px;"><strong>价格范围</strong></div>
                  <div style="display:inline"><strong>发布时间</strong></div>
               </div>
           </li>
	       <form action="com.chinasoft.action.buyerRentAct">
			 <c:out value='${sth}' escapeXml='false'/>        
		   </form>
        </div>
        <div style="width:25%;height:auto;float:left;margin-left:5%;">
           <a href="http://www.baidu.com"><img style="width:100%;height:240px;"src="images/houselist/f1.png"/></a>
           <a href="http://www.baidu.com"><img style="width:100%;height:240px;margin-top:10px;"src="images/houselist/f2.png"/></a>
      </div>
     </div>
    </body>
 </html>
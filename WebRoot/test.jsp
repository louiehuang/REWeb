<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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

<title>test</title>

</head>

<body>
	<!-- 	分页隐藏域 -->
	<input type="hidden" name="hiddenPageIndex" id="pageIndex" value="1" />
	<input type="hidden" name="hiddenPageSize" id="pageSize" value="10" />
	<input type="hidden" name="hiddenPageCount" id="pageCount" value="0" />

	${requestScope.hiddenPageIndex} 
	当前
	<%=request.getParameter("hiddenPageIndex")%>
	/
	<%=request.getParameter("hiddenpageCount")%>
	页





</body>
</html>




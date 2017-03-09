<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%	String root=request.getContextPath();
	boolean flag= (Boolean)request.getAttribute("flag");
	
%>  --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
* {
	font-family: gulim;
	font-size: 20px;
}
</style>
<link href="<%-- <%=root%> --%>${pageContext.request.contextPath}/css/style.css" rel="Stylesheet" type="text/css">
</head>
<!-- *********************************************** -->
<body>

	<!-- *********************************************** -->

	<DIV class="title">회원탈퇴</DIV>



	<div class="content">

		<%-- <%
	if(flag){
		out.print("탈퇴되었습니다. 자동로그아웃 됩니다.");
	} else{
		out.print("탈퇴를 실패했습니다");
	}

%> --%>
		<c:choose>
			<c:when test="${flag }">탈퇴되었습니다. 자동로그아웃 됩니다.</c:when>
			<c:otherwise>탈퇴를 실패했습니다</c:otherwise>
		</c:choose>


	</div>

	<DIV class='bottom'>
		<input type='button' value='홈' onclick="location.href='<%-- <%=root%> --%>${pageContext.request.contextPath}/index.jsp'">
		<input type='button' value='다시시도' onclick="history.back()">
	</DIV>


	<!-- *********************************************** -->

</body>
<!-- *********************************************** -->
</html>

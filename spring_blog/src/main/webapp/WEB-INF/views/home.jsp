<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:choose>
	<c:when test="${empty sessionScope.id}">
		<c:set var="str">Spring MVC Blog 페이지 입니다.</c:set>
	</c:when>
	<c:otherwise>
		<c:set var="str">안녕하세요 ${sessionScope.id} 님!</c:set>
	</c:otherwise>
</c:choose>
<c:set var="title">Spring MVC Blog</c:set>
<c:if test="${not empty sessionScope.id && sessionScope.grade=='A' }">
	<c:set var="title">관리자 페이지</c:set>
</c:if>
<html>
<head>
<title>Home</title>
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
</head>
<body>
	<div class="title">${title}</div>
	<div class="content">
		<p>${str}</p>
		<h4>${serverTime}.</h4>
		<c:choose>
			<c:when test="${empty sessionScope.id}">
				<input type="button" value="LogIn" onclick="location.href='member/login'">
				<br>
				<br>
				<img src="${pageContext.request.contextPath}/images/refree.gif" width="40%">
			</c:when>
			<c:otherwise>
				<input type="button" value="LogOut" onclick="location.href='member/logout'">
				<br>
				<br>
				<img src="${pageContext.request.contextPath}/images/kkc.gif" width="40%">
			</c:otherwise>
		</c:choose>
	</div>
</body>
</html>

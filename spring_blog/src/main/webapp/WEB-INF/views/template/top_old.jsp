<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<style type="text/css">
ul#menu li {
	display: inline;
}

ul#menu li a {
	background-color: black;
	color: orange;
	pading: 10px 20px;
	text-decoration: none;
	border-radius: 5px 5px 5px 5px;
	font-weight: bold;
	font-size: 25px;
	margin: 20px 5px;
	border-style: dotted;
	border-color: orange;
}

ul#menu li a:hover {
	background-color: red;
	border-color: blue;
	color: blue;
}

ul#menu li a:ACTIVE {
	background-color: blue;
	border-color: red;
	color: red;
}

.table {
	width: 100%;
	text-align: center;
}

.table, .td {
	border-style: none;
}

li#admin {
	float: right;
	padding-right: 30px;
}
</style>
</head>
<body>
	<!-- 상단 메뉴 -->
	<div style="background-color: #EEEEEE;">
		<table class="table">
			<tr>
				<td class=td>
					<img src="${pageContext.request.contextPath}/images/main-03.jpg" width="70%">
				</td>
			<tr>
			<tr>
				<td class=td>
					<ul id="menu">

						<li><a href="${pageContext.request.contextPath}/">홈</a></li>
						<li><a href="${pageContext.request.contextPath}/memo/list">메모목록</a></li>
						<li><a href="${pageContext.request.contextPath}/address/list">주소록</a></li>
						<li><a href="${pageContext.request.contextPath}/bbs/list">게시판</a></li>
						<li><a href="${pageContext.request.contextPath}/img/list">사진 게시판</a></li>
						<li><a href="${pageContext.request.contextPath}/team/list">팀 목록</a></li>
						<%-- 						<li><a href="${pageContext.request.contextPath}/admin/list.do">회원목록</a></li> --%>
						<c:choose>
							<c:when test="${empty sessionScope.id }">
								<li><a href="${pageContext.request.contextPath}/member/agree">회원가입</a></li>
								<li><a href="${pageContext.request.contextPath}/member/login">로그인</a></li>
							</c:when>
							<c:when test="${not empty sessionScope.id && sessionScope.grade=='H'}">
								<li><a href="${pageContext.request.contextPath}/member/read">나의정보</a></li>
								<li><a href="${pageContext.request.contextPath}/member/update">정보수정</a></li>
								<li><a href="${pageContext.request.contextPath}/member/delete">탈퇴하기</a></li>
								<li><a href="${pageContext.request.contextPath}/member/logout">Logout</a></li>
							</c:when>
						</c:choose>
						<c:if test="${not empty sessionScope.id && sessionScope.grade=='A'}">
							<li><a href="${pageContext.request.contextPath}/admin/list">회원목록</a></li>
							<li><a href="${pageContext.request.contextPath}/member/logout">Logout</a></li>
						</c:if>
					</ul>
				</td>
			</tr>
		</table>
	</div>
	<!-- 상단 메뉴 끝 -->



	<!-- 내용 시작 -->
	<div style="width: 100%; padding-top: 10px;">
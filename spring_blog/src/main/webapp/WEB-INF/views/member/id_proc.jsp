<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>id_proc</title>
<script type="text/javascript">
	function use() {
		opener.frm.id.value = '${id}';
		window.close();
	}
</script>
<style type="text/css">
* {
	font-family: gulim;
	font-size: 20px;
}
</style>
<link href="${pageContext.request.contextPath}/css/style.css" rel="Stylesheet" type="text/css">
</head>
<!-- *********************************************** -->
<body leftmargin="0" topmargin="0">
	<!-- *********************************************** -->

	<DIV class="title">
		ID
		<br>
		중복 확인
	</DIV>

	<DIV class="content">
		입력한 ID : ${id}
		<br>
		<br>
		<c:choose>
			<c:when test="${flag}">이 ID는 이미 사용중 입니다.<br>
				<br>
			</c:when>
			<c:otherwise>이거 쓰세요.<br>
				<br>
				<input type='button' value='사용' onclick='use()'>
			</c:otherwise>
		</c:choose>
	</DIV>

	<DIV class='bottom'>
		<input type='button' value='재 시도' onclick="location.href='id_form'">
		<input type='button' value='닫기' onclick="window.close()">
	</DIV>

	<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html>

<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>passwdError</title>
<style type="text/css">
* {
	font-family: gulim;
	font-size: 20px;
}
</style>
<link href="${pageContext.request.contextPath}/css/style.css" rel="Stylesheet" type="text/css">
</head>
<body>
	<DIV class="content">
		Password 오류 입니다.
		<br>
		다시 한번 시도해 보시죠.
	</DIV>
	<DIV class='bottom'>
		<input type='button' value='다시시도' onclick="history.back()">
	</DIV>
</body>
</html>
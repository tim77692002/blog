<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>email_form</title>
<style type="text/css">
* {
	font-family: gulim;
	font-size: 20px;
}
</style>

<link href='${pageContext.request.contextPath}/css/style.css' rel='Stylesheet' type='text/css'>

</head>
<body>

	<DIV class='title'>E-mail<BR>중복 확인</DIV>

	<DIV class='content'>

			E-mail을 입력 하세요.<br>

		<FORM name='frm' method='post' action='./email_proc'>

			<br>

			<TABLE align='center'>
				<TR>
					<TH>E-mail</TH>
					<TD>
						<input type='text' name='email' size='20'>
					</TD>
				</TR>
			</TABLE>

			<DIV class="bottom">
				<input type='submit' value='중복확인'> <input type="button" value="취소" onclick="window.close()" />
			</DIV>

		</FORM>

	</DIV>

</body>
</html>

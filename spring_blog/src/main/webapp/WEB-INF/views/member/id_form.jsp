<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>id_form</title>
<style type="text/css">
* {
	font-family: gulim;
	font-size: 20px;
}
</style>

<link href='${pageContext.request.contextPath}/css/style.css' rel='Stylesheet' type='text/css'>

</head>
<body>
	<DIV class="title">ID<br>중복 확인</DIV>

	<DIV class='content'>

			ID를 입력 하세요.<br> <br>
			
		<FORM name='frm' method='post' action='./id_proc'>

			<TABLE align='center'>
				<TR>
					<TH>ID</TH>
					<TD>
						<input type='text' name='id' size='20'>
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

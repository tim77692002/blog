<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>createForm</title>

<script type="text/javascript">
	function inputCheck(f) {
		if (f.wname.value == "") {
			alert("이름을 입력하세요.");
			f.wname.focus();
			return false;
		}

		if (f.title.value == "") {
			alert("제목을 입력하세요.");
			f.title.focus();
			return false;
		}

		if (f.content.value == "") {
			alert("내용을 입력하세요.");
			f.content.focus();
			return false;
		}

		if (f.passwd.value == "") {
			alert("비밀번호를 입력하세요.");
			f.passwd.focus();
			return false;
		}

		if (f.fnameMF.value == "") {
			alert("사진을 등록하세요.");
			f.fnameMF.focus();
			return false;
		}

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
<body>
	<!-- *********************************************** -->

	<DIV class="title">사진등록</DIV>
	<br>

	<FORM name='frm' method='POST' action='./create' onsubmit="return inputCheck(this)" enctype="multipart/form-data">
		<TABLE>
			<TR>
				<TH>이름</TH>
				<TD>
					<input type="text" name="wname" size="15" placeholder="이름">
				</TD>
			</TR>
			<TR>
				<TH>제목</TH>
				<TD>
					<input type="text" name="title" size="15" placeholder="제목">
				</TD>
			</TR>
			<TR>
				<TH>내용</TH>
				<TD>
					<textarea rows="5" cols="40" placeholder="내용" name="content"></textarea>
				</TD>
			</TR>
			<TR>
				<TH>패스워드</TH>
				<TD>
					<input type="password" name="passwd" size="15" placeholder="비밀번호">
				</TD>
			</TR>
			<TR>
				<TH>사진</TH>
				<TD>
					<input type="file" name="fnameMF" accept=".jpg,.png,.gif">
				</TD>
			</TR>
		</TABLE>

		<DIV class='bottom'>
			<input type='submit' value='등록'>
			<input type='button' value='취소' onclick="history.back()">
		</DIV>
	</FORM>

</body>

</html>

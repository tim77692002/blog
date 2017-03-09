<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>createForm</title>
<script type="text/javascript">
	function incheck(f) {
		if (f.title.value == "") {
			alert("제목이 없음");
			f.title.focus();
			return false;
		}
		if (f.wname.value == "") {
			alert("이름이 없음");
			f.wname.focus();
			return false;
		}
		// 		if (f.content.value == "") {
		// 			alert("내용이 없음");
		// 			f.content.focus();
		// 			return false;
		// 		}

		if (CKEDITOR.instances['content'].getData() == '') {
			window.alert('내용을 입력해 주세요.');
			CKEDITOR.instances['content'].focus();
			return false;
		}

		if (f.passwd.value == "") {
			alert("암호가 없음");
			f.passwd.focus();
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
<script type="text/javascript" src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
<script type="text/JavaScript">
	window.onload = function() {
		CKEDITOR.replace('content'); // <TEXTAREA>태그 id 값
	};
</script>
</head>
<!-- *********************************************** -->
<body leftmargin="0" topmargin="0">
	<!-- *********************************************** -->

	<DIV class="title">등록</DIV>

	<FORM name='frm' method='POST' action='./create' enctype="multipart/form-data" onsubmit="return incheck(this)">
		<TABLE>
			<TR>
				<TH>제목</TH>
				<TD>
					<input type="text" name="title" placeholder="제목을 쓰세요.">
				</TD>
			</TR>
			<TR>
				<TH>성명</TH>
				<TD>
					<input type="text" name="wname" placeholder="이름을 쓰세요.">
				</TD>
			</TR>
			<TR>
				<TH>내용</TH>
				<TD>
					<textarea rows="10" cols="45" name="content" placeholder="내용을 쓰세요."></textarea>
				</TD>
			</TR>
			<TR>
				<TH>비밀번호</TH>
				<TD>
					<input type="password" name="passwd" placeholder="비밀번호을 입력하세요.">
				</TD>
			</TR>
			<TR>
				<TH>첨부파일</TH>
				<TD>
					<input type="file" name="fileMF">
				</TD>
			</TR>
		</TABLE>

		<DIV class='bottom'>
			<input type='submit' value='등록'>
			<input type='button' value='취소' onclick="history.back()">
		</DIV>
	</FORM>

	<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html>

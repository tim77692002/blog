<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Images - updateForm</title>
<script type="text/javascript">
	function inputCheck(f) {
		if (f.wname.value == "") {
			alert("이름이 없음");
			f.wname.focus();
			return false;
		}
		if (f.title.value == "") {
			alert("제목이 없음");
			f.title.focus();
			return false;
		}
		if (f.content.value == "") {
			alert("내용이 없음");
			f.content.focus();
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
</head>
<!-- *********************************************** -->
<body leftmargin="0" topmargin="0">
	<!-- *********************************************** -->

	<DIV class="title">사진 수정</DIV>

	<FORM name='frm' method='POST' action='./update' enctype="multipart/form-data" onsubmit="return inputCheck(this)">
		<input type="hidden" name="grpno" value="${dto.grpno}">
		<input type="hidden" name="indent" value="${dto.indent}">
		<input type="hidden" name="ansnum" value="${dto.ansnum}">
		<input name="no" value="${dto.no}" type="hidden">
		<input name="col" value="${param.col}" type="hidden">
		<input name="word" value="${param.word}" type="hidden">
		<input name="nowPage" value="${param.nowPage}" type="hidden">
		<input name="oldfile" value="${dto.fname}" type="hidden">
		<TABLE>
			<TR>
				<TH>성명</TH>
				<TD>
					<input type="text" name="wname" value="${dto.wname}">
				</TD>
			</TR>
			<TR>
				<TH>제목</TH>
				<TD>
					<input type="text" name="title" value="${dto.title}">
				</TD>
			</TR>
			<TR>
				<TH>내용</TH>
				<TD>
					<textarea rows="10" cols="45" name="content">${dto.content}</textarea>
				</TD>
			</TR>
			<TR>
				<TH>비밀번호</TH>
				<TD>
					<input type="password" name="passwd" placeholder="비밀번호를 꼭! 입력하세요.">
				</TD>
			</TR>
			<TR>
				<TH>첨부파일</TH>
				<TD>
					<input type="file" name="fnameMF" accept=".jpg,.png,.gif"><br>
					원본 : ${dto.fname}
				</TD>
			</TR>
		</TABLE>

		<DIV class='bottom'>
			<input type='submit' value='수정'>
			<input type='button' value='취소' onclick="history.back()">
		</DIV>
	</FORM>
	<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html>
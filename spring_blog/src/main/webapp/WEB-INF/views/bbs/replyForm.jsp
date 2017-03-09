<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>replyForm</title>
<script type="text/javascript">
	function incheck(f) {
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
		if (CKEDITOR.instances['content'].getData() == '') {
			window.alert('내용을 입력해 주세요.');
			CKEDITOR.instances['content'].focus();
			return false;
		}
		// 	if (f.content.value == "") {
		// 			alert("내용이 없음");
		// 			f.content.focus();
		// 			return false;
		// 		}
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
		CKEDITOR.replace('content');
	};
</script>
</head>
<!-- *********************************************** -->
<body leftmargin="0" topmargin="0">
	<!-- *********************************************** -->

	<DIV class="title">답변</DIV>

	<FORM name='frm' method='POST' action='./reply' enctype="multipart/form-data">

		<!-- 답변을 등록하기 위해서 -->
		<input type="hidden" name="grpno" value="${dto.grpno}">
		<input type="hidden" name="indent" value="${dto.indent}">
		<input type="hidden" name="ansnum" value="${dto.ansnum}">

		<!-- 페이지와 검색 유지를 위해서 -->
		<input name="col" value="${param.col}" type="hidden">
		<input name="word" value="${param.word}" type="hidden">
		<input name="nowPage" value="${param.nowPage}" type="hidden">

		<!-- 부모글 삭제 방지 -->
		<input name="bbsno" value="${dto.bbsno}" type="hidden">

		<TABLE>
			<TR>
				<TH>제목</TH>
				<TD>
					<input type="text" name="title" value="${dto.title}">
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
				<TH>파일명</TH>
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

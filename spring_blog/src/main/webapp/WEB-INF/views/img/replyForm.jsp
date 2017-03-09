<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
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

	<DIV class="title">답글 등록</DIV>

	<FORM name='frm' method='POST' action='./reply' enctype='multipart/form-data'>
		<!-- 답변 등록을 위한 태그 -->
		<input type="hidden" name="grpno" value="${dto.grpno}">
		<input type="hidden" name="indent" value="${dto.indent}">
		<input type="hidden" name="ansnum" value="${dto.ansnum}">
		<!-- 페이지와 검색 유지를 위한 태그 -->
			<input name="col" value="${param.col}" type="hidden">
		<input name="word" value="${param.word}" type="hidden">
		<input name="nowPage" value="${param.nowPage}" type="hidden">
		<!-- 부모글 삭제를 막기 위한 태그 -->
		<input name="no" value="${dto.no}" type="hidden">
		<TABLE>
			<TR>
				<TH>제목</TH>
				<TD>
					<input type='text' name="title" size='40' value="${dto.title}" placeholder="제목">
				</TD>
			</TR>
			<TR>
				<TH>이름</TH>
				<TD>
					<input type='text' name="wname" size='40' placeholder="이름">
				</TD>
			</TR>
			<TR>
				<TH>내용</TH>
				<TD>
					<textarea name='content' rows="10" cols="40" placeholder="내용"></textarea>
				</TD>
			</TR>
			<TR>
				<TH>비밀번호</TH>
				<TD>
					<input type='password' name="passwd" size='40' placeholder="비밀번호">
				</TD>
			</TR>
			<TR>
				<TH>파일명</TH>
				<TD>
					<input type='file' name='fnameMF' accept=".jpg,.png,.gif">
				</TD>
			</TR>
		</TABLE>

		<DIV class="bottom">
			<input class='ct-btn white' type='submit' value='등록'>
			<input class='ct-btn white' type='button' value='취소' onclick="history.back();">
		</DIV>
	</FORM>


	<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html>


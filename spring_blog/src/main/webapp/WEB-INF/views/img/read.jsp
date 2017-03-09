<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="util" uri="/ELFunctions"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>read</title>

<style type="text/css">
* {
	font-family: gulim;
	font-size: 20px;
}

#img {
	width: 500px;
}

#ftd {
	text-align: center;
}
</style>
<link href="${pageContext.request.contextPath}/css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript">
	function ilist() {
		var url = "list";
		url += "?col=${param.col}";
		url += "&word=${param.word}";
		url += "&nowPage=${param.nowPage}";
		location.href = url;
	}
	function readGo(no) {
		var url = "./read";
		url = url + "?no=" + no;

		location.href = url;
	}
	function down(fname) {
		var url = "${pageContext.request.contextPath}/download";
		url += "?dir=/img/storage";
		url += "&filename=" + fname;

		location.href = url;
	}
	function update() {
		var url = "update";
		url += "?no=${dto.no}";
		url += "&col=${param.col}";
		url += "&word=${param.word}";
		url += "&nowPage=${param.nowPage}";
		location.href = url;
	}
	function reply() {
		var url = "reply";
		url += "?no=${dto.no}";
		url += "&col=${param.col}";
		url += "&word=${param.word}";
		url += "&nowPage=${param.nowPage}";
		location.href = url;
	}
	function idelete() {
		var url = "delete";
		url += "?no=${dto.no}";
		url += "&col=${param.col}";
		url += "&word=${param.word}";
		url += "&nowPage=${param.nowPage}";
		url += "&oldfile=${dto.fname}";
		location.href = url;
	}
</script>
</head>
<!-- *********************************************** -->
<body>
	<!-- *********************************************** -->

	<DIV class="title">조회</DIV>

	<table>
		<tr>
			<td colspan="2" id="ftd">
				<img id="img" src='${pageContext.request.contextPath}/img/storage/${dto.fname}'>
			</td>
		</tr>
		<TR>
			<TH>제목</TH>
			<TD>${dto.title}</TD>
		</TR>
		<TR>
			<TH>내용</TH>
			<TD>${dto.content}</TD>
		</TR>
		<TR>
			<TH>성명</TH>
			<TD>${dto.wname}</TD>
		</TR>
		<TR>
			<TH>조회수</TH>
			<TD>${dto.viewcnt}</TD>
		</TR>
		<TR>
			<TH>등록날짜</TH>
			<TD>${fn:substring(dto.wdate,0,10)}</TD>
		</TR>
		<TR>
			<TH>파일</TH>
			<TD>
				<c:choose>
					<c:when test="${empty dto.fname }">
						<span class='glyphicon glyphicon-remove-sign'></span>
					</c:when>
					<c:otherwise>
						<a href="javascript:down('${dto.fname}')"> ${dto.fname} <span class="glyphicon glyphicon-download-alt"></span>
						</a>
					</c:otherwise>
				</c:choose>
			</TD>
		</TR>
	</TABLE>
	<br>
	<TABLE>
		<TR>
<%-- 			<c:set var="files" value="${list.get(0)}" /> --%>
<%-- 			<c:set var="noArr" value="${list.get(1)}" /> --%>
			<c:forEach var="i" begin="0" end="4">
				<c:choose>
					<c:when test="${empty files[i]}">
						<td>
							<img src="${pageContext.request.contextPath}/img/storage/default.png" width="100px" height="100px">
						</td>
					</c:when>
					<c:otherwise>
						<c:choose>
							<c:when test="${noArr[i]==dto.no}">
								<td class="td_padding">
									<a href="javascript:readGo('${noArr[i]}')"> <img class="curImg" src="${pageContext.request.contextPath}/img/storage/${files[i]}" width="100px" height="100px" border="0">
									</a>
								</td>
							</c:when>
							<c:otherwise>
								<td class="td_padding">
									<a href="javascript:readGo('${noArr[i]}')"> <img src="${pageContext.request.contextPath}/img/storage/${files[i]}" width="100px" height="100px" border="0">
									</a>
								</td>
							</c:otherwise>
						</c:choose>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</TR>
	</TABLE>

	<DIV class='bottom'>
		<input type='button' value='등록' onclick="location.href='./create'">
		<input type='button' value='목록' onclick="ilist()">
		<input type='button' value='수정' onclick="update()">
		<input type='button' value='답변' onclick="reply()">
		<input type='button' value='삭제' onclick="idelete()">
	</DIV>

	<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html>
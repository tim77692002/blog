<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="util" uri="/ELFunctions"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>bbs_list</title>
<script type="text/javascript">
	function down(filename) {
		var url = "${pageContext.request.contextPath}/download?dir=/bbs/storage&filename="
				+ filename;
		location.href = url;
	}

	function read(bbsno) { //bbsno는 자바스크립트변수 col word는 jsp변수
		var url = "read";
		url += "?bbsno=" + bbsno;
		url += "&col=${col}";
		url += "&word=${word}";
		url += "&nowPage=${nowPage}";
		location.href = url;
	}
</script>
<style type="text/css">
.search {
	text-align: center;
	margin: 1px auto;
}
</style>
<link href="${pageContext.request.contextPath}/css/style.css" rel="Stylesheet" type="text/css">
</head>
<!-- *********************************************** -->
<body leftmargin="0" topmargin="0">
	<!-- *********************************************** -->
	<DIV class="title">게시판 목록</DIV>

	<div class="search">
		<form method="post" action="./list">
			<select name="col">
				<!-- 검색할 컬럼 -->
				<option value="wname" <c:if test="${col=='wname'}">selected='selected'</c:if>>작성자</option>

				<option value="title" <c:if test="${col=='title'}">selected='selected'</c:if>>제목</option>


				<option value="content" <c:if test="${col=='content'}">selected='selected'</c:if>>내용</option>

				<option value="total">전체</option>

			</select>
			<input type="text" name="word" value="${word}">
			<!-- 검색어 -->
			<input type="submit" value="검색">
			<input type='button' value='새글 작성' onclick="location.href='./create'">
		</form>
	</div>

	<TABLE>
		<TR align="center">
			<TH>번호</TH>
			<TH>제목</TH>
			<TH>작성자</TH>
			<TH>조회수</TH>
			<TH>등록일</TH>
			<TH>파일명</TH>
		</TR>
		<c:choose>
			<c:when test="${fn:length(list)==0}">
				<tr>
					<td colspan="8">등록된 글이 없습니다.</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${list}" var="dto">
					<tr>
						<td>${dto.bbsno}</td>
						<td>
							<c:forEach begin="1" end="${dto.indent}">
								<c:out value="&nbsp;" escapeXml="false" />
							</c:forEach>
							<c:if test="${dto.indent>0}">
								<c:out value="┗" escapeXml="false" />
							</c:if>

							<c:set var="rcount" value="${util:rcount(dto.bbsno,irdao) }" />
							<a href="javascript:read('${dto.bbsno}')">
								${dto.title}
								<c:if test="${rcount>0 }">
									<span style="color: red;">[${rcount}]</span>
								</c:if>
							</a>
							<c:if test="${util:newImg(fn:substring(dto.wdate,0,10)) }">
								<span class="label label-danger">New</span>
							</c:if>
						</td>
						<td>${dto.wname}</td>
						<td>${dto.viewcnt}</td>
						<td>${fn:substring(dto.wdate,5,16)}</td>
						<td style="text-align: center;">
							<c:choose>
								<c:when test="${empty dto.filename}">
									<span class='glyphicon glyphicon-remove-sign'></span>
								</c:when>
								<c:otherwise>
									<a href="javascript:down('${dto.filename}')">
										<span class='glyphicon glyphicon-floppy-save'></span>
									</a>
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</TABLE>

	<DIV class='bottom'>${paging}</DIV>

	<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html>

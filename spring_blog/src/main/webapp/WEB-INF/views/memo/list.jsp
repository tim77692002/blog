<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="util" uri="/ELFunctions"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Memo list</title>
<style type="text/css">
a:LINK {
	color: #000000;
	text-decoration: none;
}

a:VISITED {
	color: #000000;
	text-decoration: none;
}

a:HOVER {
	color: blue;
	text-decoration: none;
}

a:ACTIVE {
	color: #000000;
	text-decoration: none;
}

.search {
	text-align: center;
	margin: 1px auto;
}
</style>
<script type="text/javascript">
	function read(memono) {
		var url = "read";
		url += "?memono=" + memono;
		url += "&col=${col}";
		url += "&word=${word}";
		url += "&nowPage=${nowPage}";
		location.href = url;
	}
</script>
</head>
<body>
	<div class="container">
		<form method="post" action="./list">
			<select name="col">
				<!-- 검색할 컬럼 -->
				<option value="title" <c:if test="${col=='title'}">selected='selected'</c:if>>제목</option>
				<option value="content" <c:if test="${col=='content'}">selected='selected'</c:if>>내용</option>
				<option value="total">전체</option>
			</select>
			<input type="text" name="word" value="${word}">
			<!-- 검색어 -->
			<input type="submit" value="검색">
			<input type='button' value='새글 작성' onclick="location.href='./create'">
		</form>
		<h2>
			<span class="glyphicon glyphicon-list-alt"></span>
			메모목록
		</h2>
		<table class="table table-hover">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>날짜</th>
				<th>조회수</th>
			</tr>
			<c:choose>
				<c:when test="${fn:length(list)==0}">
					<tr>
						<td colspan="4">등록된 메모가 없습니다.</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${list}" var="dto">
						<tr>
							<td>${dto.memono}</td>
							<td>
								<c:set var="rcount" value="${util:rcount(dto.memono,irdao) }" />
								<a href="javascript:read('${dto.memono}')">
									${dto.title}
									<c:if test="${rcount>0 }">
										<span style="color: red;">[${rcount}]</span>
									</c:if>
								</a>
							</td>
							<td>${dto.wdate}</td>
							<td>${dto.viewcnt}</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
	</div>
	<div>${paging}</div>
</body>
</html>
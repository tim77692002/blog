<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Address - list</title>
<style type="text/css">
table {
	width: auto;
	margin: 0 auto;
}

table, th, td {
	border: 2px solid red;
	border-collapse: collapse;
}

table tr:nth-child(even) {
	background-color: #ffccff;
}

table tr:nth-child(odd) {
	background-color: #99ffff;
}

th, td {
	padding: 10px;
}

a:LINK {
	color: black;
	text-decoration: none;
}

a:VISITED {
	color: black;
	text-decoration: none;
}

a:HOVER {
	color: red;
	text-decoration: none;
	font-weight: bold;
}

a:ACTIVE {
	color: blue;
	text-decoration: underline;
}
</style>
<script type="text/javascript">
	function del(no) {
		if (confirm("정말 삭제할껍니까?")) {
			var url = "delete";
			url += "?no=" + no;
			url += "&col=${col}";
			url += "&word=${word}";
			url += "&nowPage=${nowPage}";
			location.href = url;
		}
	}
	function read(no) {
		var url = "read";
		url += "?no=" + no;
		url += "&col=${col}";
		url += "&word=${word}";
		url += "&nowPage=${nowPage}";
		location.href = url;
	}
	function update(no) {
		var url = "update";
		url += "?no=" + no;
		url += "&col=${col}";
		url += "&word=${word}";
		url += "&nowPage=${nowPage}";
		location.href = url;
	}
</script>
</head>
<body>
	<div>Address - list</div>
	<div class="search" align="center">
		<form method="post" action="./list">
			<select name="col">
				<!-- 검색할 컬럼 -->

				<option value="name" <c:if test="${col=='name'}">selected='selected'</c:if>>작성자</option>

				<option value="phone" <c:if test="${col=='phone'}">selected='selected'</c:if>>전화번호</option>

				<option value="total">전체</option>

			</select>
			<input type="text" name="word" value="${word}">
			<!-- 검색어 -->
			<input type="submit" value="검색">
			<input type='button' value='새글 작성' onclick="location.href='./create'">
		</form>
	</div>
	<table>
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>전화번호</th>
			<th>등록일</th>
			<th>수정 / 삭제</th>
		</tr>
		<c:choose>
			<c:when test="${fn:length(list)==0}">
				<tr>
					<td colspan="6">등록된 Address정보가 없음</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${list}" var="dto">
					<tr>
						<td>${dto.no}</td>
						<td>
							<a href="javascript:read('${dto.no}')"> ${dto.name}</a>
						</td>
						<td>${dto.phone}</td>
						<td>${dto.wdate}</td>

						<td>
							<a href="javascript:update('${dto.no}')">수정 </a>
							/
							<a href="javascript:del('${dto.no}')">삭제 </a>
						</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		<tr style="background-color: #33ff99">
			<th colspan="5">
				<input type="button" value="등록" onclick="location.href='./create'">
			</th>
		</tr>
	</table>
	<div>${paging}</div>
</body>
</html>
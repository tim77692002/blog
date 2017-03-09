<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>팀 목록</title>
<style type="text/css">

div {
	text-align: center;
	margin-top: 20px;
	margin-bottom: 20px
}

table {
	width: 60%;
	margin: 0 auto;
}

th {
	background-color: red;
	color: blue;
}

table, th, td {
	border: 1px solid blue;
	border-collapse: collapse;
}

table tr:nth-child(even) {
	background-color: #dfe;
}

table tr:nth-child(odd) {
	background-color: #f1f1c1;
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

.timg {
	width: 100px;
	heigh: 100px;
}
</style>

<script type="text/javascript">
	function del(no, oldfile) {
		if (confirm("정말 삭제할껍니까?")) {
			var url = "delete";
			url += "?no=" + no;
			url += "&col=${col}";
			url += "&word=${word}	";
			url += "&nowPage=${nowPage}";
			url += "&oldfile=" + oldfile;
			location.href = url;
		}
	}
	function read(no) {
		var url = "read";
		url += "?no=" + no;
		url += "&col=${col}";
		url += "&word=${word}	";
		url += "&nowPage=${nowPage}";
		location.href = url;
	}
	function update(no) {
		var url = "update";
		url += "?no=" + no;
		url += "&col=${col}";
		url += "&word=${word}	";
		url += "&nowPage=${nowPage}";
		location.href = url;
	}
</script>
</head>
<body>
	<div style="color: red; font-size: 50px">팀 목록</div>
	<div class="search">
		<form method="post" action="./list">
			<select name="col">

				<option value="name" <c:if test="${col=='name'}">selected='selected'</c:if>>작성자</option>

				<option value="phone" <c:if test="${col=='phone'}">selected='selected'</c:if>>전화번호</option>

				<option value="skill" <c:if test="${col=='skill'}">selected='selected'</c:if>>보유기술</option>

				<option value="total">전체 출력</option>

			</select>

			<input type="text" name="word" value="${word}">
			<input type="submit" value="검색">
			<input type="button" value="새글 작성" onclick="location.href='./create'">

		</form>
	</div>
	<TABLE class='table01'>
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>전화번호</th>
			<th>보유기술</th>
			<th>사진</th>
			<th>수정/삭제</th>
		</tr>
		<c:choose>
			<c:when test="${fn:length(list)==0}">
				<tr>
					<td colspan="6">등록된 팀정보가 없음</td>
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
						<td>${dto.skillstr}</td>
						<td>
							<img class="timg" src="${pageContext.request.contextPath}/team/storage/${dto.filename}">
						</td>
						<td>
							<a href="javascript:update('${dto.no}')">수정</a>/ <a href="javascript:del('${dto.no}','${dto.filename}')">삭제</a>
						</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>

	</table>
	<div>${paging}</div>
</body>
</html>
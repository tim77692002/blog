<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>read</title>
<script type="text/javascript">
	function tlist() {
		var url = "list";
		url += "?col=${param.col}";
		url += "&word=${param.word}";
		url += "&nowPage=${param.nowPage}";
		location.href = url;
	}
</script>
<style type="text/css">

div {
	text-align: center;
	color: red;
}

table {
	width: 60px;
	margin: auto;
}

table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
}

.timg {
	width: 500px;
	heigh: 500px;
}
</style>
</head>
<body>
	<div>조회</div>
	<table>
		<tr>
			<td colspan="2">
				<img class="timg" src='${pageContext.request.contextPath}/team/storage/${dto.filename}'>
		</tr>
		<tr>
			<th>이름</th>
			<td>${dto.name}</td>
		</tr>
		<tr>
			<th>성별</th>
			<td>${dto.gender}</td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td>${dto.phone}</td>
		</tr>
		<tr>
			<th>주소</th>
			<td>${dto.address1}
				<br>
				${dto.address2}
				<br>
				(${dto.zipcode})
			</td>
		</tr>
		<tr>
			<th>보유기술</th>
			<td>${dto.skillstr}</td>
		</tr>
		<tr>
			<th>취미</th>
			<td>${dto.hobby}</td>
		</tr>
	</table>
	<div>
		<input type="button" value="생성" onclick="location.href='./create'">
		<input type='button' value='다운로드' onclick="location.href='${pageContext.request.contextPath}/download?dir=/team/storage&filename=${dto.filename}'">
		<input type="button" value="목록" onclick="tlist()">
	</div>
</body>
</html>
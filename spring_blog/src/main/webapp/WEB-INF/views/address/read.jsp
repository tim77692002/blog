<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Address - read</title>
<style type="text/css">
* {
	font-family: gulim;
	font-size: 20px;
}

div {
	text-align: center;
	margin-top: 20px;
	margin-bottom: 20px;
	font-size: 45px;
	color: red;
}

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
</style>
<script type="text/javascript">
	function acreate() {
		var url = "create";
		location.href = url;
	}

	function alist() {
		var url = "list";
		url += "?col=${param.col}";
		url += "&word=${param.word}";
		url += "&nowPage=${param.nowPage}";
		location.href = url;
	}
</script>
</head>
<body>
	<div>Address - read</div>
	<br>
	<table>
		<tr>
			<th>이름</th>
			<td>${dto.name}</td>
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
			<th>등록일</th>
			<td>${fn:substring(dto.wdate,0,16) }</td>
		</tr>
		<tr style="background-color: #33ff99">
			<th colspan="2"><input type="button" value="생성" onclick="acreate()"> <input type="button" value="목록" onclick="alist()"></th>
		</tr>
	</table>
</body>
</html>
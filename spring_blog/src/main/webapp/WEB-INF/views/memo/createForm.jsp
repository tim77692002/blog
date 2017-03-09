<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CreateForm</title>
<link href="/css/style.css" rel="stylesheet">
<style type="text/css">
* {
	font-family: gulim;
	font-size: 20px;
}

div {
	text-align: center;
	margin-top: 20px;
	margin-bottom: 20px;
}

table {
	width: auto;
	margin: 0 auto;
}

table, th, td {
	border: 1px solid red;
	border-collapse: collapse;
}
</style>
<script type="text/javascript">
function input(frm){
	if(frm.title.value==""){
		alert("제목이 비었음");
		frm.title.focus();
		return false;
	}

	if(frm.content.value==""){
		alert("내용이 비었음");
		frm.content.focus();
		return false;
	}
}
	</script>
</head>
<body>
	<div class="title">등록</div>
	<form name="frm" method="post" action="./create" onsubmit="return input(this)">
		<table>
			<tr>
				<th>제목</th>
				<td>
					<input type="text" name="title" size="30" placeholder="제목" />
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<textarea rows="10" cols="30" name="content" placeholder="내용"></textarea>
				</td>
			</tr>
		</table>
		<div>
			<input type='submit' value='전송'>
		</div>
	</form>
</body>
</html>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>삭제확인</title>

</head>
<body>
	<div align="center" style="size: 30px">삭제확인</div>
	<form method="post" action="delete">
		<input type="hidden" name="memono" value="${param.memono}">
		<input type="hidden" name="col" value="${param.col}">
		<input type="hidden" name="word" value="${param.word}">
		<input type="hidden" name="nowPage" value="${param.nowPage}">
		<div align="center">
			삭제를 하면 복구 될 수 없습니다.
			<br>
			<br>
			삭제하시려면 삭제버튼을 클릭하세요
			<br>
			<br>
			취소하시면 목록창으로 돌아갑니다
			<br>
			<br>
			<input type="submit" value="삭제">
			<input type="button" value="취소" onclick="location.href='./list'">
		</div>
	</form>
</body>
</html>
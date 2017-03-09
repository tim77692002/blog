<%@ page contentType="text/html; charset=UTF-8"%>

<%-- <%
	String root=request.getContextPath();
	String id= (String)request.getAttribute("id");

	String oldfile= (String)request.getAttribute("oldfile");
	
%>  --%>

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
<link href="<%-- <%=root%> --%>${pageContext.request.contextPath}/css/style.css" rel="Stylesheet" type="text/css">
</head>
<!-- *********************************************** -->
<body>

	<!-- *********************************************** -->

	<DIV class="title">회원탈퇴</DIV>

	<FORM name='frm' method='POST' action='./delete'>
		<input type="hidden" name="id" value="<%-- <%=id %> --%>${id}">
		<input type="hidden" name="oldfile" value="<%-- <%=oldfile %> --%>${oldfile}">
		<div class="content">정말 탈퇴하시겠습니까?</div>

		<DIV class='bottom'>
			<input type='submit' value='탈퇴'>
			<input type='button' value='취소' onclick="history.back()">
		</DIV>
	</FORM>


	<!-- *********************************************** -->

</body>
<!-- *********************************************** -->
</html>

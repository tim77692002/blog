<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="/ELFunctions"%>
<%-- <%
 	String root=request.getContextPath();
	String id= (String)request.getAttribute("id");
	String grade= (String)request.getAttribute("grade");
	
   
	MemberDTO dto= (MemberDTO)request.getAttribute("dto");			
%>   --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script>
	function mlist() {
		var url = "${pageContext.request.contextPath}/admin/list";
		url += "?col=${param.col}";
		url += "&word=${param.word}";
		url += "&nowPage=${param.nowPage}";

		location.href = url;
	}
	function update() {
		var url = "update";
		url += "?id=${id}";
		url += "&col=${param.col}";
		url += "&word=${param.word}";
		url += "&nowPage=${param.nowPage}";
		location.href = url;
	}
	function updatePw() {
		var url = "updatePw";
		url += "?id=${id}";

		location.href = url;
	}
	function updateFile() {
		var url = "updateFile";
		url += "?id=${id}";
		url += "&oldfile=${dto.fname}";
		location.href = url;
	}
</script>
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

	<DIV class="title">${dto.mname} 회원정보</DIV>


	<TABLE>
		<tr>
			<td colspan="2" align="center" width="400px">
				<img src="${pageContext.request.contextPath}/member/storage/${dto.fname} " style="width: 400px;">
			</td>
		</tr>
		<TR>
			<TH>ID</TH>
			<TD>${dto.id}</TD>
		</TR>
		<TR>
			<TH>성명</TH>
			<TD>${dto.mname}</TD>
		</TR>
		<TR>
			<TH>전화번호</TH>
			<TD>${dto.tel}</TD>
		</TR>
		<TR>
			<TH>E-Mail</TH>
			<TD>${dto.email}</TD>
		</TR>
		<TR>
			<TH>주소</TH>
			<TD>${dto.address1}
				<br>
				${dto.address2}
				<br>
				(${dto.zipcode})
			</TD>
		</TR>
		<TR>
			<TH>직업</TH>
			<TD>${util:codeValue(dto.job)}</TD>
		</TR>
		<TR>
			<TH>가입일</TH>
			<TD>${dto.mdate}</TD>
		</TR>
	</TABLE>

	<DIV class='bottom'>
		<input type='button' value='정보수정' onclick="update()">
		<%--     <%if(id!=null && grade.equals("A")){//관리자 %> --%>
		<c:choose>
			<c:when test="${not empty id && grade=='A'}">
				<input type='button' value='회원목록' onclick="mlist()">
				<%--     <%}else{ %> --%>
			</c:when>
			<c:otherwise>
				<input type='button' value='사진수정' onclick="updateFile()">
				<input type='button' value='패스워드 변경' onclick="updatePw()">
				<input type='button' value='다운로드' onclick="location.href='<%-- <%=root %> --%>${pageContext.request.contextPath}/download?dir=/member/storage&filename=${dto.fname}<%-- <%=dto.getFname()%> --%>'">
				<%--   	<%} %> --%>
			</c:otherwise>
		</c:choose>
	</DIV>

	<!-- *********************************************** -->

</body>
<!-- *********************************************** -->
</html>

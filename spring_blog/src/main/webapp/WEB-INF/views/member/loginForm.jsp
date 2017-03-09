<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%-- <% request.setCharacterEncoding("utf-8"); 
   String root= request.getContextPath();
   
   String c_id=(String)request.getAttribute("c_id");
   String c_id_val=(String)request.getAttribute("c_id_val");
   
   
%>   --%>

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

	<DIV class="title">로그인</DIV>

	<FORM name='frm' method='POST' action='<%-- <%=root%> --%>${pageContext.request.contextPath}/member/login'>
		<input type="hidden" name="bflag" value="${param.bflag}">
		<input type="hidden" name="nowPage" value="${param.nowPage}">
		<input type="hidden" name="nPage" value="${param.nPage}">
		<input type="hidden" name="col" value="${param.col}">
		<input type="hidden" name="word" value="${param.word}">
		<!-- pk(bbsno 값,memono값,...) -->
		<input type="hidden" name="no" value="${param.no}">
		<!-- ino (식별자-pk의 이름:'bbsno','memono') -->
		<input type="hidden" name="ino" value="${param.ino}">
		<TABLE>
			<TR>
				<TH>아이디</TH>
				<TD>
					<input type="text" name="id" value='<%-- <%=c_id_val %> --%>${c_id_val}'>
					<c:choose>
						<%-- <% 
       if (c_id.equals("Y")){  // id 저장 상태라면 
       %>    --%>
						<c:when test="${c_id eq 'Y' }">
							<input type='checkbox' name='c_id' value='Y' checked='checked'> ID 저장 
<%--        <% 
       }else{ %>  --%>
						</c:when>
						<c:otherwise>
							<input type='checkbox' name='c_id' value='Y'> ID 저장 
<%--        <% 
       } 
       %>  --%>
						</c:otherwise>
					</c:choose>
				</TD>
			</TR>
			<TR>
				<TH>패스워드</TH>
				<TD>
					<input type="password" name="passwd">
				</TD>
			</TR>
		</TABLE>

		<DIV class='bottom'>
			<input type='submit' value='로그인'>
			<input type='button' value='회원가입' onclick="location.href='agree'">
		</DIV>

	</FORM>


	<!-- *********************************************** -->

</body>
<!-- *********************************************** -->
</html>

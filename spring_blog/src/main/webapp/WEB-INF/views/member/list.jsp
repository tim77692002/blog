<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <% 
	String root= request.getContextPath();

	String col= (String)request.getAttribute("col");
	String word= (String)request.getAttribute("word");
	int nowPage= (Integer)request.getAttribute("nowPage");

	Iterator<MemberDTO> iter=(Iterator<MemberDTO>)request.getAttribute("iter");	
	String paging = (String)request.getAttribute("paging");	
%>  --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member List</title>
<script type="text/javascript">
	function read(id) {
		var url = "${pageContext.request.contextPath}/member/read";
		url += "?id=" + id;
		url += "&nowPage=${nowPage}";
		url += "&col=${col}";
		url += "&word=${word}";

		location.href = url;
	}
</script>
<style type="text/css">
* {
	font-family: gulim;
	font-size: 20px;
}
/*검색폼*/
.search {
	text-align: center;
	margin: 1px auto;
}
</style>
<link href="<%-- <%=root%> --%>${pageContext.request.contextPath}/css/style.css" rel="Stylesheet" type="text/css">
</head>
<!-- *********************************************** -->
<body>

	<!-- *********************************************** -->

	<DIV class="title">회원목록</DIV>

	<div class="search">
		<FORM name='frm' method='POST' action='./list'>
			<select name="col">

				<option value="mname" <%-- <%if(col.equals("mname")) out.print("selected='selected'");%>  --%>
			<c:if test="${col==mname }">selected='selected'</c:if>>성명</option>

				<option value="email" <%-- <%if(col.equals("email")) out.print("selected='selected'");%> --%> 
			<c:if test="${col==email }">selected='selected'</c:if>>이메일</option>

				<option value="id" <%-- <%if(col.equals("id")) out.print("selected='selected'");%> --%> 
			<c:if test="${col==id }">selected='selected'</c:if>>아이디</option>

				<option value="total">전체출력</option>
			</select>

			<input type="text" name="word" value='<%-- <%=word %> --%>${word}'>
			<input type="submit" value="검색">
			<input type="button" value="회원가입" onclick="location.href='<%-- <%=root%> --%>${pageContext.request.contextPath}/member/agree'">
		</FORM>
	</div>
	<%-- <%while(iter.hasNext()) {
	MemberDTO dto= iter.next();
%> --%>
	<c:forEach items="${list }" var="dto">
		<TABLE style="width: 50%; margin-top: 10px; margin-bottom: 10px;">
			<TR>
				<TD rowspan="5" width="320px" align="center">
					<img src='<%-- <%=root%> --%>${pageContext.request.contextPath}/member/storage/${dto.fname}<%-- <%=dto.getFname() %> --%>' style="width: 300px;">
				</TD>
				<TH width="20%">아이디</TH>
				<TD width="55%">
					<a href="javascript: read('<%-- <%=dto.getId() %> --%>${dto.id }')"> <%-- <%=dto.getId() %> --%>${dto.id }</a>
				</TD>
			</TR>

			<TR>
				<TH>성명</TH>
				<TD>
					<%-- <%=dto.getMname() %> --%>${dto.mname }</TD>
			</TR>

			<TR>
				<TH>전화번호</TH>
				<TD>
					<%-- <%=dto.getTel() %> --%>${dto.tel }</TD>
			</TR>

			<TR>
				<TH>이메일</TH>
				<TD>
					<%-- <%=dto.getEmail() %> --%>${dto.email }</TD>
			</TR>

			<TR>
				<TH>주소</TH>
				<TD>
					${dto.address1}
					<%-- <%=dto.getAddress1() %> --%>
					${dto.address2}
					<%--   <%=Utility.checkNull(dto.getAddress2()) %> --%>
				</TD>
			</TR>
		</TABLE>
		<%--  <%} %> --%>
	</c:forEach>

	<DIV class='bottom'>
		<%--    <%=paging%> --%>${paging }
	</DIV>


	<!-- *********************************************** -->

</body>
<!-- *********************************************** -->
</html>

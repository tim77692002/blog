<%@ page contentType="text/html; charset=UTF-8" %> 

<%-- <% 	
	String root=request.getContextPath();
	String str=(String)request.getAttribute("str");
%> --%>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 20px; 
} 
</style> 
<link href="<%-- <%=root%> --%>${pageContext.request.contextPath }/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>

<!-- *********************************************** -->
 
<DIV class="title">아이디 및 이메일 중복확인</DIV>
<div class="content">
<%-- <%=str

%> --%>
${str}
</div>   
  <DIV class='bottom'>
    <input type='button' value='다시 시도' onclick="history.back()">
   </DIV>

 
 
<!-- *********************************************** -->

</body>
<!-- *********************************************** -->
</html> 

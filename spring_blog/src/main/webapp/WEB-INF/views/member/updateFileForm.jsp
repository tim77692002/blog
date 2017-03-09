<%@ page contentType="text/html; charset=UTF-8" %> 
<%-- <% request.setCharacterEncoding("utf-8"); 
   String root= request.getContextPath();
   String id = request.getParameter("id");
   String oldfile= request.getParameter("oldfile");   
   
%>  --%>
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<script>
	function inCheck(f){
		if(f.fname.value==""){
			alert("사진을 선택하세요");
			f.fname.focus();
			return false;
		}
	}

</script>
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 20px; 
} 
</style> 
<link href="<%-- <%=root%> --%>${pageContext.request.contextPath}/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>

<!-- *********************************************** -->
 
<DIV class="title">사진수정</DIV>
 
<FORM name='frm' method='POST' action='./updateFile' 
enctype="multipart/form-data"
onsubmit="return inCheck(this)"
>
  <input type="hidden" name="id" value="<%-- <%=id %> --%>${param.id}">
  <input type="hidden" name="oldfile" value="<%-- <%=oldfile %> --%>${param.oldfile}">
  <TABLE>
   
    <TR>
      <TH>원본파일</TH>
      <TD>
       <img src= "<%-- <%=root%> --%>${pageContext.request.contextPath}/member/storage/<%-- <%=oldfile %> --%>${param.oldfile}"><br>
      원본파일명:<%-- <%=oldfile %> --%>${param.oldfile}
      </TD>
    </TR>
    
    <TR>
      <TH>변경파일</TH>
      <TD>
      <input type="file" name="fnameMF" accept=".jpg, .png, .gif">
      </TD>
    </TR>
    
  </TABLE>
  
  <DIV class='bottom'>
    <input type='submit' value='변경'>
    <input type='button' value='취소' onclick="history.back()">
  </DIV>
  
</FORM>
 
 
<!-- *********************************************** -->

</body>
<!-- *********************************************** -->
</html> 

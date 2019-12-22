<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    <%="hey: "+request.getParameter("id") %><br>
<%="hey2: "+request.getParameter("pw") %><br>
<%
	String id=request.getParameter("id");
	String pw=request.getParameter("pw");
	String url;
	if(id=="" || pw==""){
		url="signup.jsp";
	
	
%>
<script>


location.href="<%=url%>";

</script>
<%}else{ 
	response.sendRedirect("userProc.jsp");
}
%>

    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>
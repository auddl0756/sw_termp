<%@ page contentType="text/html;charset=utf-8" %>
<%
   session.invalidate();  // 세션의 무효화
%>
<html>
<head><title>로그아웃</title></head>
<body>
로그아웃하였습니다. <br/><br/>
<a href="login.jsp">처음부터</a>
</body>
</html>

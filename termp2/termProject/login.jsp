<%@page contentType="text/html; charset=utf-8" %>
<%
	String id=(String)session.getAttribute("idKey");
%>
<html>
<head>
<title>로그인</title>
<script type="text/javascript">
	function loginCheck(){
		if(document.loginFrm.id.value=""){
			alert("아이디를 입력해주세요");
			document.loginFrm.id.focus();
			return;
		}
		if(document.loginFrm.pw.value=""){
			alert("비밀번호를 입력해주세요");
			document.loginFrm.pw.focus();
			return;
		}
		document.loginFrm.submit();
	}
</script>
</head>
<body>
<%	if(id!=null){%>
<%=id %>님 로그인되었습니다
<a href="logout.jsp">로그아웃</a>
<%}else{ %>
<form name="loginFrm" method="post" action="loginProc.jsp">
id:<input name="id"><br>
pw:<input type="password" name="pw"><br>
<input type="submit" value="login"><br>
<!-- <input type="button" value="로그인" onclick="loginCheck()"> -->
<input type="button" value="회원가입" onclick="javascript:location.href ='signup.jsp'">
</form>
<%} %>

</body>
</html>


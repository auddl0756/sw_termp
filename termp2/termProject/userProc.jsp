<%@page contentType="text/html; charset=utf-8" %>


    <%="hey: "+request.getParameter("id") %><br>
<%="hey2: "+request.getParameter("pw") %><br>
<jsp:useBean id="mgr" class="termp.userbeanManager" scope="session"></jsp:useBean>
<jsp:useBean id="bean" class="termp.userbean" scope="session"></jsp:useBean>

<jsp:setProperty name="bean" property="*"></jsp:setProperty>



<%
	boolean result=mgr.insertUser(bean);
	out.println("result="+result+"<br>");
	out.println(bean.getId()+"<br>");
	out.println(bean.getPw()+"<br>");
	out.println(bean.getClass());
	String msg="회원 가입에 실패했습니다.";
	String location="signup.jsp";
	if(result){
		msg="회원가입을 하였습니다.";
		location="login.jsp";
		
	}
%>
<script>
alert("<%=msg%>");
location.href = "<%=location%>";
</script>


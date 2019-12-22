<%@page contentType="text/html; charset=utf-8" %>
<jsp:useBean id="mMgr" class="termp.userbeanManager"/>
<%
	String id=request.getParameter("id");
	String pw=request.getParameter("pw");
	String url="login.jsp";
	String msg="로그인에 실패했습니다.";
	
	boolean result=mMgr.loginUser(id,pw);
	out.println("id="+id);
	out.println("result="+result);
	if(result){
		session.setAttribute("idKey",id);
		session.setAttribute("pwKey", pw);
		msg="로그인에 성공했습니다.";
		url="menu(after_login).jsp";
	}
%>
<script>
alert("<%=msg%>");
location.href="<%=url%>";

</script>

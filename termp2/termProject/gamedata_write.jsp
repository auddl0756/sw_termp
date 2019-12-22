<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import ="java.util.*" %>
<jsp:useBean id="mgr" class="termp.userbeanManager"></jsp:useBean>
<jsp:useBean id="bean" class="termp.userbean"></jsp:useBean>
<% 
	//out.println(request.getParameter("win"));
	//out.println(request.getParameter("draw"));
	//out.println(request.getParameter("lose"));
	
	Integer win= new Integer(request.getParameter("win"));
	Integer draw= new Integer(request.getParameter("draw"));
	Integer lose= new Integer(request.getParameter("lose"));
	
	String id=(String)session.getAttribute("idKey");
	String pw=(String)session.getAttribute("pwKey");
	
	out.println(id);
	out.println(pw);
	out.println("win="+win);
	out.println("draw="+draw);
	out.println("lose"+lose);
	
	bean.setGame2_win(win);
	bean.setGame2_draw(draw);
	bean.setGame2_lose(lose);
	
	//out.println("bean.getgame2_win:"+bean.getGame2_win());
	//out.println("bean.getgame2_draw:"+bean.getGame2_draw());
	//out.println("bean.getgame2_lose:"+bean.getGame2_lose());
	
	boolean result=mgr.writeUser2(id, pw, bean);
	out.println("result="+result);
	String location="gameselectpage.jsp";
	
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

<script>


 
</script>
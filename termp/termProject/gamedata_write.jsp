<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<jsp:useBean id="mgr" class="termp.userbeanManager" scope="session"></jsp:useBean>
<jsp:useBean id="bean" class="termp.userbean" scope="session">
</jsp:useBean>
<% 
	//out.println(request.getParameter("win"));
	//out.println(request.getParameter("draw"));
	//out.println(request.getParameter("lose"));
	String game=request.getParameter("game");
	Integer win= new Integer(request.getParameter("win"));
	Integer draw= new Integer(request.getParameter("draw"));
	Integer lose= new Integer(request.getParameter("lose"));
	
	//String id=(String)session.getAttribute("idKey");
	//String pw=(String)session.getAttribute("pwKey");
	String id=bean.getId();
	String pw=bean.getPw();
	//out.println(id);
	//out.println(pw);
	
	out.println("win="+win);
	out.println("draw="+draw);
	out.println("lose="+lose);
	
	
	
	out.println("game="+game);
	//out.println(game=="game2");
	
out.println("bean.getid="+bean.getId());
out.println(bean.getPw());
	//out.println("bean.getgame2_win:"+bean.getGame2_win());
	//out.println("bean.getgame2_draw:"+bean.getGame2_draw());
	//out.println("bean.getgame2_lose:"+bean.getGame2_lose());
	
	boolean result;
	if(game.equals("game1")){
		out.println("hey?");
		bean.setGame1_win(win);
		bean.setGame1_draw(draw);
		bean.setGame1_lose(lose);
		result=mgr.writeUser1(id, pw, bean);
	}else if(game.equals("game2")){
		//out.println("hey?");
		bean.setGame2_win(win);
		bean.setGame2_draw(draw);
		bean.setGame2_lose(lose);
		
		result=mgr.writeUser2(id, pw, bean);
	}else{
		result=false;
	}
	
	/*
	Map <String,Integer> map=mgr.userRank1();
	Map <String,Integer> map2=mgr.userRank2();
	Iterator iterator = map.keySet().iterator();
	Iterator iterator2 = map.keySet().iterator();
	while(iterator.hasNext()) {

		String temp = (String) iterator.next();

		out.println(temp + " = " + map.get(temp)+"<br>");

		}

	while(iterator2.hasNext()) {

		String temp = (String) iterator2.next();

		out.println(temp + " = " + map2.get(temp)+"<br>");

		}
	*/
	
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

location.href="<%=location%>";
 
</script>
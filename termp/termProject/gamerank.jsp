<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="java.util.*"%>
<jsp:useBean id="mgr" class="termp.userbeanManager" scope="session"></jsp:useBean>

<%!
public static List sortByValue ( final Map map )  {

	List<String> list = new ArrayList();

	list.addAll(map.keySet());

	Collections.sort(list,new Comparator() {

	public int compare(Object o1,Object o2) {

		Object v1 = map.get(o1);

		Object v2 = map.get(o2);

		return ((Comparable) v2).compareTo(v1);

	}

	});
	//Collections.reverse(list); // 주석시 오름차순
	return list;

	}
%>    
<%
    Map <String,Integer> map=mgr.userRank1();
	Map <String,Integer> map2=mgr.userRank2();
	//Iterator iterator = map.keySet().iterator();
	//Iterator iterator2 = map2.keySet().iterator();
	
	boolean best_flag=true;
	
	Iterator it = sortByValue(map).iterator();
	Iterator it2 = sortByValue(map2).iterator();
	
	out.println("<table border='2'>");
	out.println("<tr>");
	out.println("<td>  id"+"</td>" +"<td> game1_wins"+"</td>");
	out.println("</tr>");
	while(it.hasNext()) {
		
		String temp = (String) it.next();
		if(best_flag==true){
			out.println("<tr bgcolor='blue'>");
		}else{
			out.println("<tr>");
		}
		
		//out.println(temp + " = " + map.get(temp)+"<br>");
		
		out.println("<td>"+temp+"</td>"+"<td>"+map.get(temp)+"</td>");
		out.println("</tr>");
		best_flag=false;
		}
	out.println("<tr>");
	out.println("</tr>");
	out.println("</table>");
	best_flag=true;
	out.println("<table border='2'>");
	out.println("<tr>");
	out.println("<td>  id"+"</td>" +"<td> game2_wins"+"</td>");
	out.println("</tr>");
	while(it2.hasNext()) {

		String temp = (String) it2.next();
		if(best_flag==true){
			out.println("<tr bgcolor='blue'>");
		}else{
			out.println("<tr>");
		}
		//out.println(temp + " = " + map2.get(temp)+"<br>");
		out.println("<td>"+temp+"</td>"+"<td>"+map2.get(temp)+"</td>");
		out.println("</tr>");
		best_flag=false;
		}

	out.println("</table>");
	
	
	
	
	
	
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function changepage(field){
	if(field.value=="back"){
		location.href="menu(after_login).jsp";
	}
}
</script>
</head>
<body>
back : <input type="button" name="btn1" value="back" onclick="changepage(this)"><br>
</body>
</html>
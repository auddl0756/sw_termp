<%@page contentType="text/html charset=utf-8" %>
<jsp:useBean id="mMgr" class="termp.userbeanManager"></jsp:useBean>
<%
	
	String id=request.getParameter("id");
	out.println("requested id: "+id);
	boolean result=mMgr.checkId(id);
%>
<html>
<head><title>id 중복체크</title></head>
<body>
<%="id is :"+id %><br>
<%="result: "+result %><br>
<%
	
	if(result){
		out.println("id already exists");
	}else{
		out.println("id available");
	}

%>

<a href="#" onClick="self.close()">close</a>
</body>

</html>

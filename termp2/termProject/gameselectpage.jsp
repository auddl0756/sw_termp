<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<SCRIPT LANGUAGE="JavaScript"> 
        
     function changepage(field){
        if(field.value=="airhockey"){
          location.href="airhockey.jsp";
        }else if(field.value="r_c_p"){
          location.href="r_c_p.jsp";
        }else{

        }
     }
        
</SCRIPT>


</head>
<body>
 에어하키 게임:  <Input type="button" NAME="btn1" VALUE="airhockey" onclick="changepage(this)"><br>
   가위바위보 게임: <Input type="button" NAME="btn2" VALUE="r_c_p"onclick="changepage(this)"><br> 

</body>
</html>
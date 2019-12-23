<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>menu</title>
<SCRIPT LANGUAGE="JavaScript"> 
        
     function changepage(field){
        if(field.value=="gameselect"){
          location.href="gameselectpage.jsp";
        }else if(field.value="gamerecord"){
          location.href="gamerecordpage.jsp";
        }else{
		
        }
     }
       
    
</SCRIPT>
</head>
<body>
  <form>

        게임선택:<Input type="button" NAME="btn1" VALUE="gameselect" onclick="changepage(this)"><br>
            
  게임기록: <Input type="button" NAME="btn2" VALUE="gamerecord"onclick="changepage(this)"><br> 
                
            </form>
</body>
</html>
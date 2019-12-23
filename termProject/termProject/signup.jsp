<%@page contentType="text/html; charset=utf-8"%>
<html>
<head><title>회원가입</title></head>
<script type="text/javascript">

function inputCheck(){
	//alert(document.regFrm.id.value);
	//var a=document.getElementById('regFrm');
	
	if(document.regFrm.id.value=""){
		alert("아이디를 입력해주세요");
		document.regFrm.id.focus();
		return;	
	}
	if(document.regFrm.pw.value=""){
		alert("패스워드를 입력해주세요");
		document.regFrm.pw.focus();
		return;
	}
	document.forms[0].submit();
	//alert(document.regFrm);
	
}
function win_close(){
	self.close();
}


function idCheck(id){
	//alert("id="+id);
	frm=document.regFrm;
	if(id==""){
		alert("id를 입력해주세요");
		frm.id.focus();
		return;
	}
	url="idCheck.jsp?id="+id;
	//alert("id= "+id);
	window.open(url,"IDCheck","width=300,height=150");
}


</script>
<body onLoad="regFrm.id.focus()">
<form name="regFrm" method="post" action="userProc.jsp">
id: <input type="text" name="id" id="id" ><br>
id duplication check:<input type="button" value="id duplication check" onClick="idCheck(this.form.id.value)" ><br>
pw: <input type="password" name="pw" id="pw"><br>

<input type="reset" value="rewrite"><br>&nbsp;
<input type="button" value="log in" onClick="javascript:location.href='login.jsp'"><br>

<!--  <input type="button" value="sign up" onClick="inputCheck()">&nbsp; &nbsp;<br>
-->

<input type="submit" value="sign up2"><br>
</form>
</body>

</html>